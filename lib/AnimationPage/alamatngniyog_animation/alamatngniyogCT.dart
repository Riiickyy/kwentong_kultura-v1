import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/QUIZZES/alamatngniyogQuiz.dart';
import 'package:video_player/video_player.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class AlamatngniyogCT extends StatefulWidget {
  const AlamatngniyogCT({super.key});

  @override
  State<AlamatngniyogCT> createState() => _AlamatngniyogCTState();
}

class _AlamatngniyogCTState extends State<AlamatngniyogCT> {
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
      "endSec": 2,
      "endMilli": 933,
      "text": "Ang Alamat ng Niyog",
    },
    {
      "startSec": 5,
      "startMilli": 800,
      "endSec": 12,
      "endMilli": 67,
      "text":
          "noong unang panahon sa lalawigan ng Laguna ay may naninirahang mag asawa na may isang anak",
    },
    {
      "startSec": 13,
      "startMilli": 767,
      "endSec": 15,
      "endMilli": 67,
      "text": "ito ay si Yumi",
    },
    {
      "startSec": 15,
      "startMilli": 567,
      "endSec": 17,
      "endMilli": 667,
      "text": "may angking kagandahan si Yumi",
    },
    {
      "startSec": 19,
      "startMilli": 167,
      "endSec": 23,
      "endMilli": 533,
      "text": "bukod pa sa ito'y matangkad mahaba at malago ang kanyang buhok",
    },
    {
      "startSec": 24,
      "startMilli": 133,
      "endSec": 25,
      "endMilli": 567,
      "text": "mayumi kung kumilos",
    },
    {
      "startSec": 27,
      "startMilli": 200,
      "endSec": 30,
      "endMilli": 267,
      "text": "matulungin ito at mapagmalasakit sa kanyang Ina",
    },
    {
      "startSec": 31,
      "startMilli": 333,
      "endSec": 35,
      "endMilli": 467,
      "text": "madalas siyang katuwang ng kanyang Ina sa anumang gawaing bahay",
    },
    {
      "startSec": 36,
      "startMilli": 667,
      "endSec": 39,
      "endMilli": 533,
      "text": "Tatay: Yumi! kami'y mangingisda ng iyong ina",
    },
    {
      "startSec": 40,
      "startMilli": 467,
      "endSec": 42,
      "endMilli": 600,
      "text": "minsan ay wika ng kanyang Ama",
    },
    {
      "startSec": 43,
      "startMilli": 533,
      "endSec": 46,
      "endMilli": 267,
      "text": "Tatay: tiyak naming kinabukasan ng umaga ang aming balik",
    },
    {
      "startSec": 46,
      "startMilli": 933,
      "endSec": 50,
      "endMilli": 567,
      "text":
          "Tatay: mas mabuting manatili ka na lamang dito sa bahay habang wala kami",
    },
    {
      "startSec": 52,
      "startMilli": 200,
      "endSec": 54,
      "endMilli": 267,
      "text": "nang makaalis ang kanyang mga magulang",
    },
    {
      "startSec": 54,
      "startMilli": 767,
      "endSec": 56,
      "endMilli": 67,
      "text": "naglinis si Yumi",
    },
    {
      "startSec": 57,
      "startMilli": 200,
      "endSec": 60,
      "endMilli": 100,
      "text": "nilinis niya ang kabuuan ng kanilang tahanan",
    },
    {
      "startSec": 60,
      "startMilli": 600,
      "endSec": 61,
      "endMilli": 900,
      "text": "maging ang bakuran",
    },
    {
      "startSec": 63,
      "startMilli": 133,
      "endSec": 66,
      "endMilli": 0,
      "text": "naglaba siya at pagkatapos ay namlantsa",
    },
    {
      "startSec": 66,
      "startMilli": 900,
      "endSec": 69,
      "endMilli": 933,
      "text": "ang mga sira sirang damit ay kanyang sinulsihan",
    },
    {
      "startSec": 71,
      "startMilli": 267,
      "endSec": 72,
      "endMilli": 967,
      "text": "matapos ang mga gawaing ito",
    },
    {
      "startSec": 73,
      "startMilli": 300,
      "endSec": 76,
      "endMilli": 100,
      "text": "naisipan ni Yumi na mamasyal sa dalampasigan",
    },
    {
      "startSec": 79,
      "startMilli": 300,
      "endSec": 84,
      "endMilli": 567,
      "text":
          "nang mahapo siya sa paglalakad ay naupo siya sa ilalim ng isang punong kahoy",
    },
    {
      "startSec": 85,
      "startMilli": 533,
      "endSec": 87,
      "endMilli": 933,
      "text": "maya maya ay nagdilim na ang kalangitan",
    },
    {
      "startSec": 88,
      "startMilli": 367,
      "endSec": 90,
      "endMilli": 133,
      "text": "biglang bumuhos ang malakas na ulan",
    },
    {
      "startSec": 90,
      "startMilli": 900,
      "endSec": 92,
      "endMilli": 867,
      "text": "maging ang hangin ay kay lakas",
    },
    {
      "startSec": 93,
      "startMilli": 0,
      "endSec": 94,
      "endMilli": 67,
      "text": "may bagyo",
    },
    {
      "startSec": 95,
      "startMilli": 133,
      "endSec": 98,
      "endMilli": 333,
      "text": "upang hindi siya matangay ng napakalakas na hangin",
    },
    {
      "startSec": 98,
      "startMilli": 767,
      "endSec": 102,
      "endMilli": 400,
      "text": "ay mahigpit na yumakap si Yumi sa punong kahoy",
    },
    {
      "startSec": 103,
      "startMilli": 600,
      "endSec": 105,
      "endMilli": 133,
      "text": "nang bumalik ang mag asawa",
    },
    {
      "startSec": 105,
      "startMilli": 800,
      "endSec": 107,
      "endMilli": 667,
      "text": "hindi nila natagpuan si Yumi",
    },
    {
      "startSec": 108,
      "startMilli": 500,
      "endSec": 111,
      "endMilli": 167,
      "text": "kahit saang dako ay hinanap nila ito",
    },
    {
      "startSec": 113,
      "startMilli": 333,
      "endSec": 117,
      "endMilli": 0,
      "text": "sa may dalampasigan ay may natagpuan silang isang halaman",
    },
    {
      "startSec": 117,
      "startMilli": 700,
      "endSec": 120,
      "endMilli": 700,
      "text": "ang mga dahon nito'y mahahaba at maraming bunga",
    },
    {
      "startSec": 121,
      "startMilli": 767,
      "endSec": 123,
      "endMilli": 900,
      "text": "kumuha ng isa ang matandang lalaki",
    },
    {
      "startSec": 124,
      "startMilli": 700,
      "endSec": 127,
      "endMilli": 300,
      "text": "dagli niyang inalis ang makapal na balat nito",
    },
    {
      "startSec": 128,
      "startMilli": 167,
      "endSec": 131,
      "endMilli": 0,
      "text": "lumabas ang isang bilog at matigas na bao",
    },
    {
      "startSec": 131,
      "startMilli": 967,
      "endSec": 134,
      "endMilli": 267,
      "text": "may tatlong marka ito na animo'y",
    },
    {
      "startSec": 134,
      "startMilli": 767,
      "endSec": 136,
      "endMilli": 467,
      "text": "dalawang mata at isang bibig",
    },
    {
      "startSec": 137,
      "startMilli": 667,
      "endSec": 139,
      "endMilli": 700,
      "text": "ito ang unang puno ng Niyog",
    },
    {
      "startSec": 140,
      "startMilli": 567,
      "endSec": 141,
      "endMilli": 567,
      "text": "tulad ni Yumi",
    },
    {
      "startSec": 142,
      "startMilli": 300,
      "endSec": 143,
      "endMilli": 800,
      "text": "mataas at mayumi",
    },
    {
      "startSec": 144,
      "startMilli": 0,
      "endSec": 145,
      "endMilli": 0,
      "text": "kung kumilos",
    },
  ];

  String assetVideo = 'assets/videos/AlamatngNiyog.mp4';

  @override
  void initState() {
    super.initState();
    BgmPlayer.player.pause();
    initializeVideoPlayer();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _buildPortrait(words);
          } else {
            return _buildLandscape(words);
          }
        },
      ),
    );
  }

  // ----------------- Portrait Layout -----------------
  Widget _buildPortrait(List<String> words) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Animation Page/PaperBG.png'),
              fit: BoxFit.cover,
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
                child:
                    isLandscape
                        ? _buildSubtitleLandscape(words) // ✅ New boxed style
                        : _buildSubtitle(words), // ✅ Original full-width
              ),
            ),
          ],
        ),
        _buildButtonsPortrait(),
        if (_isSettingsOpen) _buildSettingsDialog(),
      ],
    );
  }

  // ----------------- Landscape Layout -----------------
  Widget _buildLandscape(List<String> words) {
    return Stack(
      children: [
        // Video full screen
        Positioned.fill(
          child:
              _controller.value.isInitialized
                  ? CustomVideoPlayer(
                    customVideoPlayerController: _customVideoPlayerController,
                  )
                  : const Center(child: CircularProgressIndicator()),
        ),

        // Subtitles overlay
        Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: _buildSubtitleLandscape(words),
        ),

        // Buttons
      ],
    );
  }

  // ----------------- Karaoke Subtitle -----------------
  Widget _buildSubtitle(List<String> words) {
    return RichText(
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
                      ? const Color(0xFF760AFB)
                      : const Color(0xFFfefefe),
            ),
          );
        }),
      ),
    );
  }

  // ----------------- Karaoke Subtitle for Landscape -----------------
  Widget _buildSubtitleLandscape(List<String> words) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: screenWidth * 0.7, // 70% of screen width
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12),
        ),

        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: List.generate(words.length, (index) {
              return TextSpan(
                text: "${words[index]} ",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14, // slightly smaller
                  fontWeight: FontWeight.w700,
                  color:
                      index <= _currentWordIndex
                          ? Colors.yellowAccent
                          : Colors.white,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  // ----------------- Portrait Buttons -----------------
  Widget _buildButtonsPortrait() {
    return Stack(
      children: [
        Positioned(
          bottom: 105,
          left: 20,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            style: Design.playVideoButtonDesign,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 32,
                  color: const Color(0xFF3f3f3f),
                ),
                const Text(
                  'Play',
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
        Positioned(
          bottom: 20,
          left: 20,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                SlidePageRoute(
                  page: Alamatngniyogquiz(),
                  direction: SlideDirection.right,
                ),
              );
            },
            style: Design.quizButtonDesign,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.quiz, size: 24, color: Color(0xFF3f3f3f)),
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
        Positioned(
          bottom: 100,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: Colors.orange.shade300,
            onPressed: _toggleSettings,
            child: const Icon(Icons.settings),
          ),
        ),
      ],
    );
  }

  // ----------------- Settings Dialog -----------------
  Widget _buildSettingsDialog() {
    return Center(
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    );
  }
}
