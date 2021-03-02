import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iQueChumbei',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        home: TestPage ()
    );
  }
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Hello World!!"),),
    );
  }
}
