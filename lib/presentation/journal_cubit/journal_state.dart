abstract class JournalState {}

class JournalInitial extends JournalState {}

class JournalLoaded extends JournalState {
  final List<String> months;
  final String selectedMonth;
  final List<JournalEntry> entries;

  JournalLoaded({
    required this.months,
    required this.selectedMonth,
    required this.entries,
  });
}

class JournalEntry {
  final String id;
  final String dayNumber;
  final String monthStr;
  final String weekdayStr;
  final String title;
  final String description;
  final String timeStr;

  JournalEntry({
    required this.id,
    required this.dayNumber,
    required this.monthStr,
    required this.weekdayStr,
    required this.title,
    required this.description,
    required this.timeStr,
  });
}
