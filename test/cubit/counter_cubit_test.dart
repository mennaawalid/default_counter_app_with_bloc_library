import 'package:bloc_test/bloc_test.dart';
import 'package:default_counter_app_bloc_library/logic/cubit/counter_cubit.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit = CounterCubit();

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test(
        'the initial value for the CounterCubit is CounterState(counterValue: 0)',
        () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
      'the cubit should emit a CounterState(counterValue: 1,'
      'wasIncremented: true) after the cubit.increment() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      'the cubit should emit a CounterState(counterValue: 0,'
      'wasIncremented: false) after the cubit.decrement() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [],
    );
  });
}
