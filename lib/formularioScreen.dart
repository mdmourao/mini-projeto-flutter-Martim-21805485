import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/drawerMenu.dart';

class FormularioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Formulário Incidente")),
        body: Center(child: Text('formulário')),
        drawer: DrawMenu());
  }
}
