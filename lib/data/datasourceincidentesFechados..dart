import '../incidente.dart';
import 'dart:math';

class DataSourceIncidenteFechado {
  final List<Incidente> _datasource = [
    Incidente(titulo: "Buraco Enorme na Estrada",
        descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempus leo vitae libero euismod pretium. ",
        morada: "Rua Joana", resolvido: true),
  ];

  static DataSourceIncidenteFechado _instance;

  DataSourceIncidenteFechado._internal(){}

  static DataSourceIncidenteFechado getInstance(){
    if(_instance == null){
      _instance = DataSourceIncidenteFechado._internal();
    }
    return _instance;
  }

  void insert(i){
    _datasource.add(i);
  }

  void remove(Incidente inc){
    for(var i = 0; i < _datasource.length; i++){
      if(inc.id == _datasource[i].id){
        _datasource.removeAt(i);
      }
    }
  }

  List getAll() => _datasource;


}