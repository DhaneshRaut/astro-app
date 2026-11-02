import 'package:astrologer_app/core/theme/app_theme.dart';
import 'package:astrologer_app/presentation/screens/startup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/astro_cubit/astro_cubit.dart';

void main() {
  runApp(const AstroApp());
}

class AstroApp extends StatelessWidget {
  const AstroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AstroCubit()..loadDashboardData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Astro Tracker',
        theme: AppTheme.lightTheme,
        home: const StartupScreen(),
      ),
    );
  }
}
