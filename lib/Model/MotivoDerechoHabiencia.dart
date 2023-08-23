class MotivoDerechoHabienciasModel{
  String motivoDerechoHabiencia;
  String Orden;

  MotivoDerechoHabienciasModel({this.motivoDerechoHabiencia, this.Orden});

  Map<String, dynamic> toMap() {
    return {
      'escolaridad': motivoDerechoHabiencia,
      'Orden' : Orden

    };
  }
  MotivoDerechoHabienciasModel.fromMap(Map<String, dynamic> map) {
    motivoDerechoHabiencia = map['motivoDerechoHabiencia'];
    Orden = map['Orden'];
  }
}