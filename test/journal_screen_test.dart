import 'package:astrologer_app/presentation/screen/journal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('journal entries render and scroll without errors', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: JournalScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Recent Entries'), findsOneWidget);
    expect(find.text('A Day To Remember'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -500));
    await tester.pumpAndSettle();

    expect(find.text('Something I Realized'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
