import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/Alamatngpinya_animation/alamatngpinyaTitle.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/Pages/taramagbasa.dart';
import 'package:kwentong_kultura/QUIZZES/pinyaQuiz.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class Anpscene7 extends StatefulWidget {
  const Anpscene7({super.key});

  @override
  State<Anpscene7> createState() => _Anpscene7State();
}

class _Anpscene7State extends State<Anpscene7> {
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
                direction: SlideDirection.left,
              ),
              (Route<dynamic> route) => false,
            ); // This will navigate back to the previous screen
          },
        ),
        title: const Text(
          "Ang Alamat ng Pinya",
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
                            'assets/images/Read Scenes/Alamat ng Pinya/SC8.png',
                          ), // Replace with your image
                          fit:
                              BoxFit
                                  .contain, // You can adjust fit (contain, cover, etc.)
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

                Container(
                  width: 300,
                  height: 870,
                  child: Text(
                    'Sa isang sulok ng kanilang bakuran ay nakita niya ang isang halaman na ang bunga ay tulad ng isang ulo na maraming mata.   \n \n'
                    'Naalala ni Aling Rosa ang sinabi sa kanyang anak:\n\n'
                    '“Sana’y tubuan ka ng maraming mata nang makita mo ang iyong hinahanap!” \n\n'
                    'Napaiyak si Aling Rosa at iniisip na ang ang hamang tumubo sa kanyang bakuran ay ang kanyang anak na si Pina. \n\n'
                    'Inalagaan niya ang halaman ay simula noon ay tinawag niya itong Pinya.\n\n',
                    style: Design.readStory,
                    textAlign: TextAlign.justify, // Justify the text
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/Animations/Read BG/Read-animate.gif',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20, // Position below the Play button
            right: 20, // Positioned left with some margin
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  SlidePageRoute(
                    page: Pinyaquiz(),
                    direction: SlideDirection.up,
                  ),
                );
              },
              style: Design.nextandPrevButtonDesign,
              icon: Icon(
                Icons.quiz, // Next button icon
                size: 32, // Icon size
                color: Colors.white, // Icon color
              ),
              label: Text(
                'Take Quiz', // Button label
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
                  SlidePageRoute(
                    page: AlamatngpinyaTitle(),
                    direction: SlideDirection.down,
                  ),
                );
              },
              style: Design.nextandPrevButtonDesign,
              icon: Icon(
                Icons.live_tv_rounded, // Next button icon
                size: 32, // Icon size
                color: Colors.white, // Icon color
              ),
              label: Text(
                'Watch', // Button label
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
