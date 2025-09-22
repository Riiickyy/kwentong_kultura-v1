import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/QUIZZES/angasoatkanyanganinoQuiz.dart';
import 'package:video_player/video_player.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class AsoAtKanyangAninoCT extends StatefulWidget {
  const AsoAtKanyangAninoCT({super.key});

  @override
  State<AsoAtKanyangAninoCT> createState() => _AsoAtKanyangAninoCTState();
}

class _AsoAtKanyangAninoCTState extends State<AsoAtKanyangAninoCT> {
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
      "startMilli": 0,
      "endSec": 3,
      "endMilli": 433,
      "text": "Ang Aso at ang kanyang Anino",
    },
    {
      "startSec": 5,
      "startMilli": 133,
      "endSec": 9,
      "endMilli": 800,
      "text":
          "may isang asong naglalakad sa kagubatan at nakahanap ng makakain",
    },

    {
      "startSec": 10,
      "startMilli": 600,
      "endSec": 14,
      "endMilli": 0,
      "text": "Pagod na pagod sya habang nililibot ang buong paligid",
    },
    {
      "startSec": 14,
      "startMilli": 733,
      "endSec": 17,
      "endMilli": 800,
      "text": "Sa wakas ay may nakita siyang kapirasong buto",
    },

    {
      "startSec": 18,
      "startMilli": 533,
      "endSec": 21,
      "endMilli": 66,
      "text": "Agad niya itong sinakmal at itinakbo",
    },

    {
      "startSec": 22,
      "startMilli": 633,
      "endSec": 24,
      "endMilli": 933,
      "text": "Aso: Salamat naman at makakain na ako",
    },

    {
      "startSec": 25,
      "startMilli": 566,
      "endSec": 26,
      "endMilli": 933,
      "text": "Wika nya sa sarili",
    },

    {
      "startSec": 27,
      "startMilli": 633,
      "endSec": 30,
      "endMilli": 667,
      "text": "Aso: Iuwi ko na ito at nang makapaghapunan na ako",
    },
    {
      "startSec": 31,
      "startMilli": 567,
      "endSec": 32,
      "endMilli": 533,
      "text": "Dagdag pa niya",
    },
    {
      "startSec": 33,
      "startMilli": 167,
      "endSec": 37,
      "endMilli": 567,
      "text":
          "May kalayuan ang tirahan ng aso kaya't siya'y nagmadaling tumakbo",
    },
    {
      "startSec": 38,
      "startMilli": 300,
      "endSec": 43,
      "endMilli": 333,
      "text":
          "bago siya makarating sa kanyang tahanan ay kailangan niyang dumaan sa isang batis",
    },
    {
      "startSec": 43,
      "startMilli": 600,
      "endSec": 46,
      "endMilli": 367,
      "text": "Na may malinis at malinaw na tubig",
    },
    {
      "startSec": 48,
      "startMilli": 633,
      "endSec": 53,
      "endMilli": 600,
      "text":
          "Habang siya ay patawid na nasilayan niya ang kanyang anino sa tubig",
    },
    {
      "startSec": 54,
      "startMilli": 67,
      "endSec": 57,
      "endMilli": 67,
      "text": "Ngunit di nya alam na ito'y kanyang anino",
    },

    {
      "startSec": 57,
      "startMilli": 533,
      "endSec": 61,
      "endMilli": 367,
      "text": "Ang buong akala niya'y may isa pang may hawak ng buto",
    },

    {
      "startSec": 61,
      "startMilli": 967,
      "endSec": 65,
      "endMilli": 100,
      "text": "Sa Kanyang pagnanasang mapasakanya pa ang buto",
    },
    {
      "startSec": 65,
      "startMilli": 633,
      "endSec": 68,
      "endMilli": 700,
      "text": "Ibinukas niya ang kanyang bibig para kunin ito",
    },
    {
      "startSec": 69,
      "startMilli": 733,
      "endSec": 74,
      "endMilli": 700,
      "text": "Nahulog ang butong hawak niya at ito'y pumasailalim sa tubig",
    },
    {
      "startSec": 75,
      "startMilli": 467,
      "endSec": 78,
      "endMilli": 200,
      "text": "Ang aso'y lungkot na lungkot umuwi",
    },
    {
      "startSec": 78,
      "startMilli": 333,
      "endSec": 82,
      "endMilli": 400,
      "text": "Dahil ang kanyang pinakaiingat ingatan na buto ay nawala din",
    },
  ];

  String assetVideo = 'assets/videos/AngAsoatangKanyangAnino.mp4';

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
    BgmPlayer.player.pause();
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
                  page: AngAsoatkanyangAninoQuiz(),
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
