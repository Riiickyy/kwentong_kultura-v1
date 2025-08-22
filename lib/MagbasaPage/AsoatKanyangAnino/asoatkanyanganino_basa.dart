import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Background%20Classes/background_read.dart';
import 'package:kwentong_kultura/MagbasaPage/AsoatKanyangAnino/Scenes/AAKAAscene1.dart';
import 'package:kwentong_kultura/Styles/styles.dart';
import 'package:kwentong_kultura/Pages/taramagbasa.dart';

class AsoatkanyanganinoBasa extends StatefulWidget {
  const AsoatkanyanganinoBasa({super.key});

  @override
  State<AsoatkanyanganinoBasa> createState() => _AsoatkanyanganinoBasaState();
}

class _AsoatkanyanganinoBasaState extends State<AsoatkanyanganinoBasa> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // The back icon
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder:
                    (context, animation, secondaryAnimation) => Taramagbasa(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  const begin = Offset(
                    -1.0,
                    0.0,
                  ); // Start position (right side)
                  const end = Offset.zero; // End position (normal position)
                  const curve = Curves.easeInOut;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  // Create a fade animation for smooth fade in/out effect
                  var fadeAnimation = Tween(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(CurvedAnimation(parent: animation, curve: curve));

                  // Use both SlideTransition and FadeTransition
                  return FadeTransition(
                    opacity: fadeAnimation,
                    child: SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    ),
                  );
                },
              ),
              (Route<dynamic> route) => false,
            ); // This will navigate back to the previous screen
          },
        ),
        title: const Text(
          "Ang Aso at ang Kanyang Anino",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFFACDC94),
        elevation: 6,
        shadowColor: Colors.black54,
      ),
      body: Stack(
        children: [
          // Background: Rive animation filling the entire screen
          Positioned.fill(
            child: Opacity(
              opacity: 1.0, // Set the opacity value here (0.0 to 1.0)
              child: BackgroundRead(
                assetPath: 'assets/Animations/Read BG/read_bg.riv',
                stateMachineName: 'State Machine 1',
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Container(
                    height: screenHeight * 0.3, // 40% of the screen height
                    width: screenWidth * 0.8, // 60% of the screen width
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Read Scenes/Ang aso at kanyang anino/SC1.png',
                        ), // Replace with your image
                        fit:
                            BoxFit
                                .cover, // You can adjust fit (contain, cover, etc.)
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Ang Aso at ang Kanyang Anino',
                    style: Design.storyTitle,
                  ),
                  SizedBox(height: 20), // Adds vertical space between the texts
                  Container(
                    width: 300, // Specify the width here
                    child: Text(
                      'May isang asong naglalakad sa kagubatan at nakahanap ng makakain. \n Pagod na pagod siya habang nililibot ang buong paligid. ',
                      style: Design.readStory,
                      textAlign: TextAlign.justify, // Justify the text
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20, // Position below the Play button
            right: 20, // Positioned left with some margin
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder:
                        (context, animation, secondaryAnimation) =>
                            Aakaascene1(),
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      const begin = Offset(1.0, 0.0);
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
              style: Design.nextandPrevButtonDesign,
              icon: Icon(
                Icons.arrow_forward, // Next button icon
                size: 32, // Icon size
                color: Colors.white, // Icon color
              ),
              label: Text(
                'Next', // Button label
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Font size of label
                  fontWeight: FontWeight.bold, // Font weight
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
