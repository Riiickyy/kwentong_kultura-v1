import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/KunehoatPagong_animation/kunehoatpagongCT.dart';

class KunehoatPagongTitle extends StatefulWidget {
  const KunehoatPagongTitle({super.key});

  @override
  State<KunehoatPagongTitle> createState() => _KunehoatPagongTitleState();
}

class _KunehoatPagongTitleState extends State<KunehoatPagongTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ang Kuneho at ang Pagong",
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
      body: KunehotPagongCT(),
    );
  }
}
