import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/blocs/incidenteBLoCFechado.dart';
import 'package:miniprojetoflutter21805485/drawerMenu.dart';
import 'detailIncidenteScreen.dart';
import 'incidente.dart';
import 'package:shake/shake.dart';

class IncidentesFechadosScreen extends StatelessWidget {
  IncidentesFechadosScreen() {
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      //TODO
      //IncidenteBlocProvider.getInstance().shake();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Incidentes Fechados")),
        body: StreamBuilder(
          initialData: [Incidente(titulo: "Teste")],
          stream: IncidenteBlocFechadoProvider.getInstance().output,
          builder: (BuildContext context, snapshot) =>
              ListaIncidente(content: snapshot.data),
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
              "Sem Incidentes Fechados de momento, pode fechar incidentes com um swipe nos incidentes que deseja fechar!"),
        ),
      );
    }
    return Container(
      child: ListView.builder(
        itemCount: content.length,
        itemBuilder: (context, index) {
          final item = content[index];
          return Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailIncidenteScreen(
                              incidente: item, isClosed: true,
                            ),
                          ))
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
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "lib/assets/close.png")))),
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
                                      builder: (context) => DetailIncidenteScreen(incidente: item,isClosed: true,),
                                    )
                                );
                              },
                              elevation: 5.0,
                              fillColor: Colors.blueGrey,
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
          );
        },
      ),
    );
  }
}
