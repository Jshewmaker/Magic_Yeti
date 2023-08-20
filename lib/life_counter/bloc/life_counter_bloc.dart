import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'life_counter_event.dart';
part 'life_counter_state.dart';

class LifeCounterBloc extends Bloc<LifeCounterEvent, LifeCounterState> {
  LifeCounterBloc() : super(const LifeCounterState(counter: 0)) {
    on<LifeCounterIncrementPressed>(
      _incrementCounter,
    );
    on<LifeCounterDecrementPressed>(_decrementCounter);
  }

  void _incrementCounter(
    LifeCounterIncrementPressed event,
    Emitter<LifeCounterState> emit,
  ) {
    emit(LifeCounterState(counter: state.counter + 1));
  }

  void _decrementCounter(
    LifeCounterDecrementPressed event,
    Emitter<LifeCounterState> emit,
  ) {
    emit(LifeCounterState(counter: state.counter - 1));
  }
}
