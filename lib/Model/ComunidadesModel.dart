class ComunidadesModel {
  int pk_Comunidad;
  int orden_Comunidad;
  String Comunidad;

  ComunidadesModel({this.pk_Comunidad, this.Comunidad, this.orden_Comunidad});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'pk_Comunidad': pk_Comunidad,
      'Comunidad': Comunidad,
      'orden_Comunidad': orden_Comunidad
    };
    return map;
  }

  ComunidadesModel.fromMap(Map<String, dynamic> map) {
    pk_Comunidad = map['pk_Comunidad'];
    Comunidad = map['Comunidad'];
    orden_Comunidad = map['orden_Comunidad'];
  }
}
