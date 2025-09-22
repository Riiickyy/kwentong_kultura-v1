import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/ColorPage/Character/Pinya/pinya.dart';

class Pinyacolorclass extends CustomPainter {
  List<DrawingArea?> points;
  Color color;
  double strokeWidth;
  ui.Image? backgroundImage;

  Pinyacolorclass({
    required this.points,
    required this.color,
    required this.strokeWidth,
    required this.backgroundImage,
  });
  @override
  void paint(Canvas canvas, Size size) {
    if (backgroundImage == null) return;

    double imageAspectRatio = backgroundImage!.width / backgroundImage!.height;
    double canvasAspectRatio = size.width / size.height;

    double scaleX = size.width;
    double scaleY = size.height;

    if (imageAspectRatio > canvasAspectRatio) {
      scaleY = size.width / imageAspectRatio;
    } else {
      scaleX = size.height * imageAspectRatio;
    }

    Rect src = Rect.fromLTWH(
      0,
      0,
      backgroundImage!.width.toDouble(),
      backgroundImage!.height.toDouble(),
    );
    Rect dst = Rect.fromLTWH(0, 0, scaleX, scaleY);

    canvas.drawImageRect(backgroundImage!, src, dst, Paint());

    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != null && points[x + 1] != null) {
        Paint paint = points[x]!.areaPaint;
        canvas.drawLine(points[x]!.point, points[x + 1]!.point, paint);
      } else if (points[x] != null && points[x + 1] == null) {
        Paint paint = points[x]!.areaPaint;
        canvas.drawPoints(PointMode.points, [points[x]!.point], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
