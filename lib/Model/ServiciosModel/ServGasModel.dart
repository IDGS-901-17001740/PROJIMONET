class ServGasModel {
  int ClaveServGas;
  int OrdenServGas;
  String ServGas;
  bool value;
  ServGasModel({this.ClaveServGas, this.OrdenServGas, this.ServGas})
      : this.value = false;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ClaveServGas': ClaveServGas,
      'OrdenServGas': OrdenServGas,
      'ServGas': ServGas,
      'value': value,
    };
  }

  ServGasModel.fromMap(Map<String, dynamic> map) {
    ClaveServGas = map['ClaveServGas'];
    OrdenServGas = map['OrdenServGas'];
    ServGas = map['ServGas'];
  }

  @override
  String toString() {
    return 'ServGasModel(ClaveServGas: $ClaveServGas, OrdenServGas: $OrdenServGas, ServGas: $ServGas)';
  }
}
