import 'dart:async' show Timer;
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: container(),
      ),
    );
  }
}

double scaleLength(number) {
  return number * 3.0;
}

GestureDetector container() {
  Container c = new Container(
    color: Colors.yellow,
    child: stack(),
  );
  GestureDetector gd = new GestureDetector(
    onTap: () {
      log('onTap');
      y += 50;
    },
    child: c,
  );
  return gd;
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
          child: new Image(
            image: new AssetImage('image/sprites_43.png'),
          ),
        ),
      )
    ],
  );
  return s;
}

void main() {
  loop();
}
