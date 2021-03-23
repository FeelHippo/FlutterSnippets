import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<Counter>(Counter(), signalsReady: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(title: 'Behavior Subject'),
    );
  }
}

class Counter {
  BehaviorSubject _counter = BehaviorSubject.seeded(0);
  
  Stream get stream$ => _counter.stream;
  int get current => _counter.value;
  
  increment() {
    _counter.add(current + 1);
  }
}

class MyWidget extends StatefulWidget {
  MyWidget({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override

  void initState() {
    // Access the instance of the registered Counter
    // As we don't know for sure if Counter is already ready we use getAsync
    getIt
      .isReady<Counter>()
      .then((_) => print('Ready to do amazing things with getIt<Counter>()'));

      super.initState();
  }

  @override
  void dispose() {
    print('Here we can dispose of any listeners attached to getIt<Counter>()');
    super.dispose();
  }

  void update() => setState(() => {});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
        future: getIt.allReady(), // confirms availability for async operations
        builder: (context, snapshot) {
          return Scaffold(
            body: StreamBuilder(
              stream: getIt<Counter>().stream$,
              builder: (BuildContext context, AsyncSnapshot snap) {
                return Text(getIt<Counter>().current.toString());
              }
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => getIt<Counter>().increment(),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            )
          );
        },
      ),
    );
  }
}