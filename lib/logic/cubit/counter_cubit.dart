// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() {
    emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true),
    );
  }

  void decrement() {
    if (state.counterValue > 0) {
      emit(
        CounterState(
            counterValue: state.counterValue - 1, wasIncremented: false),
      );
    }
  }
}
