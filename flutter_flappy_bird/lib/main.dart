import 'dart:async' show Timer;
import 'dart:ffi';
import 'package:flutter/material.dart';

void log(content) {
  print(content);
}

void loop() {
  Duration d = new Duration(milliseconds: 40);
  Timer.periodic(d, (_) {
    loopBody();
  });
}

double y = 180.0;

void loopBody() {
  y = y + 1;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: stack()
      ),
    );
  }
}

Stack stack() {
  Stack s = new Stack(
    children: <Widget>[
      new Positioned(
        left: 30.0,
        top: y,
        child: new Container(
          width: 100.0,
          height: 100.0,
          child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
        ),
      )
    ],
  );
  return s;
}

void main() {
  loop();
}
