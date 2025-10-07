import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class AlamatngunggoyQuiz extends StatefulWidget {
  const AlamatngunggoyQuiz({super.key});

  @override
  State<AlamatngunggoyQuiz> createState() => _AlamatngunggoyQuizState();
}

class _AlamatngunggoyQuizState extends State<AlamatngunggoyQuiz> {
  int currentQuestionIndex = 0;
  bool isAnswerSelected = false;
  bool isAnswerCorrect = false;
  String selectedAnswer = '';
  int score = 0; // Initialize score
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Ano ang pangalan ng batang tamad?',
      'answers': ['a) Juan', 'b) Pedro', 'c) Jose'],
      'correctAnswer': 'a) Juan',
    },
    {
      'question': 'Ano ang ayaw gawin ni Juan?',
      'answers': ['a) Gumising ng maaga', 'b) Kumain', 'c) Maglaro'],
      'correctAnswer': 'a) Gumising ng maaga',
    },
    {
      'question': 'Ano ang ipinahanap ng ina niya?',
      'answers': ['a) Kutsara', 'b) Sandok', 'c) Plato'],
      'correctAnswer': 'b) Sandok',
    },
    {
      'question': 'Ano ang ibinigay ni Juan sa kanyang ina?',
      'answers': ['a) Kutsarang kahoy', 'b) Tinidor', 'c) Baso'],
      'correctAnswer': 'a) Kutsarang kahoy',
    },
    {
      'question': 'Ano ang ginawa ng ina nang hindi sumunod si Juan?',
      'answers': ['a) Pinagalitan siya', 'b) Pinuri siya', 'c) Pinatulog siya'],
      'correctAnswer': 'a) Pinagalitan siya',
    },
    {
      'question': 'Ano ang itinapon ng ina kay Juan?',
      'answers': ['a) Kutsara', 'b) Baso', 'c) Plato'],
      'correctAnswer': 'a) Kutsara',
    },
    {
      'question': 'Ano ang tumubo kay Juan?',
      'answers': ['a) Buntot', 'b) Sungay', 'c) Pakpak'],
      'correctAnswer': 'a) Buntot',
    },
    {
      'question': 'Ano ang kulay ng unggoy sa kwento?',
      'answers': ['a) Kayumanggi', 'b) Pula', 'c) Asul'],
      'correctAnswer': 'a) Kayumanggi',
    },
    {
      'question': 'Ano ang aral ng kwento?',
      'answers': [
        'a) Huwag maging tamad',
        'b) Laging maglaro',
        'c) Manloko ng magulang',
      ],
      'correctAnswer': 'a) Huwag maging tamad',
    },
    {
      'question': 'Ano ang naging hayop si Juan?',
      'answers': ['a) Unggoy', 'b) Leon', 'c) Kalabaw'],
      'correctAnswer': 'a) Unggoy',
    },
  ];

  @override
  void initState() {
    super.initState();
    questions.shuffle();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    BgmPlayer.player.play();
  }

  void onAnswerSelected(String answer) {
    setState(() {
      selectedAnswer = answer;
      isAnswerSelected = true;
      isAnswerCorrect =
          answer == questions[currentQuestionIndex]['correctAnswer'];

      // If answer is correct, add 3 points
      if (isAnswerCorrect) {
        score += 3;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < 4) {
        // Check if there are more questions
        currentQuestionIndex++;
        isAnswerSelected = false;
      } else {
        // Quiz is completed
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color(0xFFACDC94),
              title: Text('Quiz Completed', style: Design.readTitle),
              content: Text('Your score is $score/15', style: Design.RecoPass),

              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      questions.shuffle();
                      currentQuestionIndex =
                          0; // Restart quiz or go back to a main page
                      score = 0; // Reset the score
                      isAnswerSelected = false;
                    });
                  },
                  style: Design.buttonDesign, // Apply the design to the button
                  child: Text(
                    'OK',
                    style:
                        Design
                            .Normaltext, // You can use the Login style for text or define your own
                  ),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz',
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
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Animation Page/PaperBG.png',
                  ), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              width: 150,
              child: Image.asset('assets/Animations/Quiz/Cup.gif'),
            ),
            Positioned(
              bottom: -20,
              right: -50,
              width: 200,
              child: Image.asset('assets/Animations/Quiz/Confused.gif'),
            ),
            // The main content of the quiz (moved outside of the Stack)
            SingleChildScrollView(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 40),
                          Container(
                            width: constraints.maxWidth * 0.8,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFACDC94),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Mga tanong",
                                  style: Design.action,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  currentQuestion['question'],
                                  style: Design.storyTitle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                                ...currentQuestion['answers'].map((answer) {
                                  return ElevatedButton(
                                    style: Design.buttonDesign.copyWith(
                                      backgroundColor: MaterialStateProperty.all(
                                        isAnswerSelected
                                            ? (answer == selectedAnswer
                                                ? (isAnswerCorrect
                                                    ? Colors.green
                                                    : Colors
                                                        .red) // Green if correct, red if wrong
                                                : Color(
                                                  0xFFFFCCBC,
                                                )) // Default color if other answer is selected
                                            : Color(
                                              0xFFFFCCBC,
                                            ), // Default color when no answer is selected
                                      ),
                                    ),
                                    onPressed:
                                        isAnswerSelected
                                            ? null // Disable button if an answer is already selected
                                            : () => onAnswerSelected(
                                              answer,
                                            ), // Enable button for selection
                                    child: Text(answer, style: Design.tara),
                                  );
                                }).toList(),
                                SizedBox(height: 20),
                                if (isAnswerSelected)
                                  Column(
                                    children: [
                                      Text(
                                        isAnswerCorrect
                                            ? 'Correct! 🎉'
                                            : 'Wrong! The correct answer is: ${currentQuestion['correctAnswer']} 😞',
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              isAnswerCorrect
                                                  ? Colors.green
                                                  : Colors.red,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: nextQuestion,
                                        style: Design.buttonDesign,
                                        child: Text(
                                          'Next Question',
                                          style: Design.action,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
