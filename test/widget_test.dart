// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:nyayanow/main.dart';

void main() {
  testWidgets('Language selection screen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const NyayaNowApp());
    await tester.pump(); // initial frame
    await tester.pump(const Duration(milliseconds: 900)); // allow splash timer
    await tester.pumpAndSettle();

    expect(find.text('Choose Language'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
  });
}
