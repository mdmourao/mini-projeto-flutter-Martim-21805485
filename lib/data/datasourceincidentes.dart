import 'dart:io';

import '../incidente.dart';
import 'dart:math';

class DataSourceIncidente {
  final List<Incidente> _datasource = [
    Incidente(titulo: "Buraco na Estrada",
      descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit Aliquam porta elementum sem, non rutrum odio iaculis sed. Donec eget libero pellentesque, feugiat leo egestas, rutrum lacus.",
      morada: "Rua Joana"),
    Incidente(titulo: "Caiu Poste Eletricidade",
        descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit Aliquam porta elementum sem, non rutrum odio iaculis sed. Donec eget libero pellentesque, feugiat leo egestas, rutrum lacus.",
        morada: "Rua Joana",resolvido: true),
    Incidente(titulo: "Fuga Esgotos na Estrada",
        descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit Aliquam porta elementum sem, non rutrum odio iaculis sed. Donec eget libero pellentesque, feugiat leo egestas, rutrum lacus.",
        morada: "Rua Joana"),
    Incidente(titulo: "Jardim com Lixo",
        descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit Aliquam porta elementum sem, non rutrum odio iaculis sed. Donec eget libero pellentesque, feugiat leo egestas, rutrum lacus.",
        morada: "Rua Joana"),
  ];

  static DataSourceIncidente _instance;



  // apenas a propria classe pode instanciar a sua classe
  DataSourceIncidente._internal(){}

  static DataSourceIncidente getInstance(){
    if(_instance == null){
      _instance = DataSourceIncidente._internal();
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

  void resolveIncidente(){
    var rng = new Random();
    int count = 0;
    var allPos = [];
    for(int i = 0; i < _datasource.length; i++){
      if (_datasource.elementAt(i).resolvido == false){
        allPos.add(i);
      }
    }
    var random = rng.nextInt(allPos.length);
    if(allPos.length == 0){
      return;
    }
    _datasource.elementAt(allPos.elementAt(random)).resolvido = true;
  }

  List getAll() => _datasource;


}