import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Background%20Classes/background_read.dart';
import 'package:kwentong_kultura/MagbasaPage/Kuneho%20at%20Pagong/Scenes/KAPscene1.dart';
import 'package:kwentong_kultura/Styles/styles.dart';
import 'package:kwentong_kultura/Pages/taramagbasa.dart';

class KunehoatpagongBasa extends StatefulWidget {
  const KunehoatpagongBasa({super.key});

  @override
  State<KunehoatpagongBasa> createState() => _KunehoatpagongBasaState();
}

class _KunehoatpagongBasaState extends State<KunehoatpagongBasa> {
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
          "Ang Kuneho at ang Pagong",
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
                          'assets/images/Read Scenes/Pagong at Kuneho/SC1.png',
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
                  Text('Ang Kuneho at ang Pagong', style: Design.storyTitle),
                  SizedBox(height: 20), // Adds vertical space between the texts
                  Container(
                    width: 300, // Specify the width here
                    child: Text(
                      'Isang araw, ang kuneho at ang pagong ay nagpapahinga sa ilalim ng malaking, punong mangga.\n'
                      'Pagong: Kaibigang kuneho'
                      'wika ng pagong.\n'
                      'Pagong: Wala ba tayong gagawin kundi panoorin ang mga dahon ng punong manggang ito?\n'
                      'Kuneho: Bakit, ano ba ang gusto mong gawin?'
                      'tanong ng kuneho.',
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
                        (context, animation, secondaryAnimation) => Kapscene1(),
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
