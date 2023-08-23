class ServBanoModel {
  int pk_bano;
  int int_orden_bano;
  String txt_desc_bano;
  String otroBano;

  bool value;
  ServBanoModel(
      {this.pk_bano, this.int_orden_bano, this.txt_desc_bano, this.otroBano})
      : value = false;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pk_bano': pk_bano,
      'int_orden_bano': int_orden_bano,
      'txt_desc_bano': txt_desc_bano,
      'otroBano': otroBano,
      'value': value,
    };
  }

  ServBanoModel.fromMap(Map<String, dynamic> map) {
    pk_bano = map['pk_bano'];
    int_orden_bano = map['int_orden_bano'];
    txt_desc_bano = map['txt_desc_bano'];
    otroBano = map['otroBano'];
  }

  @override
  String toString() {
    return 'ServBanoModel(pk_bano: $pk_bano, int_orden_bano: $int_orden_bano, txt_desc_bano: $txt_desc_bano)';
  }
}
