import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/Alamatngpinya_animation/alamatngpinyaTitle.dart';
import 'package:kwentong_kultura/AnimationPage/AsoatKanyangAnino_animation/aso_at_kanyang_anino_Title.dart';
import 'package:kwentong_kultura/AnimationPage/KunehoatPagong_animation/kunehoatpagongTitle.dart';
import 'package:kwentong_kultura/AnimationPage/Sipagongatmatsing_animation/sipagongatmatsingTitle.dart';
import 'package:kwentong_kultura/AnimationPage/Malakasatmaganda_animation/malakasatmagandaTitle.dart';
import 'package:kwentong_kultura/AnimationPage/Tipaklongatlanggam_animation/tipaklongatlanggamTitle.dart';
import 'package:kwentong_kultura/AnimationPage/alamatngmaya_animation/alamatngmayaTitle.dart';
import 'package:kwentong_kultura/AnimationPage/alamatngniyog_animation/alamatngniyogTitle.dart';
import 'package:kwentong_kultura/AnimationPage/angalamatngunggoy_animation/alamantngunggoyTitle.dart';
import 'package:kwentong_kultura/AnimationPage/mariamakiling_animation/mariamakilingTitle.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import '../Styles/styles.dart';

class Makinigcards extends StatefulWidget {
  const Makinigcards({super.key});

  @override
  State<Makinigcards> createState() => _MakinigcardsState();
}

class _MakinigcardsState extends State<Makinigcards> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 40, 10, 40),

      child: Column(
        //Alamat ng pinya at si malakas at maganda
        children: [
          Row(
            children: [
              Container(
                width: 165,
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
                          'Ito ay ag kwento kung paano nagkameron ng prutas na Pinya',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: AlamatngpinyaTitle(),
                                direction: SlideDirection.right,
                              ),
                            );
                          },
                          style: Design.buttonDesign,
                          child: Text('Pakinggan', style: Design.tara),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),

              Container(
                width: 165,
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
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: Malakasatmagandatitle(),
                                direction: SlideDirection.right,
                              ),
                            );
                          },
                          style: Design.buttonDesign,
                          child: Text('Pakinggan', style: Design.tara),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Tipaklong at langgam at pagong at matsing
          SizedBox(height: 20),

          Row(
            children: [
              Container(
                width: 165,
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
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: SiPagongatMatsingTitle(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            }
                          },
                          style: Design.buttonDesign,
                          child: Text('Pakinggan', style: Design.tara),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),

              Container(
                width: 165,
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10), // Add spacing
                        Text(
                          'Si Tipaklong at Langgam',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 40),
                        Text(
                          'Ito ay kwento ng magkaibigang si Tipaklong at Langgam',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: TipaklongatlanggamTitle(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            }
                          },
                          style: Design.buttonDesign,
                          child: Text('Pakinggan', style: Design.tara),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Alamat ng Maya at Alamat ng Niyog
          SizedBox(height: 20),

          Row(
            children: [
              Container(
                width: 165,
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10), // Add spacing
                        Text(
                          'Ang Alamat ng Niyog',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Ito ay kwento ng kauna-unahang puno ng Niyog',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: AlamatngniyogTitle(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            }
                          },
                          style: Design.buttonDesign,
                          child: Text('Pakinggan', style: Design.tara),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),

              Container(
                width: 165,
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
                          height: 100,
                        ),
                        SizedBox(height: 10), // Add spacing
                        Text(
                          'Alamat ng Maya',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 40),
                        Text(
                          'Ito ay ang kwento ng unang ibong maya',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: AlamatngmayaTitle(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            }
                          },
                          style: Design.buttonDesign,
                          child: Text('Pakinggan', style: Design.tara),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          //Ang kuneho at Pagong at maria makiling
          SizedBox(height: 20),

          Row(
            children: [
              Container(
                width: 165,
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
                            {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: KunehoatPagongTitle(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            }
                          },
                          style: Design.buttonDesign,
                          child: Text('Pakinggan', style: Design.tara),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),

              Container(
                width: 165,
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10), // Add spacing
                        Text(
                          'Maria Makiling',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 40),
                        Text(
                          'Ang pag-iibigan ni Maria at Gatdula',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: MariamakilingTitle(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            }
                          },
                          style: Design.buttonDesign,
                          child: Text('Pakinggan', style: Design.tara),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          //Alamay ng Unggoy at ang aso at ang kanyang anino
          SizedBox(height: 20),

          Row(
            children: [
              Container(
                width: 165,
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
                        SizedBox(height: 10), // Add spacing
                        Text(
                          'Ang Alamat ng Unggoy',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Ito ay ang kwento ng unang Unggoy',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: AlamantngunggoyTitle(),
                                  direction: SlideDirection.right,
                                ),
                              );
                            }
                          },
                          style: Design.buttonDesign,
                          child: Text('Pakinggan', style: Design.tara),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),

              Container(
                width: 165,
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
                        SizedBox(height: 10), // Add spacing
                        Text(
                          'Ang Aso at ang kanyang Anino',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 40),
                        Text(
                          'Ito ay kwento ng paghahanap ng aso ng makakain para sa kanyang hapunan',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: AsoAtKanyangAninoTitle(),
                                direction: SlideDirection.right,
                              ),
                            );
                          },
                          style: Design.buttonDesign,
                          child: Text('Pakinggan', style: Design.tara),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
