import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Cards/MagkulayCards/characterCards.dart';

class Taramagkulay extends StatelessWidget {
  const Taramagkulay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pumili ng Kukulayan',
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
          // Background Color
          Container(color: Color(0xFFC5F1FF)),

          // Cloud Images - top and bottom
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/HomeUI/Cloud.png',
              width: MediaQuery.of(context).size.width, // Ensure full-width
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/HomeUI/Cloud.png',
              width: MediaQuery.of(context).size.width, // Ensure full-width
            ),
          ),

          CharacterCards(),
        ],
      ),
    );
  }
}
