import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Cards/magbasacards.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/UI-stack-widget.dart';

class Taramagbasa extends StatefulWidget {
  const Taramagbasa({super.key});

  @override
  State<Taramagbasa> createState() => _TaramagbasaState();
}

class _TaramagbasaState extends State<Taramagbasa> {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              SlidePageRoute(
                page: const HomeUIWidget(),
                direction: SlideDirection.down,
              ),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: const Text(
          'Pumili ng Babasahin',
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
          const Magbasacards(),
        ],
      ),
    );
  }
}
