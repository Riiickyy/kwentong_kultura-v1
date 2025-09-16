import 'package:flutter/material.dart';
import 'package:kwentong_kultura/MagbasaPage/Alamatngpinya_Magbasa/Scenes/ANPscene1.dart';
import 'package:kwentong_kultura/Styles/styles.dart';
import 'package:kwentong_kultura/Pages/taramagbasa.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';

class AlamatngpinyaBasa extends StatefulWidget {
  const AlamatngpinyaBasa({super.key});

  @override
  State<AlamatngpinyaBasa> createState() => _AlamatngpinyaBasaState();
}

class _AlamatngpinyaBasaState extends State<AlamatngpinyaBasa> {
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
              SlidePageRoute(
                page: Taramagbasa(),
                direction: SlideDirection.right,
              ),
              (Route<dynamic> route) => false,
            ); // This will navigate back to the previous screen
          },
        ),
        title: const Text(
          "Si Pagong at Matsing",
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
            child: Image.asset(
              'assets/images/Animation Page/PaperBG.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
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
                            'assets/images/Read Scenes/Alamat ng Pinya/SC1.png',
                          ), // Replace with your image
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Alamat ng Pinya', style: Design.readTitle),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      height: 450, // Specify the width here
                      child: Text(
                        'Mahal na mahal ni Aling Rosa ang kanyang anak na si Pina.  \n\n'
                        'Inaalagaan niya itong mabuti at hindi niya pinapagawa sa bahay upang hindi ito mapagod.  \n\n'
                        'Masaya na siyang nagsisilbi sa anak at gumawa ng lahat ng trabaho sa bahay \n',
                        style: Design.readStory,
                        textAlign: TextAlign.justify, // Justify the text
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/Animations/Read BG/Read-animate.gif',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: // Add padding around the button
                ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  SlidePageRoute(
                    page: Anpscene1(),
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
