import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/blocs/incidenteBLoC.dart';
import 'package:miniprojetoflutter21805485/formularioScreen.dart';
import 'package:miniprojetoflutter21805485/incidentesAbertosScreen.dart';

import 'incidente.dart';

class DetailIncidenteScreen extends StatelessWidget {
  Incidente incidente;
  bool isClosed;

  DetailIncidenteScreen({this.incidente, this.isClosed = false});

  @override
  Widget build(BuildContext context) {
    if (isClosed) {
      return Scaffold(
          appBar: AppBar(title: Text("Detalhes")),
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 170.0,
                width: double.infinity,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //Center Row contents vertically,
                      children: [
                        Expanded(
                          child: Text(
                            incidente.titulo,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //Center Row contents vertically,
                      children: [
                        Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("lib/assets/close.png"))),
                        ),
                        Text(
                          "Fechado",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //Center Row contents vertically,
                      children: [Text("Criado a: " + incidente.toStringDate(),  style: TextStyle(fontSize: 15,color: Colors.white),)],
                    ),
                  ],
                )),
                decoration: new BoxDecoration(
                  color: Colors.blueGrey,
                  boxShadow: [new BoxShadow(blurRadius: 40.0)],
                  borderRadius: new BorderRadius.vertical(
                      bottom: new Radius.elliptical(
                          MediaQuery.of(context).size.width, 100.0)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
              ),
              Stack(children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 220,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  padding: EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              " Descrição:",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              incidente.descricao,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ))
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 4),
                    borderRadius: BorderRadius.circular(15),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ]),
              Stack(children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 100,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  padding: EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              " Morada:",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(6),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              incidente.morada.isEmpty
                                  ? "Sem Morada"
                                  : incidente.morada,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ))
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 4),
                    borderRadius: BorderRadius.circular(15),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ]),
            ]),
          ));
    } else {
      return Scaffold(
          appBar: AppBar(title: Text(incidente.titulo)),
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 170.0,
                width: double.infinity,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //Center Row contents vertically,
                      children: [
                        Expanded(
                          child: Text(
                            incidente.titulo,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                            color: Colors.white,fontSize: 30),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //Center Row contents vertically,
                      children: [
                        Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: incidente.resolvido
                                      ? AssetImage("lib/assets/checkgreen.png")
                                      : AssetImage("lib/assets/green.png"))),
                        ),
                        Text(
                          incidente.resolvido ? " Resolvido" : " Aberto",
                          style: TextStyle(fontSize: 15,color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //Center Row contents vertically,
                      children: [Text("Criado a: " + incidente.toStringDate(),  style: TextStyle(fontSize: 15,color: Colors.white),)],
                    ),
                  ],
                )),
                decoration: new BoxDecoration(
                  color: Colors.blueGrey,
                  boxShadow: [new BoxShadow(blurRadius: 40.0)],
                  borderRadius: new BorderRadius.vertical(
                      bottom: new Radius.elliptical(
                          MediaQuery.of(context).size.width, 100.0)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2),
              ),
              Stack(children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 220,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  padding: EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              " Descrição:",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              incidente.descricao,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ))
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 4),
                    borderRadius: BorderRadius.circular(15),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ]),
              Stack(children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 100,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              " Morada:",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(6),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              incidente.morada.isEmpty
                                  ? "Sem Morada"
                                  : incidente.morada,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ))
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 4),
                    borderRadius: BorderRadius.circular(15),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center,
                //Center Row contents vertically,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: incidente.resolvido ? null : () {
                      IncidenteBlocProvider.getInstance().remove(incidente);
                      showAlertDialog(context);
                    },
                    icon: Icon(Icons.delete, size: 25),
                    label: Text("APAGAR"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormularioScreen(
                              i: incidente,
                            ),
                          ));
                    },
                    icon: Icon(Icons.edit, size: 25),
                    label: Text("EDITAR"),
                  ),
                ],
              )
            ]),
          ));
    }
  }

  showAlertDialog(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IncidentesAbertosScreen(),
            ));
      },
    );

    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Mensagem De Sucesso"),
      content: Text("O seu incidente foi apagado com sucesso."),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
