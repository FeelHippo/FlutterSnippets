import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // initial state
  int _counter = 0;
  // method that determines when the widget should re-render
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  // define widget which is re-rendered every time setState is called
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 500.0,
              child: Center(
                child: Text('$_counter')
              )
            )
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter
      )
    );
  }
}