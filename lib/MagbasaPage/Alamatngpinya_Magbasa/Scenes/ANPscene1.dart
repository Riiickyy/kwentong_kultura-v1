import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/MagbasaPage/Alamatngpinya_Magbasa/Alamatngpinya_basa.dart';
import 'package:kwentong_kultura/MagbasaPage/Alamatngpinya_Magbasa/Scenes/ANPscene2.dart';
import 'package:kwentong_kultura/Pages/taramagbasa.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class Anpscene1 extends StatefulWidget {
  const Anpscene1({super.key});

  @override
  State<Anpscene1> createState() => _Anpscene1State();
}

class _Anpscene1State extends State<Anpscene1> {
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
                            'assets/images/Read Scenes/Alamat ng Pinya/SC2.png',
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
                  height: 770,
                  child: Text(
                    'Si Pina ay lumaki sa layaw dahil na rin sa kagagawan ni Aling Rosa. \n \n'
                    'Gustuhin man niyang turuan itong gumawa sa bahay at magbago ng ugali ay hindi na niya magawa. \n\n'
                    'Ayaw nang baguhin ni Pina ang kanyang nakasanayang masarap na buhay .  \n\n'
                    'Kung kaya’t napilitan si Aling Rosa na kahit matanda na ay siya pa rin ang nagtatrabaho at gumawa ng lahat ng gawain sa bahay. ',
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
                    page: Anpscene2(),
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
          Positioned(
            bottom: 20, // Position below the Play button
            left: 20, // Positioned left with some margin
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  SlidePageRoute(
                    page: AlamatngpinyaBasa(),
                    direction: SlideDirection.left,
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
