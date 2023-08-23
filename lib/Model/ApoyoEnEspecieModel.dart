class ApoyoEnEspecieModel {
  int folio;
  int claveApoyo;
  int ordenApoyo;
  String apoyo;
  String proporcionadoPor;
  int claveFrecuencia;
  int ordenFrecuencia;
  String frecuencia;
  String otro;

  String folioDisp;
  String usuario;
  String dispositivo;

  ApoyoEnEspecieModel(
      {this.folio,
      this.claveApoyo,
      this.ordenApoyo,
      this.apoyo,
      this.proporcionadoPor,
      this.claveFrecuencia,
      this.ordenFrecuencia,
      this.frecuencia,
      this.otro,
      this.dispositivo,
      this.folioDisp,
      this.usuario});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'claveApoyo': claveApoyo,
      'ordenApoyo': ordenApoyo,
      'apoyo': apoyo,
      'proporcionadoPor': proporcionadoPor,
      'claveFrecuencia': claveFrecuencia,
      'ordenFrecuencia': ordenFrecuencia,
      'frecuencia': frecuencia,
      'otro': otro,
      'dispositivo': dispositivo,
      'folioDisp': folioDisp,
      'usuario': usuario
    };
    return map;
  }

  ApoyoEnEspecieModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];

    claveApoyo = map['claveApoyo'];
    ordenApoyo = map['ordenApoyo'];
    apoyo = map['apoyo'];
    proporcionadoPor = map['proporcionadoPor'];
    claveFrecuencia = map['claveFrecuencia'];
    ordenFrecuencia = map['ordenFrecuencia'];
    frecuencia = map['frecuencia'];
    otro = map['otro'];

    dispositivo = map['dispositivo'];
    folioDisp = map['folioDisp'];
    usuario = map['usuario'];
  }
}
