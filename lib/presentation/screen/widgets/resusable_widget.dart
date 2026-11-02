import 'package:flutter/material.dart';

class LuckNumberCard{
static  Widget buildNumerologyCard(String fact, {String title = 'Lucky Number'}) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 16),
      // padding: const EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffFEF2C2), Color(0xFFFFFFFF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        color: const Color(0xFFFCF8DC), // Light yellow background
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left:15.0 ,top: 15 ,bottom: 15 ,right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF135B6B),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 20),
        
            // 2. Images (Sphere and Cube)
            SizedBox(
              height: 220,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Cube Image (pedestal at the bottom)
                  Positioned(
                    bottom: 10,
                    child: Image.asset(
                      "assets/png/gradient_cube.png",
                      height: 105,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Sphere Image overlapping on top
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/png/lucky_number.png",
                      height: 145,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
        
            // 3. Text Section
            const Text(
              "Today's guidance:",
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              fact.isNotEmpty ? fact : "Stay open to unexpected opportunities. Trust your instincts, explore something new, and avoid overthinking your next move.",
              // fact,
              style: const TextStyle(
                color: Color(0xFF4A4A4A),
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static   Widget dot(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }

  static   Widget leftLineWidget([Color? color]) {
    final c = color ?? const Color(0xFF27828E);
    return Container(
      height: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [c.withOpacity(0), c],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }

   static Widget RightLineWidget([Color? color]) {
    final c = color ?? const Color(0xFF27828E);
    return Container(
      height: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [c, c.withOpacity(0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }


}