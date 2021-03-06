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
        appBar: AppBar(title: Text(incidente.titulo)),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.black12,
                      child: Text(
                        "Título",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        incidente.titulo,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.black12,
                      child: Text(
                        "Descrição",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        incidente.descricao,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.black12,
                      child: Text(
                        "Morada",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        incidente.morada.length == 0
                            ? "Sem morada definida"
                            : incidente.morada,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.black12,
                      child: Text(
                        "Data",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        incidente.toStringDate(),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.black12,
                      child: Text(
                        "Estado",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "lib/assets/close.png")))),
                            Text(
                              "Fechado",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text(incidente.titulo)),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.black12,
                      child: Text(
                        "Título",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        incidente.titulo,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.black12,
                      child: Text(
                        "Descrição",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        incidente.descricao,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.black12,
                      child: Text(
                        "Morada",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        incidente.morada.length == 0
                            ? "Sem morada definida"
                            : incidente.morada,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.black12,
                      child: Text(
                        "Data",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        incidente.toStringDate(),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.black12,
                      child: Text(
                        "Estado",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: incidente.resolvido
                                            ? AssetImage(
                                                "lib/assets/checkgreen.png")
                                            : AssetImage(
                                                "lib/assets/green.png")))),
                            Text(
                              incidente.resolvido ? "Resolvido" : "Aberto",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        )),
                  ),
                  Divider(),
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
                        onPressed: () {
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
                ],
              ),
            ),
          ),
        ),
      );
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
      title: Text("Mensagem"),
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
