import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/Malakasatmaganda_animation/malakasatmagandaCT.dart';

class Malakasatmagandatitle extends StatefulWidget {
  const Malakasatmagandatitle({super.key});

  @override
  State<Malakasatmagandatitle> createState() => _MalakasatmagandatitleState();
}

class _MalakasatmagandatitleState extends State<Malakasatmagandatitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Malakas at Maganda",
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
      body: MalakasatmagandaCT(),
    );
  }
}
