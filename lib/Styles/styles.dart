import 'package:flutter/material.dart';

class Design {
  static ButtonStyle buttonDesign = ElevatedButton.styleFrom(
    backgroundColor: Color(0xFFFFCCBC),
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 4, // Controls the shadow intensity
    shadowColor: Colors.black.withOpacity(0.5),
  );
  static ButtonStyle LoginbuttonDesign = ElevatedButton.styleFrom(
    backgroundColor: Color(0xFFFFCCBC),
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 4, // Controls the shadow intensity
    shadowColor: Colors.black.withOpacity(0.5),
  );
  static ButtonStyle nextandPrevButtonDesign = ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    backgroundColor: Colors.orange.shade300, // Button color
    shadowColor: Color(0xFF3f3f3f), // Shadow color
    elevation: 7, // Shadow effect
  );
  static ButtonStyle playVideoButtonDesign = ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
    shape: CircleBorder(),
    backgroundColor: Colors.orange.shade300, // Button color
    shadowColor: const Color.fromARGB(255, 0, 0, 0), // Shadow color
    elevation: 7, // Shadow effect
  );
  static ButtonStyle quizButtonDesign = ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
    shape: CircleBorder(),
    backgroundColor: Colors.orange.shade300, // Button color
    shadowColor: Color(0xFF3f3f3f),
    elevation: 7, // Shadow effect
  );
  static TextStyle tara = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Nunito',
    color: Colors.black,
  );
  static TextStyle action = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    fontFamily: 'Nunito',
    color: Colors.black,
  );
  static TextStyle desciption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    fontFamily: 'Nunito',
    color: Color(0xFF6B6B6B),
  );
  static TextStyle storyTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    fontFamily: 'Nunito',
    color: Colors.black,
  );
  static TextStyle Normaltext = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    fontFamily: 'Nunito',
    color: Colors.black,
  );
  static TextStyle Login = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Nunito',
    color: Colors.black,
  );
  static TextStyle RecoPass = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Nunito',
    color: Colors.black,
  );
  static TextStyle readStory = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: 'Nunito',
    color: Color(0xFF3f3f3f),
  );
  static TextStyle readTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    fontFamily: 'Nunito',
    color: Colors.black,
  );
}
