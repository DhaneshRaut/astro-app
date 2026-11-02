abstract class InsightsState {}

class InsightsInitial extends InsightsState {}

class InsightsLoaded extends InsightsState {
  final String userName;
  final String birthday;
  final String sunSign;
  final String moonSign;
  final String ascendantSign;
  final String focusOfTheDay;
  final int luckyNumber;
  final int destinyNumber;

  InsightsLoaded({
    required this.userName,
    required this.birthday,
    required this.sunSign,
    required this.moonSign,
    required this.ascendantSign,
    required this.focusOfTheDay,
    required this.luckyNumber,
    required this.destinyNumber,
  });
}
