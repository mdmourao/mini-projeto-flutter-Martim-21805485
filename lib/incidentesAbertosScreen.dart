import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/detailIncidenteScreen.dart';
import 'package:miniprojetoflutter21805485/drawerMenu.dart';
import 'package:miniprojetoflutter21805485/formularioScreen.dart';
import 'package:volume_watcher/volume_watcher.dart';
import 'blocs/incidenteBLoC.dart';
import 'incidente.dart';
import 'package:shake/shake.dart';
import 'package:flutter/material.dart';
import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;

class IncidentesAbertosScreen extends StatelessWidget {


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
            confirmDismiss: (direction) async {
              if (item.resolvido) {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("O seu incidente foi dado como fechado.")));
                return true;
              } else{
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("Este incidente ainda não se encontra resolvido, por isso não pode transitar para a lista dos fechados.")));
                return false;
              }
            },
            onDismissed: (direction) {
              IncidenteBlocProvider.getInstance().close(item);

            },
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onDoubleTap: () =>  {
                            IncidenteBlocProvider.getInstance().resolveIncidente()
                      },
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
                              RawMaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailIncidenteScreen(incidente: item,),
                                      )
                                  );
                                },
                                elevation: 5.0,
                                fillColor: Colors.lightBlue,
                                child: Icon(
                                  Icons.more_horiz_outlined,
                                  color: Colors.white,
                                  size: 25.0,
                                ),
                                padding: EdgeInsets.all(1.0),
                                shape: CircleBorder(),
                              )
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
