class integrante_clasificacionModel {
  String folio;
  String folioDisp;
  String pk_clasificacion;
  String usuario;
  String orden_integrante;
  String dispositivo;

  integrante_clasificacionModel(
      {this.folio,
      this.folioDisp,
      this.pk_clasificacion,
      this.usuario,
      this.orden_integrante,
      this.dispositivo});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'folio': folio,
      'folioDisp': folioDisp,
      'pk_clasificacion': pk_clasificacion,
      'usuario': usuario,
      'orden_integrante': orden_integrante,
      'dispositivo': dispositivo
    };
  }

  integrante_clasificacionModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    folioDisp = map['folioDisp'];
    pk_clasificacion = map['pk_clasificacion'];
    usuario = map['usuario'];
    orden_integrante = map['orden_integrante'];
    dispositivo = map['dispositivo'];
  }

  @override
  String toString() {
    return 'integrante_clasificacionModel(folio: $folio, folioDisp: $folioDisp, pk_clasificacion: $pk_clasificacion, usuario: $usuario, orden_integrante: $orden_integrante)';
  }
}
