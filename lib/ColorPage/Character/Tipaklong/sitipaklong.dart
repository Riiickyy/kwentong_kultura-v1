import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/ColorPage/Character/Tipaklong/sitipaklongcolorclass.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class Sitipaklong extends StatefulWidget {
  const Sitipaklong({super.key});

  @override
  State<Sitipaklong> createState() => _SitipaklongState();
}

class DrawingArea {
  Offset point;
  Paint areaPaint;

  DrawingArea({required this.point, required this.areaPaint});
}

class _SitipaklongState extends State<Sitipaklong> {
  List<DrawingArea?> points = [];
  List<DrawingArea?> redoStack = [];
  late Color selectedColor;
  late double strokeWidth;
  bool isEraser = false;
  ui.Image? backgroundImage;

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
      'assets/images/Color/Character/Tipaklong.png',
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
            .doc('siTipaklong') // 🔑 load the only slot
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Drawing loaded")));
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
        .doc('siTipaklong') // 🔑 only one slot
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

  void undo() {
    if (points.isNotEmpty) {
      setState(() {
        redoStack.add(points.removeLast());
      });
    }
  }

  void redo() {
    if (redoStack.isNotEmpty) {
      setState(() {
        points.add(redoStack.removeLast());
      });
    }
  }

  void clearDrawing() {
    setState(() {
      points.clear();
      redoStack.clear();
    });
  }

  void toggleEraser() {
    setState(() {
      isEraser = !isEraser;
    });
  }

  void eraseAtPoint(Offset position) {
    setState(() {
      List<int> pointsToRemove = [];

      for (int i = 0; i < points.length; i++) {
        DrawingArea? currentPoint = points[i];

        if (currentPoint == null) continue;

        double distance = (currentPoint.point - position).distance;

        double eraserRadius = strokeWidth * 2;

        if (distance <= eraserRadius) {
          pointsToRemove.add(i);
        }
      }

      for (int i = pointsToRemove.length - 1; i >= 0; i--) {
        points.removeAt(pointsToRemove[i]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Si Tipaklong',
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/Animation Page/PaperBG.png',
                ), // Replace with your image path
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),

                    child: GestureDetector(
                      onPanDown: (details) {
                        setState(() {
                          if (isEraser) {
                            eraseAtPoint(details.localPosition);
                          } else {
                            points.add(
                              DrawingArea(
                                point: details.localPosition,
                                areaPaint:
                                    Paint()
                                      ..strokeCap = StrokeCap.round
                                      ..isAntiAlias = true
                                      ..color = selectedColor
                                      ..strokeWidth = strokeWidth,
                              ),
                            );
                          }
                        });
                      },
                      onPanUpdate: (details) {
                        setState(() {
                          if (isEraser) {
                            eraseAtPoint(details.localPosition);
                          } else {
                            points.add(
                              DrawingArea(
                                point: details.localPosition,
                                areaPaint:
                                    Paint()
                                      ..strokeCap = StrokeCap.round
                                      ..isAntiAlias = true
                                      ..color = selectedColor
                                      ..strokeWidth = strokeWidth,
                              ),
                            );
                          }
                        });
                      },
                      onPanEnd: (details) {
                        setState(() {
                          points.add(null);
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: CustomPaint(
                          painter: Sitipaklongcolorclass(
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

                SizedBox(height: 20),
                Container(
                  width: width * 0.80,
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                SelectColor();
                              },
                              icon: Icon(Icons.color_lens),
                              color: selectedColor,
                            ),

                            Expanded(
                              child: Slider(
                                min: 1.0,
                                max: 10.0,
                                activeColor: selectedColor,
                                value: strokeWidth,
                                onChanged: (value) {
                                  setState(() {
                                    strokeWidth = value;
                                  });
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  points.clear();
                                });
                              },
                              icon: Icon(Icons.layers_clear),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  onPressed: undo,
                                  icon: Icon(Icons.undo),
                                  color: Colors.black,
                                ),

                                Text("Bawiiin", style: Design.Normaltext),
                              ],
                            ),
                            SizedBox(width: 40),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: redo,
                                  icon: Icon(Icons.redo),
                                  color: Colors.black,
                                ),
                                Text("Ibalik", style: Design.Normaltext),
                              ],
                            ),
                            SizedBox(width: 40),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      toggleEraser();
                                    });
                                  },
                                  icon: Icon(Icons.mode_rounded),
                                  color: isEraser ? Colors.blue : Colors.black,
                                ),
                                Text("Burahin", style: Design.Normaltext),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: saveDrawing,
                              icon: Icon(Icons.save),
                              color: Colors.blue[600],
                            ),
                            Text('I - save'),
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
