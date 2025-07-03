import 'package:flutter/material.dart';

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
                              ), // Image
                              Text(
                                'Kwentong\nKultura',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      blurRadius: 4,
                                      color: Colors.black.withOpacity(
                                        0.25,
                                      ), // shadow color
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
                        // Green Container with Black Border inside the Login Button
                        Container(
                          margin: EdgeInsets.all(
                            8,
                          ), // Margin for the green container
                          decoration: BoxDecoration(
                            color: Colors.green, // Green background
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ), // Black border
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // Rounded corners
                          ),
                          child: Container(
                            width:
                                constraints.maxWidth * 0.7, // Responsive width
                            height: 64,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFCCBC),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Add login functionality
                              },
                              child: Text(
                                'Mag-Login',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Create Account Button
                        Container(
                          width: constraints.maxWidth * 0.7, // Responsive width
                          height: 98,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFCCBC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {
                              // Add create account functionality
                            },
                            child: Text(
                              'Gumawa ng \n account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                              ),
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
