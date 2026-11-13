import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:astrologer_app/presentation/insights_cubit/insights_state.dart';
import 'package:astrologer_app/presentation/widgets/common/luck_number_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InsightWidget {
  static Widget buildNatalChartSection(
    InsightsLoaded state,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lemonYellow.withOpacity(0.1),

        gradient: LinearGradient(
          colors: [AppColors.paleBlueTint, AppColors.lemonYellow],
          begin: AlignmentGeometry.topRight,
          end: AlignmentGeometry.centerEnd,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Insights',
              style: TextStyle(
                color: AppColors.ink,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          buildTimelineTabs(),
          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lemonYellow.withOpacity(0.1),
                    border: Border.all(
                      color: AppColors.shadowTeal.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.lemonYellow.withOpacity(0.1),
                            AppColors.lightAquaTint.withOpacity(0.4),
                          ],
                        ),
                        border: Border.all(
                          color: AppColors.lightAquaTint.withOpacity(0.4),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: ClipOval(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "assets/png/horoscope.png",
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        const Color(
                                          0xFFFEF2C2,
                                        ).withOpacity(0.1),
                                        const Color(
                                          0xFFBEDDE2,
                                        ).withOpacity(0.4),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    "assets/svg/leo.svg",
                                    height: 125,
                                    width: 75,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -18,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Gilli Gaurav Singh',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.ink,
                        ),
                      ),
                      const Text(
                        'You • Sept 22, 2001',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.mutedGray,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.06,
                  left: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/zodiaccancer.svg",
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 10),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Cancer',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.ink,
                            ),
                          ),
                          Text(
                            'Sun Sign',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.mutedGray,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.06,
                  right: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Leo',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.ink,
                            ),
                          ),
                          Text(
                            'Moon Sign',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.mutedGray,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      SvgPicture.asset(
                        "assets/svg/zodiacleo.svg",
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.38,
                  left: 15,
                  child: SvgPicture.asset(
                    "assets/svg/crab.svg",
                    height: 35,
                    width: 35,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.width * 0.16,
                  left: 40,
                  child: SvgPicture.asset(
                    "assets/svg/girl.svg",
                    height: 45,
                    width: 45,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: MediaQuery.of(context).size.width * 0.37,
                  child: SvgPicture.asset(
                    "assets/svg/lion.svg",
                    height: 60,
                    width: 60,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.width * 0.16,
                  right: 40,
                  child: SvgPicture.asset(
                    "assets/svg/reindeer.svg",
                    height: 45,
                    width: 45,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.38,
                  right: 15,
                  child: SvgPicture.asset(
                    "assets/svg/bull.svg",
                    height: 35,
                    width: 35,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildTimelineTabs({String selectedTab = 'TODAY'}) {
    final tabs = ['YESTERDAY', 'TODAY', 'TOMORROW', 'WEEK', 'MONTH'];

    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: tabs.length,

        itemBuilder: (context, index) {
          final currentTab = tabs[index];
          final isSelected = currentTab == selectedTab;

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentTab,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,

                  color: isSelected
                      ? AppColors.deepTeal
                      : AppColors.mutedBlueGray,
                ),
              ),
              const SizedBox(height: 6),

              Opacity(
                opacity: isSelected ? 1.0 : 0.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 14,
                      height: 1.5,
                      color: AppColors.deepTeal,
                    ),
                    const SizedBox(width: 4),
                    CustomWidgets.dot(4, AppColors.deepTeal),
                    const SizedBox(width: 4),
                    Container(
                      width: 14,
                      height: 1.5,
                      color: AppColors.deepTeal,
                    ),
                  ],
                ),
              ),
            ],
          );
        },

        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomWidgets.dot(1.5, AppColors.paleBlueGray),
                const SizedBox(width: 3),
                CustomWidgets.dot(3.5, AppColors.mutedBlueGray),
                const SizedBox(width: 3),
                CustomWidgets.dot(1.5, AppColors.paleBlueGray),
              ],
            ),
          );
        },
      ),
    );
  }

  static Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 32.0, bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.black38,
          fontSize: 12,
          fontFamily: "Geist",

          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  static Widget buildFocusCardNew(String target, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      height: 55, // Height matches the UI screenshot
      decoration: BoxDecoration(
        // Soft gradient from left (white) to right (pale blue) as seen in the image
        gradient: const LinearGradient(
          colors: [Color(0xFFF4FBFD), Color(0xFFE2F3F7)],
          begin: Alignment.topRight,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.paleBlueBorder, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          11,
        ), // Fits inside the 12px outer border
        child: Stack(
          children: [
            // 1. Background SVG (Waves / Layout extending from the left)
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: SvgPicture.asset(
                          "assets/svg/astrology_below_layout.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          "assets/svg/astrology_above_layout.svg",
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0, // Positioned lower
              right: 45,
              child: Container(
                width: 44,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.mediumTeal,
                  border: Border.all(color: Color(0xff1B6D7B), width: 1.5),

                  borderRadius: BorderRadius.all(Radius.elliptical(22, 10)),
                ),
              ),
            ),

            Positioned(
              bottom: 15,
              right: 50,
              child: Container(
                width: 32,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.textWhite,
                  border: Border.all(color: AppColors.mediumTeal, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.elliptical(16, 8)),
                ),
              ),
            ),

            // 4. Second Overlapping Ring (Lower)
            Positioned(
              bottom: 30, // Positioned lower
              right: 55, // Slightly adjusted for the smaller size
              child: Container(
                width: 20,
                height: 12,
                decoration: BoxDecoration(
                  color: AppColors.lightTeal.withOpacity(0.8),
                  border: Border.all(color: Color(0xff8AC9D3), width: 1.5),

                  borderRadius: BorderRadius.all(Radius.elliptical(10, 6)),
                ),
              ),
            ),

            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: 'Focus of the day: ',
                      style: const TextStyle(
                        color: AppColors.grayBlue, // e.g. Color(0xFF7A8B93)
                        fontSize: 12,
                        fontFamily: "Geist",
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: target,
                          style: const TextStyle(
                            fontFamily: "Geist",
                            fontSize: 12,

                            color: Color(0xFF0F4D5C), // Dark teal
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildHoroscopeNarrativeCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,

      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.lemonYellow, width: 1),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -30,
            right: -20,
            child: SvgPicture.asset("assets/svg/horoscope.svg", height: 170),
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Your today\'s horoscope',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Satoshi",

                    fontWeight: FontWeight.w700,
                    color: AppColors.nearBlack,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Give yourself time to heal and focus on your well-being today. Adopt healthy habits and choose nourishing foods. Stay patient—positive career opportunities are on the way, while love brings warmth and connection.',
                  style: TextStyle(
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w500,

                    color: Color(0xFF4C4C4C),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildMetricCard(
    String title,
    String value,
    Color themeColor,
    String subtitle,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),

      child: Column(
        children: [
          SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.nearBlack,
            ),
          ),
          Image.asset(
            value,
            colorBlendMode: BlendMode.srcIn,
            height: 100,
            width: 100,
          ),
          Row(
            children: [
              Expanded(child: CustomWidgets.leftLine(themeColor)),
              const SizedBox(width: 4),
              CustomWidgets.dotGroup(themeColor),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  subtitle,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: themeColor,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              CustomWidgets.dotGroup(themeColor),
              const SizedBox(width: 4),
              Expanded(child: CustomWidgets.rightLine(themeColor)),
            ],
          ),
        ],
      ),
    );
  }

  static Widget buildFunFactsBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/svg/fun_facts.svg",
              fit: BoxFit.fill,
            ),
          ),

          Positioned(
            bottom: 5,
            right: 20,
            child: SvgPicture.asset(
              "assets/svg/fun_fact_cloud.svg",
              height: 40,
              color: AppColors.textWhite.withOpacity(0.12),
            ),
          ),

          Positioned(
            top: 5,
            right: 100,
            child: SvgPicture.asset(
              "assets/svg/fun_fact_cloud.svg",
              height: 40,
              color: AppColors.textWhite.withOpacity(0.12),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 80,
            child: SvgPicture.asset(
              "assets/svg/fun_fact_cloud.svg",
              height: 40,
              color: AppColors.textWhite.withOpacity(0.12),
            ),
          ),
//top cloud right 
          Positioned(
            right: -15,
            top: -30,
            child: Container(
              decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: AppColors.textWhite.withOpacity(0.05), // Replace with AppColors.textWhite
                //     blurRadius: 0.5,
                //     spreadRadius: 1,
                //   ),  
                // ],
              ),
              width: 80,
              height: 80,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return  RadialGradient(
                    center: Alignment.center,
                    radius:
                        0.5, // Adjust between 0.4 and 0.5 to control fade width
                    colors: [
                    Colors.white.withOpacity(0.50), // Replace with AppColors.textWhite
                    Colors.white.withOpacity(0.50), // Replace with AppColors.textWhite
                      Colors.transparent, // Fades outer border out
                    ],
                    stops: [
                      0.0,
                      0.65,
                      1.0,
                    ], // Increase 0.65 for a thinner edge blur
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: SvgPicture.asset(
                  "assets/svg/faded_cloud.svg",
                  height: 80,
                  colorFilter:  ColorFilter.mode(
                    Colors.white.withOpacity(0.50), // Replace with AppColors.textWhite
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),

            Positioned(
            left: -10,
            bottom: -5,
            child: Container(
              decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: AppColors.textWhite.withOpacity(0.05), // Replace with AppColors.textWhite
                //     blurRadius: 0.5,
                //     spreadRadius: 1,
                //   ),  
                // ],
              ),
              width: 80,
              height: 80,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return  RadialGradient(
                    center: Alignment.bottomLeft,
                    radius:
                        0.5, // Adjust between 0.4 and 0.5 to control fade width
                    colors: [
                    Colors.white.withOpacity(0.50), // Replace with AppColors.textWhite
                    Colors.white.withOpacity(0.50), // Replace with AppColors.textWhite
                      Colors.transparent, // Fades outer border out
                    ],
                    stops: [
                      0.0,
                      0.65,
                      1.0,
                    ], // Increase 0.65 for a thinner edge blur
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: SvgPicture.asset(
                  "assets/svg/faded_cloud.svg",
                  height: 80,
                  colorFilter:  ColorFilter.mode(
                                        Colors.red
,
                  //  Colors.white.withOpacity(0.50), // Replace with AppColors.textWhite
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
    
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Fun Facts',
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 18,
                    fontFamily: "Satoshi",

                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Leo is ruled by the Sun ☀️, which is why it\'s traditionally '
                  'associated with confidence, creativity, warmth, and a natural '
                  'desire to shine.',
                  style: TextStyle(
                    color: AppColors.white70,
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w500,

                    fontSize: 13,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildDestinyPathwayCardNew(int destinyNumber) {
    return Center(
      child: AspectRatio(
        aspectRatio: 3 / 3,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.iceWhite,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: const Alignment(0, -0.4),
                  child: Container(
                    width: 80,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.paleYellow,

                      boxShadow: [
                        BoxShadow(
                          color: AppColors.paleYellow,
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '$destinyNumber',
                        style: const TextStyle(
                          fontSize: 35,

                          fontWeight: FontWeight.w500,
                          color: AppColors.neutralGray,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 40,
                  left: -10,
                  child: SvgPicture.asset(
                    'assets/svg/left_tree.svg',
                    width: 140,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 40,
                  right: -10,
                  child: SvgPicture.asset(
                    'assets/svg/right_tree.svg',
                    width: 140,
                    fit: BoxFit.contain,
                  ),
                ),

                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  height: 250,

                  child: SvgPicture.asset(
                    'assets/svg/direction_path.svg',
                    fit: BoxFit.fitWidth,
                  ),
                ),

                Positioned(
                  bottom: 50,
                  child: SvgPicture.asset(
                    'assets/svg/direction_person_standing.svg',
                    height: 130,
                    fit: BoxFit.contain,
                  ),
                ),

                Positioned(
                  bottom: -20,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Destiny Number $destinyNumber',
                        style: const TextStyle(
                          fontFamily: "Satoshi",

                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const Text(
                        'The Seeker',
                        style: TextStyle(
                          fontFamily: "Satoshi",

                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.luckyTeal,
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildCenterLayout() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          CustomWidgets.dot(3, AppColors.tealBlue),
          SizedBox(width: 4),
          CustomWidgets.dot(5, AppColors.tealBlue),
          SizedBox(width: 4),

          const Center(
            child: Text(
              '✦',
              style: TextStyle(color: AppColors.tealBlue, fontSize: 12),
            ),
          ),

          SizedBox(width: 4),

          CustomWidgets.dot(5, AppColors.tealBlue),
          SizedBox(width: 4),

          CustomWidgets.dot(3, AppColors.tealBlue),
        ],
      ),
    );
  }
}
