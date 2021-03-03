import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/drawerMenu.dart';

import 'blocs/incidenteBLoC.dart';

class IncidentesFechadosScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Incidentes Fechados")),
        body: Center(child: Text('Fechados')),
        drawer: DrawMenu());
  }
}
