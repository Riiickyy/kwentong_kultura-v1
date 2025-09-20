import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:kwentong_kultura/QUIZZES/mariamakilingQuiz.dart';
import 'package:video_player/video_player.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class MariamakilingCT extends StatefulWidget {
  const MariamakilingCT({super.key});

  @override
  State<MariamakilingCT> createState() => _MariamakilingCTState();
}

class _MariamakilingCTState extends State<MariamakilingCT> {
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
      "startMilli": 933,
      "endSec": 3,
      "endMilli": 333,
      "text": "Ang Alamat ng Maria Makiling",
    },
    {
      "startSec": 4,
      "startMilli": 867,
      "endSec": 5,
      "endMilli": 867,
      "text": "noong unang panahon",
    },
    {
      "startSec": 6,
      "startMilli": 200,
      "endSec": 9,
      "endMilli": 467,
      "text": "ang mga diyos ay namumuhay na katulad ng mga tao",
    },
    {
      "startSec": 10,
      "startMilli": 533,
      "endSec": 16,
      "endMilli": 700,
      "text":
          "sina Dayang Makiling at Gat Panahon ay may nag iisang anak na nagngangalang Maria",
    },
    {
      "startSec": 18,
      "startMilli": 67,
      "endSec": 21,
      "endMilli": 300,
      "text": "itinuring siyang isang kayamanan ng mga mag asawa",
    },
    {
      "startSec": 23,
      "startMilli": 600,
      "endSec": 26,
      "endMilli": 733,
      "text": "dahil sa ang diyos ay namumuhay na parang tao",
    },
    {
      "startSec": 27,
      "startMilli": 367,
      "endSec": 29,
      "endMilli": 733,
      "text": "sila rin ay nagtungo sa palengke",
    },
    {
      "startSec": 30,
      "startMilli": 300,
      "endSec": 32,
      "endMilli": 800,
      "text": "si Maria ay madalas pumunta sa palengke",
    },
    {
      "startSec": 33,
      "startMilli": 67,
      "endSec": 34,
      "endMilli": 733,
      "text": "kasama ang dalawang alalay",
    },

    {
      "startSec": 35,
      "startMilli": 867,
      "endSec": 42,
      "endMilli": 567,
      "text":
          "ang mga alalay ay may dalang basket na puno ng gintong luya na ipinagpapalit sa mga bagay na nais",
    },
    {
      "startSec": 44,
      "startMilli": 467,
      "endSec": 50,
      "endMilli": 267,
      "text":
          "at lahat ng tao na nadaraanan ni Maria ay yumuyuko bilang paggalang sa kanya",
    },
    {
      "startSec": 52,
      "startMilli": 933,
      "endSec": 57,
      "endMilli": 333,
      "text":
          "hindi lamang ang mga tao sa lugar nila ang nagtutungo sa palengke",
    },
    {
      "startSec": 57,
      "startMilli": 733,
      "endSec": 59,
      "endMilli": 900,
      "text": "pati na rin ang mga taga ibang nayon",
    },
    {
      "startSec": 61,
      "startMilli": 300,
      "endSec": 62,
      "endMilli": 100,
      "text": "isang araw",
    },
    {
      "startSec": 62,
      "startMilli": 667,
      "endSec": 67,
      "endMilli": 900,
      "text":
          "habang namimili si Maria ay nakabangga niya si Gatdula na nakatira sa ibang nayon",
    },
    {
      "startSec": 69,
      "startMilli": 167,
      "endSec": 73,
      "endMilli": 267,
      "text": "nagkataon na sabay nilang nadampot ang magandang balat ng hayop",
    },
    {
      "startSec": 73,
      "startMilli": 567,
      "endSec": 75,
      "endMilli": 700,
      "text": "at nagkahawakan sila ng kamay",
    },
    {
      "startSec": 78,
      "startMilli": 933,
      "endSec": 84,
      "endMilli": 300,
      "text":
          "yumuko si Gatdula bilang paghingi ng pasensya at pagbibigay respeto kay Maria",
    },
    {
      "startSec": 85,
      "startMilli": 367,
      "endSec": 90,
      "endMilli": 0,
      "text":
          "magmula noon ay madalas na silang nagkikita ni Gatdula sa palengke",
    },
    {
      "startSec": 90,
      "startMilli": 700,
      "endSec": 93,
      "endMilli": 500,
      "text": "minsan nilapitan niya si Maria at kinausap",
    },
    {
      "startSec": 94,
      "startMilli": 300,
      "endSec": 96,
      "endMilli": 867,
      "text": "binigyan siya nito ng isang matamis na ngiti",
    },
    {
      "startSec": 97,
      "startMilli": 933,
      "endSec": 102,
      "endMilli": 267,
      "text": "ito ang naging simula ng pag iibigan ni Maria at Gatdula",
    },
    {
      "startSec": 105,
      "startMilli": 200,
      "endSec": 110,
      "endMilli": 167,
      "text":
          "hindi rin naglaon ay nalaman ng ama ni Maria at nagalit ito sa dalaga",
    },
    {
      "startSec": 111,
      "startMilli": 300,
      "endSec": 114,
      "endMilli": 900,
      "text": "hindi na pinayagan pang muli si Maria na makababa sa lupa",
    },
    {
      "startSec": 116,
      "startMilli": 300,
      "endSec": 121,
      "endMilli": 567,
      "text":
          "hindi nila matanggap na ang isang katulad nitong diyosa ay iibig lamang sa isang mortal",
    },

    {
      "startSec": 123,
      "startMilli": 100,
      "endSec": 127,
      "endMilli": 400,
      "text": "kahit na ang pag iibigan nila Maria at Gatdula ay hinahadlangan",
    },
    {
      "startSec": 128,
      "startMilli": 67,
      "endSec": 131,
      "endMilli": 367,
      "text": "ang kanilang pag iibigan ay mas lalo pang yumabong",
    },
    {
      "startSec": 132,
      "startMilli": 300,
      "endSec": 139,
      "endMilli": 200,
      "text":
          "hindi na nakakapunta si maria sa lupa ay nagagawa pa rin niyang subaybayan at panoorin si Gatdula",
    },
    {
      "startSec": 140,
      "startMilli": 733,
      "endSec": 148,
      "endMilli": 0,
      "text":
          "kahit na nagkaroon ng labanan sina Gatdula at Lakan Buto ay wala ni isang galos si Gatdula sa binata",
    },
    {
      "startSec": 148,
      "startMilli": 800,
      "endSec": 151,
      "endMilli": 967,
      "text": "dahil na rin sa palagiang pagsubaybay ni Maria",
    },
    {
      "startSec": 153,
      "startMilli": 367,
      "endSec": 156,
      "endMilli": 867,
      "text": "si Gatdula ay walang kakayahang makita si Maria",
    },
    {
      "startSec": 157,
      "startMilli": 500,
      "endSec": 158,
      "endMilli": 500,
      "text": "sa lungkot ay nagkasakit ito at namatay",
    },
    {
      "startSec": 161,
      "startMilli": 267,
      "endSec": 166,
      "endMilli": 200,
      "text":
          "dahil sa labis na pag ibig ni Maria kay Gatdula hiniling nito sa ama",
    },
    {
      "startSec": 166,
      "startMilli": 467,
      "endSec": 169,
      "endMilli": 933,
      "text": "na ibigay na lamang sa kanya ang kaluluwa ni Gatdula",
    },
    {
      "startSec": 170,
      "startMilli": 67,
      "endSec": 172,
      "endMilli": 967,
      "text": "bilang alaala sa yumao nitong pag-ibig",
    },
  ];

  String assetVideo = 'assets/videos/MariaMakiling.mp4';

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
                      return Mariamakilingquiz();
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
