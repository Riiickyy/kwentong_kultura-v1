import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:kwentong_kultura/QUIZZES/alamatngmayaQuiz.dart';
import 'package:video_player/video_player.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class AlamatngmayaCT extends StatefulWidget {
  const AlamatngmayaCT({super.key});

  @override
  State<AlamatngmayaCT> createState() => _AlamatngmayaCTState();
}

class _AlamatngmayaCTState extends State<AlamatngmayaCT> {
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
      "startMilli": 0,
      "endSec": 2,
      "endMilli": 333,
      "text": "Ang Alamat ng Maya",
    },
    {
      "startSec": 4,
      "startMilli": 267,
      "endSec": 9,
      "endMilli": 0,
      "text":
          "noong unang panahon sa isang liblib na lugar SA bundok ng Carabayo",
    },
    {
      "startSec": 9,
      "startMilli": 933,
      "endSec": 12,
      "endMilli": 0,
      "text": "may mag inang nananahan doon",
    },
    {
      "startSec": 13,
      "startMilli": 100,
      "endSec": 16,
      "endMilli": 600,
      "text": "malayo ang kanilang bahay sa mga naninirahan din doon",
    },
    {
      "startSec": 18,
      "startMilli": 67,
      "endSec": 23,
      "endMilli": 400,
      "text":
          "nakaugalian na sa kanilang lugar na kailangan bayuhin muna ang palay bago kainin",
    },
    {
      "startSec": 24,
      "startMilli": 800,
      "endSec": 29,
      "endMilli": 100,
      "text":
          "si Mayan ay isang batang babaeng may labing tatlong taong gulang",
    },
    {
      "startSec": 30,
      "startMilli": 200,
      "endSec": 32,
      "endMilli": 267,
      "text": "bukod sa ito'y ubod ng likot",
    },
    {
      "startSec": 32,
      "startMilli": 933,
      "endSec": 34,
      "endMilli": 600,
      "text": "saksakan pa ito ng tamad",
    },
    {
      "startSec": 36,
      "startMilli": 67,
      "endSec": 39,
      "endMilli": 400,
      "text": "nagbabayo ng palay ang Ina nito isang umaga",
    },

    {
      "startSec": 42,
      "startMilli": 367,
      "endSec": 45,
      "endMilli": 700,
      "text": "sapagkat sa tanghalian ay wala na silang isasaing",
    },
    {
      "startSec": 46,
      "startMilli": 767,
      "endSec": 51,
      "endMilli": 967,
      "text":
          "habang ang batang si Mayan ay abala naman sa pakikipaglaro sa kanyang mga kapwa bata",
    },
    {
      "startSec": 54,
      "startMilli": 967,
      "endSec": 62,
      "endMilli": 0,
      "text":
          "nang datnan niyang pagkapagod ay lumapit sa kanyang ina at pinanood na lamang ang kanyang ina sa pagbabayo",
    },
    {
      "startSec": 63,
      "startMilli": 367,
      "endSec": 64,
      "endMilli": 867,
      "text": "habang siya'y nakaupo",
    },
    {
      "startSec": 65,
      "startMilli": 500,
      "endSec": 68,
      "endMilli": 133,
      "text": "nakadama siya ng pagkalam ng sikmura",
    },
    {
      "startSec": 70,
      "startMilli": 467,
      "endSec": 76,
      "endMilli": 333,
      "text":
          "nagtungo siya sa kanilang kusina at tumingin sa kaldero kung mayroong makakain kahit ano",
    },
    {
      "startSec": 76,
      "startMilli": 767,
      "endSec": 78,
      "endMilli": 567,
      "text": "ngunit bigo siya",
    },
    {
      "startSec": 79,
      "startMilli": 0,
      "endSec": 81,
      "endMilli": 267,
      "text": "at dagli siyang lumapit sa bakol",
    },
    {
      "startSec": 82,
      "startMilli": 500,
      "endSec": 86,
      "endMilli": 67,
      "text": "sa tantsa niya'y may isang salop pa ang laman niyon",
    },
    {
      "startSec": 87,
      "startMilli": 567,
      "endSec": 89,
      "endMilli": 467,
      "text": "dahil sa tindi ng gutom",
    },
    {
      "startSec": 89,
      "startMilli": 900,
      "endSec": 92,
      "endMilli": 167,
      "text": "sinimulan niyang kainin ang bigas",
    },
    {
      "startSec": 93,
      "startMilli": 533,
      "endSec": 95,
      "endMilli": 567,
      "text": "waring hindi pa siya nasiyahan",
    },
    {
      "startSec": 96,
      "startMilli": 67,
      "endSec": 99,
      "endMilli": 800,
      "text": "inalis pa ang takip ng bakol at palihim na pumasok sa loob",
    },
    {
      "startSec": 101,
      "startMilli": 0,
      "endSec": 102,
      "endMilli": 233,
      "text": "siya'y naupo",
    },
    {
      "startSec": 102,
      "startMilli": 567,
      "endSec": 107,
      "endMilli": 767,
      "text":
          "at sa kanya muling ibinalik ang takip hangad niyang hindi siya makita ng Ina",
    },
    {
      "startSec": 110,
      "startMilli": 167,
      "endSec": 112,
      "endMilli": 467,
      "text": "natapos ang kanyang Ina sa pagbabayo",
    },
    {
      "startSec": 113,
      "startMilli": 100,
      "endSec": 118,
      "endMilli": 933,
      "text":
          "tinawag niya si Mayan ngunit halos mamaos na'y hindi pa rin lumilitaw si Mayan",
    },
    {
      "startSec": 121,
      "startMilli": 167,
      "endSec": 126,
      "endMilli": 67,
      "text":
          "nang buksan ng Ina ang bakol ay may isang maliit na ibon ang lumabas doon",
    },
    {
      "startSec": 128,
      "startMilli": 100,
      "endSec": 130,
      "endMilli": 400,
      "text": "nanginain ng bigas ang ibon",
    },
    {
      "startSec": 131,
      "startMilli": 133,
      "endSec": 134,
      "endMilli": 167,
      "text": "kalaunan ang ibong iyon ay tinawag na Maya",
    },
    {
      "startSec": 135,
      "startMilli": 467,
      "endSec": 139,
      "endMilli": 133,
      "text": "malaki ang hinala ng kanyang Ina na si Mayan iyon",
    },
  ];

  String assetVideo = 'assets/videos/AlamatngMaya.mp4';

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
                      return AlamatngmayaQuiz();
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
