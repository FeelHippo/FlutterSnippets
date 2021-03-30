import 'package:bloc/bloc.dart';

// a [Cubit] to manage an int state
class CounterCubit extends Cubit<int> {
  // init state to 0
  CounterCubit() : super(0);
  // add 1
  void increment() => emit(state + 1);
  // sub 1
  void decrement() => emit(state - 1);
}