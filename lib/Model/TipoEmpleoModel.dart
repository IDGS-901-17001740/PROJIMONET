class TipoEmpleoModel {
  String TipoEmpleo;
  String Orden;

  TipoEmpleoModel({this.TipoEmpleo, this.Orden});

  Map<String, dynamic> toMap() {
    return {'TipoEmpleo': TipoEmpleo, 'Orden': Orden};
  }

  TipoEmpleoModel.fromMap(Map<String, dynamic> map) {
    TipoEmpleo = map['TipoEmpleo'];
    Orden = map['Orden'];
  }
}
