// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_yeti/life_counter/life_counter.dart';

import '../../helpers/helpers.dart';

void main() {
  group('LifeCounterWidget', () {
    testWidgets('increments on tap', (tester) async {
      await tester.pumpApp(
        LifeCounterWidget(
          player: 1,
          color: Colors.blue,
        ),
      );

      await tester.tap(find.byKey(ValueKey('life_counter_widget_increment')));
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('decrements on tap', (tester) async {
      await tester.pumpApp(
        LifeCounterWidget(
          player: 1,
          color: Colors.blue,
        ),
      );

      await tester.tap(find.byKey(ValueKey('life_counter_widget_decrement')));
      await tester.pumpAndSettle();

      expect(find.text('-1'), findsOneWidget);
    });
  });
}
