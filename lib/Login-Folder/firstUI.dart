import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      final data = await rootBundle.load(
        'assets/Animations/login_bg_last (4).riv',
      );
      final file = RiveFile.import(data);
      _riveArtboard = file.mainArtboard;
      print('Available State Machines: ${_riveArtboard.stateMachines}');
      var controller = StateMachineController.fromArtboard(
        _riveArtboard,
        'State Machine 1',
      );
      if (controller != null) {
        _riveArtboard.addController(controller);
        controller.isActive = true; // Start animation
      } else {
        print('Error: StateMachineController could not be created.');
      }

      setState(() {
        _isLoaded = true; // Set loaded to true once the animation is ready
      });
    } catch (e) {
      throw Exception('Error loading Rive animation: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    loadRiveAnimation(); // Initialize the animation on app start
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          !_isLoaded
              ? const Center(
                child:
                    CircularProgressIndicator(), // Show loading indicator while waiting
              )
              : Stack(
                children: [
                  // Background: Rive animation filling the entire screen
                  Positioned.fill(
                    child: Opacity(
                      opacity: 1.0, // Set the opacity level (adjust as needed)
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
                            // Login Button
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
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
                                  MaterialPageRoute(
                                    builder: (context) => Createaccount(),
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
