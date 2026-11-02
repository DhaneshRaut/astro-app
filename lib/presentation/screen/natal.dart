
import 'dart:math' as math;
import 'package:flutter/material.dart';



class CircularWheelScreen extends StatelessWidget {
  const CircularWheelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent  ,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff144750) ,Color(0xff081C20)] ,
          begin: Alignment.topLeft ,
          end: Alignment.center
        ),




        ),
        child:
         Stack(
          children: [
            // BACKGROUND CIRCULAR WHEEL
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: CustomPaint(
                  painter: const CircularWheelPainter(),
                ),
              ),
            ),
        
            // TOP PROFILE INFORMATION
            const Positioned(
              left: 10,
              top: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Evening,",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Saniya",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  Text(
                    "Air • Mutable • Mercury",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
        
            // DRAGGABLE BOTTOM SHEET
            DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              maxChildSize: 0.95,
              snap: true,
              snapSizes: const [0.5, 0.95],
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFCF3),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
        
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    children: [
                      // DRAG HANDLE
                      Center(
                        child: Container(
                          height: 5,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
        
                      const SizedBox(height: 24),
        
                      const Text(
                        "Your Destiny Path",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF263D45),
                        ),
                      ),
        
                      const SizedBox(height: 10),
        
                      const Text(
                        "Discover your personality, strengths "
                        "and the direction of your life.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
        
                      const SizedBox(height: 24),
        
                      // SAMPLE CONTENT
                      _buildInfoCard(
                        "Life Path Number",
                        "Your journey is guided by creativity "
                        "and self-discovery.",
                      ),
        
                      _buildInfoCard(
                        "Personality",
                        "You have a natural ability to understand "
                        "people and situations.",
                      ),
        
                      _buildInfoCard(
                        "Career & Growth",
                        "Your strengths can help you achieve "
                        "your professional goals.",
                      ),
        
                      _buildInfoCard(
                        "Relationships",
                        "Build meaningful connections through "
                        "communication and understanding.",
                      ),
        
                      _buildInfoCard(
                        "Your Strengths",
                        "Confidence, creativity and determination.",
                      ),
        
                      const SizedBox(height: 40),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
     
     
     
      ),
    );
  }

  static Widget _buildInfoCard(String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFEAE5D8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF27828E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}





class CircularWheelPainter extends CustomPainter {
  const CircularWheelPainter();

  @override
  void paint(Canvas canvas, Size size) {
    // Center of the wheel
    final center = Offset(
      size.width * 0.93,
      size.height * 0.495,
    );

    // Responsive outer radius
    final radius = math.min(
      size.height * 0.53,
      size.width * 1.0,
    );

    // Circle radius levels
    final radii = [
      radius,
      radius * 0.77,
      radius * 0.62,
      radius * 0.48,
      radius * 0.34,
      radius * 0.19,
    ];

    // Circle colors
    final colors = [
      const Color(0xFFFEFBEC),
      const Color(0xFFFEF2C2),
      const Color(0xFFDFD4AA),
      const Color(0xFF659BA5),
      const Color(0xFF84BAC4),
      const Color(0xFFA9D1D9),
    ];

    // Draw concentric circles
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

    // Draw numbers on each circular ring

    // Outer ring
    _drawRingNumbers(
      canvas: canvas,
      center: center,
      ringRadius: (radii[0] + radii[1]) / 2,
      numbers: ['19', '20', '21', '22', '23', '24', '25'],
      fontSize: size.width * 0.065,
      normalColor: const Color(0xFFD9D7C8),
      selectedColor: const Color(0xFF171711),
      selectedNumbers: ['22'],
    );

    // Second ring
    _drawRingNumbers(
      canvas: canvas,
      center: center,
      ringRadius: (radii[1] + radii[2]) / 2,
      numbers: ['6', '7', '8', '9', '10', '11', '12'],
      fontSize: size.width * 0.052,
      normalColor: const Color(0xFFC5B98E),
      selectedColor: const Color(0xFF171711),
      selectedNumbers: ['9'],
    );

    // Third ring
    _drawRingNumbers(
      canvas: canvas,
      center: center,
      ringRadius: (radii[2] + radii[3]) / 2,
      numbers: ['17', '18', '19', '20', '21', '22', '23'],
      fontSize: size.width * 0.048,
      normalColor: const Color(0xFFB4A980),
      selectedColor: const Color(0xFF171711),
      selectedNumbers: ['20'],
    );

    // Fourth ring
    _drawRingNumbers(
      canvas: canvas,
      center: center,
      ringRadius: (radii[3] + radii[4]) / 2,
      numbers: ['11', '12', '13', '14', '15', '16', '17'],
      fontSize: size.width * 0.046,
      normalColor: const Color(0xFF467F89),
      selectedColor: const Color(0xFF101C1C),
      selectedNumbers: ['14'],
    );

    // Fifth ring
    _drawRingNumbers(
      canvas: canvas,
      center: center,
      ringRadius: (radii[4] + radii[5]) / 2,
      numbers: ['5', '6', '7', '8', '9', '10', '11'],
      fontSize: size.width * 0.042,
      normalColor: const Color(0xFF699BA2),
      selectedColor: const Color(0xFF101C1C),
      selectedNumbers: ['8'],
    );

    // Inner ring
    _drawRingNumbers(
      canvas: canvas,
      center: center,
      ringRadius: radii[5] * 0.72,
      numbers: ['18', '19', '20', '21', '22', '23'],
      fontSize: size.width * 0.032,
      normalColor: const Color(0xFF789DA0),
      selectedColor: const Color(0xFF101C1C),
      selectedNumbers: ['20'],
    );
  }

  // ====================================================
  // DRAW ROTATED NUMBERS AROUND THE CIRCLE
  // ====================================================

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
    // Numbers are distributed around the upper-left arc
    // of the circular wheel.

    final startAngle = -170 * math.pi / 180;
    final endAngle = -90 * math.pi / 180;

    for (int i = 0; i < numbers.length; i++) {
      final progress = numbers.length == 1
          ? 0.5
          : i / (numbers.length - 1);

      final angle =
          startAngle + (endAngle - startAngle) * progress;

      // Position on circle
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

      // Rotate numbers along the circular direction
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
