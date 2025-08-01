import 'package:flutter/material.dart';

import 'package:kwentong_kultura/Cards/magbasacards.dart';

class Taramagbasa extends StatelessWidget {
  const Taramagbasa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pumili ng Babasahin',
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
      body: Stack(
        children: [
          Container(color: Color(0xFFC5F1FF)),

          Positioned(
            top: 50,
            child: Image.asset('assets/images/HomeUI/Cloud.png'),
          ),
          Positioned(
            bottom: 10,
            child: Image.asset('assets/images/HomeUI/Cloud.png'),
          ),

          Magbasacards(),
        ],
      ),
    );
  }
}
