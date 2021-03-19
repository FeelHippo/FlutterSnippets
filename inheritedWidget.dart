import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InheritedCounter(child: MyWidget()),
    );
  }
}

class InheritedCounter extends InheritedWidget {
  final Map _counter = { 'val': 0 };
  final Widget child;
  InheritedCounter({ this.child }) : super(child: child);
  // setter
  increment() {
    _counter['val']++;
  }
  
  //getter
  get counter => _counter['val'];
  
  @override
  // method run when this inherited widget is rebuilt
  // will notify any descendants whether they should rebuild
  bool updateShouldNotify(InheritedCounter oldWidget) => true;
  
  static InheritedCounter of(BuildContext context) => 
    context.dependOnInheritedWidgetOfExactType<InheritedCounter>();
}

class MyWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        int counter = InheritedCounter.of(context).counter;
        Function increment = InheritedCounter.of(context).increment;
        
        return Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 500.0,
                  child: Center(
                    child: Text('$counter')
                  )
                )
              ),
            ]
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() => increment()),
          )
        );
      }
    );
  }
}
