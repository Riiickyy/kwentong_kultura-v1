import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class Alamatngniyogquiz extends StatefulWidget {
  const Alamatngniyogquiz({super.key});

  @override
  State<Alamatngniyogquiz> createState() => _AlamatngniyogquizState();
}

class _AlamatngniyogquizState extends State<Alamatngniyogquiz> {
  int currentQuestionIndex = 0;
  bool isAnswerSelected = false;
  bool isAnswerCorrect = false;
  String selectedAnswer = '';
  int score = 0; // Initialize score
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Ano ang pangalan ng anak ng mag-asawa?',
      'answers': ['a) Yumi', 'b) Pina', 'c) Mayan'],
      'correctAnswer': 'a) Yumi',
    },
    {
      'question': 'Ano ang katangian ni Yumi?',
      'answers': ['a) Tamad', 'b) Maganda at masipag', 'c) Palalo'],
      'correctAnswer': 'b) Maganda at masipag',
    },
    {
      'question':
          'Ano ang ginawa ni Yumi nang umalis ang kanyang mga magulang?',
      'answers': ['a) Naglinis ng bahay', 'b) Natulog', 'c) Naglaro'],
      'correctAnswer': 'a) Naglinis ng bahay',
    },
    {
      'question': 'Saan pumunta si Yumi matapos maglinis?',
      'answers': ['a) Sa gubat', 'b) Sa dalampasigan', 'c) Sa palengke'],
      'correctAnswer': 'b) Sa dalampasigan',
    },
    {
      'question': 'Ano ang dumating habang siya ay naglalakad?',
      'answers': ['a) Lindol', 'b) Bagyo', 'c) Araw'],
      'correctAnswer': 'b) Bagyo',
    },
    {
      'question': 'Ano ang ginawa ni Yumi upang hindi matangay ng hangin?',
      'answers': [
        'a) Nagtago sa kuweba',
        'b) Yumakap sa puno',
        'c) Pumunta sa bahay',
      ],
      'correctAnswer': 'b) Yumakap sa puno',
    },
    {
      'question': 'Ano ang natagpuan ng kanyang mga magulang sa dalampasigan?',
      'answers': ['a) Isda', 'b) Puno ng niyog', 'c) Pinya'],
      'correctAnswer': 'b) Puno ng niyog',
    },
    {
      'question': 'Ano ang itsura ng bao ng niyog?',
      'answers': [
        'a) May tatlong marka na parang mata at bibig',
        'b) May sungay',
        'c) May buntot',
      ],
      'correctAnswer': 'a) May tatlong marka na parang mata at bibig',
    },
    {
      'question': 'Ano ang kulay ng bao ng niyog?',
      'answers': ['a) Kayumanggi', 'b) Berde', 'c) Pula'],
      'correctAnswer': 'a) Kayumanggi',
    },
    {
      'question': 'Ano ang aral ng kwento?',
      'answers': [
        'a) Maging mapagmahal at masipag',
        'b) Maging tamad',
        'c) Umiwas sa pamilya',
      ],
      'correctAnswer': 'a) Maging mapagmahal at masipag',
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
              title: Text('Natapos mo ang tanong', style: Design.readTitle),
              content: Text(
                'Nakakuha ka ng  $score/15 points!',
                style: Design.RecoPass,
              ),

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
