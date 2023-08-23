class TipoMuroModel{

  String TipoMuro;
  String Orden;

  TipoMuroModel({this.TipoMuro, this.Orden});

  Map<String, dynamic> toMap(){
    return{
      'TipoMuro' : TipoMuro,
      'Orden' : Orden
    };
  }

  TipoMuroModel.fromMap(Map<String, dynamic>map){
    TipoMuro = map['TipoMuro'];
    Orden = map['Orden'];
  }

}