import 'package:flutter_bloc/flutter_bloc.dart';
import 'journal_state.dart';

class JournalCubit extends Cubit<JournalState> {
  JournalCubit() : super(JournalInitial());

  void loadJournalData() {
    emit(JournalLoaded(
      months: ['Sep', 'Oct', 'Nov'],
      selectedMonth: 'Oct',
      entries: [
        JournalEntry(
          id: '1',
          dayNumber: '12',
          monthStr: 'Aug',
          weekdayStr: 'Mon',
          title: 'A Day To Remember',
          description: 'Today felt like a good day to slow down. I finally made time for something I had...',
          timeStr: '06:30 PM',
        ),
        JournalEntry(
          id: '2',
          dayNumber: '10',
          monthStr: 'Aug',
          weekdayStr: 'Mon',
          title: 'A Thought To Keep',
          description: 'I\'m learning to trust my own pace and enjoy the journey....',
          timeStr: '06:30 PM',
        ),
        JournalEntry(
          id: '3',
          dayNumber: '9',
          monthStr: 'Aug',
          weekdayStr: 'Mon',
          title: 'Something I Realized',
          description: 'Small steps can still move me closer to where I want to be....',
          timeStr: '06:30 PM',
        ),
      ],
    ));
  }
}
