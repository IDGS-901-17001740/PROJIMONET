class DocumentosModel {
  int folio;
  String curp;
  String actaNacimiento;
  String comprobanteDomicilio;
  String ine;

  String folioDisp;
  String usuario;
  String dispositivo;

  DocumentosModel(
      {this.folio,
      this.curp,
      this.actaNacimiento,
      this.comprobanteDomicilio,
      this.ine,
      this.folioDisp,
      this.dispositivo,
      this.usuario});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'curp': curp,
      'actaNacimiento': actaNacimiento,
      'comprobanteDomicilio': comprobanteDomicilio,
      'ine': ine,
      'folioDisp': folioDisp,
      'dispositivo': dispositivo,
      'usuario': usuario
    };
    return map;
  }

  DocumentosModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    curp = map['curp'];
    actaNacimiento = map['actaNacimiento'];
    comprobanteDomicilio = map['comprobanteDomicilio'];
    ine = map['ine'];

    folioDisp = map['folioDisp'];
    dispositivo = map['dispositivo'];
    usuario = map['usuario'];
  }
}
