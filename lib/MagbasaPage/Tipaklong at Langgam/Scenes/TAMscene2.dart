import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/MagbasaPage/Tipaklong%20at%20Langgam/Scenes/TAMscene1.dart';
import 'package:kwentong_kultura/MagbasaPage/Tipaklong%20at%20Langgam/Scenes/TAMscene3.dart';
import 'package:kwentong_kultura/Pages/taramagbasa.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class Tamscene2 extends StatefulWidget {
  const Tamscene2({super.key});

  @override
  State<Tamscene2> createState() => _Tamscene2State();
}

class _Tamscene2State extends State<Tamscene2> {
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
                            'assets/images/Read Scenes/Tipaklong at Langgam/SC3.png',
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

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 950,
                      child: Text(
                        'Tipaklong: Hay naku! Langgam, bakit nagtitiyaga kang magbuhat ng mga mabibigat na pagkain gayong kay dami namang pagkain sa paligid,  \n\n'
                        'Panunudyo ni Tipaklong kay Langgam na halos di makalakad dahil sa bigat ng kanyang pinapasan.\n\n'
                        'Langgam: Nag-iipon na kasi ako ng aking makakain. Alam mo namang malapit na ang tag-ulan \n\n'
                        'Sagot naman ni Langgam. \n\n'
                        'Tipaklong: Matagal pa iyong sinasabi mong tag-ulan. Hatika muna rito, tularan mo ako, nagsasaya, pakanta-kanta. Hindi ako nagpapakapagod na katulad mo,\n\n'
                        'Wika ni Tipaklong \n\n'
                        'Hindi na pinansin ni Langgam si Tipaklong. Nagpatuloy na ito sa paglalakad. \n\n',
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
            bottom: 20, // Position below the Play button
            right: 20, // Positioned left with some margin
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  SlidePageRoute(
                    page: Tamscene3(),
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
                    page: Tamscene1(),
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
