import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:kwentong_kultura/QUIZZES/pinyaQuiz.dart';
import 'package:kwentong_kultura/Styles/styles.dart';
import 'package:video_player/video_player.dart';

class AlamatngpinyaCT extends StatefulWidget {
  const AlamatngpinyaCT({super.key});

  @override
  State<AlamatngpinyaCT> createState() => _AlamatngpinyaCTState();
}

class _AlamatngpinyaCTState extends State<AlamatngpinyaCT> {
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
      "startMilli": 333,
      "endSec": 3,
      "endMilli": 133,
      "text": "Ang Alamat ng Pinya",
    },
    {
      "startSec": 5,
      "startMilli": 66,
      "endSec": 6,
      "endMilli": 800,
      "text": "mahal na mahal ni aling Rosa",
    },
    {
      "startSec": 7,
      "startMilli": 200,
      "endSec": 8,
      "endMilli": 800,
      "text": "ang kanyang anak na si Pina",
    },
    {
      "startSec": 9,
      "startMilli": 700,
      "endSec": 13,
      "endMilli": 667,
      "text": "inaalagaan niya itong mabuti at hindi niya pinagagawa sa bahay",
    },
    {
      "startSec": 14,
      "startMilli": 200,
      "endSec": 15,
      "endMilli": 333,
      "text": "upang hindi mapagod",
    },

    {
      "startSec": 16,
      "startMilli": 500,
      "endSec": 21,
      "endMilli": 0,
      "text":
          "masaya na siyang nagsisilbi sa anak at gumagawa ng lahat ng trabaho sa bahay",
    },

    {
      "startSec": 22,
      "startMilli": 800,
      "endSec": 27,
      "endMilli": 967,
      "text":
          "si Pina ay lumaki sa layaw dahil na rin sa kagagawan ni Aling Rosa",
    },

    {
      "startSec": 28,
      "startMilli": 467,
      "endSec": 35,
      "endMilli": 0,
      "text":
          "gustuhin man niyang turuan ito gumawa sa bahay at magbago ng ugali ay hindi na niya magagawa",
    },
    {
      "startSec": 36,
      "startMilli": 267,
      "endSec": 40,
      "endMilli": 800,
      "text":
          "ayaw na baguhin ni Pina ang kanyang nakasanayang masarap na buhay",
    },
    {
      "startSec": 41,
      "startMilli": 600,
      "endSec": 44,
      "endMilli": 133,
      "text": "kung kaya't napilitan si Aling Rosa",
    },
    {
      "startSec": 44,
      "startMilli": 600,
      "endSec": 50,
      "endMilli": 900,
      "text":
          "na kahit na matanda na siya ay siya pa rin ang nagtatrabaho at gumawa ng lahat ng gawaing bahay",
    },
    {
      "startSec": 52,
      "startMilli": 733,
      "endSec": 55,
      "endMilli": 167,
      "text": "isang araw ay nagkasakit si Aling Rosa",
    },
    {
      "startSec": 56,
      "startMilli": 267,
      "endSec": 59,
      "endMilli": 667,
      "text": "mahinang mahina siya at hindi siya makabangon sa higaan",
    },
    {
      "startSec": 61,
      "startMilli": 0,
      "endSec": 66,
      "endMilli": 900,
      "text":
          "nagmamakaawa siya sa anak na magluto ng pagkain upang hindi sila magutom mag-ina",
    },
    {
      "startSec": 69,
      "startMilli": 700,
      "endSec": 74,
      "endMilli": 367,
      "text":
          "masama man ang loob ay pumayag si Pina na magluto at gumawa ng iba pa",
    },
    {
      "startSec": 75,
      "startMilli": 200,
      "endSec": 79,
      "endMilli": 100,
      "text": "ngunit pamali mali dahil hindi siya sanay magtrabaho",
    },
    {
      "startSec": 80,
      "startMilli": 700,
      "endSec": 82,
      "endMilli": 467,
      "text": "nagtagal ang sakit ni Aling Rosa",
    },
    {
      "startSec": 83,
      "startMilli": 0,
      "endSec": 87,
      "endMilli": 333,
      "text": "at nagsawa si Pina sa paggawa at pagsunod sa utos ng ina",
    },
    {
      "startSec": 89,
      "startMilli": 400,
      "endSec": 91,
      "endMilli": 167,
      "text": "madalas na silang magkagalit",
    },
    {
      "startSec": 91,
      "startMilli": 933,
      "endSec": 96,
      "endMilli": 100,
      "text":
          "laging masama ang loob ni Pina habang gumagawa ng trabaho sa bahay",
    },
    {
      "startSec": 97,
      "startMilli": 300,
      "endSec": 98,
      "endMilli": 167,
      "text": "Isang araw",
    },
    {
      "startSec": 98,
      "startMilli": 467,
      "endSec": 100,
      "endMilli": 667,
      "text": "ay magluluto na naman si Pina",
    },
    {
      "startSec": 101,
      "startMilli": 467,
      "endSec": 105,
      "endMilli": 467,
      "text": "hindi siya makapagsimula dahil hindi niya makita ang sandok",
    },
    {
      "startSec": 106,
      "startMilli": 967,
      "endSec": 111,
      "endMilli": 500,
      "text":
          "hinanap niya ito ng mabuti sa loob ng bahay ngunit di pa rin niya makita",
    },
    {
      "startSec": 112,
      "startMilli": 367,
      "endSec": 114,
      "endMilli": 367,
      "text": "nagreklamo na siya sa kanyang ina",
    },
    {
      "startSec": 115,
      "startMilli": 333,
      "endSec": 119,
      "endMilli": 100,
      "text": "inutusan siya ng ina na bumaba ng bahay at doon hanapin",
    },
    {
      "startSec": 119,
      "startMilli": 400,
      "endSec": 121,
      "endMilli": 333,
      "text": "dahil baka nahulog sa lupa",
    },
    {
      "startSec": 123,
      "startMilli": 567,
      "endSec": 127,
      "endMilli": 733,
      "text":
          "nagkakagalit na ang mag ina dahil sa paghahanap ng nawawalang sandok",
    },
    {
      "startSec": 128,
      "startMilli": 600,
      "endSec": 131,
      "endMilli": 133,
      "text": "hanggang sa nasambit ni Aling Rosa ang",
    },
    {
      "startSec": 131,
      "startMilli": 900,
      "endSec": 135,
      "endMilli": 867,
      "text":
          "Ina: Sana'y tubuan ka ng maraming mata ng makita mo ang iyong hinahanap",
    },
    {
      "startSec": 136,
      "startMilli": 867,
      "endSec": 141,
      "endMilli": 800,
      "text":
          "ilang oras na ang nagdaan ay hindi pa umaakyat si Pina sa bahay  ",
    },
    {
      "startSec": 143,
      "startMilli": 933,
      "endSec": 148,
      "endMilli": 0,
      "text": "lumipas na ang gutom ni Aling Rosa ay wala pa rin si Pina",
    },
    {
      "startSec": 149,
      "startMilli": 0,
      "endSec": 150,
      "endMilli": 967,
      "text": "gabi na ay wala pa rin si Pina",
    },
    {
      "startSec": 151,
      "startMilli": 600,
      "endSec": 154,
      "endMilli": 867,
      "text": "nagaalalana si Aling Rosa sa hindi pagbalik ni Pina",
    },
    {
      "startSec": 155,
      "startMilli": 867,
      "endSec": 160,
      "endMilli": 267,
      "text":
          "nagtanong na siya sa kanilang kapitbahay ngunit walang nakakita kay Pina",
    },
    {
      "startSec": 161,
      "startMilli": 400,
      "endSec": 166,
      "endMilli": 867,
      "text": "hinanap niya itong muli sa buong kabahayan at buong bakuran",
    },
    {
      "startSec": 167,
      "startMilli": 767,
      "endSec": 169,
      "endMilli": 767,
      "text": "hindi na niya nakita si Pina",
    },
    {
      "startSec": 170,
      "startMilli": 900,
      "endSec": 174,
      "endMilli": 800,
      "text": "sa isang sulok ng bakuran ay nakita niya ang isang halaman",
    },
    {
      "startSec": 175,
      "startMilli": 67,
      "endSec": 178,
      "endMilli": 500,
      "text": "na ang bunga ay tulad ng isang tao na maraming mata",
    },
    {
      "startSec": 181,
      "startMilli": 67,
      "endSec": 183,
      "endMilli": 900,
      "text": "naalala ni Aling Rosa ang sinabi sa kanyang anak",
    },
    {
      "startSec": 184,
      "startMilli": 667,
      "endSec": 190,
      "endMilli": 167,
      "text":
          "na sana'y tubuan ka ng maraming mata ng makita mo ang iyong hinahanap",
    },
    {
      "startSec": 191,
      "startMilli": 767,
      "endSec": 196,
      "endMilli": 667,
      "text":
          "napaiyak si Aling Rosa at iniisip na ang halamang tumubo sa kanyang bakuran",
    },
    {
      "startSec": 197,
      "startMilli": 200,
      "endSec": 199,
      "endMilli": 67,
      "text": "ay ang kanyang anak na si Pina",
    },
    {
      "startSec": 200,
      "startMilli": 567,
      "endSec": 204,
      "endMilli": 800,
      "text": "inalagaan niya ang halaman at simula noon tinawag niya itong ",
    },
    {
      "startSec": 205,
      "startMilli": 300,
      "endSec": 206,
      "endMilli": 233,
      "text": "Pinya",
    },
  ];

  String assetVideo = 'assets/videos/AlamatngPinya.mp4';

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
                      return Pinyaquiz();
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
