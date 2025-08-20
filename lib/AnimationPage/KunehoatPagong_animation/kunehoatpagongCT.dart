import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/QUIZZES/kunehoatpagongQuiz.dart';
import 'package:kwentong_kultura/Styles/styles.dart';
import 'package:video_player/video_player.dart';

class KunehotPagongCT extends StatefulWidget {
  const KunehotPagongCT({super.key});

  @override
  State<KunehotPagongCT> createState() => _KunehotPagongCTState();
}

class _KunehotPagongCTState extends State<KunehotPagongCT> {
  late CustomVideoPlayerController _customVideoPlayerController;
  late VideoPlayerController _controller;
  double _playbackSpeed = 1.0;
  double _fontSize = 24;
  bool _isSettingsOpen = false;
  String _currentSubtitle = "";
  int _currentWordIndex = -1;

  final List<Map<String, dynamic>> subtitles = [
    {
      "startSec": 1,
      "startMilli": 300,
      "endSec": 3,
      "endMilli": 350,
      "text": "Ang Kuneho at ang pagong",
    },
    {
      "startSec": 5,
      "startMilli": 510,
      "endSec": 6,
      "endMilli": 560,
      "text": "Isang araw",
    },
    {
      "startSec": 6,
      "startMilli": 870,
      "endSec": 11,
      "endMilli": 600,
      "text":
          "Ang Kuneho at ang pagong ay nagpapahinga sa ilalim ng malaking punong mangga",
    },
    {
      "startSec": 12,
      "startMilli": 680,
      "endSec": 14,
      "endMilli": 160,
      "text": "Pagong: Kaibigang Kuneho",
    },
    {
      "startSec": 14,
      "startMilli": 680,
      "endSec": 15,
      "endMilli": 810,
      "text": "Wika ng pagong",
    },
    {
      "startSec": 16,
      "startMilli": 700,
      "endSec": 21,
      "endMilli": 450,
      "text":
          "Pagong: Wala ba tayong gagawin kundi panoorin ang mga dahon ng manggang ito",
    },
    {
      "startSec": 22,
      "startMilli": 530,
      "endSec": 23,
      "endMilli": 260,
      "text": "Kuneho: Bakit?",
    },
    {
      "startSec": 23,
      "startMilli": 750,
      "endSec": 25,
      "endMilli": 290,
      "text": "Kuneho: Ano ba ang gusto mong gawin",
    },
    {
      "startSec": 26,
      "startMilli": 180,
      "endSec": 27,
      "endMilli": 380,
      "text": "Tanong ng Kuneho",
    },
    {
      "startSec": 28,
      "startMilli": 460,
      "endSec": 29,
      "endMilli": 480,
      "text": "Pagong: Halika",
    },
    {
      "startSec": 29,
      "startMilli": 910,
      "endSec": 31,
      "endMilli": 420,
      "text": "Pagong: Magkarera tayo",
    },
    {
      "startSec": 31,
      "startMilli": 940,
      "endSec": 35,
      "endMilli": 0,
      "text": "Pagong: Nakikita mo ba ang puno ng sampalok ngayon",
    },
    {
      "startSec": 35,
      "startMilli": 600,
      "endSec": 40,
      "endMilli": 280,
      "text":
          "Pagong: Kung sino ang unang makakarating sa atin doon ay siyang panalo",
    },
    {
      "startSec": 41,
      "startMilli": 240,
      "endSec": 42,
      "endMilli": 250,
      "text": "Sabi ng pagong",
    },
    {
      "startSec": 43,
      "startMilli": 320,
      "endSec": 45,
      "endMilli": 500,
      "text": "Tumawa ng malakas ang kuneho",
    },
    {
      "startSec": 45,
      "startMilli": 570,
      "endSec": 47,
      "endMilli": 250,
      "text": "Kuneho: HAHAHA",
    },
    {
      "startSec": 47,
      "startMilli": 290,
      "endSec": 52,
      "endMilli": 520,
      "text":
          "Kuneho: Ako ba ang iyong hinahamon sa paligsahang ito baka nagkakamali ka",
    },
    {
      "startSec": 54,
      "startMilli": 110,
      "endSec": 55,
      "endMilli": 720,
      "text": "Sabi ng kuneho nang buong pagmamalaki",
    },
    {
      "startSec": 56,
      "startMilli": 440,
      "endSec": 60,
      "endMilli": 640,
      "text":
          "Kuneho: Kilala mo naman kung sino ako at kung gaano kabilis sa takbuhan",
    },
    {
      "startSec": 61,
      "startMilli": 190,
      "endSec": 65,
      "endMilli": 480,
      "text":
          "Kuneho: hindi pa man ay alam ko nang ako ang mananalo sa paligsahang ito",
    },
    {
      "startSec": 66,
      "startMilli": 480,
      "endSec": 67,
      "endMilli": 730,
      "text": "Dagdag pa nito",
    },
    {
      "startSec": 68,
      "startMilli": 280,
      "endSec": 73,
      "endMilli": 840,
      "text":
          "Kuneho: Kaya bago ka mapagod ay bawiin mo na ang sinabi mo, kawawa ka lang!",
    },
    {
      "startSec": 75,
      "startMilli": 730,
      "endSec": 78,
      "endMilli": 510,
      "text": "Pagong: Wag kang masyadong pakasisiguro kaibigan",
    },
    {
      "startSec": 79,
      "startMilli": 350,
      "endSec": 80,
      "endMilli": 270,
      "text": "Sabi ni Pagong",
    },
    {
      "startSec": 81,
      "startMilli": 490,
      "endSec": 85,
      "endMilli": 190,
      "text": "Pagong: Sige!, halika na, Mag umpisa na tayo",
    },
    {
      "startSec": 86,
      "startMilli": 470,
      "endSec": 89,
      "endMilli": 420,
      "text": "Kuneho: Oh Sige, Ikaw ang may kagustuhan nito",
    },
    {
      "startSec": 89,
      "startMilli": 660,
      "endSec": 91,
      "endMilli": 0,
      "text": "Sagot ng Kuneho",
    },
    {
      "startSec": 93,
      "startMilli": 770,
      "endSec": 96,
      "endMilli": 110,
      "text": "At nag umpisa na ang paligsahan",
    },
    {
      "startSec": 96,
      "startMilli": 350,
      "endSec": 102,
      "endMilli": 260,
      "text":
          "Nakakalayo na ang kuneho ngunit ang pagong ay mabagal pa rin ang pag usad sa kanyang likuran",
    },
    {
      "startSec": 103,
      "startMilli": 600,
      "endSec": 108,
      "endMilli": 090,
      "text": "Kuneho: Hay Naku!, tutal ay matatagalan pa ang pagong na ito",
    },
    {
      "startSec": 108,
      "startMilli": 140,
      "endSec": 113,
      "endMilli": 890,
      "text":
          "Kuneho: Mainam na magpahinga muna ako sa ilalim ng punong ito, mainit masyado",
    },
    {
      "startSec": 114,
      "startMilli": 550,
      "endSec": 115,
      "endMilli": 860,
      "text": "Wika ng Kuneho",
    },
    {
      "startSec": 117,
      "startMilli": 560,
      "endSec": 125,
      "endMilli": 230,
      "text":
          "At nahiga na nga ang kuneho sa ilalim ng punong mangga ilang sandali pa lamang ay nakatulog na ang kuneho",
    },
    {
      "startSec": 125,
      "startMilli": 790,
      "endSec": 131,
      "endMilli": 220,
      "text":
          "Lumipas ang mga minuto naabutan ng Pagong ang kinaroroonan ni Kuneho",
    },
    {
      "startSec": 131,
      "startMilli": 750,
      "endSec": 136,
      "endMilli": 610,
      "text":
          "Nakita nya kung gaano kahimbing ang tulog nito sa ilalim ng punong mangga",
    },
    {
      "startSec": 137,
      "startMilli": 920,
      "endSec": 143,
      "endMilli": 980,
      "text":
          "Pagong: Tignan mo nga naman itong si Kuneho, masyado kasing nagtitiwala sa kanyang kakayahan",
    },
    {
      "startSec": 144,
      "startMilli": 580,
      "endSec": 147,
      "endMilli": 450,
      "text": "Pagong: Ngayon! Naunahan ko na sya",
    },
    {
      "startSec": 148,
      "startMilli": 200,
      "endSec": 150,
      "endMilli": 060,
      "text": "Sabi ng Pagong",
    },
    {
      "startSec": 150,
      "startMilli": 220,
      "endSec": 151,
      "endMilli": 930,
      "text": "Ilang sandali pa lamang ay",
    },
    {
      "startSec": 152,
      "startMilli": 0,
      "endSec": 155,
      "endMilli": 510,
      "text": "Nakarating na ang pagong sa ilalim ng puno ng Sampaloc",
    },
    {
      "startSec": 156,
      "startMilli": 0,
      "endSec": 158,
      "endMilli": 540,
      "text": "Pagong: Kuneho! Kuneho!",
    },
    {
      "startSec": 159,
      "startMilli": 640,
      "endSec": 164,
      "endMilli": 150,
      "text": "Pagong: Gumising ka na! Nanalo ako sa pasiglahan natin",
    },
    {
      "startSec": 165,
      "startMilli": 210,
      "endSec": 167,
      "endMilli": 430,
      "text": "Tawag ng Pagong sa Kuneho",
    },
    {
      "startSec": 167,
      "startMilli": 880,
      "endSec": 175,
      "endMilli": 660,
      "text":
          "Nagising ang Kuneho at laking gulat na lamang niya nang makita niya ang Pagong na sumasayaw sa ilalim ng puno ng sampaloc",
    },
  ];

  String assetVideo = 'assets/videos/KunehoatPagong.mp4';

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
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
                          : const Center(child: CircularProgressIndicator()),
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
                        duration: const Duration(milliseconds: 250),
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
                                          : Color(0xFF3f3f3f),
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
                      return KunehoatPagongQuiz();
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
            bottom: 50,
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
