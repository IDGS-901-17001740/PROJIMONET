class CodigoPostalModel {
  int ClaveCP;
  String Asentamiento;
  String TipoAsentamiento;
  String Municipio;
  String Estado;
  String Ciudad;
  int ClaveEstado;
  int Clavetipo_asenta;
  int ClaveMunicipio;
  String TipoZona;
  int ClaveCiudad;

  CodigoPostalModel(
      {this.ClaveCP,
      this.Asentamiento,
      this.TipoAsentamiento,
      this.Municipio,
      this.Estado,
      this.Ciudad,
      this.ClaveEstado,
      this.Clavetipo_asenta,
      this.ClaveMunicipio,
      this.TipoZona,
      this.ClaveCiudad});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'ClaveCP': ClaveCP,
      'Asentamiento': Asentamiento,
      'TipoAsentamiento': TipoAsentamiento,
      'Municipio': Municipio,
      'Estado': Estado,
      'Ciudad': Ciudad,
      'ClaveEstado': ClaveEstado,
      'Clavetipo_asenta': Clavetipo_asenta,
      'ClaveMunicipio': ClaveMunicipio,
      'TipoZona': TipoZona,
      'ClaveCiudad': ClaveCiudad
    };
    return map;
  }

  CodigoPostalModel.fromMap(Map<String, dynamic> map) {
    ClaveCP = map['ClaveCP'];
    Asentamiento = map['Asentamiento'];
    TipoAsentamiento = map['TipoAsentamiento'];
    Municipio = map['Municipio'];

    Estado = map['Estado'];
    Ciudad = map['Ciudad'];
    ClaveEstado = map['ClaveEstado'];
    Clavetipo_asenta = map['Clavetipo_asenta'];

    ClaveMunicipio = map['ClaveMunicipio'];
    TipoZona = map['TipoZona'];
    ClaveCiudad = map['ClaveCiudad'];
  }
}
