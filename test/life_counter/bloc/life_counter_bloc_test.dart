// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_yeti/life_counter/life_counter.dart';

void main() {
  group('LifeCounterBloc', () {
    test('initial state is LoginState', () {
      expect(LifeCounterBloc().state, LifeCounterState(counter: 0));
    });

    blocTest<LifeCounterBloc, LifeCounterState>(
      'emits [1] when LifeCounterIncrementPressed is added.',
      build: LifeCounterBloc.new,
      act: (LifeCounterBloc bloc) => bloc.add(LifeCounterIncrementPressed()),
      expect: () => const <LifeCounterState>[LifeCounterState(counter: 1)],
    );

    blocTest<LifeCounterBloc, LifeCounterState>(
      'emits [1] when LifeCounterDecrementPressed is added.',
      build: LifeCounterBloc.new,
      act: (LifeCounterBloc bloc) => bloc.add(LifeCounterDecrementPressed()),
      expect: () => const <LifeCounterState>[LifeCounterState(counter: -1)],
    );
  });
}
