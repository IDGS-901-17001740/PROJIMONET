class integrante_condicionModel {
  String folio;
  String folioDisp;
  String pk_condicion;
  String usuario;
  String orden_Integrante;
  String dispositivo;
  String ponderacion;

  integrante_condicionModel(
      {this.folio,
      this.folioDisp,
      this.pk_condicion,
      this.usuario,
      this.orden_Integrante,
      this.dispositivo,
      this.ponderacion});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'folio': folio,
      'folioDisp': folioDisp,
      'pk_condicion': pk_condicion,
      'usuario': usuario,
      'orden_Integrante': orden_Integrante,
      'dispositivo': dispositivo,
      'ponderacion': ponderacion
    };
  }

  integrante_condicionModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    folioDisp = map['folioDisp'];
    pk_condicion = map['pk_condicion'];
    usuario = map['usuario'];
    orden_Integrante = map['orden_Integrante'];
    dispositivo = map['dispositivo'];
    ponderacion = map['ponderacion'];
  }

  @override
  String toString() {
    return 'integrante_condicionModel(folio: $folio, folioDisp: $folioDisp, pk_condicion: $pk_condicion, usuario: $usuario, orden_Integrante: $orden_Integrante)';
  }
}
