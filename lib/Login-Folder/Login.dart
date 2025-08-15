import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Login-Folder/Forgot%20password/email.dart';
import 'package:kwentong_kultura/Login-Folder/firstUI.dart';
import 'package:kwentong_kultura/UI-stack-widget.dart';
import 'package:kwentong_kultura/auth_service.dart';
import '../Styles/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _HomeUIWidgetState();
}

class _HomeUIWidgetState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    try {
      await authService.value.signIn(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeUIWidget()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'Your credentials are wrong';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3D9FF), // Light blue background color
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -75,
              left: 20,
              right: 0,
              child: Image.asset('assets/Animations/LOGIN ANIMATIONS/MAYA.gif'),
            ),
            // Positioned background image or GIF
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/Animations/LOGIN ANIMATIONS/GRASS BG.png',
                fit: BoxFit.fitWidth, // Make sure it fits the screen width
                height: 100, // Adjust height as needed
              ),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              child: Image.asset(
                'assets/Animations/LOGIN ANIMATIONS/DOG.gif',
                fit: BoxFit.fitWidth, // Make sure it fits the screen width
                height: 100, // Adjust height as needed
              ),
            ),

            // Main content (login form) wrapped inside a scrollable area
            Positioned.fill(
              // Ensures that the form takes up the remaining space
              child: SingleChildScrollView(
                // Make the form scrollable
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 200), // Adjust for image/GIF height
                    // Login Form Container
                    Opacity(
                      opacity: 1.0,
                      child: Container(
                        width:
                            MediaQuery.of(context).size.width *
                            0.8, // Responsive width
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
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Firstui();
                                          },
                                        ),
                                      );
                                    },
                                    style: Design.buttonDesign,
                                    child: Icon(Icons.arrow_back),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Username field
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Username",
                                style: Design.storyTitle,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20),
                            // Password field
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Password",
                                style: Design.storyTitle,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Passrec();
                                    },
                                  ),
                                );
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Forgot Password?',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              errorMessage,
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            SizedBox(height: 20),
                            // Login button
                            ElevatedButton(
                              onPressed: signIn,
                              style: Design.buttonDesign,
                              child: Text('Mag - Login', style: Design.Login),
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
      ),
    );
  }
}
