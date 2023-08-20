// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:magic_yeti/life_counter/life_counter.dart';

import '../../helpers/helpers.dart';

void main() {
  group('LifeCounterPage', () {
    testWidgets('render LifeCounterPage', (tester) async {
      await tester.pumpApp(LifeCounterPage());
      expect(find.byType(LifeCounterPage), findsOneWidget);
    });
  });
}
