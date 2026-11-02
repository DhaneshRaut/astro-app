
import 'dart:math' as math;
import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';




class CircularWheelPainter extends CustomPainter {
  const CircularWheelPainter();

  @override
  void paint(Canvas canvas, Size size) {
    
    final center = Offset(
      size.width * 0.93,
      size.height * 0.495,
    );

    
    final radius = math.min(
      size.height * 0.53,
      size.width * 1.0,
    );

    
    final radii = [
      radius,
      radius * 0.77,
      radius * 0.62,
      radius * 0.48,
      radius * 0.34,
      radius * 0.19,
    ];

    
    final colors = [
      AppColors.cream,
      AppColors.lemonYellow,
      AppColors.desertBeige,
      AppColors.steelBlue,
      AppColors.softAqua,
      AppColors.paleCyan,
    ];

    
    for (int i = 0; i < radii.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill
        ..isAntiAlias = true;

      canvas.drawCircle(
        center,
        radii[i],
        paint,
      );
    }

    

    
    _drawRingNumbers(
      canvas: canvas,
      center: center,
      ringRadius: (radii[0] + radii[1]) / 2,
      numbers: ['19', '20', '21', '22', '23', '24', '25'],
      fontSize: size.width * 0.065,
      normalColor: AppColors.ringMuted,
      selectedColor: AppColors.ringSelected,
      selectedNumbers: ['22'],
    );

    
    _drawRingNumbers(
      canvas: canvas,
      center: center,
      ringRadius: (radii[1] + radii[2]) / 2,
      numbers: ['6', '7', '8', '9', '10', '11', '12'],
      fontSize: size.width * 0.052,
      normalColor: AppColors.ringGold,
      selectedColor: AppColors.ringSelected,
      selectedNumbers: ['9'],
    );

    
    _drawRingNumbers(
      canvas: canvas,
      center: center,
      ringRadius: (radii[2] + radii[3]) / 2,
      numbers: ['17', '18', '19', '20', '21', '22', '23'],
      fontSize: size.width * 0.048,
      normalColor: AppColors.ringSand,
      selectedColor: AppColors.ringSelected,
      selectedNumbers: ['20'],
    );

    
    _drawRingNumbers(
      canvas: canvas,
      center: center,
      ringRadius: (radii[3] + radii[4]) / 2,
      numbers: ['11', '12', '13', '14', '15', '16', '17'],
      fontSize: size.width * 0.046,
      normalColor: AppColors.ringTeal,
      selectedColor: AppColors.ringDark,
      selectedNumbers: ['14'],
    );

    
    _drawRingNumbers(
      canvas: canvas,
      center: center,
      ringRadius: (radii[4] + radii[5]) / 2,
      numbers: ['5', '6', '7', '8', '9', '10', '11'],
      fontSize: size.width * 0.042,
      normalColor: AppColors.ringBlue,
      selectedColor: AppColors.ringDark,
      selectedNumbers: ['8'],
    );

    
    _drawRingNumbers(
      canvas: canvas,
      center: center,
      ringRadius: radii[5] * 0.72,
      numbers: ['18', '19', '20', '21', '22', '23'],
      fontSize: size.width * 0.032,
      normalColor: AppColors.ringSoftBlue,
      selectedColor: AppColors.ringDark,
      selectedNumbers: ['20'],
    );
  }

  
  
  

  void _drawRingNumbers({
    required Canvas canvas,
    required Offset center,
    required double ringRadius,
    required List<String> numbers,
    required double fontSize,
    required Color normalColor,
    required Color selectedColor,
    required List<String> selectedNumbers,
  }) {
    
    

    final startAngle = -170 * math.pi / 180;
    final endAngle = -90 * math.pi / 180;

    for (int i = 0; i < numbers.length; i++) {
      final progress = numbers.length == 1
          ? 0.5
          : i / (numbers.length - 1);

      final angle =
          startAngle + (endAngle - startAngle) * progress;

      
      final position = Offset(
        center.dx + ringRadius * math.cos(angle),
        center.dy + ringRadius * math.sin(angle),
      );

      final number = numbers[i];

      final isSelected = selectedNumbers.contains(number);

      final textPainter = TextPainter(
        text: TextSpan(
          text: number,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: isSelected
                ? FontWeight.w900
                : FontWeight.w600,
            color: isSelected
                ? selectedColor
                : normalColor,
            height: 1,
          ),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      
      canvas.save();

      canvas.translate(
        position.dx,
        position.dy,
      );

      canvas.rotate(angle + math.pi / 2);

      textPainter.paint(
        canvas,
        Offset(
          -textPainter.width / 2,
          -textPainter.height / 2,
        ),
      );

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(
    covariant CircularWheelPainter oldDelegate,
  ) {
    return false;
  }
}
