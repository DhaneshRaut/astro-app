import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:astrologer_app/presentation/screens/goals_screen.dart';
import 'package:astrologer_app/presentation/screens/home_screen.dart';
import 'package:astrologer_app/presentation/screens/insights_screen.dart';
import 'package:astrologer_app/presentation/screens/journal_screen.dart';

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
        backgroundColor: AppColors.textWhite,
        selectedItemColor: AppColors.accentTeal,
        unselectedItemColor: AppColors.textMuted,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag_outlined),
            activeIcon: Icon(Icons.flag),
            label: 'Goals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_outlined),
            activeIcon: Icon(Icons.auto_awesome),
            label: 'Insights',
          ),
        ],
      ),
    );
  }
}
