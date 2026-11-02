import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';

class CustomWidgets {
  static Widget numerologyCard(String fact, {String title = 'Lucky Number'}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.lemonYellow, AppColors.textWhite],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        color: AppColors.cardCream, 
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          top: 15,
          bottom: 15,
          right: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.strongTeal,
                fontSize: 15,
                fontFamily: "Satoshi",

                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            
            SizedBox(
              height: 220,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  
                  Positioned(
                    bottom: 10,
                    child: Image.asset(
                      "assets/png/gradient_cube.png",
                      height: 105,
                      fit: BoxFit.contain,
                    ),
                  ),
                  
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

            
            const Text(
              "Today's guidance:",
              style: TextStyle(
                fontFamily: "Geist",

                color: AppColors.darkGray,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              fact.isNotEmpty
                  ? fact
                  : "Stay open to unexpected opportunities. Trust your instincts, explore something new, and avoid overthinking your next move.",
              
              style: const TextStyle(
                fontFamily: "Geist",

                color: AppColors.mediumGray,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget dot(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }

  static Widget leftLine([Color? color]) {
    final c = color ?? AppColors.luckyTeal;
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

  static Widget rightLine([Color? color]) {
    final c = color ?? AppColors.luckyTeal;
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

  static Widget dotGroup(Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        dot(2.5, color),
        const SizedBox(width: 3),
        dot(5, color),
        const SizedBox(width: 3),
        dot(2.5, color),
      ],
    );
  }
}
