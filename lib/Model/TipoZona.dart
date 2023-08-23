class TipoZona{
  String tipoZona;



  TipoZona({this.tipoZona});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'tipoZona': tipoZona,
    };
    return map;
  }

  TipoZona.fromMap(Map<String, dynamic> map) {
    tipoZona = map['tipoZona'];
  }
}