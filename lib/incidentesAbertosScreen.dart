import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/detailIncidenteScreen.dart';
import 'package:miniprojetoflutter21805485/drawerMenu.dart';
import 'package:miniprojetoflutter21805485/formularioScreen.dart';

import 'blocs/incidenteBLoC.dart';
import 'incidente.dart';
import 'package:shake/shake.dart';

class IncidentesAbertosScreen extends StatelessWidget {
  IncidentesAbertosScreen() {
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      IncidenteBlocProvider.getInstance().shake();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Incidentes Abertos e Resolvidos")),
        body: StreamBuilder(
          initialData: [Incidente(titulo: "Teste")],
          stream: IncidenteBlocProvider.getInstance().output,
          builder: (BuildContext context, snapshot) =>
              ListaIncidente(content: snapshot.data),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormularioScreen(),
                ));
          },
        ),
        drawer: DrawMenu());
  }
}

class ListaIncidente extends StatelessWidget {
  final content;

  ListaIncidente({this.content});

  @override
  Widget build(BuildContext context) {
    if (content == null || content.length == 0) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: Text(
              "Sem Incidentes de momento, pode criar novos incidentes carregando no botão +"),
        ),
      );
    }
    return Container(
      child: ListView.builder(
        itemCount: content.length,
        itemBuilder: (context, index) {
          final item = content[index];
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              IncidenteBlocProvider.getInstance().remove(item);
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("${item.titulo} dismissed")));
            },
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailIncidenteScreen(incidente: item,),
                                )
                            )
                      },
                      child: Card(
                        color: Colors.white60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            fit: BoxFit.cover,
                                            image: item.resolvido
                                                ? AssetImage(
                                                    "lib/assets/checkgreen.png")
                                                : AssetImage(
                                                    "lib/assets/green.png")))),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      item.titulo,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Divider(),
                                    Text(
                                      item.toStringDate(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            background: Container(
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
