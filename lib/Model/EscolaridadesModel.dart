class EscolaridadesModel{
  String escolaridad;
  String Orden;

  EscolaridadesModel({this.escolaridad, this.Orden});

  Map<String, dynamic> toMap() {
    return {
      'escolaridad': escolaridad,
      'Orden': Orden
    };
  }
  EscolaridadesModel.fromMap(Map<String, dynamic> map) {
    escolaridad = map['escolaridad'];
    Orden = map['Orden'];

  }
}