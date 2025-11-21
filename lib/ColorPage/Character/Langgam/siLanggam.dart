import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/ColorPage/Character/Langgam/silanggamcolorclass.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class Silanggam extends StatefulWidget {
  const Silanggam({super.key});

  @override
  State<Silanggam> createState() => _SilanggamState();
}

class DrawingArea {
  Offset point;
  Paint areaPaint;

  DrawingArea({required this.point, required this.areaPaint});
}

class ActionItem {
  final String type;
  final List<DrawingArea?>? stroke;
  final List<Map<String, dynamic>>? removed;
  final List<DrawingArea?>? snapshot;

  ActionItem.draw(this.stroke) : type = 'draw', removed = null, snapshot = null;

  ActionItem.erase(this.removed)
    : type = 'erase',
      stroke = null,
      snapshot = null;

  ActionItem.clear(this.snapshot)
    : type = 'clear',
      stroke = null,
      removed = null;
}

class _SilanggamState extends State<Silanggam> {
  List<DrawingArea?> points = [];
  List<ActionItem> undoStack = [];
  List<ActionItem> redoStack = [];
  List<DrawingArea?>? currentStroke;
  List<Map<String, dynamic>>? currentRemoved;

  late Color selectedColor;
  late double strokeWidth;
  bool isEraser = false;
  bool isDrawing = true;
  ui.Image? backgroundImage;

  // Fixed eraser radius as requested
  final double eraserRadius = 10.0;
  @override
  void initState() {
    super.initState();
    selectedColor = Colors.black;
    strokeWidth = 2.0;
    loadImage();
    loadDrawing();
  }

  Future<void> loadImage() async {
    final ByteData data = await rootBundle.load(
      'assets/images/Color/Character/Langgam.png',
    ); // Replace with your image path
    final ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
    );
    final ui.FrameInfo frame = await codec.getNextFrame();

