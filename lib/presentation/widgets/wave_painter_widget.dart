


import 'dart:math' as math;
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0; // Added strokeWidth for clear visibility



    // ---------- OVERLAPPING SEMICIRCLES (drawn on top) ----------
   paint.color = const Color(0xFFB8D4DC);

    // Define radius and vertical baseline for the semicircles
    final double radius = size.width * 0.25;
    final double centerY = size.height * 1.25 ;

    // 1. First Semicircle (starts near the left edge)
    final double firstCenterX = radius + 10; 
    final firstRect = Rect.fromCircle(
      center: Offset(firstCenterX, centerY),
      radius: radius,
    );

    final firstSemiCircle = Path()
      ..addArc(
        firstRect,
        math.pi, // Start at 180 degrees (left side)
        math.pi, // Sweep 180 degrees clockwise to form a top arch
      );
    canvas.drawPath(firstSemiCircle, paint);

    // 2. Second Semicircle (starts from the midpoint of the first semicircle)
    // Since the first semicircle spans from (firstCenterX - radius) to (firstCenterX + radius),
    // its horizontal midpoint is simply `firstCenterX`.
    final double secondStartX = firstCenterX;
    final double secondCenterX = secondStartX + radius;
    final secondRect = Rect.fromCircle(
      center: Offset(secondCenterX, centerY),
      radius:  radius,
    );


paint.color = const Color.fromARGB(255, 129, 179, 221); // Change color for the second semicircle
    final secondSemiCircle = Path()
      ..addArc(
        secondRect,
        math.pi, // Start at 180 degrees (which aligns with firstCenterX)
        math.pi, // Sweep 180 degrees clockwise
      );
    canvas.drawPath(secondSemiCircle, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
