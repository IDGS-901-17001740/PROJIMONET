class FrecuenciaModel {
  String Frecuencia;
  int OrdenFrecuencia;
  int ClaveFrecuencia;

  FrecuenciaModel(
      {this.Frecuencia, this.OrdenFrecuencia, this.ClaveFrecuencia});

  Map<String, dynamic> toMap() {
    return {
      'Frecuencia': Frecuencia,
      'OrdenFrecuencia': OrdenFrecuencia,
      'ClaveFrecuencia': ClaveFrecuencia
    };
  }

  FrecuenciaModel.fromMap(Map<String, dynamic> map) {
    Frecuencia = map['Frecuencia'];
    OrdenFrecuencia = map['OrdenFrecuencia'];
    ClaveFrecuencia = map['ClaveFrecuencia'];
  }
}
