import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter.dart';

// a [StatelessWidget] that will react to a given [CounterCubit]'s state changes
class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>( //A BlocBuilder is used to wrap the Text widget in order to update the text any time the CounterCubit state changes.
          builder: (context, state) {
            return Text('$state', style: textTheme.headline2); // Only the Text widget is wrapped in a BlocBuilder because that is the only widget that needs to be rebuilt in response to state changes in the CounterCubit
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(), // used to look-up the closest CounterCubit instance
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(), //used to look-up the closest CounterCubit instance
          ),
        ],
      ),
    );
  }
}