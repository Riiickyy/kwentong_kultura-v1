import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwentong_kultura/Classes/SFXplayerclass.dart';
import 'package:kwentong_kultura/Classes/slide_transition.dart';
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

  double _playbackSpeed = 1.0; // for controlling narration speed
  double _fontSize = 24;
  bool _isSettingsOpen = false;
  String _currentSubtitle = "";
  int _currentWordIndex = -1;

  // Subtitle timing list (syncs with narration)
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
  // Video asset that includes both video and voice narration
  String assetVideo = 'assets/videos/AlamatngMaya.mp4';

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer(); // sets up video & narration
    BgmPlayer.player.pause(); // pauses background music so narration is clear
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void initializeVideoPlayer() {
    // The VideoPlayerController automatically plays both
    // the video *and its built-in audio track (voice narration)*
    // because MP4 includes sound by default.
    _controller = VideoPlayerController.asset(assetVideo)
      ..initialize().then((value) {
        setState(() {});
      });

    // The custom player to control the video
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

  // This checks the current playback time and
  // finds which subtitle matches that timestamp.
  // It makes the text appear in sync with the narration voice.

  void _updateSubtitle() {
    final currentTime = _controller.value.position.inMilliseconds;

    String fullSubtitle = "";
    int subtitleStartTime = 0;
    int subtitleEndTime = 0;

    for (var subtitle in subtitles) {
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
    // When narration moves to a new line, update text
    if (fullSubtitle != _currentSubtitle) {
      setState(() {
        _currentSubtitle = fullSubtitle;
        _currentWordIndex = 0;
      });
    }
    // highlight each word in sync with narration speed
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    BgmPlayer.player.play(); // resumes background music when they exit
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
        // Generate a TextSpan (styled text) for each word
        children: List.generate(words.length, (index) {
          return TextSpan(
            // Add a space after each word
            text: "${words[index]} ",
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: _fontSize,
              fontWeight: FontWeight.w900,

              // 🟣 If the word index is less than or equal to
              // _currentWordIndex, it means the narration already
              // reached or passed that word → highlight it.
              // Otherwise, keep it white (not yet spoken).
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
                  page: AlamatngmayaQuiz(),
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
