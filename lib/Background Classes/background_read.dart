import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class BackgroundRead extends StatefulWidget {
  final String assetPath;
  final String stateMachineName;

  BackgroundRead({required this.assetPath, required this.stateMachineName});

  @override
  _RiveAnimationLoaderState createState() => _RiveAnimationLoaderState();
}

class _RiveAnimationLoaderState extends State<BackgroundRead> {
  Artboard? _riveArtboard;
  bool _isLoaded = false;

  // Function to load the Rive animation
  Future<void> loadRiveAnimation() async {
    try {
      final data = await rootBundle.load(widget.assetPath);
      final file = RiveFile.import(data);
      _riveArtboard = file.mainArtboard;

      if (_riveArtboard != null) {
        print('Available State Machines: ${_riveArtboard?.stateMachines}');
        var controller = StateMachineController.fromArtboard(
          _riveArtboard!,
          widget.stateMachineName,
        );
        if (controller != null) {
          _riveArtboard?.addController(controller);
          controller.isActive = true;
        } else {
          print('Error: StateMachineController could not be created.');
        }

        setState(() {
          _isLoaded = true;
        });
      } else {
        print('Error: Artboard not found.');
      }
    } catch (e) {
      print('Error loading Rive animation: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    loadRiveAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          _isLoaded
              ? SizedBox.expand(
                child: Rive(
                  artboard: _riveArtboard!,
                  fit:
                      BoxFit
                          .cover, // This will make the animation fill the screen
                ),
              )
              : CircularProgressIndicator(),
    );
  }
}
