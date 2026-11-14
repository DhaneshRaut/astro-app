import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:astrologer_app/presentation/screens/goals_screen.dart';
import 'package:astrologer_app/presentation/screens/home_screen.dart';
import 'package:astrologer_app/presentation/screens/insights_screen.dart';
import 'package:astrologer_app/presentation/screens/journal_screen.dart';
import 'package:flutter_svg/svg.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _activeTab = 0;
  final List<int> _visitedTabs = [0];

  Widget _createViewport(int index) {
    return switch (index) {
      1 => const GoalsScreen(),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeTab,
        onTap: _selectTab,
        type: BottomNavigationBarType.fixed,
        iconSize: 48,
        backgroundColor: AppColors.textWhite,
        selectedItemColor: AppColors.accentTeal,
        unselectedItemColor: AppColors.textMuted,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SvgPicture.asset(
                    "assets/svg/unselected_home.svg",
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
            activeIcon: _buildSelectedIcon("assets/svg/selected_home.svg"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SvgPicture.asset(
                    "assets/svg/unselected_insight.svg",
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
            activeIcon: _buildSelectedIcon("assets/svg/selected_insight.svg"),
            label: 'Goals',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SvgPicture.asset(
                    "assets/svg/unselected_journal.svg",
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
            activeIcon: _buildSelectedIcon("assets/svg/selected_journal.svg"),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SvgPicture.asset(
                    "assets/svg/unselected_insight.svg",
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
            activeIcon: _buildSelectedIcon("assets/svg/selected_insights.svg"),
            label: 'Insights',
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedIcon(String assetPath) {
    return Container(
        width: 24,
              height: 35 ,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [ 
          SvgPicture.asset(
            "assets/svg/selectedicon.svg",
            width: 24,
            height: 10 ,
            fit: BoxFit.fill,
          ),
          SvgPicture.asset(assetPath, width: 24, height: 24 ,
                      fit: BoxFit.cover,

          
          )
        ],
      ),
    );
  }
}
