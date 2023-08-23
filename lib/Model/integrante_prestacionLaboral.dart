class integrante_prestacionLaboralModel {
  String folio;
  String folioDisp;
  String pk_prestacionLaboral;
  String usuario;
  String orden_Integrante;
  String dispositivo;

  integrante_prestacionLaboralModel(
      {this.folio,
      this.folioDisp,
      this.pk_prestacionLaboral,
      this.usuario,
      this.orden_Integrante,
      this.dispositivo});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'folio': folio,
      'folioDisp': folioDisp,
      'pk_prestacionLaboral': pk_prestacionLaboral,
      'usuario': usuario,
      'orden_Integrante': orden_Integrante,
      'dispositivo': dispositivo
    };
  }

  integrante_prestacionLaboralModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    folioDisp = map['folioDisp'];
    pk_prestacionLaboral = map['pk_prestacionLaboral'];
    usuario = map['usuario'];
    orden_Integrante = map['orden_Integrante'];
    dispositivo = map['dispositivo'];
  }

  @override
  String toString() {
    return 'integrante_prestacionLaboralModel(folio: $folio, folioDisp: $folioDisp, pk_prestacionLaboral: $pk_prestacionLaboral, usuario: $usuario, orden_Integrante: $orden_Integrante)';
  }
}
