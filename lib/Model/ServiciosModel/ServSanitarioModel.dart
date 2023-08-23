class ServSanitarioModel {
  int ClaveServSanitario;
  int OrdenServSanitario;
  String ServSanitario;
  bool value;

  ServSanitarioModel(
      {this.ClaveServSanitario, this.OrdenServSanitario, this.ServSanitario})
      : this.value = false;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ClaveServSanitario': ClaveServSanitario,
      'OrdenServSanitario': OrdenServSanitario,
      'ServSanitario': ServSanitario,
      'value': value,
    };
  }

  ServSanitarioModel.fromMap(Map<String, dynamic> map) {
    ClaveServSanitario = map['ClaveServSanitario'];
    OrdenServSanitario = map['OrdenServSanitario'];
    ServSanitario = map['ServSanitario'];
  }

  @override
  String toString() =>
      'ServSanitarioModel(ClaveServSanitario: $ClaveServSanitario, OrdenServSanitario: $OrdenServSanitario, ServSanitario: $ServSanitario)';
}
