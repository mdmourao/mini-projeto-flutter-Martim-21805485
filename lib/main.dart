import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/drawerMenu.dart';

import 'blocs/incidenteBLoC.dart';
import 'incidentesAbertosScreen.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  StreamSubscription<HardwareButtons.VolumeButtonEvent> _volumeButtonSubscription;
  void initState() {

    _volumeButtonSubscription = HardwareButtons.volumeButtonEvents.listen((event) {
      IncidenteBlocProvider.getInstance().resolveIncidente();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iQueChumbei',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
        home: IncidentesAbertosScreen (),
    );
  }
}
