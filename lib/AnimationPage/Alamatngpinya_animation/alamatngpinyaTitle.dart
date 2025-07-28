import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/Alamatngpinya_animation/alamatngpinyaCT.dart';

class AlamatngpinyaTitle extends StatefulWidget {
  const AlamatngpinyaTitle({super.key});

  @override
  State<AlamatngpinyaTitle> createState() => _AlamatngpinyaTitleState();
}

class _AlamatngpinyaTitleState extends State<AlamatngpinyaTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alamat ng Pinya",
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
      body: AlamatngpinyaCT(),
    );
  }
}
