import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/drawerMenu.dart';
import 'package:miniprojetoflutter21805485/formularioScreen.dart';

import 'blocs/incidenteBLoC.dart';
import 'incidente.dart';

class IncidentesAbertosScreen extends StatelessWidget {
  IncidenteBlocProvider incidenteBlocProvider;

  IncidentesAbertosScreen({this.incidenteBlocProvider});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Incidentes Abertos e Resolvidos")),
        body: StreamBuilder(
          initialData: [Incidente(titulo: "Teste")],
          stream: incidenteBlocProvider.output,
          builder: (BuildContext context, snapshot) => ListaIncidente(content: snapshot.data),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormularioScreen(incidenteBlocProvider: incidenteBlocProvider,),
                )
            );
          },
        ),
        drawer: DrawMenu()
    );
  }
}

class ListaIncidente extends StatelessWidget{
  final content;

  ListaIncidente({this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: content.length,
        itemBuilder: (context, index) {
          final item = content[index];
          return Title(
              color: Colors.black,
              child: Text(
                  item.titulo
              )
          );
        },
      ),
    );

  }

}