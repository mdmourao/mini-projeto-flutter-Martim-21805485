import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/drawerMenu.dart';

import 'blocs/incidenteBLoC.dart';
import 'incidentesAbertosScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  IncidenteBlocProvider incidenteBlocProvider = new IncidenteBlocProvider();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iQueChumbei',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
        home: IncidentesAbertosScreen (incidenteBlocProvider: incidenteBlocProvider,),
    );
  }
}
