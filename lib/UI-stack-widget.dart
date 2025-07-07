import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Login-Folder/firstUI.dart';
import 'package:kwentong_kultura/Styles/styles.dart';
import 'package:kwentong_kultura/auth_service.dart';
import 'buttons/Home-Buttons.dart';

class HomeUIWidget extends StatefulWidget {
  const HomeUIWidget({super.key});

  @override
  State<HomeUIWidget> createState() => _HomeUIWidgetState();
}

class _HomeUIWidgetState extends State<HomeUIWidget> {
  // Method to show the logout confirmation dialog
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 7,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFACDC94), // Light green background
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black, // Black border
                width: 2, // Border width
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Are you sure you want to logout?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: Design.buttonDesign,
                        onPressed: () async {
                          try {
                            // Sign out the user
                            await authService.value.signOut();
                            // Navigate to Firstui after logout
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
                        child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.black, fontSize: 28),
                        ),
                      ),
                      TextButton(
                        style: Design.buttonDesign,
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.black, fontSize: 28),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC5F1FF),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            child: Image.asset('assets/images/HomeUI/Cloud.png'),
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
            bottom: 0,
            child: Image.asset(
              'assets/images/HomeUI/Grass.png',
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            bottom: 65,
            right: -5,
            child: Image.asset('assets/images/HomeUI/Turtle.png'),
          ),

          Positioned(
            bottom: 150,
            left: -5,
            child: Image.asset('assets/images/HomeUI/Rock.png'),
          ),

          Positioned(top: 270, right: 0, left: 0, child: Homebuttons()),
          Positioned(
            bottom: 100,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.orange.shade300,
              onPressed:
                  _showLogoutDialog, // Directly call the method to show dialog
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
