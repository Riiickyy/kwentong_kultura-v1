import 'package:flutter/material.dart';
import 'package:kwentong_kultura/UI-stack-widget.dart';
import '../Styles/styles.dart';

class Createaccount extends StatefulWidget {
  const Createaccount({super.key});

  @override
  State<Createaccount> createState() => _HomeUIWidgetState();
}

class _HomeUIWidgetState extends State<Createaccount> {
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
                      // Login Form
                      Container(
                        width: constraints.maxWidth * 0.8, // Responsive width
                        padding: EdgeInsets.all(16),
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
                        child: Column(
                          children: [
                            Align(
                              alignment:
                                  Alignment
                                      .centerLeft, // Aligns the text to the left
                              child: Text(
                                "Name",
                                style: Design.storyTitle,
                                textAlign:
                                    TextAlign
                                        .left, // Optional: Just in case you want additional control
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment:
                                  Alignment
                                      .centerLeft, // Aligns the text to the left
                              child: Text(
                                "Username",
                                style: Design.storyTitle,
                                textAlign:
                                    TextAlign
                                        .left, // Optional: Just in case you want additional control
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Username',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment:
                                  Alignment
                                      .centerLeft, // Aligns the text to the left
                              child: Text(
                                "Password",
                                style: Design.storyTitle,
                                textAlign:
                                    TextAlign
                                        .left, // Optional: Just in case you want additional control
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20),
                            // Login button
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return HomeUIWidget();
                                    },
                                  ),
                                );
                              },
                              style: Design.buttonDesign,
                              child: Text('Mag - Login', style: Design.Login),
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
