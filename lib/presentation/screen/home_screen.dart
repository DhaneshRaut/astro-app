import 'dart:math' as math;

import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:astrologer_app/presentation/astro_cubit/astro_cubit.dart';
import 'package:astrologer_app/presentation/astro_cubit/state_cubit.dart';
import 'package:astrologer_app/presentation/screen/insights_screen.dart';
import 'package:astrologer_app/presentation/screen/natal.dart';
import 'package:astrologer_app/presentation/screen/widgets/resusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AstroCubit, AstroState>(
      builder: (context, state) {
        if (state is! AstroLoaded) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.accentTeal),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.transparent,
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.deepTeal, AppColors.darkestTeal],
                begin: Alignment.topLeft,
                end: Alignment.center,
              ),
            ),
            child: Stack(
              children: [
                // BACKGROUND CIRCULAR WHEEL
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: CustomPaint(painter: const CircularWheelPainter()),
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
                        style: TextStyle(color: AppColors.textWhite, fontSize: 12),
                      ),
                      Text(
                        "Saniya",
                        style: TextStyle(color: AppColors.textWhite, fontSize: 26),
                      ),
                      Text(
                        "Air • Mutable • Mercury",
                        style: TextStyle(color: AppColors.textWhite, fontSize: 10),
                      ),
                    ],
                  ),
                ),

                // === FIXED BACKGROUND SYMBOLS ===
                Positioned(
                  right: 240,
                  top: 170,
                  child: SvgPicture.asset(
                    "assets/svg/symbol_two.svg", // assets/svg/symbol_three.svg
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      AppColors.textWhite.withOpacity(0.15),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Positioned(
                  left: 45,
                  top: 220,
                  child: SvgPicture.asset(
                    "assets/svg/symbol_three.svg", //done
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      AppColors.textWhite.withOpacity(0.15),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 140,
                  child: SvgPicture.asset(
                    "assets/svg/symbol_one.svg",
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      AppColors.textWhite.withOpacity(0.15), //done
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Positioned(
                  left: 120,
                  top: 50,
                  child: SvgPicture.asset(
                    ''
                    "assets/svg/symbol_five.svg",
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      AppColors.textWhite.withOpacity(0.15),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Positioned(
                  left: 180,
                  top: 45,
                  child: SvgPicture.asset(
                    "assets/svg/symbol_six.svg",
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      AppColors.textWhite.withOpacity(0.15),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                // ================================

                // PROFILE ICON (Fixed to be circular like the design)
                Positioned(
                  right: 70,
                  top: 55,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0XFF20707E)),
                      color: AppColors.textWhite,
                      shape: BoxShape.circle, // Makes it round
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/profile.svg",
                        width: 20,
                        height: 20,
                         fit: BoxFit.cover,
                                               color: AppColors.deepTeal,
                      ),

                      //  Icon(
                      //   Icons.person,
                      //   size: 20,
                      //   color: AppColors.deepTeal,
                      // ),
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 55,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0XFF20707E)),
                      color: AppColors.textWhite,
                      shape: BoxShape.circle, // Makes it round
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/notification.svg",
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                                               color: AppColors.deepTeal,

                      ),
                    ),
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
                        color: AppColors.textWhite,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(28),
                        ),
                      ),

                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        children: [
                          // DRAG HANDLE
                          _buildSectionHeader("GOAL'S"),
                          SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.paleBlue,
                                    AppColors.lemonYellow,
                                    // AppColors.lemonYellow,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),

                                borderRadius: BorderRadius.circular(24),
                              ),
                              height: 210,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/goals.svg',
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'No Goals Yet',
                                          style: TextStyle(
                                            color: AppColors.background,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        const Text(
                                          'Let your intentions guide\nyour journey.',
                                          style: TextStyle(
                                            color: AppColors.mutedGray,
                                            fontSize: 14,
                                            height: 1.4,
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: double.infinity,
                                          child: OutlinedButton(
                                            onPressed: () {},
                                            style: OutlinedButton.styleFrom(
                                              side: const BorderSide(
                                                color: AppColors.textWhite,
                                                width: 1,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              // padding: const EdgeInsets.symmetric(vertical: 14),
                                            ),
                                            child: const Text(
                                              '+ Create Your Goal',
                                              style: TextStyle(
                                                color: AppColors.textWhite,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          _buildSectionHeader("TODAY'S HOROSCOPE"),
                          SizedBox(height: 8),

                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: SvgPicture.asset(
                                  'assets/svg/rectangle_gradient_layout.svg',
                                  width: double.infinity,
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),

                                    Text(
                                      "Gemini",
                                      style: const TextStyle(
                                        color: AppColors.textWhite,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      state.dateStr,
                                      style: const TextStyle(
                                        color: AppColors.textMuted,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    const Text(
                                      'Your natural curiosity is your strength today. Stay open to new ideas, but give yourself time to focus before making decisions.',
                                      style: TextStyle(
                                        color: AppColors.textMuted,
                                        fontSize: 14,
                                        height: 1.4,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Read more >',
                                            style: TextStyle(
                                              color: AppColors.accentTeal,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: -12,
                                right: 20,
                                child: SvgPicture.asset(
                                  'assets/svg/sign.svg',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),

                          LuckNumberCard.buildNumerologyCard(
                            "Stay open to unexpected opportunities. Trust your instincts, explore something new, and avoid overthinking your next move.",
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: _buildSectionHeader("YOUR JOURNAL"),
                          ),

                          SizedBox(height: 10),
                          Center(
                            child: SvgPicture.asset(
                              'assets/svg/book.svg',
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 2,
                              alignment: Alignment.center,
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Common Header Helper Element
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 0.0),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textMuted,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.4,
        ),
      ),
    );
  }

  // Uniform Layout Wrapper Frame
}

// Concentric Dial Painting Processor Engine
class AstrologicalWheelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final arcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final List<Map<String, dynamic>> configurations = [
      {
        'radius': 175.0,
        'width': 32.0,
        'color': AppColors.ringYrs,
        'start': 0.8,
        'sweep': 0.5,
      },
      {
        'radius': 142.0,
        'width': 28.0,
        'color': AppColors.ringMmDays,
        'start': 0.9,
        'sweep': 0.7,
      },
      {
        'radius': 110.0,
        'width': 26.0,
        'color': AppColors.ringMmDays,
        'start': 0.7,
        'sweep': 0.6,
      },
      {
        'radius': 78.0,
        'width': 22.0,
        'color':AppColors.softAqua,
        'start': 0.6,
        'sweep': 0.8,
      },
      {
        'radius': 46.0,
        'width': 18.0,
        'color':AppColors.lightAqua,
        'start': 0.5,
        'sweep': 0.9,
      },
    ];
    for (var config in configurations) {
      arcPaint.color = config['color'] as Color;
      arcPaint.strokeWidth = config['width'] as double;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: config['radius'] as double),
        math.pi * (config['start'] as double),
        math.pi * (config['sweep'] as double),
        false,
        arcPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
