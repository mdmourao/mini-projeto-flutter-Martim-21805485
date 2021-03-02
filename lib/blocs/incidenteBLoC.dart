import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/data/datasourceincidentes.dart';
import 'package:miniprojetoflutter21805485/incidente.dart';

class IncidenteBlocProvider{

  IncidenteBlocProvider(){
    _input.add(_content);
  }

  List<Incidente> _content = DataSourceIncidente.getInstance().getAll();
  final StreamController _controller = StreamController();

  Sink get _input => _controller.sink;

  Stream get output => _controller.stream;

  void consultaDados(){
    _content =  DataSourceIncidente.getInstance().getAll();
    _input.add(_content);
  }

  void dispose() => _controller.close();

}