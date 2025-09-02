import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/alamatngniyog_animation/alamatngniyogCT.dart';

class AlamatngniyogTitle extends StatefulWidget {
  const AlamatngniyogTitle({super.key});

  @override
  State<AlamatngniyogTitle> createState() => _AlamatngniyogTitleState();
}

class _AlamatngniyogTitleState extends State<AlamatngniyogTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alamat ng Niyog",
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
      body: AlamatngniyogCT(),
    );
  }
}
