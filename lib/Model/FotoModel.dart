class FotoModel {
  int folio;
  String fileFoto;

  String folioDisp;
  String usuario;
  String dispositivo;

  String firma;

  FotoModel(
      {this.folio,
      this.fileFoto,
      this.folioDisp,
      this.dispositivo,
      this.usuario,
      this.firma});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'fileFoto': fileFoto,
      'folioDisp': folioDisp,
      'dispositivo': dispositivo,
      'usuario': usuario,
      'firma': firma
    };
    return map;
  }

  FotoModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    fileFoto = map['fileFoto'];

    folioDisp = map['folioDisp'];
    dispositivo = map['dispositivo'];
    usuario = map['usuario'];
    firma = map['firma'];
  }
}
