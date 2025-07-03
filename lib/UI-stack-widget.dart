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
    return Scaffold(
      backgroundColor: Color(0xFFC5F1FF),
      body: Stack(
        children: [
          // Cloud Image Positioned at the top
          Positioned(
            top: 30,
            child: Image.asset('assets/images/HomeUI/Cloud.png'),
          ),

          // Wood Image and Title Positioned at the top center
          Positioned(
            top: 105, // Adjust top to place it properly
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/HomeUI/Wood.png',
                    fit: BoxFit.cover,
                    width:
                        MediaQuery.of(context).size.width *
                        0.8, // Responsive image width
                  ),
                  // Title Text "Kwentong Kultura"
                  Text(
                    'Kwentong\nKultura',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25),
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

          // Sun Cloud Positioned on the top right
          Positioned(
            top: 45,
            right: 10,
            child: Image.asset('assets/images/HomeUI/sunncloud.png'),
          ),

          // Grass Image at the bottom
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/images/HomeUI/Grass.png',
              fit: BoxFit.contain,
            ),
          ),

          // Turtle Image positioned towards the bottom right
          Positioned(
            bottom: 65,
            right: -5,
            child: Image.asset('assets/images/HomeUI/Turtle.png'),
          ),

          // Rock Image positioned towards the bottom left
          Positioned(
            bottom: 150,
            left: -5,
            child: Image.asset('assets/images/HomeUI/Rock.png'),
          ),

          // Home Buttons positioned near the middle of the screen
          Positioned(top: 270, right: 0, left: 0, child: Homebuttons()),
        ],
      ),
    );
  }
}
