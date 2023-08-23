class ResolucionModel {
  int folio;
  String puntaje;
  String escalaNecesidad;
  String inseguridadAlimenticia;
  String clasificacionPobresa;

  String folioDisp;
  String usuario;
  String dispositivo;

  ResolucionModel(
      {this.folio,
      this.puntaje,
      this.escalaNecesidad,
      this.inseguridadAlimenticia,
      this.clasificacionPobresa,
      this.folioDisp,
      this.dispositivo,
      this.usuario});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'puntaje': puntaje,
      'escalaNecesidad': escalaNecesidad,
      'inseguridadAlimenticia': inseguridadAlimenticia,
      'clasificacionPobresa': clasificacionPobresa,
      'folioDisp': folioDisp,
      'dispositivo': dispositivo,
      'usuario': usuario
    };
    return map;
  }

  ResolucionModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    puntaje = map['puntaje'];
    escalaNecesidad = map['escalaNecesidad'];
    inseguridadAlimenticia = map['inseguridadAlimenticia'];
    clasificacionPobresa = map['clasificacionPobresa'];

    folioDisp = map['folioDisp'];
    dispositivo = map['dispositivo'];
    usuario = map['usuario'];
  }
}
