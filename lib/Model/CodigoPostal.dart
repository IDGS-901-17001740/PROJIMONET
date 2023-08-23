class CodigoPostal {
  int claveCodigoPostal;

  CodigoPostal({this.claveCodigoPostal});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'claveCodigoPostal': claveCodigoPostal,


    };
    return map;
  }

  CodigoPostal.fromMap(Map<String, dynamic> map) {
    claveCodigoPostal = map['claveCodigoPostal'];
  }
}