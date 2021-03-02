import '../incidente.dart';

class DataSourceIncidente {
  final List<Incidente> _datasource = [ Incidente(titulo: "Valor Default 1 Initial Data",
      descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit Aliquam porta elementum sem, non rutrum odio iaculis sed. Donec eget libero pellentesque, feugiat leo egestas, rutrum lacus.",
      morada: "Rua Joana")];

  static DataSourceIncidente _instance;



  // apenas a propria classe pode instanciar a sua classe
  DataSourceIncidente._internal();

  static DataSourceIncidente getInstance(){
    if(_instance == null){
      _instance = DataSourceIncidente._internal();
    }
    return _instance;
  }

  void insert(operation){
      _datasource.add(operation);
  }

  List getAll() => _datasource;


}