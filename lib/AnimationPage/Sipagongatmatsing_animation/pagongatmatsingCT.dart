import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:video_player/video_player.dart';
import 'package:kwentong_kultura/QUIZZES/pagongatmatsingQuiz.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class PagongatmatsingCT extends StatefulWidget {
  const PagongatmatsingCT({super.key});

  @override
  State<PagongatmatsingCT> createState() => _PagongatmatsingCTState();
}

class _PagongatmatsingCTState extends State<PagongatmatsingCT> {
  late CustomVideoPlayerController _customVideoPlayerController;
  late VideoPlayerController _controller;
  double _playbackSpeed = 1.0;
  double _fontSize = 24;
  bool _isSettingsOpen = false;
  String _currentSubtitle = "";
  int _currentWordIndex = -1;

  final List<Map<String, dynamic>> subtitles = [
    {
      "startSec": 0,
      "startMilli": 733,
      "endSec": 2,
      "endMilli": 666,
      "text": "Ang Matsing at ang Pagong",
    },
    {
      "startSec": 4,
      "startMilli": 700,
      "endSec": 7,
      "endMilli": 733,
      "text": "Minsan sa paglalakad nina Matsing at Pagong",
    },
    {
      "startSec": 8,
      "startMilli": 0,
      "endSec": 11,
      "endMilli": 533,
      "text": "Ay di sinasadyang makakita sila ng isang punong saging",
    },
    {
      "startSec": 12,
      "startMilli": 533,
      "endSec": 14,
      "endMilli": 967,
      "text": "ang punong ito ay mataba at malaki",
    },
    {
      "startSec": 15,
      "startMilli": 933,
      "endSec": 19,
      "endMilli": 0,
      "text": "malalapad ang kulay, luntiang mga dahon",
    },
    {
      "startSec": 19,
      "startMilli": 700,
      "endSec": 22,
      "endMilli": 567,
      "text": "na pagkaisahan nilang kunin ang punong iyon",
    },
    {
      "startSec": 23,
      "startMilli": 333,
      "endSec": 24,
      "endMilli": 267,
      "text": "Pagong: Hati tayo rito",
    },
    {
      "startSec": 25,
      "startMilli": 267,
      "endSec": 26,
      "endMilli": 900,
      "text": "Ang wika ni Pagong",
    },
    {
      "startSec": 27,
      "startMilli": 600,
      "endSec": 31,
      "endMilli": 333,
      "text": "Pagong: at kapwa natin itanim ang mapagpipilian nating bahagi",
    },
    {
      "startSec": 32,
      "startMilli": 800,
      "endSec": 34,
      "endMilli": 500,
      "text": "ganoon na nga ang kanilang ginawa",
    },
    {
      "startSec": 35,
      "startMilli": 367,
      "endSec": 38,
      "endMilli": 533,
      "text": "Pinutol nila ang puno ng saging sa pinakagitna",
    },
    {
      "startSec": 41,
      "startMilli": 400,
      "endSec": 43,
      "endMilli": 900,
      "text": "Matsing: akin ang bahagi ng may malapad na dahon",
    },
    {
      "startSec": 44,
      "startMilli": 567,
      "endSec": 46,
      "endMilli": 467,
      "text": "Nakangising wika ni Matsing",
    },
    {
      "startSec": 46,
      "startMilli": 733,
      "endSec": 49,
      "endMilli": 167,
      "text": "Sa pagaakalang, madaling tumubo iyon",
    },
    {
      "startSec": 50,
      "startMilli": 567,
      "endSec": 53,
      "endMilli": 900,
      "text": "Ang pagong ay nagkasya na lamang sa ibabang bahagi",
    },
    {
      "startSec": 56,
      "startMilli": 500,
      "endSec": 58,
      "endMilli": 200,
      "text": "Pagkalipas ng ilang araw",
    },
    {
      "startSec": 58,
      "startMilli": 867,
      "endSec": 61,
      "endMilli": 667,
      "text": "Sina Pagong at Matsing ay muling nagkita",
    },
    {
      "startSec": 62,
      "startMilli": 567,
      "endSec": 65,
      "endMilli": 267,
      "text": "Pagong: Magandang Araw sayo ginoong Matsing",
    },
    {
      "startSec": 66,
      "startMilli": 67,
      "endSec": 67,
      "endMilli": 167,
      "text": "Bungad ng Pagong",
    },
    {
      "startSec": 68,
      "startMilli": 600,
      "endSec": 73,
      "endMilli": 133,
      "text":
          "Pagong: Ano ang nangyari sa itinanim mong punong saging na mayroong malalapad na dahon",
    },
    {
      "startSec": 74,
      "startMilli": 267,
      "endSec": 75,
      "endMilli": 267,
      "text": "Tanong ni Pagong",
    },
    {
      "startSec": 76,
      "startMilli": 200,
      "endSec": 77,
      "endMilli": 0,
      "text": "Matsing: Ay!!",
    },
    {
      "startSec": 77,
      "startMilli": 533,
      "endSec": 79,
      "endMilli": 67,
      "text": "Ang wika ni Matsing",
    },
    {
      "startSec": 79,
      "startMilli": 867,
      "endSec": 81,
      "endMilli": 500,
      "text": "Matsing: Malaunang namatay",
    },
    {
      "startSec": 81,
      "startMilli": 867,
      "endSec": 83,
      "endMilli": 333,
      "text": "Matsing: Kamusta naman ang itinanim mo?",
    },
    {
      "startSec": 85,
      "startMilli": 0,
      "endSec": 86,
      "endMilli": 767,
      "text": "Pagong: Ang sa akin ay napakabuti",
    },
    {
      "startSec": 87,
      "startMilli": 567,
      "endSec": 91,
      "endMilli": 133,
      "text": "Pagong: May mga dahong malalapad, at ngayon ay namumunga na",
    },
    {
      "startSec": 91,
      "startMilli": 500,
      "endSec": 93,
      "endMilli": 167,
      "text": "Pagong: Hindi ko nga makuha ang mga bunga ",
    },
    {
      "startSec": 93,
      "startMilli": 333,
      "endSec": 94,
      "endMilli": 167,
      "text": "Pagong: Dala ng.... ",
    },
    {
      "startSec": 94,
      "startMilli": 467,
      "endSec": 96,
      "endMilli": 0,
      "text": "Pagong: hindi ko naman maakyat ito",
    },
    {
      "startSec": 96,
      "startMilli": 967,
      "endSec": 98,
      "endMilli": 200,
      "text": "Sabi ni Pagong",
    },
    {
      "startSec": 98,
      "startMilli": 900,
      "endSec": 102,
      "endMilli": 733,
      "text": "Matsing: Kung ang paguusapan ay ang pag akyat ng punong saging",
    },
    {
      "startSec": 103,
      "startMilli": 800,
      "endSec": 105,
      "endMilli": 733,
      "text": "Matsing: Ipaubaya mo na yan sakin",
    },
    {
      "startSec": 106,
      "startMilli": 200,
      "endSec": 109,
      "endMilli": 367,
      "text": "Matsing: kayang kaya kong panikin ang punong saging",
    },
    {
      "startSec": 110,
      "startMilli": 733,
      "endSec": 112,
      "endMilli": 200,
      "text": "Pagmamayabang ni Matsing",
    },
    {
      "startSec": 112,
      "startMilli": 933,
      "endSec": 116,
      "endMilli": 133,
      "text": "Pagong: Hindi pa man ay nagpapasalamat na ako sayo  Matsing",
    },
    {
      "startSec": 116,
      "startMilli": 767,
      "endSec": 117,
      "endMilli": 867,
      "text": "Wika ni Pagong",
    },
    {
      "startSec": 118,
      "startMilli": 400,
      "endSec": 120,
      "endMilli": 600,
      "text": "At tinungo nila ang bahay ni Pagong",
    },
    {
      "startSec": 121,
      "startMilli": 733,
      "endSec": 125,
      "endMilli": 500,
      "text": "Nang makita ni Matsing ang magandang buwig ng saging",
    },
    {
      "startSec": 125,
      "startMilli": 700,
      "endSec": 129,
      "endMilli": 300,
      "text": "Ay hindi niya maitago ang buong pagnanasa niya rito",
    },
    {
      "startSec": 129,
      "startMilli": 700,
      "endSec": 132,
      "endMilli": 0,
      "text": "Agad niyang inakyat ang puno ng saging",
    },
    {
      "startSec": 132,
      "startMilli": 967,
      "endSec": 136,
      "endMilli": 867,
      "text": "Pagkuha'y sinimulan na niyang kainin ang mga bungang mayroon",
    },
    {
      "startSec": 137,
      "startMilli": 433,
      "endSec": 138,
      "endMilli": 467,
      "text": "Matsing: HA! HA! HA!",
    },
    {
      "startSec": 138,
      "startMilli": 833,
      "endSec": 141,
      "endMilli": 200,
      "text": "Matsing: Ang tatamis ng bunga ng saging mo",
    },
    {
      "startSec": 141,
      "startMilli": 600,
      "endSec": 144,
      "endMilli": 500,
      "text": "Halos mabulunan pa ang matsing sa pag nguya",
    },
    {
      "startSec": 145,
      "startMilli": 200,
      "endSec": 148,
      "endMilli": 400,
      "text": "Pagong: Ngunit! bigyan mo naman ako kahit ilang piraso lang",
    },
    {
      "startSec": 149,
      "startMilli": 433,
      "endSec": 154,
      "endMilli": 400,
      "text":
          "pagsusumamo ni pagong ng makitang iisang piraso na lamang ang mga bunga",
    },
    {
      "startSec": 155,
      "startMilli": 833,
      "endSec": 156,
      "endMilli": 833,
      "text": "Matsing: HA! HA! HA!",
    },
    {
      "startSec": 157,
      "startMilli": 833,
      "endSec": 160,
      "endMilli": 133,
      "text": "Matsing: hindi kita bibigyan kahit isa",
    },
    {
      "startSec": 160,
      "startMilli": 267,
      "endSec": 162,
      "endMilli": 767,
      "text": "Tumatawang wika ni Matsing",
    },
    {
      "startSec": 162,
      "startMilli": 967,
      "endSec": 167,
      "endMilli": 200,
      "text": "sa galit ni Pagong ay naisipan nitong gumanti",
    },
    {
      "startSec": 169,
      "startMilli": 767,
      "endSec": 171,
      "endMilli": 533,
      "text": "tinungo nito ang ilang ilog",
    },
    {
      "startSec": 172,
      "startMilli": 300,
      "endSec": 173,
      "endMilli": 967,
      "text": "namulot ng ilang tinik",
    },
    {
      "startSec": 174,
      "startMilli": 100,
      "endSec": 177,
      "endMilli": 133,
      "text": "at isa isang tinusok sa paligid ng punong saging",
    },
    {
      "startSec": 177,
      "startMilli": 767,
      "endSec": 181,
      "endMilli": 167,
      "text": "at pagkatapos ay nangubli siya sa isang bao",
    },
    {
      "startSec": 182,
      "startMilli": 333,
      "endSec": 188,
      "endMilli": 133,
      "text":
          "nang maubos na lahat ni Matsing ang bunga ng saging, ay nagpasya na itong bumaba",
    },
    {
      "startSec": 189,
      "startMilli": 133,
      "endSec": 192,
      "endMilli": 100,
      "text": "gayon na lamang ang pagkakasugat ng kanyang katawan",
    },
    {
      "startSec": 192,
      "startMilli": 333,
      "endSec": 194,
      "endMilli": 600,
      "text": "dahil sa mga tinik na inilagay ni Pagong",
    },
    {
      "startSec": 195,
      "startMilli": 467,
      "endSec": 196,
      "endMilli": 667,
      "text": "galit na galit si Matsing",
    },
    {
      "startSec": 197,
      "startMilli": 800,
      "endSec": 201,
      "endMilli": 367,
      "text": "nahirapan siya sa paghahanap bago niya nakita si Pagong",
    },
    {
      "startSec": 201,
      "startMilli": 700,
      "endSec": 202,
      "endMilli": 533,
      "text": "Matsing: AHA!",
    },
    {
      "startSec": 202,
      "startMilli": 967,
      "endSec": 204,
      "endMilli": 400,
      "text": "Matsing: Nariyan kalang pala!",
    },
    {
      "startSec": 205,
      "startMilli": 67,
      "endSec": 208,
      "endMilli": 200,
      "text": "Matsing: Ikaw ang dahilan ng pagkakasugat ng aking katawan",
    },
    {
      "startSec": 209,
      "startMilli": 167,
      "endSec": 213,
      "endMilli": 200,
      "text":
          "Matsing: ngayo'y matitikman mo na ang lupit ng aking paghihiganti",
    },
    {
      "startSec": 213,
      "startMilli": 900,
      "endSec": 215,
      "endMilli": 133,
      "text": "Matsing: hamak na nilalang",
    },
    {
      "startSec": 216,
      "startMilli": 167,
      "endSec": 216,
      "endMilli": 980,
      "text": "galit na galit",
    },
    {
      "startSec": 217,
      "startMilli": 367,
      "endSec": 219,
      "endMilli": 133,
      "text": "na sinabi ni Matsing",
    },
    {
      "startSec": 219,
      "startMilli": 367,
      "endSec": 222,
      "endMilli": 133,
      "text": "Matsing: subalit lubha naman akong maunawain",
    },
    {
      "startSec": 222,
      "startMilli": 433,
      "endSec": 226,
      "endMilli": 467,
      "text":
          "Matsing: pagpipilian kita sa kung ano sa dalawang paraan ang katapusan mo",
    },
    {
      "startSec": 227,
      "startMilli": 533,
      "endSec": 228,
      "endMilli": 933,
      "text": "Matsing: ano ang nais mo?",
    },
    {
      "startSec": 229,
      "startMilli": 767,
      "endSec": 235,
      "endMilli": 67,
      "text":
          "Matsing: itatapon kita sa tubig o dudurugin kita ng pinong-pino sa may ilog?",
    },
    {
      "startSec": 235,
      "startMilli": 200,
      "endSec": 236,
      "endMilli": 67,
      "text": "Pagong: sa ilog",
    },
    {
      "startSec": 236,
      "startMilli": 767,
      "endSec": 238,
      "endMilli": 567,
      "text": "Pagong: durugin mo na ako sa may ilog",
    },
    {
      "startSec": 239,
      "startMilli": 767,
      "endSec": 243,
      "endMilli": 900,
      "text": "Pagmamakaawa ni Pagong na wari tutulo pa ang luha",
    },
    {
      "startSec": 244,
      "startMilli": 467,
      "endSec": 245,
      "endMilli": 467,
      "text": "Pagong: ayoko sa tubig!",
    },
    {
      "startSec": 246,
      "startMilli": 133,
      "endSec": 247,
      "endMilli": 200,
      "text": "Pagong: takot na takot ako",
    },
    {
      "startSec": 247,
      "startMilli": 400,
      "endSec": 248,
      "endMilli": 667,
      "text": "Pagong: baka ako malunod",
    },
    {
      "startSec": 250,
      "startMilli": 67,
      "endSec": 251,
      "endMilli": 100,
      "text": "Matsing: AHA!",
    },
    {
      "startSec": 252,
      "startMilli": 67,
      "endSec": 254,
      "endMilli": 500,
      "text": "wika ni Matsing na nakangisi pa",
    },
    {
      "startSec": 255,
      "startMilli": 433,
      "endSec": 256,
      "endMilli": 567,
      "text": "Matsing: sa madaling salita",
    },
    {
      "startSec": 257,
      "startMilli": 600,
      "endSec": 258,
      "endMilli": 900,
      "text": "Matsing: takot kang malunod",
    },
    {
      "startSec": 259,
      "startMilli": 567,
      "endSec": 262,
      "endMilli": 167,
      "text": "Matsing: kung gayon ay lulunurin kita!!!",
    },
    {
      "startSec": 263,
      "startMilli": 133,
      "endSec": 266,
      "endMilli": 900,
      "text": "walang nagawa si Pagong ng dalhin siya ni Matsing sa may ilog",
    },
    {
      "startSec": 267,
      "startMilli": 100,
      "endSec": 269,
      "endMilli": 200,
      "text": "at buong lakas niyang itinapon siya",
    },
    {
      "startSec": 271,
      "startMilli": 967,
      "endSec": 275,
      "endMilli": 700,
      "text": "ngunit lumitaw agad si Pagong at waring nang uuyam",
    },
    {
      "startSec": 275,
      "startMilli": 967,
      "endSec": 279,
      "endMilli": 133,
      "text": "sa nadaya, at nagtatakang si Matsing",
    },
    {
      "startSec": 280,
      "startMilli": 167,
      "endSec": 281,
      "endMilli": 800,
      "text": "Pagong: naisahan kita Matsing",
    },
    {
      "startSec": 282,
      "startMilli": 467,
      "endSec": 284,
      "endMilli": 867,
      "text": "Pagong: ang tubig ay aking tirahan",
    },
    {
      "startSec": 285,
      "startMilli": 567,
      "endSec": 289,
      "endMilli": 100,
      "text": "Pagong: Salamat sa iyo at ibinalik mo ako sa aking tahanan",
    },
  ];

