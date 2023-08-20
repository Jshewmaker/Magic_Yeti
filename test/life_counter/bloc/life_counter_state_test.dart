// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:magic_yeti/life_counter/life_counter.dart';

void main() {
  group('LifeCounterState', () {
    test('supports value comparisons', () {
      expect(LifeCounterState(counter: 0), LifeCounterState(counter: 0));
    });
  });
}
