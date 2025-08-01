import 'package:flutter/material.dart';
import 'package:kwentong_kultura/ColorPage/Scenario/Kareranipagongatkuneho/Karera_ni_pagong_at_kuneho.dart';
import 'package:kwentong_kultura/ColorPage/Scenario/PagongkunehoMangga/PagongKunehoMangga.dart';
import '../../Styles/styles.dart';

class ScenarioCards extends StatelessWidget {
  const ScenarioCards({super.key});

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
                          'assets/images/Thumbnails/Kulay/Scenario/Pagong at ang kuneho sa ilalim ng mangga thumbnail.jpg',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Si Pagong at Kuneho sa ilalim ng puno',
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
                                  return PagongKunehoMangga();
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
                        Image.asset(
                          'assets/images/Thumbnails/Kulay/Scenario/Karera ni kuneho at pagong.jpg',
                          width: 150,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Karera ni Pagong at Kuneho',
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
                                  return KareraNiPagongAtKuneho();
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
                          'Si Matsing',
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
                          'Si Bakunawa',
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
