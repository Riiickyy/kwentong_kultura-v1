import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Login-Folder/firstUI.dart';
import 'package:kwentong_kultura/UI-stack-widget.dart';
import 'package:kwentong_kultura/auth_service.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, this.pageIfNotConnected});

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;

            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show loading indicator while waiting for auth state
              widget = Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              // If there is data (user is authenticated)
              widget = const HomeUIWidget();
            } else {
              // If no user is authenticated, show the login/first UI
              widget = pageIfNotConnected ?? const Firstui();
            }

            return widget;
          },
        );
      },
    );
  }
}
