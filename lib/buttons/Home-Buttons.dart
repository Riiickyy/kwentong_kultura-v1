import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kwentong_kultura/Pages/taramagbasa.dart';
import 'package:kwentong_kultura/Pages/taramagkulay.dart';
import 'package:kwentong_kultura/Pages/taramakinig.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class Homebuttons extends StatefulWidget {
  const Homebuttons({super.key});

  @override
  State<Homebuttons> createState() => _HomebuttonsState();
}

class _HomebuttonsState extends State<Homebuttons> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void playSound() async {
    await _audioPlayer.play(AssetSource('assets/Buttonclick.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          //button 1
          Positioned(
            bottom: 250,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  playSound();
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation, secondaryAnimation) =>
                              Taramagbasa(),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(
                          begin: begin,
                          end: end,
                        ).chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        // Use SlideTransition to apply the animation
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                style: Design.buttonDesign,
                child: SizedBox(
                  width: 180,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Tara\n', style: Design.tara),
                        TextSpan(text: 'Magbasa', style: Design.action),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          //button 1
          SizedBox(height: 21.0),

          //button 2
          Positioned(
            bottom: 250,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  playSound();
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation, secondaryAnimation) =>
                              Taramakinig(),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(
                          begin: begin,
                          end: end,
                        ).chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        // Use SlideTransition to apply the animation
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                style: Design.buttonDesign,
                child: SizedBox(
                  width: 180,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Tara\n', style: Design.tara),
                        TextSpan(text: 'Makinig', style: Design.action),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          //button 2

          //
          SizedBox(height: 21.0),

          //button 3
          Positioned(
            bottom: 250,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  playSound();
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation, secondaryAnimation) =>
                              Taramagkulay(),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(
                          begin: begin,
                          end: end,
                        ).chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        // Use SlideTransition to apply the animation
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                style: Design.buttonDesign,
                child: SizedBox(
                  width: 180,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Tara\n', style: Design.tara),
                        TextSpan(text: 'Magkulay', style: Design.action),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
