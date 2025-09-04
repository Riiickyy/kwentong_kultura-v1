import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/Tipaklongatlanggam_animation/tipaklongatlanggamCT.dart';

class TipaklongatlanggamTitle extends StatefulWidget {
  const TipaklongatlanggamTitle({super.key});

  @override
  State<TipaklongatlanggamTitle> createState() =>
      _TipaklongatlanggamTitleState();
}

class _TipaklongatlanggamTitleState extends State<TipaklongatlanggamTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Si Tipaklong at Langgam",
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
      body: TipaklongatlanggamCT(),
    );
  }
}
