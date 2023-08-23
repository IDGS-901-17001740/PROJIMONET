  class OcupacionesModel {
  String ocupacion;
  String Orden;

  OcupacionesModel({this.ocupacion, this.Orden});

  Map<String, dynamic> toMap() {
    return {
      'grado': ocupacion,
      'Orden': Orden
    };
  }
  OcupacionesModel.fromMap(Map<String, dynamic> map) {
    ocupacion = map['ocupacion'];
    Orden = map['Orden'];
  }
}