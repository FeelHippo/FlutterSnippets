import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_view.dart';
import '../counter.dart';

// a [StatelessWidget] responsible for providing a [CounterCubit] instance to the [CounterView]
class CounterPage extends StatelessWidget {
  const CounterPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: CounterView(),
    );
  }
}