    setState(() {
      backgroundImage = frame.image; // Store the image
    });
  }

  Future<void> loadDrawing() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('drawings')
            .doc('siLanggam') // 🔑 load the only slot
            .get();

    if (doc.exists) {
      List<dynamic> pointsData = doc['drawing'];
      setState(() {
        points =
            pointsData.map((data) {
              if (data == null) return null;
              return DrawingArea(
                point: Offset(data['dx'], data['dy']),
                areaPaint:
                    Paint()
                      ..color = Color(data['color'])
                      ..strokeWidth = (data['strokeWidth'] as num).toDouble()
                      ..strokeCap = StrokeCap.round
                      ..isAntiAlias = true,
              );
            }).toList();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "You don’t have any saved color yet. Start coloring now!",
          ),
        ),
      );
    }
  }

  Future<void> saveDrawing() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    List<Map<String, dynamic>?> pointsData =
        points.map((point) {
          if (point == null) return null;
          return {
            'dx': point.point.dx,
            'dy': point.point.dy,
            'color': point.areaPaint.color.value,
            'strokeWidth': point.areaPaint.strokeWidth,
          };
        }).toList();

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('drawings')
        .doc('siLanggam') // 🔑 only one slot
        .set({
          'drawing': pointsData,
          'timestamp': FieldValue.serverTimestamp(),
        });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Color saved!")));
  }

  void SelectColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pumili ng Kulay!'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                setState(() {
                  selectedColor = color;
                  isEraser = false;
                });
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Alisin'),
            ),
          ],
        );
      },
    );
  }

  // ---------- Action lifecycle helpers ----------

  void _startAction() {
    if (redoStack.isNotEmpty) redoStack.clear();

    if (isEraser) {
      currentRemoved = [];
    } else {
      currentStroke = [];
    }
  }

  void _addDrawPoint(Offset pos) {
    final area = DrawingArea(
      point: pos,
      areaPaint:
          Paint()
            ..strokeCap = StrokeCap.round
            ..isAntiAlias = true
            ..color = selectedColor
            ..strokeWidth = strokeWidth,
    );
    points.add(area);
    currentStroke?.add(area);
  }

  void _eraseSegmentAtPoint(Offset pos) {
    List<int> indices = [];
    for (int i = 0; i < points.length; i++) {
      final p = points[i];
      if (p == null) continue;
      final dist = (p.point - pos).distance;
      if (dist <= eraserRadius) indices.add(i);
    }

    if (indices.isEmpty) return;

    for (int j = indices.length - 1; j >= 0; j--) {
      final idx = indices[j];
      final removedPoint = points.removeAt(idx);
      currentRemoved?.add({'index': idx, 'point': removedPoint});
    }
  }

  void _endAction() {
    if (isEraser) {
      if (currentRemoved != null && currentRemoved!.isNotEmpty) {
        currentRemoved!.sort(
          (a, b) => (a['index'] as int).compareTo(b['index'] as int),
        );
        undoStack.add(
          ActionItem.erase(List<Map<String, dynamic>>.from(currentRemoved!)),
        );
      }
      currentRemoved = null;
    } else {
      if (currentStroke != null && currentStroke!.isNotEmpty) {
        points.add(null);
        currentStroke!.add(null);
        undoStack.add(ActionItem.draw(List<DrawingArea?>.from(currentStroke!)));
      }
      currentStroke = null;
    }
    setState(() {});
  }

  // ---------- Undo / Redo ----------

  void undo() {
    if (undoStack.isEmpty) return;

    final last = undoStack.removeLast();

    if (last.type == 'draw') {
      final stroke = last.stroke!;
      // remove stroke.length items from the end of points
      for (int i = 0; i < stroke.length; i++) {
        if (points.isNotEmpty) points.removeLast();
      }
      // push to redo
      redoStack.add(last);
    } else if (last.type == 'erase') {
      final removed = last.removed!;
      // re-insert in ascending index order
      for (var item in removed) {
        final int idx = item['index'] as int;
        final DrawingArea? pt = item['point'] as DrawingArea?;
        if (idx <= points.length) {
          points.insert(idx, pt);
        } else {
          points.add(pt);
        }
      }
      redoStack.add(last);
    } else if (last.type == 'clear') {
      final snapshot = last.snapshot!;
      // restore snapshot fully
      points = List<DrawingArea?>.from(snapshot);
      redoStack.add(last);
    }

    setState(() {});
  }

  void redo() {
    if (redoStack.isEmpty) return;

    final action = redoStack.removeLast();

    if (action.type == 'draw') {
      final stroke = action.stroke!;
      for (var item in stroke) {
        points.add(item);
      }
      undoStack.add(action);
    } else if (action.type == 'erase') {
      final removed = action.removed!;
      final reversed = List<Map<String, dynamic>>.from(removed.reversed);
      for (var item in reversed) {
        final int idx = item['index'] as int;
        if (idx >= 0 && idx < points.length) {
          points.removeAt(idx);
        }
      }
      undoStack.add(action);
    } else if (action.type == 'clear') {
      points.clear();
      undoStack.add(action);
    }

    setState(() {});
  }

  // ---------- Clear All (stored as a snapshot for A1 behavior) ----------
  void clearAllAction() {
    if (points.isEmpty) return;

    final snapshot = List<DrawingArea?>.from(points);
    undoStack.add(ActionItem.clear(snapshot));
    if (redoStack.isNotEmpty) redoStack.clear();
    points.clear();
    setState(() {});
  }

  // ---------- Other helpers ----------
  void clearDrawing() {
    clearAllAction();
  }

  void toggleEraser() {
    setState(() {
      isEraser = !isEraser;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Si Langgam',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFACDC94),
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Animation Page/PaperBG.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: 10,
            width: 150,
            child: Image.asset('assets/Animations/Paint/Paint.gif'),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Drawing Area with Zoom
                AspectRatio(
                  aspectRatio:
                      backgroundImage != null
                          ? backgroundImage!.width.toDouble() /
                              backgroundImage!.height.toDouble()
                          : 1.0,
                  child: Container(
                    width: width * 0.80,
                    height: height * 0.60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: InteractiveViewer(
                        panEnabled: true,
                        scaleEnabled: true,
                        minScale: 1.0,
                        maxScale: 4.0,
                        child: GestureDetector(
                          onPanDown:
                              isDrawing
                                  ? (details) {
                                    _startAction();
                                    if (isEraser) {
                                      _eraseSegmentAtPoint(
                                        details.localPosition,
                                      );
                                    } else {
                                      _addDrawPoint(details.localPosition);
                                    }
                                    setState(() {});
                                  }
                                  : null,
                          onPanUpdate:
                              isDrawing
                                  ? (details) {
                                    if (isEraser) {
                                      _eraseSegmentAtPoint(
                                        details.localPosition,
                                      );
                                    } else {
                                      _addDrawPoint(details.localPosition);
                                    }
                                    setState(() {});
                                  }
                                  : null,
                          onPanEnd:
                              isDrawing
                                  ? (details) {
                                    // finalize action
                                    if (!isEraser) {
                                      if (currentStroke != null &&
                                          currentStroke!.isNotEmpty) {
                                        // add null separator in points and stroke
                                        points.add(null);
                                        currentStroke!.add(null);
                                      }
                                    }
                                    _endAction();
                                  }
                                  : null,
                          child: CustomPaint(
                            painter: Silanggamcolorclass(
                              points: points,
                              strokeWidth: strokeWidth,
                              color: selectedColor,
                              backgroundImage: backgroundImage,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Controls
                Container(
                  width: width * 0.90,
                  decoration: BoxDecoration(
                    color: const Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: SelectColor,
                              icon: const Icon(Icons.color_lens),
                              color: selectedColor,
                            ),
                            Expanded(
                              child: Slider(
                                min: 1.0,
                                max: 10.0,
                                activeColor: selectedColor,
                                value: strokeWidth,
                                onChanged:
                                    (value) =>
                                        setState(() => strokeWidth = value),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // mode toggle
                            Column(
                              children: [
                                IconButton(
                                  onPressed:
                                      () => setState(
                                        () => isDrawing = !isDrawing,
                                      ),
                                  icon: Icon(
                                    isDrawing ? Icons.edit : Icons.zoom_in,
                                    color:
                                        isDrawing ? Colors.green : Colors.black,
                                  ),
                                ),
                                Text(
                                  isDrawing ? "Color" : "Zoom",
                                  style: Design.Normaltext,
                                ),
                              ],
                            ),
                            const SizedBox(width: 30),
                            // eraser toggle
                            Column(
                              children: [
                                IconButton(
                                  onPressed:
                                      () => setState(() => toggleEraser()),
                                  icon: const Icon(Icons.cleaning_services),
                                  color: isEraser ? Colors.blue : Colors.black,
                                ),
                                Text("Burahin", style: Design.Normaltext),
                              ],
                            ),
                            const SizedBox(width: 30),
                            // undo
                            Column(
                              children: [
                                IconButton(
                                  onPressed: undo,
                                  icon: const Icon(Icons.undo),
                                  color: Colors.black,
                                ),
                                Text("Bawiin", style: Design.Normaltext),
                              ],
                            ),
                            const SizedBox(width: 30),
                            // redo
                            Column(
                              children: [
                                IconButton(
                                  onPressed: redo,
                                  icon: const Icon(Icons.redo),
                                  color: Colors.black,
                                ),
                                Text("Ibalik", style: Design.Normaltext),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: saveDrawing,
                              icon: const Icon(Icons.save),
                              color: Colors.blue,
                            ),
                            const Text('I-save'),
                            const SizedBox(width: 8),
                            IconButton(
                              onPressed: clearAllAction,
                              icon: const Icon(Icons.delete_forever),
                              color: Colors.redAccent,
                            ),
                            const Text(
                              'Burahin Lahat',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
