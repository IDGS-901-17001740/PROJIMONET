class RemesasModel {
  int folio;
  String claveFrecuenciaApoyo;
  String ordenFrecuenciaApoyo;
  String dineroOtrosPaises;
  String frecuencia;

  String folioDisp;
  String usuario;
  String dispositivo;

  RemesasModel(
      {this.folio,
      this.claveFrecuenciaApoyo,
      this.ordenFrecuenciaApoyo,
      this.dineroOtrosPaises,
      this.frecuencia,
      this.folioDisp,
      this.dispositivo,
      this.usuario});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'claveFrecuenciaApoyo': claveFrecuenciaApoyo,
      'ordenFrecuenciaApoyo': ordenFrecuenciaApoyo,
      'dineroOtrosPaises': dineroOtrosPaises,
      'frecuencia': frecuencia,
      'folioDisp': folioDisp,
      'dispositivo': dispositivo,
      'usuario': usuario
    };
    return map;
  }

  RemesasModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    claveFrecuenciaApoyo = map['claveFrecuenciaApoyo'];
    ordenFrecuenciaApoyo = map['ordenFrecuenciaApoyo'];
    dineroOtrosPaises = map['dineroOtrosPaises'];
    frecuencia = map['frecuencia'];

    folioDisp = map['folioDisp'];
    dispositivo = map['dispositivo'];
    usuario = map['usuario'];
  }
}
