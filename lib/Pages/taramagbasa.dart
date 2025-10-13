import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/Styles/styles.dart';
import 'package:kwentong_kultura/UI-stack-widget.dart';
import 'package:kwentong_kultura/MagbasaPage/Alamatngmariamakiling/mariamakiling_basa.dart';
import 'package:kwentong_kultura/MagbasaPage/Alamatngmaya/alamatngmaya_basa.dart';
import 'package:kwentong_kultura/MagbasaPage/Alamatngniyog/alamatngniyog_basa.dart';
import 'package:kwentong_kultura/MagbasaPage/Alamatngpinya_Magbasa/Alamatngpinya_basa.dart';
import 'package:kwentong_kultura/MagbasaPage/Alamatngunggoy/alamatngunggoy_basa.dart';
import 'package:kwentong_kultura/MagbasaPage/AsoatKanyangAnino/asoatkanyanganino_basa.dart';
import 'package:kwentong_kultura/MagbasaPage/Kuneho%20at%20Pagong/kunehoatpagong_basa.dart';
import 'package:kwentong_kultura/MagbasaPage/MalakasatMaganda/malakasatmaganda_basa.dart';
import 'package:kwentong_kultura/MagbasaPage/PagongatMatsing/pagongatmatsing_basa.dart';
import 'package:kwentong_kultura/MagbasaPage/Tipaklong%20at%20Langgam/tipaklongatlanggam_basa.dart';

class Taramagbasa extends StatefulWidget {
  const Taramagbasa({super.key});

  @override
  State<Taramagbasa> createState() => _TaramagbasaState();
}

