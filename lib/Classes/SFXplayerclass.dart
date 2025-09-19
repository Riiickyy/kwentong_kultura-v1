import 'package:just_audio/just_audio.dart';

class BgmPlayer {
  static final AudioPlayer player = AudioPlayer();
  static bool _isPlaying = false;

  static Future<void> init() async {
    if (_isPlaying) return; // Prevent restarting if already playing

    try {
      await player.setAsset('assets/SFX/bg-sfx.mp3');
      await player.setLoopMode(LoopMode.one);
      await player.play();
      _isPlaying = true;
    } catch (e) {
      print("Error playing BGM: $e");
    }
  }

  static Future<void> pause() async {
    if (_isPlaying) {
      await player.pause();
    }
  }

  static Future<void> resume() async {
    if (_isPlaying) {
      await player.play();
    }
  }

  static Future<void> stop() async {
    await player.stop();
    _isPlaying = false;
  }
}
