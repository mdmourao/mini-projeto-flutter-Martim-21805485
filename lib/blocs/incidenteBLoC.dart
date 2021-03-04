import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/blocs/incidenteBLoCFechado.dart';
import 'package:miniprojetoflutter21805485/data/datasourceincidentes.dart';
import 'package:miniprojetoflutter21805485/data/datasourceincidentesFechados..dart';
import 'package:miniprojetoflutter21805485/incidente.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math';

class IncidenteBlocProvider{

  static IncidenteBlocProvider _instance;
  List<Incidente> _content = DataSourceIncidente.getInstance().getAll();
  StreamController _controller = BehaviorSubject();
  Sink get _input => _controller.sink;
  Stream get output => _controller.stream;

  IncidenteBlocProvider._internal(){
    _input.add(_content);
  }

  static IncidenteBlocProvider getInstance(){
    if(_instance == null){
      _instance = IncidenteBlocProvider._internal();
    }
    return _instance;
  }

  void insereDados(i){
    DataSourceIncidente.getInstance().insert(i);
    _content = DataSourceIncidente.getInstance().getAll();
    _input.add(_content);
  }

  void confirmUpdate(){
    _content = DataSourceIncidente.getInstance().getAll();
    _input.add(_content);
  }

  void remove(i){
    DataSourceIncidente.getInstance().remove(i);
    IncidenteBlocFechadoProvider.getInstance().insereDados(i);
    _content = DataSourceIncidente.getInstance().getAll();
    _input.add(_content);
  }

  void shake(){
      DataSourceIncidente.getInstance().shake();
      confirmUpdate();
  }

  void dispose() => _controller.close();
}

