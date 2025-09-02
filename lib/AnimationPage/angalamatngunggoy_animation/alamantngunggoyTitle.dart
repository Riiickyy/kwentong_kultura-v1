import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/angalamatngunggoy_animation/alamantngunggoyCT.dart';

class AlamantngunggoyTitle extends StatefulWidget {
  const AlamantngunggoyTitle({super.key});

  @override
  State<AlamantngunggoyTitle> createState() => _AlamantngunggoyTitleState();
}

class _AlamantngunggoyTitleState extends State<AlamantngunggoyTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alamat ng Unggoy",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFFACDC94),
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: AlamantngunggoyCT(),
    );
  }
}
