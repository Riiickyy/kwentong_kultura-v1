import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Login-Folder/Alamatngpinya_Magbasa/Scenes/ANPscene1.dart';

class AlamatngpinyaBasa extends StatefulWidget {
  const AlamatngpinyaBasa({super.key});

  @override
  State<AlamatngpinyaBasa> createState() => _AlamatngpinyaBasaState();
}

class _AlamatngpinyaBasaState extends State<AlamatngpinyaBasa> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alamat ng Pinya",
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Container(height: 300, width: 250, color: Colors.blue),
                ),
              ),
              SizedBox(height: 20),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'YOUR STORY',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20), // Adds vertical space between the texts
                  Container(
                    width: 300, // Specify the width here
                    child: Text(
                      'STORY IS ALL about ....dsdssdsdsfddffsdfrf',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify, // Justify the text
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20, // Position below the Play button
            right: 20, // Positioned left with some margin
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Anpscene1(); // Change this to your next screen
                    },
                  ),
                );
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ), // Makes the button rounded
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Colors.orange.shade300, // Button color
                ),
                shadowColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 0, 0, 0), // Shadow color
                ),
                elevation: MaterialStateProperty.all(7), // Shadow effect
              ),
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
        ],
      ),
    );
  }
}
