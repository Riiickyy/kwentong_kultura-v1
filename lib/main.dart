import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'Login-Folder/firstUI.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'auth_layout.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MaterialApp(title: 'Kwentong Kultura', home: KwentongKultura()));
}

class KwentongKultura extends StatefulWidget {
  const KwentongKultura({super.key});
  @override
  State<KwentongKultura> createState() => _KwentongKulturaState();
}

class _KwentongKulturaState extends State<KwentongKultura> {
  @override
  void initState() {
    super.initState();
    initialization();
    BgmPlayer.init();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthLayout(
        pageIfNotConnected: const Firstui(),
      ), // Use AuthLayout here
    );
  }
}
