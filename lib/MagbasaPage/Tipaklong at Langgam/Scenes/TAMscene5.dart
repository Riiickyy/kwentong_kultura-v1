import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/Tipaklongatlanggam_animation/tipaklongatlanggamTitle.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/Pages/taramagbasa.dart';
import 'package:kwentong_kultura/QUIZZES/tipaklongatlanggamQuiz.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class Tamscene5 extends StatefulWidget {
  const Tamscene5({super.key});

  @override
  State<Tamscene5> createState() => _Tamscene5State();
}

class _Tamscene5State extends State<Tamscene5> {
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
          "Si Tipaklong at Langgam",
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
                            'assets/images/Read Scenes/Tipaklong at Langgam/SC6.png',
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
                  height: 450,
                  child: Text(
                    'Langgam: Baka ako ang mawalan ng pagkain   \n'
                    'Paliwanag ni Langgam. \n\n'
                    'Malungkot na lumisan si Tipaklong.  \n\n'
                    'At naisip niya kung nag-ipon din siya ng makakain ay hindi niya mararamdaman ang gutom sa panahon ng tag-ulan.  \n\n',
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
                    page: Tipaklongatlanggamquiz(),
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
                    page: TipaklongatlanggamTitle(),
                    direction: SlideDirection.down,
                  ),
                );
              },
              style: Design.nextandPrevButtonDesign,
              icon: Icon(
                Icons.live_tv_sharp, // Next button icon
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
