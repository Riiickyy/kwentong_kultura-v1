import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Login-Folder/Login.dart';
import 'package:kwentong_kultura/auth_service.dart';
import '../../Styles/styles.dart';

class Passrec extends StatefulWidget {
  const Passrec({super.key});

  @override
  State<Passrec> createState() => _PassrecState();
}

class _PassrecState extends State<Passrec> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  String errorMessage = '';

  void dispose() {
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  void resetPassword() async {
    try {
      await authService.value.resetPassword(email: emailController.text);
      showSnackBarSuccess();
      print("success");
    } on FirebaseAuthException catch (e) {
      setState(() {
        showSnackBarFailure(e);
      });
      print("fail"); // Pass the exception to show detailed error
    }
  }

  void showSnackBarSuccess() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'It will send to yourr email',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showSnackBarFailure(FirebaseAuthException e) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          e.message ?? "Email not register", // Displaying error message
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3D9FF),
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
                          width: constraints.maxWidth * 0.8,
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: constraints.maxWidth * 0.8,
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
                                  alignment:
                                      Alignment.centerLeft, // Align to the left
                                  child: ElevatedButton(
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
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Your Username',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20),

                            // Change Password button
                            ElevatedButton(
                              onPressed: resetPassword,
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
