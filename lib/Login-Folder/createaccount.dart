import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Login-Folder/Login.dart';
import 'package:kwentong_kultura/Login-Folder/firstUI.dart';
import 'package:kwentong_kultura/auth_service.dart';
import '../Styles/styles.dart';

class Createaccount extends StatefulWidget {
  const Createaccount({super.key});

  @override
  State<Createaccount> createState() => _HomeUIWidgetState();
}

class _HomeUIWidgetState extends State<Createaccount> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';
  bool isLoading = false; // Track loading state

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register() async {
    setState(() {
      isLoading = true; // Start loading
    });

    try {
      await authService.value.createAccount(
        email: emailController.text,
        password: passwordController.text,
      );
      setState(() {
        isLoading = false; // Stop loading on success
      });
      _showSuccessDialog(); // Show success dialog after successful account creation
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false; // Stop loading on error
        errorMessage = e.message ?? 'Bad format of Email';
      });
    }
  }

  void _showSuccessDialog() {
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
                    'Your account has been successfully created!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    style: Design.buttonDesign,
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  Login(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOut;

                            var tween = Tween(
                              begin: begin,
                              end: end,
                            ).chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            // Use SlideTransition to apply the animation
                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      ); // Navigate to the login screen
                    },
                    child: Text(
                      'Go to Login',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/Animations/LOGIN ANIMATIONS/GRASS BG.png',
                fit: BoxFit.fitWidth, // Ensure it fits the screen width
                height: 100,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              child: Image.asset(
                'assets/Animations/LOGIN ANIMATIONS/DOG.gif',
                fit: BoxFit.fitWidth, // Ensure it fits the screen width
                height: 100,
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 200), // Adjust for image/GIF height
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
                          border: Border.all(color: Colors.black, width: 1),
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
                                        PageRouteBuilder(
                                          pageBuilder:
                                              (
                                                context,
                                                animation,
                                                secondaryAnimation,
                                              ) => Firstui(),
                                          transitionsBuilder: (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                            child,
                                          ) {
                                            const begin = Offset(
                                              1.0,
                                              0.0,
                                            ); // Start position (right side)
                                            const end =
                                                Offset
                                                    .zero; // End position (normal position)
                                            const curve = Curves.easeInOut;

                                            var tween = Tween(
                                              begin: begin,
                                              end: end,
                                            ).chain(CurveTween(curve: curve));
                                            var offsetAnimation = animation
                                                .drive(tween);

                                            // Create a fade animation for smooth fade in/out effect
                                            var fadeAnimation = Tween(
                                              begin: 0.0,
                                              end: 1.0,
                                            ).animate(
                                              CurvedAnimation(
                                                parent: animation,
                                                curve: curve,
                                              ),
                                            );

                                            // Use both SlideTransition and FadeTransition
                                            return FadeTransition(
                                              opacity: fadeAnimation,
                                              child: SlideTransition(
                                                position: offsetAnimation,
                                                child: child,
                                              ),
                                            );
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Name",
                                style: Design.storyTitle,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email",
                                style: Design.storyTitle,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20),
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
                            SizedBox(height: 10),
                            Text(
                              errorMessage,
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            SizedBox(height: 20),
                            // Show CircularProgressIndicator while loading
                            isLoading
                                ? CircularProgressIndicator() // Show loading spinner
                                : ElevatedButton(
                                  onPressed: register,
                                  style: Design.buttonDesign,
                                  child: Text('Register', style: Design.Login),
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
