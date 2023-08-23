class ServAguaModel {
  int ClaveServAgua;
  int OrdenServAgua;
  String ServAgua;
  bool value;

  ServAguaModel({this.ClaveServAgua, this.OrdenServAgua, this.ServAgua})
      : this.value = false;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ClaveServAgua': ClaveServAgua,
      'OrdenServAgua': OrdenServAgua,
      'ServAgua': ServAgua,
      'value': value,
    };
  }

  ServAguaModel.fromMap(Map<String, dynamic> map) {
    ClaveServAgua = map['ClaveServAgua'];
    OrdenServAgua = map['OrdenServAgua'];
    ServAgua = map['ServAgua'];
  }

  @override
  String toString() =>
      'ServAguaModel(ClaveServAgua: $ClaveServAgua, OrdenServAgua: $OrdenServAgua, ServAgua: $ServAgua)';
}
