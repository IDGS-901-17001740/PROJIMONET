class Municipios {
  String Municipio;

  Municipios({this.Municipio});

  Map<String, dynamic> toMap() {
    return {
      'Municipio': Municipio
    };
  }

  Municipios.fromMap(Map<String, dynamic> map) {
    Municipio = map['Municipio'];

  }
}