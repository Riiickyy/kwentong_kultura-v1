import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/QUIZZES/kunehoatpagongQuiz.dart';
import 'package:video_player/video_player.dart';
import 'package:kwentong_kultura/QUIZZES/pagongatmatsingQuiz.dart';
import 'package:kwentong_kultura/Styles/styles.dart';

class KunehotPagongCT extends StatefulWidget {
  const KunehotPagongCT({super.key});

  @override
  State<KunehotPagongCT> createState() => _KunehotPagongCTState();
}

class _KunehotPagongCTState extends State<KunehotPagongCT> {
  late CustomVideoPlayerController _customVideoPlayerController;
  late VideoPlayerController _controller;
  double _playbackSpeed = 1.0;
  double _fontSize = 16;
  bool _isSettingsOpen = false;
  String _currentSubtitle = "";
  int _currentWordIndex = -1;
  Duration fractionalSecondsToDuration(double seconds) {
    return Duration(milliseconds: (seconds * 1000).toInt());
  }

  final List<Map<String, dynamic>> subtitles = [
    {"time": 0, "text": "Ang Kuneho at ang pagong"},
    {"time": 4, "text": "Isang araw"},
    {"time": 6, "text": "Ang Kuneho at ang pagong"},
    {"time": 8, "text": "Ay nagpapahinga sa ilalim ng malaking punong manggaw"},
    {"time": 12, "text": "Pagong: Kaibigang Kuneho"},
    {"time": 14, "text": "Wika ng pagong"},
    {"time": 16, "text": "Pagong: Wala ba tayong gagawin"},
    {"time": 19, "text": "Pagong: kundi panoorin"},
    {"time": 21, "text": "Pagong: ang mga dahon ng manggang ito"},
    {"time": 24, "text": "Kuneho: Bakit?"},
    {"time": 26, "text": "Kuneho: Ano ba ang gusto mong gawin"},
    {"time": 29, "text": "Tanong ng Kuneho"},
    {"time": 30, "text": "Pagong: Halika"},
    {"time": 30, "text": "Pagong: Magkarera tayo"},
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
    final currentTime = _controller.value.position.inSeconds;
    String fullSubtitle = "";
    int subtitleTime = 0;

    for (var subtitle in subtitles) {
      if (currentTime >= subtitle["time"]) {
        fullSubtitle = subtitle["text"];
        subtitleTime = subtitle["time"];
      }
    }

    if (fullSubtitle != _currentSubtitle) {
      setState(() {
        _currentSubtitle = fullSubtitle;
        _currentWordIndex = 0;
      });
    }

    int elapsedTime = currentTime - subtitleTime;
    List<String> words = _currentSubtitle.split(" ");
    int wordsToHighlight = (elapsedTime * words.length ~/ 2).clamp(
      0,
      words.length - 1,
    );

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
                          : const Center(
                            child: CircularProgressIndicator(),
                          ), // Show loading spinner
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
                        duration: const Duration(milliseconds: 500),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: List.generate(words.length, (index) {
                              return TextSpan(
                                text: "${words[index]} ",
                                style: TextStyle(
                                  fontSize: _fontSize,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      index <= _currentWordIndex
                                          ? Colors.blue
                                          : Colors.black, // Highlight effect
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

          Positioned(
            bottom: 30, // Adjust to your liking
            left: 50, // Adjust for centering if needed
            right: 50, // Center the button horizontally
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
              style: Design.buttonDesign,
              child: Text(
                'Tap to Continue', // Button text
                style: Design.action,
              ),
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
