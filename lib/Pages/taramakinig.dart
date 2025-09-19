import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Cards/makinigcards.dart';

class Taramakinig extends StatefulWidget {
  const Taramakinig({super.key});

  @override
  State<Taramakinig> createState() => _TaramakinigState();
}

class _TaramakinigState extends State<Taramakinig> {
  @override
  void initState() {
    super.initState();
    // 🔒 Lock to portrait only while on this screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // 🔓 Reset to allow all orientations again after leaving this screen
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pumili ng Papanoorin',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFFACDC94),
        elevation: 6,
        shadowColor: Colors.black54,
      ),
      body: Stack(
        children: [
          Container(color: const Color(0xFFC5F1FF)),
          Positioned(
            top: 50,
            child: Image.asset('assets/images/HomeUI/Cloud.png'),
          ),
          Positioned(
            bottom: 10,
            child: Image.asset('assets/images/HomeUI/Cloud.png'),
          ),
          const Makinigcards(),
        ],
      ),
    );
  }
}
