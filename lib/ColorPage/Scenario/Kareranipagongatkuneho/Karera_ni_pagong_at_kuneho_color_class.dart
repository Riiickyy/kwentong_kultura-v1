import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kwentong_kultura/ColorPage/Scenario/Kareranipagongatkuneho/Karera_ni_pagong_at_kuneho.dart';

class KareraNiPagongAtKunehoColorClass extends CustomPainter {
  List<DrawingArea?> points;
  Color color;
  double strokeWidth;
  ui.Image? backgroundImage;

  KareraNiPagongAtKunehoColorClass({
    required this.points,
    required this.color,
    required this.strokeWidth,
    required this.backgroundImage,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Rect src = Rect.fromLTWH(
      0,
      0,
      backgroundImage!.width.toDouble(),
      backgroundImage!.height.toDouble(),
    );
    Rect dst = Rect.fromLTWH(0, 0, size.width, size.height);

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
