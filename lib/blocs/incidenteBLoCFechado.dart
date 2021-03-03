import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miniprojetoflutter21805485/data/datasourceincidentesFechados..dart';
import 'package:miniprojetoflutter21805485/incidente.dart';
import 'package:rxdart/rxdart.dart';


class IncidenteBlocFechadoProvider{

  List<Incidente> _content = DataSourceIncidenteFechado.getInstance().getAll();
  StreamController _controller = BehaviorSubject();
  Sink get _input => _controller.sink;
  Stream get output => _controller.stream;
  static IncidenteBlocFechadoProvider _instance;

  IncidenteBlocFechadoProvider._internal(){
    _input.add(_content);
  }

  static IncidenteBlocFechadoProvider getInstance(){
    if(_instance == null){
      _instance = IncidenteBlocFechadoProvider._internal();
    }
    return _instance;
  }

  void insereDados(i){
    DataSourceIncidenteFechado.getInstance().insert(i);
    _content = DataSourceIncidenteFechado.getInstance().getAll();
    _input.add(_content);
  }

  void confirmUpdate(){
    _content = DataSourceIncidenteFechado.getInstance().getAll();
    _input.add(_content);
  }

  void remove(i){
    DataSourceIncidenteFechado.getInstance().remove(i);
    _content = DataSourceIncidenteFechado.getInstance().getAll();
    _input.add(_content);
  }

  void dispose() => _controller.close();

}

