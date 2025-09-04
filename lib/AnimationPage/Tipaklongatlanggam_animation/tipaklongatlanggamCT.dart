import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/QUIZZES/malakasatmagandaQuiz.dart';
import 'package:video_player/video_player.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class TipaklongatlanggamCT extends StatefulWidget {
  const TipaklongatlanggamCT({super.key});

  @override
  State<TipaklongatlanggamCT> createState() => _TipaklongatlanggamCTState();
}

class _TipaklongatlanggamCTState extends State<TipaklongatlanggamCT> {
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
      "startMilli": 666,
      "endSec": 2,
      "endMilli": 766,
      "text": "Ang Tipaklong at ang Langgam",
    },
    {
      "startSec": 5,
      "startMilli": 67,
      "endSec": 7,
      "endMilli": 700,
      "text": "kay ganda at aliwalas ng paligid",
    },
    {
      "startSec": 8,
      "startMilli": 533,
      "endSec": 12,
      "endMilli": 800,
      "text": "nakakatuwang masdan ang mga dahon ng ibat ibang uri ng bulaklak",
    },
    {
      "startSec": 13,
      "startMilli": 167,
      "endSec": 16,
      "endMilli": 200,
      "text": "habang ito'y isinasayaw ng hanging amihan",
    },
    {
      "startSec": 19,
      "startMilli": 300,
      "endSec": 26,
      "endMilli": 333,
      "text":
          "palundag lundag at masayang umaawit si Tipaklong habang siya'y palipat lipat sa mga sangahan ng halaman",
    },
    {
      "startSec": 27,
      "startMilli": 600,
      "endSec": 33,
      "endMilli": 100,
      "text":
          "naaaliw siyang pagmasdan ang mga paru parong dumadapo sa ubod ng mga bulaklak",
    },
    {
      "startSec": 35,
      "startMilli": 367,
      "endSec": 39,
      "endMilli": 667,
      "text":
          "sagana ang mga pagkain sa paligid kaya wala siyang dapat ipangamba",
    },
    {
      "startSec": 42,
      "startMilli": 233,
      "endSec": 44,
      "endMilli": 133,
      "text": "Tipaklong: Hay nako!! Langgam",
    },
    {
      "startSec": 44,
      "startMilli": 967,
      "endSec": 51,
      "endMilli": 600,
      "text":
          "Tipaklong: bakit nagtitiyaga kang magbuhat ng mabigat na pagkain gayong kay dami namang pagkain sa paligid",
    },
    {
      "startSec": 52,
      "startMilli": 600,
      "endSec": 56,
      "endMilli": 467,
      "text": "panunudyo ni Tipaklong kay Langgam na halos di makalakad",
    },
    {
      "startSec": 56,
      "startMilli": 900,
      "endSec": 59,
      "endMilli": 67,
      "text": "dahil sa bigat ng kanyang pinapasan",
    },
    {
      "startSec": 59,
      "startMilli": 767,
      "endSec": 62,
      "endMilli": 300,
      "text": "Langgam: nag iipon kasi ako ng aking makakain",
    },
    {
      "startSec": 62,
      "startMilli": 933,
      "endSec": 65,
      "endMilli": 0,
      "text": "Langgam: alam mo namang malapit na ang tag ulan",
    },
    {
      "startSec": 66,
      "startMilli": 133,
      "endSec": 67,
      "endMilli": 400,
      "text": "sagot naman ni Langgam",
    },
    {
      "startSec": 68,
      "startMilli": 667,
      "endSec": 71,
      "endMilli": 167,
      "text": "Tipaklong: matagal pa yung sinasabi mong tagulan",
    },
    {
      "startSec": 72,
      "startMilli": 133,
      "endSec": 73,
      "endMilli": 300,
      "text": "Tipaklong: alika muna rito",
    },
    {
      "startSec": 74,
      "startMilli": 0,
      "endSec": 75,
      "endMilli": 133,
      "text": "Tipaklong: tularan moko",
    },
    {
      "startSec": 75,
      "startMilli": 933,
      "endSec": 76,
      "endMilli": 833,
      "text": "Tipaklong: nagsasaya",
    },
    {
      "startSec": 77,
      "startMilli": 400,
      "endSec": 78,
      "endMilli": 467,
      "text": "Tipaklong: pakanta kanta",
    },
    {
      "startSec": 79,
      "startMilli": 167,
      "endSec": 82,
      "endMilli": 0,
      "text": "Tipaklong: hindi ako nagpapakapagod na katulad mo",
    },
    {
      "startSec": 83,
      "startMilli": 267,
      "endSec": 84,
      "endMilli": 567,
      "text": "wika ni Tipaklong",
    },
    {
      "startSec": 85,
      "startMilli": 367,
      "endSec": 87,
      "endMilli": 800,
      "text": "hindi na pinansin ni Langgam si Tipaklong",
    },
    {
      "startSec": 88,
      "startMilli": 867,
      "endSec": 90,
      "endMilli": 933,
      "text": "nagpatuloy na ito sa paglalakad",
    },
    {
      "startSec": 92,
      "startMilli": 167,
      "endSec": 96,
      "endMilli": 767,
      "text": "lumipas ang ilang araw ang kalangitan ay sinaklot ng dilim",
    },
    {
      "startSec": 97,
      "startMilli": 333,
      "endSec": 100,
      "endMilli": 0,
      "text": "biglang bumuhos ang napakalakas na ulan",
    },
    {
      "startSec": 100,
      "startMilli": 867,
      "endSec": 103,
      "endMilli": 267,
      "text": "halos masira lahat ng pananim",
    },
    {
      "startSec": 104,
      "startMilli": 567,
      "endSec": 109,
      "endMilli": 500,
      "text":
          "nakaramdam ng gutom si Tipaklong habang nasa sulok ng kanyang tirahan",
    },
    {
      "startSec": 110,
      "startMilli": 333,
      "endSec": 111,
      "endMilli": 633,
      "text": "Tipaklong: Paano ako ngayon?",
    },
    {
      "startSec": 112,
      "startMilli": 300,
      "endSec": 113,
      "endMilli": 400,
      "text": "Tipaklong: nagugutom ako",
    },
    {
      "startSec": 114,
      "startMilli": 333,
      "endSec": 115,
      "endMilli": 733,
      "text": "bulong niya sa sarili",
    },
    {
      "startSec": 116,
      "startMilli": 467,
      "endSec": 118,
      "endMilli": 500,
      "text": "at naalala niya si Langgam",
    },
    {
      "startSec": 119,
      "startMilli": 200,
      "endSec": 122,
      "endMilli": 467,
      "text": "kahit patuloy ang buhos ng malakas na ulan",
    },
    {
      "startSec": 122,
      "startMilli": 933,
      "endSec": 127,
      "endMilli": 67,
      "text": "ay sinagasa niya iyon upang makarating sa bahay ni Langgam",
    },
    {
      "startSec": 130,
      "startMilli": 100,
      "endSec": 134,
      "endMilli": 767,
      "text": "Tipaklong: kaibigang Langgam si Tipaklong ito papasukin mo ako",
    },
    {
      "startSec": 135,
      "startMilli": 867,
      "endSec": 138,
      "endMilli": 133,
      "text": "Tipaklong: labis ang nadarama kong pagkagutom",
    },
    {
      "startSec": 138,
      "startMilli": 800,
      "endSec": 142,
      "endMilli": 567,
      "text": "Tipaklong: wala akong maapuhap na pagkain sa aking tirahan",
    },
    {
      "startSec": 143,
      "startMilli": 100,
      "endSec": 144,
      "endMilli": 267,
      "text": "Tipaklong: pakainin mo ako",
    },
    {
      "startSec": 145,
      "startMilli": 667,
      "endSec": 147,
      "endMilli": 567,
      "text": "pagmamakaawa ni Tipaklong",
    },
    {
      "startSec": 148,
      "startMilli": 133,
      "endSec": 150,
      "endMilli": 800,
      "text": "marahang binuksan ni Langgam ang pinto ",
    },
    {
      "startSec": 151,
      "startMilli": 733,
      "endSec": 154,
      "endMilli": 67,
      "text": "Langgam: pagpaumanhin mo Tipaklong ngunit",
    },
    {
      "startSec": 155,
      "startMilli": 133,
      "endSec": 161,
      "endMilli": 367,
      "text":
          "Langgam: sapat lang sa akin ang natipon kong pagkain at sa palagay ko'y matagal pa bago tumila ang ulan",
    },
    {
      "startSec": 161,
      "startMilli": 900,
      "endSec": 163,
      "endMilli": 700,
      "text": "Langgam: baka ako ang mawalan ng pagkain",
    },
    {
      "startSec": 164,
      "startMilli": 900,
      "endSec": 166,
      "endMilli": 600,
      "text": "paliwanag ni Langgam",
    },
    {
      "startSec": 167,
      "startMilli": 733,
      "endSec": 170,
      "endMilli": 67,
      "text": "malungkot na lumisan si Tipaklong",
    },
    {
      "startSec": 170,
      "startMilli": 533,
      "endSec": 171,
      "endMilli": 533,
      "text": "at naisip niya",
    },
    {
      "startSec": 172,
      "startMilli": 267,
      "endSec": 178,
      "endMilli": 400,
      "text":
          "kung nag ipon din siya ng makakain ay hindi niya mararamdaman ang gutom sa panahon ng tag ulan",
    },
  ];

  String assetVideo = 'assets/videos/TipaklongatLanggam.mp4';

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
      backgroundColor: Colors.lightBlue.shade100,
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
                      return MalakasatmagandaQuiz();
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
