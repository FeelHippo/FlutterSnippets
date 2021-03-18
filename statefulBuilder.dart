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

class MyWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    int _counter = 0;
    return StatefulBuilder(
      builder: (context, StateSetter setState) =>
        Scaffold(
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
          onPressed: () => setState(() => _counter++),
        )
      )
    );
  }
}