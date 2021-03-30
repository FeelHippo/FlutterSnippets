import 'dart:async';
import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- bloc: ${bloc.runtimeType}');
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();

  cubitMain();
  blocMain();
}
// https://pub.dev/documentation/cubit/latest/
void cubitMain() {
  print('--- Cubit ---');
  // create a 'CounterCubit' instance
  final cubit = CounterCubit();
  // access cubit's state 
  print(cubit.state);// 0
  // trigger state change
  cubit.increment();
  // access new state
  print(cubit.state);// 1
  // dispose
  cubit.close();
}

class CounterCubit extends Cubit<int> {
  // initial state == 0
  CounterCubit() : super(0);
  // access state, modify it, and the emit new value
  void increment() => emit(state + 1);
}

void blocMain() async {
  print('--- BLOC ---');
  final bloc = CounterBloc();
  // access state value
  print(bloc.state);
  // change state value
  bloc.add(CounterEvent.increment);
  // await next iteration of event loop
  await Future<void>.delayed(Duration.zero);
  // access new state value
  print(bloc.state);
  // dispose
  await bloc.close();
}
// the event CounterBloc will react to
enum CounterEvent { increment }

class CounterBloc extends Bloc<CounterEvent, int> {
  // initial state
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      // on CounterEvent.increment, access state and emit new value via 'yield'
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}