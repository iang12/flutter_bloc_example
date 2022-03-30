import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_events.dart';
import 'counter_states.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterStateInitial(value: 0)) {
    on<CounterStartEvent>(
      (event, emit) async {
        return emit(CounterStateIncremeted(counterValue: 1));
      },
    );
    on<IncrementCounter>(
      (event, emit) async {
        final counterValue = (state as CounterStateIncremeted).counterValue;
        return emit(CounterStateIncremeted(counterValue: counterValue + 1));
      },
    );
  }
}

