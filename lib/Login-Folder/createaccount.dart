import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/Login-Folder/Login.dart';
import 'package:kwentong_kultura/Login-Folder/firstUI.dart';
import 'package:kwentong_kultura/auth_service.dart';
import '../Styles/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void register() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      // 1. Create the user in Firebase Auth
      UserCredential userCredential = await authService.value.createAccount(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      );

      // 2. Get UID of created user
      String uid = userCredential.user!.uid;

      // 3. Create user document in Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      setState(() {
        isLoading = false;
      });

      _showSuccessDialog();
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.message ?? 'Something went wrong';
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Unexpected error: $e';
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
                        SlidePageRoute(
                          page: Login(),
                          direction: SlideDirection.down,
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
                                        SlidePageRoute(
                                          page: Firstui(),
                                          direction: SlideDirection.left,
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
