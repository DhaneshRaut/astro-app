// import 'package:astrologer_app/core/constants/app_colors_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'home_screen.dart';
// import 'journal_screen.dart';
// import 'insights_screen.dart';

// class MainLayout extends StatefulWidget {
//   const MainLayout({Key? key}) : super(key: key);

//   @override
//   State<MainLayout> createState() => _MainLayoutState();
// }

// class _MainLayoutState extends State<MainLayout> {
//   int _activeTab = 0;

//   final List<Widget> _viewports = [
//     const HomeScreen(),
//     const Center(
//       child: Text(
//         'Goals Workspace',
//         style: TextStyle(color: AppColors.textWhite),
//       ),
//     ),
//     const JournalScreen(),
//     const InsightsScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(index: _activeTab, children: _viewports),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _activeTab,
//         onTap: (index) => setState(() => _activeTab = index),
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: AppColors.textWhite,
//         selectedItemColor: AppColors.accentTeal,
//         unselectedItemColor: AppColors.textMuted,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         selectedLabelStyle: const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w600,
//         ),
//         unselectedLabelStyle: const TextStyle(fontSize: 12),
//         items: [
//           BottomNavigationBarItem(
//             label: "Home",
//             backgroundColor: Colors.white,
//             icon: SvgPicture.asset(
//               "assets/svg/unselected_home.svg",
//               height: 28,
//               width: 28,
//             ),
//             activeIcon: SvgPicture.asset(
//               "assets/svg/selected_home.svg",
//               height: 28,
//               width: 28,
//             ),
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               "assets/svg/unselected_goal.svg",
//               height: 28,
//               width: 28,
//             ),
//             activeIcon: SvgPicture.asset(
//               "assets/svg/selected_goal.svg",
//               height: 28,
//               width: 28,
//             ),
//             label: 'Goals',
//           ),
//           BottomNavigationBarItem(
//             label: "Journal",
//             icon: SvgPicture.asset(
//               "assets/svg/unselected_journal.svg",
//               height: 28,
//               width: 28,
//             ),
//             activeIcon: SvgPicture.asset(
//               "assets/svg/selected_journal.svg",
//               height: 28,
//               width: 28,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: "Insights",
//             icon: SvgPicture.asset(
//               "assets/svg/unselected_insight.svg",
//               height: 28,
//               width: 28,
//             ),
//             activeIcon: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                 "assets/svg/selectedicon.svg",
//                 height: 28,
//                 width: 28,
//               ),
//                 SvgPicture.asset(
//                 "assets/svg/selected_insights.svg",
//                 height: 28,
//                 width: 28,
//               ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'home_screen.dart';
import 'journal_screen.dart';
import 'insights_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _activeTab = 0;

  final List<Widget> _viewports = [
    const HomeScreen(),
    const Center(
      child: Text(
        'Goals Workspace',
        style: TextStyle(color: AppColors.textWhite),
      ),
    ),
    const JournalScreen(),
    const InsightsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _activeTab, children: _viewports),
      // Replaced BottomNavigationBar with a Custom Container for the overlapping UI
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.textWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            height: 70, // Height of the navigation bar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, "Home", "assets/svg/unselected_home.svg",
                    "assets/svg/selected_home.svg"),
                _buildNavItem(1, "Goals", "assets/svg/unselected_goal.svg",
                    "assets/svg/selected_goal.svg"),
                _buildNavItem(2, "Journal", "assets/svg/unselected_journal.svg",
                    "assets/svg/selected_journal.svg"),
                _buildNavItem(3, "Insights", "assets/svg/unselected_insight.svg",
                    "assets/svg/selected_insights.svg",
                    isInsights: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    String label,
    String unselectedIcon,
    String selectedIcon, {
    bool isInsights = false,
  }) {
    final isSelected = _activeTab == index;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _activeTab = index),
        child: Stack(
          clipBehavior: Clip.none, // Allows the top icon to overflow outside the container
          alignment: Alignment.center,
          children: [
            // 1. GLOW EFFECT (Only shows when selected)
            if (isSelected)
              Positioned(
                top: 5,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFE0F7FA).withOpacity(0.6), // Light cyan glow
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFE0F7FA).withOpacity(0.9),
                        blurRadius: 20,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                ),
              ),

            // 2. MAIN ICON AND TEXT
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  isSelected ? selectedIcon : unselectedIcon,
                  height: 28,
                  width: 28,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected
                        ? AppColors.accentTeal
                        : AppColors.textMuted,
                  ),
                ),
              ],
            ),

            // 3. TOP CUSTOM INDICATOR (Only for Insights when selected)
            if (isSelected )
              Positioned(
                top: -0, // Adjust this to push the indicator up onto the edge
                child: SvgPicture.asset(
                  "assets/svg/selectedicon.svg",
                  height: 30, // Adjust based on your SVG proportions
                  width: 40,
                ),
              ),
          ],
        ),
      ),
    );
  }
}