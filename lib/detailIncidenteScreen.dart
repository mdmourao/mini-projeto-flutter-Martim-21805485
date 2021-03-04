import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'incidente.dart';

class DetailIncidenteScreen extends StatelessWidget {
  Incidente incidente;

  DetailIncidenteScreen({this.incidente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(incidente.titulo)),
      body: Padding(
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
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35),
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
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35),
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
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35),
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
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35),
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
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text(
                          incidente.resolvido ? "Resolvido" : "Aberto",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                            width: 25.0,
                            height: 25.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: incidente.resolvido
                                        ? AssetImage("lib/assets/checkgreen.png")
                                        : AssetImage("lib/assets/green.png")))),
                      ],
                    )),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
