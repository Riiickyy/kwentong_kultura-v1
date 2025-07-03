import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Login-Folder/Login.dart';
import '../Styles/styles.dart';

class Firstui extends StatefulWidget {
  const Firstui({super.key});

  @override
  State<Firstui> createState() => _HomeUIWidgetState();
}

class _HomeUIWidgetState extends State<Firstui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            color: Color(0xFFC5F1FF), // Set the background color here
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/HomeUI/Wood.png',
                                fit: BoxFit.cover,
                                width:
                                    constraints.maxWidth *
                                    0.8, // Responsive image
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
                        SizedBox(height: 40),
                        // Button Container
                        Container(
                          width: constraints.maxWidth * 0.8, // Responsive width
                          height: 236,
                          decoration: BoxDecoration(
                            color: const Color(0xFFACDC94),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 2, // Border width (you can adjust this)
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 25.0,
                              bottom: 20.0,
                              right: 20.0,
                              left: 25.0,
                            ),
                            child: Column(
                              children: [
                                // Login Button
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Login();
                                        },
                                      ),
                                    );
                                  },
                                  style: Design.buttonDesign,
                                  child: Text(
                                    'Mag - Login',
                                    style: Design.Login,
                                  ),
                                ),
                                SizedBox(height: 20), // Spacing between buttons
                                // Create Account Button
                                ElevatedButton(
                                  onPressed: () {
                                    // Add create account functionality here
                                  },
                                  style: Design.buttonDesign,
                                  child: Text(
                                    'Gumawa ng \n Account',
                                    textAlign: TextAlign.center,
                                    style: Design.Login,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
