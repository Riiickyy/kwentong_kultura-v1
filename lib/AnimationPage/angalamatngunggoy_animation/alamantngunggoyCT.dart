import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/QUIZZES/angasoatkanyanganinoQuiz.dart';
import 'package:video_player/video_player.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class AlamantngunggoyCT extends StatefulWidget {
  const AlamantngunggoyCT({super.key});

  @override
  State<AlamantngunggoyCT> createState() => _AlamantngunggoyCTState();
}

class _AlamantngunggoyCTState extends State<AlamantngunggoyCT> {
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
      "startMilli": 600,
      "endSec": 2,
      "endMilli": 467,
      "text": "Ang Alamat ng Unggoy",
    },
    {
      "startSec": 4,
      "startMilli": 467,
      "endSec": 6,
      "endMilli": 767,
      "text": "mayroong isang batang napakatamad",
    },
    {
      "startSec": 7,
      "startMilli": 367,
      "endSec": 9,
      "endMilli": 767,
      "text": "ang pangalan niya ay Juan",
    },
    {
      "startSec": 10,
      "startMilli": 167,
      "endSec": 15,
      "endMilli": 200,
      "text":
          "lagi na lamang napakahirap sa kanya ang mga bagay na napakasimple lamang gawin",
    },
    {
      "startSec": 16,
      "startMilli": 300,
      "endSec": 19,
      "endMilli": 867,
      "text": "isa rin sa kanyang kinaiinis ay ang paggising ng maaga",
    },
    {
      "startSec": 21,
      "startMilli": 333,
      "endSec": 25,
      "endMilli": 967,
      "text":
          "hindi na alam ng Ina ni Juan ang gagawin sa isang batang katulad niya",
    },
    {
      "startSec": 26,
      "startMilli": 800,
      "endSec": 29,
      "endMilli": 200,
      "text": "masyado siyang napapalaki nito sa layaw",
    },
    {
      "startSec": 29,
      "startMilli": 767,
      "endSec": 32,
      "endMilli": 967,
      "text": "at hindi na alam ang dapat gawin upang masupil",
    },
    {
      "startSec": 33,
      "startMilli": 333,
      "endSec": 36,
      "endMilli": 0,
      "text": "ang mga masasamang pag uugali ng anak",
    },
    {
      "startSec": 37,
      "startMilli": 200,
      "endSec": 38,
      "endMilli": 100,
      "text": "Isang araw",
    },
    {
      "startSec": 38,
      "startMilli": 500,
      "endSec": 42,
      "endMilli": 267,
      "text": "habang si Juan ay naglalaro sa labas ng kanilang tahanan",
    },
    {
      "startSec": 42,
      "startMilli": 667,
      "endSec": 46,
      "endMilli": 500,
      "text": "tinawag siya ng Ina upang hanapin ang nawawalang sandok",
    },
    {
      "startSec": 48,
      "startMilli": 100,
      "endSec": 53,
      "endMilli": 800,
      "text":
          "mabilis namang sumunod ang bata at iniwan ang kanyang paglalaro at lumapit sa ina",
    },
    {
      "startSec": 56,
      "startMilli": 533,
      "endSec": 62,
      "endMilli": 500,
      "text":
          "makalipas ang ilang oras ay naghinala ang kanyang ina na tila hindi siya sinusunod ni Juan",
    },
    {
      "startSec": 63,
      "startMilli": 100,
      "endSec": 64,
      "endMilli": 167,
      "text": "nagalit ito",
    },
    {
      "startSec": 64,
      "startMilli": 700,
      "endSec": 68,
      "endMilli": 367,
      "text": "lalo nang makita niyang nasa labas uli ito at naglalaro",
    },
    {
      "startSec": 69,
      "startMilli": 733,
      "endSec": 72,
      "endMilli": 967,
      "text": "hinila niyang papasok ng bahay si Juan at sinabing",
    },
    {
      "startSec": 73,
      "startMilli": 633,
      "endSec": 75,
      "endMilli": 267,
      "text": "Ina: nahanap mo na ba ang sandok!?",
    },
    {
      "startSec": 76,
      "startMilli": 167,
      "endSec": 82,
      "endMilli": 600,
      "text":
          "Ina: pupunta ako ngayon sa palengke at gusto ko pagbalik ko ay nahanap mo na ang sandok na aking ipinahanap",
    },
    {
      "startSec": 83,
      "startMilli": 800,
      "endSec": 86,
      "endMilli": 67,
      "text": "at iniwan na niya ang batang tamad",
    },
    {
      "startSec": 86,
      "startMilli": 600,
      "endSec": 89,
      "endMilli": 167,
      "text": "para masunod na nito ang kanyang inuutos",
    },
    {
      "startSec": 91,
      "startMilli": 200,
      "endSec": 92,
      "endMilli": 567,
      "text": "pagkaalis ng Ina",
    },
    {
      "startSec": 93,
      "startMilli": 133,
      "endSec": 97,
      "endMilli": 100,
      "text":
          "hindi man lang sinubukan ni Juan na hanapin ang nawawalang sandok",
    },
    {
      "startSec": 97,
      "startMilli": 900,
      "endSec": 101,
      "endMilli": 900,
      "text": "sa halip ay naisip niyang kunin na lamang ang kanyang nakitang",
    },
    {
      "startSec": 102,
      "startMilli": 100,
      "endSec": 104,
      "endMilli": 733,
      "text": "malaking kutsara na gawa sa kahoy",
    },
    {
      "startSec": 105,
      "startMilli": 200,
      "endSec": 108,
      "endMilli": 400,
      "text": "pupwedeng ipalit ito sa kanyang hinahanap na sandok",
    },
    {
      "startSec": 110,
      "startMilli": 167,
      "endSec": 114,
      "endMilli": 767,
      "text":
          "at nagsimula na muling maglaro hanggang sa dumating ang kanyang Ina",
    },
    {
      "startSec": 116,
      "startMilli": 333,
      "endSec": 120,
      "endMilli": 967,
      "text": "ibinigay niya sa Ina ang isang malaking kutsara at sinabing",
    },
    {
      "startSec": 122,
      "startMilli": 67,
      "endSec": 125,
      "endMilli": 0,
      "text": "Juan: hindi ko na mahanap ang sandok kasi tinatamad ako",
    },
    {
      "startSec": 125,
      "startMilli": 467,
      "endSec": 130,
      "endMilli": 967,
      "text":
          "Juan: pwede na itong malaking kahoy na kutsara na aking nakuha bilang pamalit sa nawawalang sandok",
    },
    {
      "startSec": 132,
      "startMilli": 967,
      "endSec": 133,
      "endMilli": 867,
      "text": "Ina: HOY!!",
    },
    {
      "startSec": 134,
      "startMilli": 400,
      "endSec": 136,
      "endMilli": 733,
      "text": "Ina: talagang napakatamad mong bata ka",
    },
    {
      "startSec": 137,
      "startMilli": 567,
      "endSec": 139,
      "endMilli": 600,
      "text": "at napaiyak ang kanyang Ina",
    },
    {
      "startSec": 140,
      "startMilli": 567,
      "endSec": 143,
      "endMilli": 300,
      "text": "pinalo ng pinalo si juan ng sandok",
    },
    {
      "startSec": 144,
      "startMilli": 100,
      "endSec": 145,
      "endMilli": 900,
      "text": "tumakbong palayo si Juan",
    },
    {
      "startSec": 146,
      "startMilli": 667,
      "endSec": 150,
      "endMilli": 133,
      "text": "ibinato ng Ina kay Juan ang kutsarang kahoy",
    },
    {
      "startSec": 151,
      "startMilli": 200,
      "endSec": 152,
      "endMilli": 300,
      "text": "at sinabi niyang",
    },
    {
      "startSec": 152,
      "startMilli": 833,
      "endSec": 155,
      "endMilli": 333,
      "text": "Ina: magkaroon ka sana ng buntot sa likuran",
    },
    {
      "startSec": 156,
      "startMilli": 800,
      "endSec": 162,
      "endMilli": 800,
      "text":
          "nagulat na lamang ang Ina ng makita si Juan na lumambitin sa isang puno upang makaiwas",
    },
    {
      "startSec": 164,
      "startMilli": 733,
      "endSec": 169,
      "endMilli": 767,
      "text":
          "lumapit ang Ina nito sa puno at umiyak sa kanyang matigas na ulong anak",
    },
    {
      "startSec": 171,
      "startMilli": 833,
      "endSec": 173,
      "endMilli": 133,
      "text": "Ina: bumaba ka dyan",
    },
    {
      "startSec": 174,
      "startMilli": 100,
      "endSec": 175,
      "endMilli": 933,
      "text": "Ina: kailangan pa kitang maparusahan",
    },
    {
      "startSec": 177,
      "startMilli": 767,
      "endSec": 181,
      "endMilli": 333,
      "text": "ngunit si Juan ay hindi nagsalita ng kahit ano",
    },
    {
      "startSec": 182,
      "startMilli": 500,
      "endSec": 184,
      "endMilli": 800,
      "text": "nang ibuka ni Juan ang kanyang bibig",
    },
    {
      "startSec": 185,
      "startMilli": 267,
      "endSec": 191,
      "endMilli": 767,
      "text":
          "upang humingi ng tawad sa Ina ay boses na lamang na maaligasgas ang lumalabas sa kanyang bibig",
    },
    {
      "startSec": 193,
      "startMilli": 200,
      "endSec": 198,
      "endMilli": 0,
      "text":
          "at nagsimulang tumubo ang mahabang buhok at buntot sa kanyang katawan",
    },
    {
      "startSec": 199,
      "startMilli": 133,
      "endSec": 201,
      "endMilli": 667,
      "text": "hindi na siya muling nakapagsasalita",
    },
    {
      "startSec": 202,
      "startMilli": 767,
      "endSec": 206,
      "endMilli": 200,
      "text": "si Juan ay naging kauna-unahang unggoy",
    },
    {
      "startSec": 207,
      "startMilli": 300,
      "endSec": 209,
      "endMilli": 667,
      "text": "siya ay hindi pinarusahan ng kanyang Ina",
    },
    {
      "startSec": 210,
      "startMilli": 867,
      "endSec": 214,
      "endMilli": 400,
      "text": "siya na rin ang nagdala ng parusa sa kanyang sarili",
    },
  ];

  String assetVideo = 'assets/videos/AlamatngUnggoy.mp4';

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
                      return AngAsoatkanyangAninoQuiz();
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
