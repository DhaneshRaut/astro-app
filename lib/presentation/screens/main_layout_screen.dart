import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:astrologer_app/presentation/screens/home_screen.dart';
import 'package:astrologer_app/presentation/screens/insights_screen.dart';
import 'package:astrologer_app/presentation/screens/journal_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _activeTab = 0;
  final List<int> _visitedTabs = [0];

  Widget _createViewport(int index) {
    return switch (index) {
      1 => const Center(
        child: Text(
          'Goals Workspace',
          style: TextStyle(color: AppColors.textWhite),
        ),
      ),
      2 => const JournalScreen(),
      3 => const InsightsScreen(),
      _ => const HomeScreen(),
    };
  }

  void _selectTab(int index) {
    setState(() {
      if (!_visitedTabs.contains(index)) {
        _visitedTabs.add(index);
      }
      _activeTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _visitedTabs.indexOf(_activeTab),
        children: [for (final index in _visitedTabs) _createViewport(index)],
      ),
      
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.textWhite,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            height: 70, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  0,
                  "Home",
                  "assets/svg/unselected_home.svg",
                  "assets/svg/selected_home.svg",
                ),
                _buildNavItem(
                  1,
                  "Goals",
                  "assets/svg/unselected_goal.svg",
                  "assets/svg/selected_goal.svg",
                ),
                _buildNavItem(
                  2,
                  "Journal",
                  "assets/svg/unselected_journal.svg",
                  "assets/svg/selected_journal.svg",
                ),
                _buildNavItem(
                  3,
                  "Insights",
                  "assets/svg/unselected_insight.svg",
                  "assets/svg/selected_insights.svg",
                  isInsights: true,
                ),
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
        onTap: () => _selectTab(index),
        child: Stack(
          clipBehavior: Clip
              .none, 
          alignment: Alignment.center,
          children: [
            
            if (isSelected)
              Positioned(
                top: 5,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.glowCyan.withOpacity(
                      0.6,
                    ), 
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.glowCyan.withOpacity(0.9),
                        blurRadius: 20,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                ),
              ),

            
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
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: isSelected
                        ? AppColors.accentTeal
                        : AppColors.textMuted,
                  ),
                ),
              ],
            ),

            
            if (isSelected)
              Positioned(
                top: -0, 
                child: SvgPicture.asset(
                  "assets/svg/selectedicon.svg",
                  height: 30, 
                  width: 40,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
