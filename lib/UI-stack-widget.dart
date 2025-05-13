import 'package:flutter/material.dart';
import 'buttons/Home-Buttons.dart';

class HomeUIWidget extends StatefulWidget {
  const HomeUIWidget({super.key});

  @override
  State<HomeUIWidget> createState() => _HomeUIWidgetState();
}

class _HomeUIWidgetState extends State<HomeUIWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // Wrap everything inside a Stack
      children: [
        Positioned(
          top: 30,
          child: Image.asset('assets/images/HomeUI/Cloud.png'),
        ),

        Positioned(
          top: 110,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,

              children: [
                Image.asset('assets/images/HomeUI/Wood.png'),

                Text(
                  'Kwentong\nKultura',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.25), // shadow color
                        offset: Offset(-3, 4),
                      ),
                    ],
                    color: Color(0xFF336404),
                    fontSize: 40,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 45,
          right: 10,
          child: Image.asset('assets/images/HomeUI/sunncloud.png'),
        ),
        Positioned(
          bottom: 0,
          child: Image.asset(
            'assets/images/HomeUI/Grass.png',
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: 65,
          right: -5,
          child: Image.asset('assets/images/HomeUI/Turtle.png'),
        ),
        Positioned(
          bottom: 150,
          left: -5,
          child: Image.asset('assets/images/HomeUI/Rock.png'),
        ),

        Positioned(top: 270, right: 0, left: 0, child: Homebuttons()),
      ],
    );
  }
}
