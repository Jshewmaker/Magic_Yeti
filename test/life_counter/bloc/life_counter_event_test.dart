import 'package:flutter_test/flutter_test.dart';
import 'package:magic_yeti/life_counter/life_counter.dart';

void main() {
  group('LifeCounterEvent', () {
    group('LifeCounterIncrementPressed', () {
      test('supports value comparisons', () {
        expect(
          LifeCounterIncrementPressed(),
          LifeCounterIncrementPressed(),
        );
      });
    });

    group('LifeCounterDecrementPressed', () {
      test('supports value comparisons', () {
        expect(
          LifeCounterDecrementPressed(),
          LifeCounterDecrementPressed(),
        );
      });
    });
  });
}