class _TaramagbasaState extends State<Taramagbasa> {
  @override
  void initState() {
    super.initState();
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              SlidePageRoute(
                page: const HomeUIWidget(),
                direction: SlideDirection.down,
              ),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: const Text(
          'Pumili ng Babasahin',
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
            child: Image.asset('assets/images/HomeUI/Cloud.png'),
          ),
          Positioned(
            bottom: 10,
            child: Image.asset('assets/images/HomeUI/Cloud.png'),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 40, 10, 40),

            child: Column(
              children: [
                //Alamat ng pinya at si malakas at maganda
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
                                  'assets/images/Thumbnails/Animation & Read/Ang Alamat ng Pinya.jpg',
                                  width: 150,
                                  height: 100,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Alamat ng Pinya',
                                  style: Design.storyTitle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Ang kwento ni pina at ng kanyang ina at paano nagkameron ng isang prutas na Pinya',
                                  style: Design.desciption,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      SlidePageRoute(
                                        page: AlamatngpinyaBasa(),
                                        direction: SlideDirection.right,
                                      ),
                                    );
                                  },
                                  style: Design.buttonDesign,
                                  child: Text('Basahin', style: Design.tara),
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
                                  'assets/images/Thumbnails/Animation & Read/Si Malakas at Maganda.png',
                                  width: 150,
                                  height: 100,
                                ),
                                SizedBox(height: 10), // Add spacing
                                Text(
                                  'Si Malakas at Maganda',
                                  style: Design.storyTitle,
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 10),
                                Text(
                                  'Ang unang lalaki na si Malakas at ang unang babae na si Maganda',
                                  style: Design.desciption,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      SlidePageRoute(
                                        page: MalakasatMagandaBasa(),
                                        direction: SlideDirection.right,
                                      ),
                                    );
                                  },
                                  style: Design.buttonDesign,
                                  child: Text('Basahin', style: Design.tara),
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
                // Sigong at Matsing at Si tipakling at langgam
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
                                  'assets/images/Thumbnails/Animation & Read/Si Matsing at ang Pagong.jpg',
                                  width: 150,
                                  height: 100,
                                ),
                                SizedBox(height: 10), // Add spacing
                                Text(
                                  'Si Pagong at Matsing',
                                  style: Design.storyTitle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Ang Kwento ng magkaibigang si Matsing at Pagong',
                                  style: Design.desciption,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      SlidePageRoute(
                                        page: PagongatMatsingBasa(),
                                        direction: SlideDirection.right,
                                      ),
                                    );
                                  },
                                  style: Design.buttonDesign,
                                  child: Text('Basahin', style: Design.tara),
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
                                  'assets/images/Thumbnails/Animation & Read/TipaklongAtLanggam.jpg',
                                  width: 150,
                                  height: 100,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Si Tipaklong at Langgam',
                                  style: Design.storyTitle,
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 10),
                                Text(
                                  'Ito ay kwento ng magkaibigang si Tipaklong at Langgam',
                                  style: Design.desciption,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      SlidePageRoute(
                                        page: TipaklongatlanggamBasa(),
                                        direction: SlideDirection.right,
                                      ),
                                    );
                                  },
                                  style: Design.buttonDesign,
                                  child: Text('Basahin', style: Design.tara),
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
                // Alamat ng Maya at Alamat ng Niyog
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
                                  'assets/images/Thumbnails/Animation & Read/Ang Alamat ng Maya.jpg',
                                  width: 150,
                                  height: 150,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Alamat ng Maya',
                                  style: Design.storyTitle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Ito ay ang kwento ng unang ibong maya',
                                  style: Design.desciption,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      SlidePageRoute(
                                        page: AlamatngmayaBasa(),
                                        direction: SlideDirection.right,
                                      ),
                                    );
                                  },
                                  style: Design.buttonDesign,
                                  child: Text('Basahin', style: Design.tara),
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
                                  'assets/images/Thumbnails/Animation & Read/AlamatngNiyog.jpg',
                                  width: 150,
                                  height: 100,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Alamat ng Niyog',
                                  style: Design.storyTitle,
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 10),
                                Text(
                                  'Ito ay kwento ng kauna-unahang puno ng Niyog',
                                  style: Design.desciption,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      SlidePageRoute(
                                        page: AlamatngniyogBasa(),
                                        direction: SlideDirection.right,
                                      ),
                                    );
                                  },
                                  style: Design.buttonDesign,
                                  child: Text('Basahin', style: Design.tara),
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
                // Ang kuneho at pagong at si maria makiling
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
                                  'assets/images/Thumbnails/Animation & Read/Ang Kuneho at ang Pagong.jpg',
                                  width: 150,
                                  height: 100,
                                ),
                                SizedBox(height: 10), // Add spacing
                                Text(
                                  'Ang Kuneho at ang Pagong',
                                  style: Design.storyTitle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Ito ay kwento ng paghahamon ng karera ni pagong sa kaibigan niya na si kuneho',
                                  style: Design.desciption,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      SlidePageRoute(
                                        page: KunehoatpagongBasa(),
                                        direction: SlideDirection.right,
                                      ),
                                    );
                                  },
                                  style: Design.buttonDesign,
                                  child: Text('Basahin', style: Design.tara),
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
                                  'assets/images/Thumbnails/Animation & Read/Makiling.jpg',
                                  width: 150,
                                  height: 100,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Alamat ng Maria Makiling',
                                  style: Design.storyTitle,
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 10),
                                Text(
                                  'Ang pag-iibigan ni Maria at Gatdula',
                                  style: Design.desciption,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      SlidePageRoute(
                                        page: MariamakilingBasa(),
                                        direction: SlideDirection.right,
                                      ),
                                    );
                                  },
                                  style: Design.buttonDesign,
                                  child: Text('Basahin', style: Design.tara),
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
                // Alamat ng unggoy at ang aso at ang kanyang anino
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
                                  'assets/images/Thumbnails/Animation & Read/Ang Alamat ng Unggoy.png',
                                  width: 150,
                                  height: 150,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Alamat ng Unggoy',
                                  style: Design.storyTitle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Ito ay ang kwento ng unang Unggoy',
                                  style: Design.desciption,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      SlidePageRoute(
                                        page: AlamatngunggoyBasa(),
                                        direction: SlideDirection.right,
                                      ),
                                    );
                                  },
                                  style: Design.buttonDesign,
                                  child: Text('Basahin', style: Design.tara),
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
                                  'assets/images/Thumbnails/Animation & Read/Ang Aso at ang kanyang Anino.jpg',
                                  width: 150,
                                  height: 100,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Ang Aso at ang Kanyang Anino',
                                  style: Design.storyTitle,
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 10),
                                Text(
                                  'Ito ay kwento ng paghahanap ng aso ng makakain para sa kanyang hapunan',
                                  style: Design.desciption,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      SlidePageRoute(
                                        page: AsoatkanyanganinoBasa(),
                                        direction: SlideDirection.right,
                                      ),
                                    );
                                  },
                                  style: Design.buttonDesign,
                                  child: Text('Basahin', style: Design.tara),
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
