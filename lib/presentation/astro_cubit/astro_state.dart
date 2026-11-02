
abstract class AstroState {}

class AstroInitial extends AstroState {}

class AstroLoaded extends AstroState {
  final String name;
  final String traits;
  final String sign;
  final String dateStr;
  final bool hasGoals;

  AstroLoaded({
    required this.name,
    required this.traits,
    required this.sign,
    required this.dateStr,
    required this.hasGoals,
  });
}
