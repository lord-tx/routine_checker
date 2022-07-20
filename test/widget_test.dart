// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:routine_checker/main.dart';
import 'package:routine_checker/ui/views/base_view.dart';
import 'package:routine_checker/ui/views/routine/routine_manip_view.dart';

void main() {
  testWidgets('Routine Add functionality', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RoutineChecker());

    // Verify that our baseView gets called on init
    expect(find.byWidget(const BaseView()), findsOneWidget);

    // Tap the '+' icon and trigger adding a new Routine.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.byWidget(RoutineManip()), findsOneWidget);
    expect(find.byWidget(const BaseView()), findsNothing);
  });
}
