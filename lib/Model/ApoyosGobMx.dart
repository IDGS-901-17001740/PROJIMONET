class ApoyosGobMx{
  int ClaveApoyo;
  int OrdenApoyo;
  String Apoyo;
  String ProporcionadoPor;

  ApoyosGobMx({this.ClaveApoyo, this.OrdenApoyo, this.Apoyo, this.ProporcionadoPor});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'ClaveApoyo': ClaveApoyo,
      'OrdenApoyo': OrdenApoyo,
      'Frecuencia': Apoyo,
      'ProporcionadoPor': ProporcionadoPor,

    };
    return map;
  }
  ApoyosGobMx.fromMap(Map<String, dynamic> map) {
    ClaveApoyo = map['ClaveApoyo'];
    OrdenApoyo = map['OrdenApoyo'];
    Apoyo = map['Apoyo'];
    ProporcionadoPor = map['ProporcionadoPor'];

  }
}