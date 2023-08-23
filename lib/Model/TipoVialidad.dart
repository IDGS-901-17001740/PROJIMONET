import 'package:intl/intl.dart';

class TiposVialidad {
  String TipoVialidad;
  String Orden;

  TiposVialidad({this.TipoVialidad, this.Orden});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'TipoVialidad': TipoVialidad,
      'Orden': Orden,
    };
    return map;
  }
  TiposVialidad.fromMap(Map<String, dynamic> map) {
    TipoVialidad = map['TipoVialidad'];
    Orden = map['Orden'];
  }
}