import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = new GetIt();

void main() => {
  getIt.registerSingleton<Counter>(Counter());
  runApp(MyApp());
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class Counter {
  BehaviorSubject _counter = BehaviorSubject.seeded(0);
  
  Observable get stream$ => _counter.stream;
  int get current => _counter.value;
  
  increment() {
    _counter.add(current + 1);
  }
}

// global instantiation is frowned upon, avoid if possible
// Counter counterService = Counter();

class MyWidget extends StatelessWidget {
  final counterService = getIt.get<Counter>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: counterService.stream$,
        builder: (BuildContext context, AsyncSnapshot snap) {
          return Text('{$snap.data}');
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterService.increment(),
      )
    );
  }
}