import 'package:flutter/material.dart';
import 'package:kwentong_kultura/MagbasaPage/Alamatngpinya_Magbasa/Alamatngpinya_basa.dart';
import '../Styles/styles.dart';

class Magbasacards extends StatefulWidget {
  const Magbasacards({super.key});

  @override
  State<Magbasacards> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Magbasacards> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 40, 10, 40),

      child: Column(
        children: [
          //Alamat ng pinya at si malakas at maganda
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10),
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
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AlamatngpinyaBasa();
                                },
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10),
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
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AlamatngpinyaBasa();
                                },
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
            ],
          ),

          SizedBox(height: 20),
          // Sigong at Matsing at Si tipakling at langgam
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10),
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
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: Design.buttonDesign,
                          child: Text('Basahin', style: Design.tara),
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10),
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
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: Design.buttonDesign,
                          child: Text('Basahin', style: Design.tara),
                        ),
                      ],
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
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
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: Design.buttonDesign,
                          child: Text('Basahin', style: Design.tara),
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Alamat ng Niyog',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 40),
                        Text(
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: Design.buttonDesign,
                          child: Text('Basahin', style: Design.tara),
                        ),
                      ],
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
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
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: Design.buttonDesign,
                          child: Text('Basahin', style: Design.tara),
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Alamat ng Niyog',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 40),
                        Text(
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: Design.buttonDesign,
                          child: Text('Basahin', style: Design.tara),
                        ),
                      ],
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
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
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: Design.buttonDesign,
                          child: Text('Basahin', style: Design.tara),
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
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Ang Aso at ang Kanyang Anino',
                          style: Design.storyTitle,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 40),
                        Text(
                          'Lorem ipsum dolor Lorem ipsum dolor',
                          style: Design.desciption,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: Design.buttonDesign,
                          child: Text('Basahin', style: Design.tara),
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
