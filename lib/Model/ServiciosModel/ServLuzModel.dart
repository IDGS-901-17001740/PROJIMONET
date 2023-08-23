class ServLuzModel {
  int ClaveServLuz;
  int OrdenServLuz;
  String ServLuz;
  bool value;
  ServLuzModel({this.ClaveServLuz, this.OrdenServLuz, this.ServLuz})
      : this.value = false;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ClaveServLuz': ClaveServLuz,
      'OrdenServLuz': OrdenServLuz,
      'ServLuz': ServLuz,
      'value': value,
    };
  }

  ServLuzModel.fromMap(Map<String, dynamic> map) {
    ClaveServLuz = map['ClaveServLuz'];
    OrdenServLuz = map['OrdenServLuz'];
    ServLuz = map['ServLuz'];
  }

  @override
  String toString() {
    return 'ServLuzModel(ClaveServLuz: $ClaveServLuz, OrdenServLuz: $OrdenServLuz, ServLuz: $ServLuz)';
  }
}
