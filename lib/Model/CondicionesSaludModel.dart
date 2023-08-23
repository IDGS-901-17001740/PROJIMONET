class CondicioneSaludModel {
  String ClaveCondicionSalud;
  String Orden;
  String Ponderacion;
  String CondicionesSalud;
  bool value;

  CondicioneSaludModel(
      {this.ClaveCondicionSalud,
      this.Orden,
      this.Ponderacion,
      this.CondicionesSalud,
      this.value = false});

  Map<String, dynamic> toMap() {
    return {
      'Orden': Orden,
      'Ponderacion': Ponderacion,
      'CondicionesSalud': CondicionesSalud,
      'ClaveCondicionesSalud': ClaveCondicionSalud
    };
  }

  CondicioneSaludModel.fromMap(Map<String, dynamic> map) {
    Orden = map['Orden'];
    Ponderacion = map['Ponderacion'];
    CondicionesSalud = map['CondicionesSalud'];
    ClaveCondicionSalud = map['ClaveCondicionesSalud'];
  }

  @override
  String toString() {
    //return '$Orden,$Ponderacion;$CondicionesSalud';
    return '$CondicionesSalud';
  }
}
