import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/Login-Folder/firstUI.dart';
import 'package:kwentong_kultura/Pages/taramagbasa.dart';
import 'package:kwentong_kultura/Pages/taramagkulay.dart';
import 'package:kwentong_kultura/Pages/taramakinig.dart';
import 'package:kwentong_kultura/Styles/styles.dart';
import 'package:kwentong_kultura/auth_service.dart';
import 'package:rive/rive.dart' as rive;
import 'package:shared_preferences/shared_preferences.dart';

class HomeUIWidget extends StatefulWidget {
  const HomeUIWidget({super.key});

  @override
  State<HomeUIWidget> createState() => _HomeUIWidgetState();
}

class _HomeUIWidgetState extends State<HomeUIWidget> {
  late rive.Artboard _riveArtboard;
  bool _isLoaded = false;
  double _bgmVolume = 100; // Default 100%
  bool _isMuted = false;

  Future<void> _loadBgmSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _bgmVolume = prefs.getDouble('settings_bgm_volume') ?? 100;
    _isMuted = _bgmVolume == 0;
    setState(() {});
  }

  Future<void> _saveBgmSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('settings_bgm_volume', _bgmVolume);
  }

  // Function to load the Rive animation
  Future<void> loadRiveAnimation() async {
    try {
      await rive.RiveFile.initialize();
      final data = await rootBundle.load('assets/Animations/homepage.riv');
      final file = rive.RiveFile.import(data);
      _riveArtboard = file.mainArtboard;
      print('Available State Machines: ${_riveArtboard.stateMachines}');
      var controller = rive.StateMachineController.fromArtboard(
        _riveArtboard,
        'State Machine 1',
      );
      if (controller != null) {
        _riveArtboard.addController(controller);
        controller.isActive = true;
      } else {
        print('Error: StateMachineController could not be created.');
      }

      setState(() {
        _isLoaded = true;
      });
    } catch (e) {
      throw Exception('Error loading Rive animation: $e');
    }
  }

  // Method to show the logout confirmation dialog
  void _showSettingsDialog() {
    final user = FirebaseAuth.instance.currentUser;
    TextEditingController nameController = TextEditingController(
      text: user?.displayName ?? '',
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 7,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFACDC94),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    // ❌ CLOSE BUTTON
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),

                        Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // DISPLAY NAME + EDIT BUTTON
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name:',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ElevatedButton(
                              style: Design.buttonDesign,
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Edit Name"),
                                      content: TextField(
                                        controller: nameController,
                                        decoration: const InputDecoration(
                                          hintText: "Enter your name",
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed:
                                              () => Navigator.pop(context),
                                          child: const Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            if (user != null) {
                                              // ✅ Update Firebase Auth Display Name
                                              await user.updateDisplayName(
                                                nameController.text,
                                              );
                                              await user.reload();

                                              // ✅ Save to Firestore
                                              await FirebaseFirestore.instance
                                                  .collection("users")
                                                  .doc(user.uid)
                                                  .set({
                                                    "name": nameController.text,
                                                    "email": user.email ?? "",
                                                  }, SetOptions(merge: true));
                                            }

                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Save"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                user?.displayName ?? "Edit",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // BGM VOLUME SLIDER
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isMuted = !_isMuted;
                                  if (_isMuted) {
                                    _bgmVolume = 0;
                                    BgmPlayer.player.setVolume(0);
                                  } else {
                                    _bgmVolume = 50;
                                    BgmPlayer.player.setVolume(0.5);
                                  }
                                  _saveBgmSettings();
                                });
                              },
                              child: Icon(
                                _isMuted ? Icons.volume_off : Icons.volume_up,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            Expanded(
                              child: Slider(
                                value: _bgmVolume,
                                min: 0,
                                max: 100,
                                divisions: 100,
                                label: "${_bgmVolume.toInt()}%",
                                onChanged: (value) {
                                  setState(() {
                                    _bgmVolume = value;
                                    _isMuted = value == 0;
                                    BgmPlayer.player.setVolume(value / 100);
                                    _saveBgmSettings();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        // LOGOUT BUTTON
                        TextButton.icon(
                          icon: Icon(Icons.logout, color: Colors.black),
                          onPressed: () async {
                            try {
                              await authService.value.signOut();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Firstui(),
                                ),
                              );
                            } on FirebaseAuthException catch (e) {
                              print(e);
                            }
                          },
                          label: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.black, fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _loadBgmSettings();
    loadRiveAnimation();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          !_isLoaded
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                children: [
                  // Background: Rive animation filling the entire screen
                  Positioned.fill(
                    child: Opacity(
                      opacity: 1.0,
                      child: rive.Rive(
                        artboard: _riveArtboard,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 105,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/HomeUI/Wood.png',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),

                          Text(
                            'Kwentong\nKultura',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 4,
                                  color: Colors.black.withOpacity(0.25),
                                  offset: Offset(-3, 4),
                                ),
                              ],
                              color: Color(0xFF336404),
                              fontSize: 40,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 45,
                    right: 10,
                    child: Image.asset('assets/images/HomeUI/sunncloud.png'),
                  ),

                  Positioned(
                    top: 300,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Taramagbasa(),
                                  direction: SlideDirection.up,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: SizedBox(
                              width: 180,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Tara\n',
                                      style: Design.tara,
                                    ),
                                    TextSpan(
                                      text: 'Magbasa',
                                      style: Design.action,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 21.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Taramakinig(),
                                  direction: SlideDirection.up,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: SizedBox(
                              width: 180,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Tara\n',
                                      style: Design.tara,
                                    ),
                                    TextSpan(
                                      text: 'Manood',
                                      style: Design.action,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 21.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Taramagkulay(),
                                  direction: SlideDirection.up,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: SizedBox(
                              width: 180,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Tara\n',
                                      style: Design.tara,
                                    ),
                                    TextSpan(
                                      text: 'Magkulay',
                                      style: Design.action,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 100,
                    right: 20,
                    child: FloatingActionButton(
                      backgroundColor: Colors.orange.shade300,
                      onPressed:
                          _showSettingsDialog, // Directly call the method to show dialog
                      child: Icon(Icons.settings, color: Colors.black),
                    ),
                  ),
                ],
              ),
    );
  }
}
