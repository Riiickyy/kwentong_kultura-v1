import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Cards/MagkulayCards/characterCards.dart';

class Taramagkulay extends StatefulWidget {
  const Taramagkulay({super.key});

  @override
  State<Taramagkulay> createState() => _TaramagkulayState();
}

class _TaramagkulayState extends State<Taramagkulay> {
  @override
  void initState() {
    super.initState();
    // 🔒 Lock this screen to portrait only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // 🔓 Allow all orientations again after leaving
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pumili ng Kukulayan',
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
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/HomeUI/Cloud.png',
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/HomeUI/Cloud.png',
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const CharacterCards(),
        ],
      ),
    );
  }
}
