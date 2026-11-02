import 'package:astrologer_app/presentation/astro_cubit/state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AstroCubit extends Cubit<AstroState> {
  AstroCubit() : super(AstroInitial());

  void loadDashboardData() {
    // Supplying exact interface configuration parameters matching standard response parameters
    emit(AstroLoaded(
      name: "Saniya",
      traits: "Air • Mutable • Mercury",
      sign: "Gemini",
      dateStr: "13 August 2026",
      hasGoals: false,
    ));
  }
}
