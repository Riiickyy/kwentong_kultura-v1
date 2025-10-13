import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/Styles/styles.dart';
import 'package:kwentong_kultura/ColorPage/Character/Ang%20Aso/angAso.dart';
import 'package:kwentong_kultura/ColorPage/Character/Langgam/siLanggam.dart';
import 'package:kwentong_kultura/ColorPage/Character/Maganda/maganda.dart';
import 'package:kwentong_kultura/ColorPage/Character/Malakas/malakas.dart';
import 'package:kwentong_kultura/ColorPage/Character/Maria/Maria.dart';
import 'package:kwentong_kultura/ColorPage/Character/Maya/Maya.dart';
import 'package:kwentong_kultura/ColorPage/Character/Pinya/pinya.dart';
import 'package:kwentong_kultura/ColorPage/Character/Si%20Kuneho/sikuneho.dart';
import 'package:kwentong_kultura/ColorPage/Character/Si%20Pagong/sipagong.dart';
import 'package:kwentong_kultura/ColorPage/Character/Tipaklong/sitipaklong.dart';
import 'package:kwentong_kultura/ColorPage/Character/Unggoy/unggoy.dart';
import 'package:kwentong_kultura/ColorPage/Character/Yumi/yumi.dart';

class Taramagkulay extends StatefulWidget {
  const Taramagkulay({super.key});

  @override
  State<Taramagkulay> createState() => _TaramagkulayState();
}

class _TaramagkulayState extends State<Taramagkulay> {
  @override
  void initState() {
    super.initState();
    // 🔒 Lock this screen to portrait only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
        SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pumili ng Kukulayan',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFFACDC94),
        elevation: 6,
        shadowColor: Colors.black54,
      ),
      body: Stack(
        children: [
          Container(color: const Color(0xFFC5F1FF)),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/HomeUI/Cloud.png',
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/HomeUI/Cloud.png',
              width: MediaQuery.of(context).size.width,
            ),
          ),
         SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 40, 10, 40),

      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),

                  child: Card(
                    color: Color(0xFFACDC94),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/Thumbnails/Kulay/Character/Sipagongthumbnail.png',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Si Pagong',
                            style: Design.storyTitle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Pagong(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: Text('Kulayan', style: Design.tara),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Card(
                    color: Color(0xFFACDC94),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/Thumbnails/Kulay/Character/Kunehothumbnail.jpg',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Si Kuneho',
                            style: Design.storyTitle,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: SiKuneho(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: Text('Kulayan', style: Design.tara),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),

                  child: Card(
                    color: Color(0xFFACDC94),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/Thumbnails/Kulay/Character/Ang aso Thumbnail.jpg',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Ang Aso',
                            style: Design.storyTitle,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: AngAso(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: Text('Kulayan', style: Design.tara),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Card(
                    color: Color(0xFFACDC94),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/Thumbnails/Kulay/Character/Tipaklong.png',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Si Tipaklong',
                            style: Design.storyTitle,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Sitipaklong(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: Text('Kulayan', style: Design.tara),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20.0),

          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Card(
                    color: Color(0xFFACDC94),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/Thumbnails/Kulay/Character/Pinya.png',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Ang Pinya',
                            style: Design.storyTitle,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Pinya(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: Text('Kulayan', style: Design.tara),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Card(
                    color: Color(0xFFACDC94),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/Thumbnails/Kulay/Character/Maria Makiling.png',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Maria Makiling',
                            style: Design.storyTitle,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Maria(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: Text('Kulayan', style: Design.tara),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20.0),

          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),

                  child: Card(
                    color: Color(0xFFACDC94),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/Thumbnails/Kulay/Character/Unggoy.png',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Ang Unggoy',
                            style: Design.storyTitle,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Unggoy(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: Text('Kulayan', style: Design.tara),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Card(
                    color: Color(0xFFACDC94),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/Thumbnails/Kulay/Character/Maya.png',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Ang Maya',
                            style: Design.storyTitle,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Maya(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: Text('Kulayan', style: Design.tara),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),

          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),

                  child: Card(
                    color: Color(0xFFACDC94),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/Thumbnails/Kulay/Character/Malakas.png',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Si Malakas',
                            style: Design.storyTitle,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Malakas(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: Text('Kulayan', style: Design.tara),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Card(
                    color: Color(0xFFACDC94),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/Thumbnails/Kulay/Character/Maganda.png',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Si Maganda',
                            style: Design.storyTitle,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Maganda(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: Text('Kulayan', style: Design.tara),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),

                  child: Card(
                    color: Color(0xFFACDC94),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/Thumbnails/Kulay/Character/Yumi.png',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Si Yumi',
                            style: Design.storyTitle,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Yumi(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: Text('Kulayan', style: Design.tara),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFACDC94),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Card(
                    color: Color(0xFFACDC94),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/Thumbnails/Kulay/Character/Langgam.png',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Si Langgam',
                            style: Design.storyTitle,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: Silanggam(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            },
                            style: Design.buttonDesign,
                            child: Text('Kulayan', style: Design.tara),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
        ],
      ),
    );
  }
}
