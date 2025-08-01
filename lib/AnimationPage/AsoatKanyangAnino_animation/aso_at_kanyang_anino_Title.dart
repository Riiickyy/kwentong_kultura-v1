import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/AsoatKanyangAnino_animation/aso_at_kanyang_anino_CT.dart';

class AsoAtKanyangAninoTitle extends StatefulWidget {
  const AsoAtKanyangAninoTitle({super.key});

  @override
  State<AsoAtKanyangAninoTitle> createState() => _AsoAtKanyangAninoTitleState();
}

class _AsoAtKanyangAninoTitleState extends State<AsoAtKanyangAninoTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ang Aso at ang kanyang Anino",
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
      body: AsoAtKanyangAninoCT(),
    );
  }
}
