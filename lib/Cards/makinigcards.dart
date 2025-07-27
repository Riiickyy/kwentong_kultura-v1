import 'package:flutter/material.dart';
import 'package:kwentong_kultura/AnimationPage/Alamatngpinya_animation/alamatngpinyaCT.dart';
import 'package:kwentong_kultura/AnimationPage/Alamatngpinya_animation/pinyaTitle.dart';
import 'package:kwentong_kultura/AnimationPage/Sipagongatmatsing_animation/sipagongatmatsingTitle.dart';
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10), // Add spacing
                        Text(
                          'Alamat ng Pinya',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PinyaTitle();
                                },
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10), // Add spacing
                        Text(
                          'Si Malakas at Maganda',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 10),
                        Text(
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {},
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10), // Add spacing
                        Text(
                          'Si Pagong at Matsing',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SiPagongatMatsingTitle();
                                  },
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
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {},
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
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SiPagongatMatsingTitle();
                                  },
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
                          'Alamat ng Maya',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 40),
                        Text(
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {},
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10), // Add spacing
                        Text(
                          'Ang Kuneho at ang Pagong',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SiPagongatMatsingTitle();
                                  },
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
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {},
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
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
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SiPagongatMatsingTitle();
                                  },
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
                          'Ang Aso at ang kanyang Anino',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 40),
                        Text(
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10), // Add spacing
                        ElevatedButton(
                          onPressed: () {},
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
