part of 'life_counter_bloc.dart';

class LifeCounterState extends Equatable {
  const LifeCounterState({required this.counter});

  final int counter;

  @override
  List<Object> get props => [counter];
}
