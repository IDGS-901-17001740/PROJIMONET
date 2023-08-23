class EstadosCiviles{
  String EstadoCivil;
  String Orden;

  EstadosCiviles({this.EstadoCivil, this.Orden});

  Map<String, dynamic> toMap(){
    return {
      'EstadoCivil' : EstadoCivil,
      'Orden': Orden

    };
  }

  EstadosCiviles.fromMap(Map<String, dynamic> map){
    EstadoCivil = map['EstadoCivil'];
    Orden = map['Orden'];
  }

}