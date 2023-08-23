class CapacidadesDiferentes {
  String Orden;
  String CapacidadDiferente;

  CapacidadesDiferentes({this.Orden, this.CapacidadDiferente});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{

      'Orden': Orden,
      'CapacidadDiferente': CapacidadDiferente,

    };
    return map;
  }
  CapacidadesDiferentes.fromMap(Map<String, dynamic> map) {
    Orden = map['Orden'];
    CapacidadDiferente = map['CapacidadDiferente'];

  }
}