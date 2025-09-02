import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/mariamakiling_animation/mariamakilingCT.dart';

class MariamakilingTitle extends StatefulWidget {
  const MariamakilingTitle({super.key});

  @override
  State<MariamakilingTitle> createState() => _MariamakilingTitleState();
}

class _MariamakilingTitleState extends State<MariamakilingTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Maria Makiling",
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
      body: MariamakilingCT(),
    );
  }
}
