import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Background%20Classes/background_read.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/MagbasaPage/MalakasatMaganda/Scenes/MAMscene1.dart';
import 'package:kwentong_kultura/Styles/styles.dart';
import 'package:kwentong_kultura/Pages/taramagbasa.dart';

class MalakasatMagandaBasa extends StatefulWidget {
  const MalakasatMagandaBasa({super.key});

  @override
  State<MalakasatMagandaBasa> createState() => _MalakasatMagandaBasaState();
}

class _MalakasatMagandaBasaState extends State<MalakasatMagandaBasa> {
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
              SlidePageRoute(
                page: Taramagbasa(),
                direction: SlideDirection.right,
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
                          'assets/images/Read Scenes/Malakas at Maganda/SC1.png',
                        ), // Replace with your image
                        fit:
                            BoxFit
                                .contain, // You can adjust fit (contain, cover, etc.)
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
                  Text('Malakas at Maganda', style: Design.storyTitle),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    child: Container(
                      width: 300, // Specify the width here
                      child: Text(
                        'Isang ibong kulay abuhin ang naghahanap ng makakain.  \n\n'
                        'Nahila niya ang isang uod na nakasiksik sa isang puno ng kawayan.  \n',
                        style: Design.readStory,
                        textAlign: TextAlign.justify, // Justify the text
                      ),
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
                  SlidePageRoute(
                    page: Mamscene1(),
                    direction: SlideDirection.right,
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
