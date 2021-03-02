import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/drawerMenu.dart';

import 'incidentesAbertosScreen.dart';

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
        primarySwatch: Colors.lightBlue,
      ),
        home: IncidentesAbertosScreen (),
    );
  }
}
