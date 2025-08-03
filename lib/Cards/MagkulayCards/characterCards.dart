import 'package:flutter/material.dart';
import 'package:kwentong_kultura/ColorPage/Character/Ang%20Aso/angAso.dart';
import 'package:kwentong_kultura/ColorPage/Character/Si%20Kuneho/sikuneho.dart';
import 'package:kwentong_kultura/ColorPage/Character/Si%20Pagong/sipagong.dart';
import '../../Styles/styles.dart';

class CharacterCards extends StatefulWidget {
  const CharacterCards({super.key});

  @override
  State<CharacterCards> createState() => _CharacterCardsState();
}

class _CharacterCardsState extends State<CharacterCards> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 40, 10, 40),

      child: Column(
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
                      offset: Offset(0, 3),
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
                              MaterialPageRoute(
                                builder: (context) {
                                  return Pagong();
                                },
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
                      offset: Offset(0, 3),
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
                              MaterialPageRoute(
                                builder: (context) {
                                  return SiKuneho();
                                },
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
            ],
          ),

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
                      offset: Offset(0, 3),
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
                              MaterialPageRoute(
                                builder: (context) {
                                  return AngAso();
                                },
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
              SizedBox(width: 10),

              Container(
                height: 275,
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
                      offset: Offset(0, 3),
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
                        SizedBox(height: 10),
                        Text(
                          'Si Tipaklong',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 10),

                        ElevatedButton(
                          onPressed: () {},
                          style: Design.buttonDesign,
                          child: Text('Kulayan', style: Design.tara),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20.0),

          Row(
            children: [
              Container(
                height: 275,
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
                      offset: Offset(0, 3),
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
                        SizedBox(height: 10),
                        Text(
                          'Si Pinya',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: Design.buttonDesign,
                          child: Text('Kulayan', style: Design.tara),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),

              Container(
                height: 275,
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
                      offset: Offset(0, 3),
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
                        SizedBox(height: 10),
                        Text(
                          'Maria Makiling',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 10),

                        ElevatedButton(
                          onPressed: () {},
                          style: Design.buttonDesign,
                          child: Text('Kulayan', style: Design.tara),
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
