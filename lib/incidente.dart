import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class Incidente{
  String id;
  String titulo;
  String descricao;
  String morada = "";
  bool resolvido = false;
  DateTime date = DateTime.now();

  Incidente({this.titulo,this.descricao,this.morada,this.resolvido = false}){
    var uuid = Uuid();
    id = uuid.v1();
  }

  String toStringDate(){
      return DateFormat('dd-MM-yyyy  kk:mm').format(date);
  }


}