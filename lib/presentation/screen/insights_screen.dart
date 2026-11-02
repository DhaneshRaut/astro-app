import 'package:astrologer_app/presentation/insights_cubit/insights_cubit.dart';
import 'package:astrologer_app/presentation/insights_cubit/insights_state.dart';
import 'package:astrologer_app/presentation/screen/widgets/resusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InsightsCubit()..loadInsightsData(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFBFD),
        body: BlocBuilder<InsightsCubit, InsightsState>(
          builder: (context, state) {
            if (state is! InsightsLoaded) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFF4FA0B5)),
              );
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Cosmic Wheel Natal Matrix Placement Background
                  _buildNatalChartSection(state, context),
                  SizedBox(height: 10,) ,
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                    
                   
                      children: [
                        LuckNumberCard.dot(3, Color(0xff1c6370)),
                        SizedBox(width: 4),
                        LuckNumberCard.dot(5, Color(0xff1c6370)),
                        SizedBox(width: 4),
                    
                        const Center(
                          child: Text(
                            '✦',
                            style: TextStyle(
                              color: Color(0xff1c6370),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        //
                    //        const Center(
                    //   child: Text(
                    //     '✦ ─── ✦',
                    //     style: TextStyle(color: Colors.black12, fontSize: 12),
                    //   ),
                    // ),
                        SizedBox(width: 4),
                    
                        LuckNumberCard.dot(5, Color(0xff1c6370)),
                        SizedBox(width: 4),
                    
                        LuckNumberCard.dot(3, Color(0xff1c6370)),
                      ],
                    ),
                  ),

               

                  // 3. Astrology Segment Briefings
                  _buildSectionHeader("ASTROLOGY"),
                  foucusCardBuildNew(state.focusOfTheDay),

                  // Focus Segment Card
                  // _buildFocusCard(state.focusOfTheDay),

                  // Main Narrative Reading Block
                  _buildHoroscopeNarrativeCard(),

                  // Metrics Split Grid
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildMetricCard(
                            "Favorable Direction",
                            "assets/png/direction.png",

                            // "assets/svg/favorable_direction.svg",
                            const Color(0xFF1B6375),
                            "North",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildMetricCard(
                            "Lucky Color",
                            "assets/png/lucky_color.png",

                            const Color(0xFFE91E63),
                            "Pink",
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Fun Facts Horizontal Banner
                  _buildFunFactsBanner(),

                  // 4. Numerology Visualizer Segment Maps
                  _buildSectionHeader("NUMEROLOGY"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: LuckNumberCard.buildNumerologyCard(
                      "Stay open to unexpected opportunities. Trust your instincts, explore something new, and avoid overthinking your next move.",
                    ),
                  ),
                  // _buildNumerologyCard("${state.luckyNumber}"),
                  _buildDestinyPathwayCardNew(state.destinyNumber),

                  const SizedBox(height: 60),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTimelineTabs({String selectedTab = 'TODAY'}) {
    final tabs = ['YESTERDAY', 'TODAY', 'TOMORROW', 'WEEK', 'MONTH'];

    return SizedBox(
      height:
          52, // Increased height to cleanly distribute the labels and bottom anchor elements
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: tabs.length,

        // ── 1. Text Items and Underline Selection Indicators ───────────────────
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
                  // Selected item gets high contrast teal; unselected gets a soft slate-grey
                  color: isSelected
                      ? const Color(0xFF144750)
                      : const Color(0xFF728488),
                ),
              ),
              const SizedBox(height: 6),

              // Underline line + center dot indicator (drawn exclusively below the selected option)
              Opacity(
                opacity: isSelected
                    ? 1.0
                    : 0.0, // Retains layout spacing when hidden to stop layout shifts
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 14,
                      height: 1.5,
                      color: const Color(0xFF144750),
                    ),
                    const SizedBox(width: 4),
                    LuckNumberCard.dot(4, const Color(0xFF144750)),
                    const SizedBox(width: 4),
                    Container(
                      width: 14,
                      height: 1.5,
                      color: const Color(0xFF144750),
                    ),
                  ],
                ),
              ),
            ],
          );
        },

        // ── 2. Middle Inter-Element Separators (Triple Dots) ───────────────────
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LuckNumberCard.dot(
                  1.5,
                  const Color(0xFF9CB0B4),
                ), // Tiny outer dot
                const SizedBox(width: 3),
                LuckNumberCard.dot(
                  3.5,
                  const Color(0xFF728488),
                ), // Bigger core dot
                const SizedBox(width: 3),
                LuckNumberCard.dot(
                  1.5,
                  const Color(0xFF9CB0B4),
                ), // Tiny outer dot
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNatalChartSection(InsightsLoaded state, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFEF2C2).withOpacity(0.1),

        gradient: LinearGradient(
          colors: [Color(0xFFE9F3F8), Color(0xFFFEF2C2)],
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
                color: Color(0xFF021B22),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildTimelineTabs(),
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
                    color: Color(0xFFFEF2C2).withOpacity(0.1),
                    border: Border.all(
                      color: Color(0xFF082E35).withOpacity(0.1),
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
                            const Color(0xFFFEF2C2).withOpacity(0.1),
                            const Color(0xFFBEDDE2).withOpacity(0.4),
                          ],
                        ),
                        border: Border.all(
                          color: Color(0xFFBEDDE2).withOpacity(0.4),
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
                          color: Color(0xFF021B22),
                        ),
                      ),
                      const Text(
                        'You • Sept 22, 2001',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF595959),
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
                              color: Color(0xFF021B22),
                            ),
                          ),
                          Text(
                            'Sun Sign',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF595959),
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
                              color: Color(0xFF021B22),
                            ),
                          ),
                          Text(
                            'Moon Sign',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF595959),
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 32.0, bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black38,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget foucusCardBuildNew(String target) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      height: 60, // Fixed height to match the compact banner design
      decoration: BoxDecoration(
        color: const Color(0xFFE9F3F5), // Light blue-grey background
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFD4E8EC), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // ── 1. Background Waves ──────────────────────────────────────────
            Positioned.fill(child: CustomPaint(painter: WavePainter())),

            // ── 2. Content Layout (Text & Graphic Side-by-Side) ──────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Text Component
                  RichText(
                    text: TextSpan(
                      text: 'Focus of the day: ',
                      style: const TextStyle(
                        color: Color(0xFF7A8B90), // Soft muted grey-blue text
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: target,
                          style: const TextStyle(
                            color: Color(
                              0xFF0F4D5C,
                            ), // Deep teal emphasis color
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right Graphic Component (Stacked Zen Stones)
                  Padding(
                    padding: const EdgeInsets.only(right: 8, bottom: 4),
                    child: SizedBox(
                      width: 45,
                      height: 55,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          // Bottom Stone (Solid Deep Teal)
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: 44,
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xFF268D9C),
                                borderRadius: BorderRadius.all(
                                  Radius.elliptical(22, 10),
                                ),
                              ),
                            ),
                          ),
                          // Middle Stone (White with Teal Outline)
                          Positioned(
                            bottom: 12,
                            child: Container(
                              width: 32,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0xFF268D9C),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.elliptical(16, 8),
                                ),
                              ),
                            ),
                          ),
                          // Top Stone (Semi-transparent Glossy Light Blue)
                          Positioned(
                            bottom: 24,
                            child: Container(
                              width: 20,
                              height: 12,
                              decoration: BoxDecoration(
                                color: const Color(0xFFBCE3EB).withOpacity(0.8),
                                borderRadius: BorderRadius.all(
                                  Radius.elliptical(10, 6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHoroscopeNarrativeCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      // 1. Clip.antiAlias ensures the large background SVG doesn't bleed outside the rounded corners
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFFEFBEC),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFFEF2C2), width: 1),
      ),
      child: Stack(
        children: [
          // ── 1. Background SVG (Bottom Right) ─────────────────────────
          Positioned(
            bottom: -30, // Pushes it slightly off the bottom edge
            right: -20, // Pushes it slightly off the right edge
            child: SvgPicture.asset(
              "assets/svg/horoscope.svg",
              height: 170,
              // Made much larger to match the reference image
              // Optional: Add color/opacity here if your SVG doesn't have it built-in
              // color: Colors.black.withOpacity(0.1),
            ),
          ),

          // ── 2. Foreground Text Content ───────────────────────────────
          Padding(
            padding: const EdgeInsets.all(24), // Padding goes here now
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Wraps content tightly
              children: const [
                Text(
                  'Your today\'s horoscope',
                  style: TextStyle(
                    fontSize: 16, // Increased from 16 to match image
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF040E10),
                  ),
                ),
                SizedBox(height: 16), // Increased spacing
                Text(
                  'Give yourself time to heal and focus on your well-being today. Adopt healthy habits and choose nourishing foods. Stay patient—positive career opportunities are on the way, while love brings warmth and connection.',
                  style: TextStyle(
                    color: Color(
                      0xFF4C4C4C,
                    ), // Slightly darker grey for readability
                    fontSize: 12, // Increased from 13 to match image
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(
    String title,
    String value,
    Color themeColor,
    String subtitle,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff040E10),
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
              Expanded(child: leftLineWidget(themeColor)),
              const SizedBox(width: 4),
              buildDots(themeColor),
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
              buildDots(themeColor),
              const SizedBox(width: 4),
              Expanded(child: RightLineWidget(themeColor)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFunFactsBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Stack(
        children: [
          // ── 1. Background Art ────────────────────────────────────────
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/svg/fun_facts.svg",
              fit: BoxFit.fill,
            ),
          ),

          // ── 2. Other Background Clouds & Sparkles ─────────────────────
          // Bottom Right Cloud
          Positioned(
            bottom: 5,
            right: 20,
            child: SvgPicture.asset(
              "assets/svg/fun_fact_cloud.svg",
              height: 40,
              color: Colors.white.withOpacity(0.12),
            ),
          ),

          // Top Right Cloud (Large)
          Positioned(
            top: 5,
            right: 100,
            child: SvgPicture.asset(
              "assets/svg/fun_fact_cloud.svg",
              height: 40,
              color: Colors.white.withOpacity(0.12),
            ),
          ),

          // Bottom Left Cloud
          Positioned(
            bottom: 20,
            left: 80,
            child: SvgPicture.asset(
              "assets/svg/fun_fact_cloud.svg",
              height: 40,
              color: Colors.white.withOpacity(0.12),
            ),
          ),

          // ── 3. Foreground Text Content ───────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Fun Facts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Leo is ruled by the Sun ☀️, which is why it\'s traditionally '
                  'associated with confidence, creativity, warmth, and a natural '
                  'desire to shine.',
                  style: TextStyle(
                    color: Colors.white70,
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

  Widget _buildDestinyPathwayCardNew(int destinyNumber) {
    return Center(
      child: AspectRatio(
        aspectRatio:
            3 / 3, // You can tweak this to 5/4 if it looks closer to your image
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF3F8F9),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
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
                // 1. BACKGROUND GLOW CIRCLE & NUMBER
                Align(
                  alignment: const Alignment(0, -0.4), // Pushes it up slightly
                  child: Container(
                    width: 80,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFEF4CE), // Edge blending into white

                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFEF4CE), // Pale yellow glow
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
                          color: Color(0xFF7A7A7A), // Greyish brown
                        ),
                      ),
                    ),
                  ),
                ),

                // 2. TREES (Left and Right)
                Positioned(
                  top: 40,
                  left: -10,
                  child: SvgPicture.asset(
                    'assets/svg/left_tree.svg',
                    width: 140, // Increased size
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 40,
                  right: -10,
                  child: SvgPicture.asset(
                    'assets/svg/right_tree.svg',
                    width: 140, // Increased size
                    fit: BoxFit.contain,
                  ),
                ),

                // 3. WINDING PATH (Bottom)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 250,
                  // height: 250, // Taller path to match the image
                  child: SvgPicture.asset(
                    'assets/svg/direction_path.svg',
                    fit: BoxFit.fitWidth,
                  ),
                ),

                // 4. PERSON SILHOUETTE (Center)
                Positioned(
                  bottom: 100, // Anchored from the bottom
                  child: SvgPicture.asset(
                    'assets/svg/direction_person_standing.svg',
                    height: 135,
                    fit: BoxFit.contain,
                  ),
                ),

                // 5. TEXT SECTION (Bottom)
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Destiny Number $destinyNumber', // Removed the colon
                        style: const TextStyle(
                          fontSize: 18, // Slightly larger
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const Text(
                        'The Seeker',
                        style: TextStyle(
                          fontSize: 12, // Slightly larger
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF27828E), // Teal color
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

  Widget RightLineWidget([Color? color]) {
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

  Widget leftLineWidget([Color? color]) {
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

  Widget buildDots(Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        LuckNumberCard.dot(2.5, color),
        const SizedBox(width: 3),
        LuckNumberCard.dot(5, color),
        const SizedBox(width: 3),
        LuckNumberCard.dot(2.5, color),
      ],
    );
  }
}

// Custom Painter to draw the smooth ambient hills/waves on the right edge
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw the lighter, back wave
    paint.color = const Color(0xFFD6EAEF);
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

    // Draw the darker, front wave
    paint.color = const Color(0xFFC4DFE6);
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
      ..color = Colors.black12;
    SvgPicture.asset(
      "assets/svg/insight_horoscope.svg",
      width: 240,
      height: 240,
      fit: BoxFit.contain,
      colorFilter: const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
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
