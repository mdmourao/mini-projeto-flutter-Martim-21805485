import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/drawerMenu.dart';
import 'package:miniprojetoflutter21805485/incidente.dart';
import 'package:miniprojetoflutter21805485/incidentesAbertosScreen.dart';

import 'blocs/incidenteBLoC.dart';
import 'data/datasourceincidentes.dart';
import 'main.dart';

class FormularioScreen extends StatelessWidget {
  Incidente i = null;

  FormularioScreen({this.i});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário Incidente")),
      body: myForm(this.i),
    );
  }
}

class myForm extends StatefulWidget {
  Incidente i = null;

  myForm(this.i);

  @override
  _myFormState createState() {
    return _myFormState(this.i);
  }
}

class _myFormState extends State<myForm> {
  Incidente i = null;

  _myFormState(this.i) {
    if (i != null) {
      tituloController = TextEditingController(text: i.titulo);
      descricaoController = TextEditingController(text: i.descricao);
      if (i.morada.isNotEmpty || i.morada == "") {
        moradaController = TextEditingController(text: i.morada);
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController moradaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ListView(children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Criação Incidente",
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Título*",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  TextFormField(
                    controller: tituloController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Buraco na Estrada',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Título é obrigatório';
                      }
                      if (value.length > 25) {
                        return 'Título não pode exceder os 25 caracteres';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Descrição*",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  TextFormField(
                    controller: descricaoController,
                    decoration: const InputDecoration(
                      hintText:
                          'Existe um buraco na estrada. Este buraco tem aproximadamente 50cm. Existe alguma urgência na sua reparação visto que os carros tem de fazer um desvio. Buraco aconteceu por causa da raiz de uma arvore.',
                    ),
                    maxLines: 5,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Descrição é obrigatório';
                      }
                      if (value.length < 100 || value.length > 200) {
                        return 'Descrição têm que ter entre 100 a 200 caracteres';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Morada",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  TextFormField(
                    controller: moradaController,
                    decoration: const InputDecoration(
                      hintText: 'Rua dos Olivais Nº50, perto do café Olivia',
                    ),
                    validator: (value) {
                      if (value.length > 60) {
                        return 'Morada não pode exceder os 60 caracteres';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  ButtonTheme(
                    minWidth: 100.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          if (i == null) {
                            IncidenteBlocProvider.getInstance().insereDados(
                                Incidente(
                                    titulo: tituloController.text,
                                    descricao: descricaoController.text,
                                    morada: moradaController.text));
                          } else {
                            i.titulo = tituloController.text;
                            i.descricao = descricaoController.text;
                            i.morada = moradaController.text;
                            IncidenteBlocProvider.getInstance().updateDados(i);
                          }
                          showAlertDialog1(context);
                        }
                      },
                      child: Text(
                        'Submeter',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ]))),
      ],
    );
  }


  showAlertDialog1(BuildContext context)
  {
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
      content: Text(i == null ? "O seu incidente foi submetido com sucesso." : "O seu incidente foi editado com sucesso."),
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
