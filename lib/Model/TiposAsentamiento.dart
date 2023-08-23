class TiposAsentamiento {
  String TipoAsentamiento;
  String Orden;

  TiposAsentamiento({this.TipoAsentamiento, this.Orden});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'TipoAsentamiento': TipoAsentamiento,
      'Orden': Orden,

    };
    return map;
  }

  TiposAsentamiento.fromMap(Map<String, dynamic> map) {
    TipoAsentamiento = map['TipoAsentamiento'];
    Orden = map['Orden'];
  }

}
