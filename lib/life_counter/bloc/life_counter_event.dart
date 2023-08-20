part of 'life_counter_bloc.dart';

abstract class LifeCounterEvent extends Equatable {
  const LifeCounterEvent();

  @override
  List<Object> get props => [];
}

class LifeCounterIncrementPressed extends LifeCounterEvent {}

class LifeCounterDecrementPressed extends LifeCounterEvent {}
