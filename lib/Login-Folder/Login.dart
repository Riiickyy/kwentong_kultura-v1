import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _HomeUIWidgetState();
}

class _HomeUIWidgetState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3D9FF), // Light blue background color
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
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
                          Image.asset('assets/images/HomeUI/Wood.png'), // Image
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
                    SizedBox(height: 40), // Space between title and form
                    // Login Form
                    Container(
                      width: constraints.maxWidth * 0.8, // Responsive width
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFD4EDDA), // Light green background
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black), // Border color
                      ),
                      child: Column(
                        children: [
                          // Username field
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Password field
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Login button
                          Container(
                            width:
                                constraints.maxWidth * 0.7, // Responsive width
                            height: 39,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFCCBC),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Add create account functionality
                              },
                              child: Text(
                                'IPASA',
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
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
