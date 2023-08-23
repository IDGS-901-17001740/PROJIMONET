class Estados {
  int ClaveEstado;

  String Estado;

  Estados(this.ClaveEstado, this.Estado);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'ClaveEstado': ClaveEstado,
      'Estado':Estado
    };
    return map;
  }

  Estados.fromMap(Map<String, dynamic> map) {
    ClaveEstado = map['ClaveEstado'];
    Estado = map['Estado'];

  }
}