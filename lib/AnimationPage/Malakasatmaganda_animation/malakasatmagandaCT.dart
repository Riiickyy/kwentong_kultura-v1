import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
import 'package:kwentong_kultura/QUIZZES/malakasatmagandaQuiz.dart';
import 'package:video_player/video_player.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class MalakasatmagandaCT extends StatefulWidget {
  const MalakasatmagandaCT({super.key});

  @override
  State<MalakasatmagandaCT> createState() => _MalakasatmagandaCTState();
}

class _MalakasatmagandaCTState extends State<MalakasatmagandaCT> {
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
      "startMilli": 900,
      "endSec": 2,
      "endMilli": 460,
      "text": "Malakas at Maganda",
    },
    {
      "startSec": 5,
      "startMilli": 300,
      "endSec": 9,
      "endMilli": 300,
      "text": "Isang ibong kulay abuhin ang naghahanap ng makakain",
    },
    {
      "startSec": 11,
      "startMilli": 667,
      "endSec": 16,
      "endMilli": 100,
      "text":
          "Nahila niya ang isang uod na nakasiksik sa isang puno ng kawayan",
    },
    {
      "startSec": 18,
      "startMilli": 167,
      "endSec": 23,
      "endMilli": 367,
      "text":
          "tinuka niya ng tinuka ang bahaging ito upang makuha at makain ang uod",
    },
    {
      "startSec": 24,
      "startMilli": 733,
      "endSec": 28,
      "endMilli": 333,
      "text": "hindi niya tinigilan ang pagtuka hanggang sa mabiyak ito",
    },

    {
      "startSec": 31,
      "startMilli": 500,
      "endSec": 37,
      "endMilli": 767,
      "text":
          "nakatakas ang uod ngunit lumabas ang dalawang nilikha na tinawag na Malakas at Maganda",
    },
    {
      "startSec": 39,
      "startMilli": 567,
      "endSec": 42,
      "endMilli": 333,
      "text": "Si Malakas ay matipuno at gwapong lalaki",
    },
    {
      "startSec": 44,
      "startMilli": 133,
      "endSec": 48,
      "endMilli": 733,
      "text": "Si Maganda ay mahinhin, balingkinitan ang katawan at masipag",
    },
    {
      "startSec": 50,
      "startMilli": 500,
      "endSec": 53,
      "endMilli": 100,
      "text": "sila ang kauna-unahang babae at lalaki",
    },
    {
      "startSec": 53,
      "startMilli": 600,
      "endSec": 55,
      "endMilli": 333,
      "text": "sa lahi ng mga tagalog",
    },
  ];

  String assetVideo = 'assets/videos/MalakasatMaganda.mp4';

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
                  page: MalakasatmagandaQuiz(),
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
