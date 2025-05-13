import 'package:flutter/material.dart';
import 'UI-stack-widget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MaterialApp(title: 'Kwentong Kultura', home: KwentongKultura()));
}

class KwentongKultura extends StatefulWidget {
  const KwentongKultura({super.key});

  @override
  State<KwentongKultura> createState() => _KwentongKulturaState();
}

class _KwentongKulturaState extends State<KwentongKultura> {
  late AudioPlayer _audioPlayer;
  @override
  void initState() {
    super.initState();
    initialization();
    _audioPlayer = AudioPlayer();
    _playBackgroundMusic();
  }

  void initialization() async {
    await Future.delayed(Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  Future<void> _playBackgroundMusic() async {
    try {
      await _audioPlayer.setAsset(
        'assets/background.mp3',
      ); // Ensure you have the file
      await _audioPlayer.setLoopMode(LoopMode.one); // Loop the music
      await _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(backgroundColor: Color(0xFFC5F1FF), body: HomeUIWidget()),
    );
  }
}
