class GradosEscolaresModel {
  String grado;
  String Orden;

  GradosEscolaresModel({this.grado, this.Orden});

  Map<String, dynamic> toMap() {
    return {
      'grado': grado,
      'Orden': Orden
    };
  }
  GradosEscolaresModel.fromMap(Map<String, dynamic> map) {
    grado = map['grado'];
    Orden = map['Orden'];
  }
}