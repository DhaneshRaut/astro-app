
import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    
    paint.color = AppColors.lightBlue;
    final backPath = Path()
      ..moveTo(size.width * 0.6, size.height)
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.5,
        size.width,
        size.height * 0.45,
      )
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(backPath, paint);

    
    paint.color = AppColors.softBlue;
    final frontPath = Path()
      ..moveTo(size.width * 0.7, size.height)
      ..quadraticBezierTo(
        size.width * 0.85,
        size.height * 0.65,
        size.width,
        size.height * 0.6,
      )
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(frontPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class InsightsWheelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = AppColors.black12;
    SvgPicture.asset(
      "assets/svg/insight_horoscope.svg",
      width: 240,
      height: 240,
      fit: BoxFit.contain,
      colorFilter: const ColorFilter.mode(AppColors.amber, BlendMode.srcIn),
    );
    canvas.drawCircle(center, size.width / 2, paint);
    canvas.drawCircle(center, size.width / 3, paint);
    canvas.drawCircle(center, size.width / 4, paint);

    canvas.drawLine(
      Offset(center.dx, 0),
      Offset(center.dx, size.height),
      paint,
    );
    canvas.drawLine(Offset(0, center.dy), Offset(size.width, center.dy), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
