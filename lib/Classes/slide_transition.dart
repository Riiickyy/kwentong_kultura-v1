import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;
  final SlideDirection direction;

  SlidePageRoute({required this.page, required this.direction})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const curve = Curves.easeInOut;

          // Define the start and end positions based on the direction
          late Offset begin;
          late Offset end;

          switch (direction) {
            case SlideDirection.left:
              begin = const Offset(-1.0, 0.0);
              end = Offset.zero;
              break;
            case SlideDirection.right:
              begin = const Offset(1.0, 0.0);
              end = Offset.zero;
              break;
            case SlideDirection.up:
              begin = const Offset(0.0, 1.0);
              end = Offset.zero;
              break;
            case SlideDirection.down:
              begin = const Offset(0.0, -1.0);
              end = Offset.zero;
              break;
          }

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          // Use SlideTransition to apply the animation
          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
}

enum SlideDirection { left, right, up, down }
