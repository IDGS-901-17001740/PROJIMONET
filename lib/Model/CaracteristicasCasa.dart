class CaracteristicasCasa {
  int folio;
  String numCuartos;
  String cuartosDormir;
  String cocinaSeparada;
  String cuartoBanioExclusivo;

  String folioDisp;
  String usuario;
  String dispositivo;

  CaracteristicasCasa(
      {this.folio,
      this.numCuartos,
      this.cuartosDormir,
      this.cocinaSeparada,
      this.cuartoBanioExclusivo,
      this.folioDisp,
      this.dispositivo,
      this.usuario});

  Map<String, dynamic> toMap() {
    return {
      'folio': folio,
      'numCuartos': numCuartos,
      'cuartosDormir': cuartosDormir,
      'cocinaSeparada': cocinaSeparada,
      'cuartoBanioExclusivo': cuartoBanioExclusivo,
      'folioDisp': folioDisp,
      'dispositivo': dispositivo,
      'usuario': usuario
    };
  }

  CaracteristicasCasa.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    numCuartos = map['numCuartos'];
    cuartosDormir = map['cuartosDormir'];
    cocinaSeparada = map['cocinaSeparada'];
    cuartoBanioExclusivo = map['cuartoBanioExclusivo'];

    folioDisp = map['folioDisp'];
    dispositivo = map['dispositivo'];
    usuario = map['usuario'];
  }
}
