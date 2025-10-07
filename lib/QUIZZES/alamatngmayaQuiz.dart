import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class AlamatngmayaQuiz extends StatefulWidget {
  const AlamatngmayaQuiz({super.key});

  @override
  State<AlamatngmayaQuiz> createState() => _AlamatngmayaQuizState();
}

class _AlamatngmayaQuizState extends State<AlamatngmayaQuiz> {
  int currentQuestionIndex = 0;
  bool isAnswerSelected = false;
  bool isAnswerCorrect = false;
  String selectedAnswer = '';
  int score = 0; // Initialize score

  //quiz questions and answers
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Ano ang pangalan ng batang babae?',
      'answers': ['a) Mayan', 'b) Pina', 'c) Yumi'],
      'correctAnswer': 'a) Mayan',
    },
    {
      'question': 'Ano ang ginagawa ng ina ni Mayan?',
      'answers': [
        'a) Naghuhugas ng pinggan',
        'b) Nagbabayo ng palay',
        'c) Nagtatanim',
      ],
      'correctAnswer': 'b) Nagbabayo ng palay',
    },
    {
      'question': 'Ano ang ginawa ni Mayan dahil sa gutom?',
      'answers': ['a) Kumain ng bigas', 'b) Uminom ng tubig', 'c) Natulog'],
      'correctAnswer': 'a) Kumain ng bigas',
    },
    {
      'question': 'Saan nagtago si Mayan?',
      'answers': ['a) Sa silong', 'b) Sa bakol', 'c) Sa puno'],
      'correctAnswer': 'b) Sa bakol',
    },
    {
      'question': 'Anong hayop ang lumabas mula sa bakol?',
      'answers': ['a) Kalapati', 'b) Ibon', 'c) Agila'],
      'correctAnswer': 'b) Ibon',
    },
    {
      'question': 'Ano ang ginawa ng ibon nang lumabas ito?',
      'answers': ['a) Kumanta', 'b) Kumain ng bigas', 'c) Lumipad palayo'],
      'correctAnswer': 'b) Kumain ng bigas',
    },
    {
      'question': 'Ano ang kulay ng ibon?',
      'answers': ['a) Kayumanggi', 'b) Malaki at puti', 'c) Itim'],
      'correctAnswer': 'a) Kayumanggi',
    },
    {
      'question': 'Ano ang naramdaman ng ina nang makita ang ibon?',
      'answers': ['a) Saya', 'b) Paghihinala', 'c) Galit'],
      'correctAnswer': 'b) Paghihinala',
    },
    {
      'question': 'Ano ang naging parusa kay Mayan dahil sa katamaran?',
      'answers': ['a) Naging aso', 'b) Naging ibon', 'c) Naging bulaklak'],
      'correctAnswer': 'b) Naging ibon',
    },
    {
      'question': 'Anong aral ang makukuha?',
      'answers': [
        'a) Maging masipag',
        'b) Kumain ng marami',
        'c) Matulog lagi',
      ],
      'correctAnswer': 'a) Maging masipag',
    },
  ];

  @override
  void initState() {
    super.initState();
    questions.shuffle(); // make the questions random
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

  //question to make it show 5 questions only
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
                      currentQuestionIndex = 0; // Restart quiz
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
                                  //question that is show
                                  currentQuestion['question'],
                                  style: Design.storyTitle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                                // This part shows all the answer buttons for the current question
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
                                    // When the user taps a button:
                                    // - If they already answered, do nothing
                                    // - If not, check if the answer is correct
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
                                            ? 'Magaling Tama ka! 🎉'
                                            : 'Mali! ang tamang sagot ay: ${currentQuestion['correctAnswer']} 😞',
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
