abstract class CounterState {}

class CounterStateInitial extends CounterState {
  int value;

  CounterStateInitial({this.value = 0});
}

class CounterStateIncremeted extends CounterState {
  int counterValue;

  CounterStateIncremeted({this.counterValue = 0});
}
