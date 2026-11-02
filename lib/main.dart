import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:astrologer_app/presentation/screen/main_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/astro_cubit/astro_cubit.dart';


void main() {
  runApp(const AstroApp());
}

class AstroApp extends StatelessWidget {
  const AstroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Astro Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto',
      ),
      home: BlocProvider(
        create: (context) => AstroCubit()..loadDashboardData(),
        child: const MainLayout(),
      ),
    );
  }
}