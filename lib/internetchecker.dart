import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

import 'package:kwentong_kultura/Styles/styles.dart';

class InternetChecker extends StatefulWidget {
  final Widget child;
  const InternetChecker({super.key, required this.child});

  @override
  State<InternetChecker> createState() => _InternetCheckerState();
}

class _InternetCheckerState extends State<InternetChecker> {
  final Connectivity _connectivity = Connectivity();
  bool _isOffline = false;

  @override
  void initState() {
    super.initState();
    _checkConnectionOnStart();

    // 👇 listen for connectivity changes + verify real internet
    _connectivity.onConnectivityChanged.listen((status) async {
      bool connected = status != ConnectivityResult.none;
      if (connected) {
        connected = await _hasInternet();
      }
      setState(() {
        _isOffline = !connected;
      });
    });
  }

  /// Check actual internet by pinging Google DNS
  Future<bool> _hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  Future<void> _checkConnectionOnStart() async {
    final status = await _connectivity.checkConnectivity();
    bool connected = status != ConnectivityResult.none;
    if (connected) {
      connected = await _hasInternet(); // 👈 check real internet
    }
    setState(() {
      _isOffline = !connected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child, // your app
        if (_isOffline)
          Container(
            color: Color(0xFFACDC94),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.wifi_off, size: 80, color: Colors.red),
                  const SizedBox(height: 20),
                  const Text(
                    "No Internet Connection",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      final status = await _connectivity.checkConnectivity();
                      bool connected = status != ConnectivityResult.none;
                      if (connected) {
                        connected = await _hasInternet();
                      }
                      setState(() {
                        _isOffline = !connected;
                      });
                    },
                    style: Design.buttonDesign,
                    child: const Text(
                      "Retry",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
