import 'package:flutter/material.dart';
import 'package:kwentong_kultura/MagbasaPage/AsoatKanyangAnino/Scenes/AAKAAscene2.dart';
import 'package:kwentong_kultura/MagbasaPage/AsoatKanyangAnino/Scenes/AAKAAscene4.dart';
import 'package:kwentong_kultura/Pages/taramagbasa.dart';
import 'package:kwentong_kultura/Background%20Classes/background_read.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class Aakaascene3 extends StatefulWidget {
  const Aakaascene3({super.key});

  @override
  State<Aakaascene3> createState() => _Aakaascene3State();
}

class _Aakaascene3State extends State<Aakaascene3> {
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
          Positioned.fill(
            child: Opacity(
              opacity: 1.0,
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
                          'assets/images/Read Scenes/Ang aso at kanyang anino/SC4.png',
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
                  Container(
                    width: 300, // Specify the width here
                    child: Text(
                      'Ang buong akala niya’y may isa pang may hawak ng buto.\n'
                      'Sa kanyang pagnanasang mapasakanya pa ang buto, ibinukas niya ang kanyang bibig para kunin ito. \n'
                      'Nahulog ang butong hawak niya at ito’y pumasa-ilalim na sa tubig. \n',
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
                            Aakaascene4(),
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
          Positioned(
            bottom: 20, // Position below the Play button
            left: 20, // Positioned left with some margin
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder:
                        (context, animation, secondaryAnimation) =>
                            Aakaascene2(),
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      const begin = Offset(-1.0, 0.0);
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
                Icons.arrow_back, // Next button icon
                size: 32, // Icon size
                color: Colors.white, // Icon color
              ),
              label: Text(
                'Prev', // Button label
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
