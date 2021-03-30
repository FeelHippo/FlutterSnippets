import 'package:bloc/bloc.dart';

// [BlocObserver] will observe all [Bloc] state changes
class CounterObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }
}