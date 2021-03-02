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
  final IncidenteBlocProvider incidenteBlocProvider;

  FormularioScreen({this.incidenteBlocProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário Incidente")),
      body: myForm(incidenteBlocProvider: incidenteBlocProvider,),
    );
  }
}

class myForm extends StatefulWidget {

  final IncidenteBlocProvider incidenteBlocProvider;

  myForm({this.incidenteBlocProvider});

  @override
  myFormState createState() {
    return myFormState(incidenteBlocProvider: incidenteBlocProvider);
  }
}

class myFormState extends State<myForm> {
  final IncidenteBlocProvider incidenteBlocProvider;

  myFormState({this.incidenteBlocProvider});


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
                          DataSourceIncidente.getInstance().insert(Incidente(
                              titulo: tituloController.text,
                              descricao: descricaoController.text,
                              morada: moradaController.text));
                          incidenteBlocProvider.consultaDados();
                          Navigator.push(

                              context,
                              MaterialPageRoute(
                                builder: (context) => MyApp(),
                              )
                          );
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
}