  String assetVideo = 'assets/videos/PagongatMatsing.mp4';
  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
    BgmPlayer.player.pause();
  }

  void initializeVideoPlayer() {
    _controller = VideoPlayerController.asset(assetVideo)
      ..initialize().then((value) {
        setState(() {});
      });
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _controller,
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        settingsButtonAvailable: false,
        playbackSpeedButtonAvailable: true,
      ),
    );
    _controller.addListener(_updateSubtitle); // Listen to video progress
  }

  void _updateSubtitle() {
    final currentTime =
        _controller.value.position.inMilliseconds; // Get time in milliseconds
    String fullSubtitle = "";
    int subtitleStartTime = 0;
    int subtitleEndTime = 0;

    // Find the current subtitle based on the video time
    for (var subtitle in subtitles) {
      // Convert the start and end times to milliseconds
      int subtitleStartInMilliseconds =
          subtitle["startSec"] * 1000 + subtitle["startMilli"];
      int subtitleEndInMilliseconds =
          subtitle["endSec"] * 1000 + subtitle["endMilli"];

      if (currentTime >= subtitleStartInMilliseconds &&
          currentTime <= subtitleEndInMilliseconds) {
        fullSubtitle = subtitle["text"];
        subtitleStartTime = subtitleStartInMilliseconds;
        subtitleEndTime = subtitleEndInMilliseconds;
      }
    }

    if (fullSubtitle != _currentSubtitle) {
      setState(() {
        _currentSubtitle = fullSubtitle;
        _currentWordIndex = 0;
      });
    }

    int elapsedTime = currentTime - subtitleStartTime;
    List<String> words = _currentSubtitle.split(" ");
    int wordsToHighlight = (elapsedTime *
            words.length ~/
            (subtitleEndTime - subtitleStartTime))
        .clamp(0, words.length - 1);

    if (wordsToHighlight != _currentWordIndex) {
      setState(() {
        _currentWordIndex = wordsToHighlight;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _customVideoPlayerController.dispose();
    super.dispose();
    BgmPlayer.player.play();
  }

  void _toggleSettings() {
    setState(() {
      _isSettingsOpen = !_isSettingsOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> words = _currentSubtitle.split(" ");
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/Animation Page/PaperBG.png',
                ), // Replace with your image path
                fit:
                    BoxFit.cover, // Adjust the image to cover the entire screen
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio:
                      _controller.value.isInitialized
                          ? _controller.value.aspectRatio
                          : 16 / 9,
                  child:
                      _controller.value.isInitialized
                          ? CustomVideoPlayer(
                            customVideoPlayerController:
                                _customVideoPlayerController,
                          )
                          : const Center(
                            child: CircularProgressIndicator(),
                          ), // Show loading spinner
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AnimatedOpacity(
                        opacity: 1.0,
                        duration: const Duration(milliseconds: 500),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: List.generate(words.length, (index) {
                              return TextSpan(
                                text: "${words[index]} ",
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: _fontSize,
                                  fontWeight: FontWeight.w900,
                                  color:
                                      index <= _currentWordIndex
                                          ? Color(0xFF760AFB)
                                          : Color(
                                            0xFF3f3f3f,
                                          ), // Highlight effect
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom:
                105, // Adjust to position above the quiz and settings buttons
            left: 20, // Positioned left
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    // If video is currently playing, pause it
                    _controller.pause();
                  } else {
                    // If video is paused, play it
                    _controller.play();
                  }
                });
              },
              style: Design.playVideoButtonDesign,
              child: Column(
                mainAxisSize:
                    MainAxisSize
                        .min, // Ensures the column only takes as much space as needed
                children: [
                  Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 32, // Adjust the icon size
                    color: Color(0xFF3f3f3f), // Set icon color to white
                  ),
                  SizedBox(
                    height: 0, // Adds space between the icon and the label
                  ),
                  Text(
                    _controller.value.isPlaying ? 'Pause' : 'Play',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(
                        0xFF3f3f3f,
                      ), // Set text color to white (same as button color)
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 20, // Adjust to position below Play button
            left: 20, // Positioned left with some margin
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Pagongatmatsingquiz();
                    },
                  ),
                );
              },
              style: Design.quizButtonDesign,
              child: Column(
                mainAxisSize:
                    MainAxisSize
                        .min, // Ensures the column only takes as much space as needed
                children: [
                  Icon(
                    Icons.quiz,
                    size: 24, // Adjust the icon size
                    color: Color(0xFF3f3f3f),
                  ),
                  SizedBox(
                    height: 0, // Adds space between the icon and the label
                  ),
                  Text(
                    'Quiz',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xFF3f3f3f),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Settings button
          Positioned(
            bottom: 100,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.orange.shade300,
              onPressed: _toggleSettings,
              child: Icon(Icons.settings),
            ),
          ),

          if (_isSettingsOpen)
            Center(
              child: Container(
                width: 300,
                height: 250,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: _toggleSettings,
                        ),
                      ],
                    ),
                    const Text("Sukat ng sulat"),
                    Slider(
                      value: _fontSize,
                      min: 12,
                      max: 32,
                      onChanged: (value) {
                        setState(() {
                          _fontSize = value;
                        });
                      },
                    ),
                    const Text("Bilis ng Sulat at Palabas\n"),
                    Slider(
                      value: _playbackSpeed,
                      min: 0.5,
                      max: 2.0,
                      divisions: 3,
                      label: "${_playbackSpeed}x",
                      onChanged: (value) {
                        setState(() {
                          _playbackSpeed = value;
                          _controller.setPlaybackSpeed(value);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
