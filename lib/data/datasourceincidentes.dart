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

  void shake(){
    var rng = new Random();
    var i = rng.nextInt(_datasource.length);
    _datasource.elementAt(i).resolvido = true;
  }

  List getAll() => _datasource;


}