class DerechoHabienciasModel{
  String derechoHabiencia;
  String Orden;

  DerechoHabienciasModel({this.derechoHabiencia, this.Orden});

  Map<String, dynamic> toMap() {
    return {
      'escolaridad': derechoHabiencia,
      'Orden' : Orden
    };
  }
  DerechoHabienciasModel.fromMap(Map<String, dynamic> map) {
    derechoHabiencia = map['derechoHabiencia'];
    Orden = map['Orden'];

  }
}