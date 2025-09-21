import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class AngAsoatkanyangAninoQuiz extends StatefulWidget {
  const AngAsoatkanyangAninoQuiz({super.key});

  @override
  State<AngAsoatkanyangAninoQuiz> createState() =>
      _AngAsoatkanyangAninoQuizState();
}

class _AngAsoatkanyangAninoQuizState extends State<AngAsoatkanyangAninoQuiz> {
  int currentQuestionIndex = 0;
  bool isAnswerSelected = false;
  bool isAnswerCorrect = false;
  String selectedAnswer = '';
  int score = 0; // Initialize score
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Ano ang nahanap ng aso sa kagubatan?',
      'answers': ['a) Isda', 'b) Buto', 'c) Tinapay'],
      'correctAnswer': 'b) Buto',
    },
    {
      'question': 'Saan dumaan ang aso pauwi?',
      'answers': ['a) Sa tulay', 'b) Sa batis', 'c) Sa gubat'],
      'correctAnswer': 'b) Sa batis',
    },
    {
      'question': 'Ano ang nakita ng aso sa tubig?',
      'answers': ['a) Ang kanyang anino', 'b) Isda', 'c) Tao'],
      'correctAnswer': 'a) Ang kanyang anino',
    },
    {
      'question': 'Ano ang nangyari nang ibuka ng aso ang bibig niya?',
      'answers': [
        'a) Nadagdagan ang buto',
        'b) Nahulog ang buto',
        'c) Dumami ang aso',
      ],
      'correctAnswer': 'b) Nahulog ang buto',
    },
    {
      'question': 'Ano ang itsura ng tubig sa batis?',
      'answers': ['a) Madumi', 'b) Malinaw', 'c) Maalon'],
      'correctAnswer': 'b) Malinaw',
    },
    {
      'question': 'Ano ang pakiramdam ng aso nang mawala ang buto?',
      'answers': ['a) Masaya', 'b) Malungkot', 'c) Galit'],
      'correctAnswer': 'b) Malungkot',
    },
    {
      'question': 'Anong kulay ng aso sa animation?',
      'answers': ['a) Puti', 'b) Itim', 'c) Kayumanggi'],
      'correctAnswer': 'b) Itim',
    },
    {
      'question': 'Ano ang tinuturo ng kwento?',
      'answers': [
        'a) Huwag maging sakim',
        'b) Matulog palagi',
        'c) Kumain ng marami',
      ],
      'correctAnswer': 'a) Huwag maging sakim',
    },
    {
      'question': 'Saan nakita ng aso ang kanyang anino?',
      'answers': ['a) Sa hangin', 'b) Sa tubig', 'c) Sa damo'],
      'correctAnswer': 'b) Sa tubig',
    },
    {
      'question': 'Ano ang dapat gawin ng aso sa halip na maging sakim?',
      'answers': [
        'a) Magpasalamat sa kung ano ang mayroon',
        'b) Magnakaw',
        'c) Maglaro',
      ],
      'correctAnswer': 'a) Magpasalamat sa kung ano ang mayroon',
    },
  ];

  @override
  void initState() {
    super.initState();
    questions.shuffle();
    BgmPlayer.player.play();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
                                            ? 'Tama ang sagot mo! 🎉'
                                            : 'Mali ang tamang sagot ay: ${currentQuestion['correctAnswer']} 😞',
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
