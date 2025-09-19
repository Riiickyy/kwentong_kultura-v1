import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/Login-Folder/Login.dart';
import 'package:kwentong_kultura/Login-Folder/createaccount.dart';
import '../Styles/styles.dart';
import 'package:rive/rive.dart' hide Image;

class Firstui extends StatefulWidget {
  const Firstui({super.key});

  @override
  State<Firstui> createState() => _HomeUIWidgetState();
}

class _HomeUIWidgetState extends State<Firstui> {
  late Artboard _riveArtboard;
  bool _isLoaded = false;

  // Function to load the Rive animation
  Future<void> loadRiveAnimation() async {
    try {
      final data = await rootBundle.load('assets/Animations/loginbg_final.riv');
      final file = RiveFile.import(data);
      _riveArtboard = file.mainArtboard;
      print('Available State Machines: ${_riveArtboard.stateMachines}');
      var controller = StateMachineController.fromArtboard(
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

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    loadRiveAnimation();
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
                      child: Rive(artboard: _riveArtboard, fit: BoxFit.cover),
                    ),
                  ),

                  // Main content (buttons, images, etc.) positioned above the background
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 60),
                            // Login Button
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  SlidePageRoute(
                                    page: Login(),
                                    direction: SlideDirection.right,
                                  ),
                                );
                              },
                              style: Design.buttonDesign,
                              child: Text(
                                'Mag - Login',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            // Create Account Button
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  SlidePageRoute(
                                    page: Createaccount(),
                                    direction: SlideDirection.right,
                                  ),
                                );
                              },
                              style: Design.buttonDesign,
                              child: Text(
                                'Gumawa ng \n Account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
