import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/Sipagongatmatsing_animation/pagongatmatsing.dart';

class SiPagongatMatsing extends StatefulWidget {
  const SiPagongatMatsing({super.key});

  @override
  State<SiPagongatMatsing> createState() => _SiPagongatMatsingState();
}

class _SiPagongatMatsingState extends State<SiPagongatMatsing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Si Pagong at Matsing",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFFACDC94),
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: Pagongatmatsing(),
    );
  }
}
