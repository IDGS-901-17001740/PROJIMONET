class TipoTechoModel{
  String Techo;
  String Orden;

  TipoTechoModel({this.Techo, this.Orden});

  Map<String, dynamic> toMap(){
    return {
      'Techo' : Techo,
      'Orden' : Orden
    };
  }

  TipoTechoModel.fromMap(Map<String, dynamic>map){
    Techo = map['Techo'];
    Orden = map['Orden'];
  }
}