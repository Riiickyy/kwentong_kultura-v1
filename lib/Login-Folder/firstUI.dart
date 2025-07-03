import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Login-Folder/Login.dart';
import 'package:kwentong_kultura/Login-Folder/createaccount.dart';
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
                                'assets/images/HomeUI/first.png',
                                fit: BoxFit.cover,
                                width:
                                    constraints.maxWidth *
                                    0.8, // Responsive image
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 40),

                        // Container with Buttons
                        Container(
                          width: constraints.maxWidth * 0.8, // Responsive width
                          height: 236,
                          decoration: BoxDecoration(
                            color: const Color(0xFFACDC94),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 1, // Border width (you can adjust this)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.5,
                                ), // Shadow color
                                blurRadius: 4, // Blur intensity
                                offset: Offset(
                                  0,
                                  4,
                                ), // Shadow position (you can adjust this)
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 25.0,
                              horizontal: 25.0,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Createaccount();
                                        },
                                      ),
                                    );
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
