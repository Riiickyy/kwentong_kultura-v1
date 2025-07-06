import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Login-Folder/Login.dart';
import 'package:kwentong_kultura/UI-stack-widget.dart';
import '../../Styles/styles.dart';

class Passrec extends StatefulWidget {
  const Passrec({super.key});

  @override
  State<Passrec> createState() => _PassrecState();
}

class _PassrecState extends State<Passrec> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3D9FF), // Light blue background color
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image section
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/HomeUI/first.png',
                          fit: BoxFit.cover,
                          width:
                              constraints.maxWidth *
                              0.8, // Responsive image width
                        ),
                      ),
                      SizedBox(height: 40), // Space between title and form
                      // Password Recovery Form Container
                      Container(
                        width: constraints.maxWidth * 0.8, // Responsive width
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFACDC94),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1, // Border width
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 4, // Blur intensity
                              offset: Offset(0, 4), // Shadow position
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Username field
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Your Username",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Your Username',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20),

                            // Password field
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Current Password",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Current Password',
                                border: OutlineInputBorder(),
                              ),
                            ),

                            SizedBox(height: 20),

                            // Password field
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "New Password",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'New Password',
                                border: OutlineInputBorder(),
                              ),
                            ),

                            SizedBox(height: 20),

                            // Login button
                            ElevatedButton(
                              onPressed: () {
                                // Handle login logic
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      // Replace with the correct screen after login
                                      return Login();
                                    },
                                  ),
                                );
                              },
                              style: Design.buttonDesign,
                              child: Text(
                                'Change Password',
                                textAlign: TextAlign.center,
                                style: Design.Login,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
