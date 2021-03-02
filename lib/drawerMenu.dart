import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/incidentesFechadosScreen.dart';
import 'package:miniprojetoflutter21805485/main.dart';

import 'incidentesAbertosScreen.dart';

class DrawMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.fitWidth,image:  AssetImage('lib/assets/manutencao.png'))
            ), child: null,
          ),
          ListTile(
            leading: Icon(Icons.ballot_outlined),
            title: Text(
              'Incidentes Abertos e Resolvidos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IncidentesAbertosScreen(),
                  )
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.assignment_outlined),
            title: Text(
              'Incidentes Fechados',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IncidentesFechadosScreen(),
                  )
              );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}