class AdiccionesModel {
  String Adiccion;
  String Orden;

  AdiccionesModel({this.Adiccion, this.Orden});

  Map<String, dynamic> toMap(){
    return{
      'Adiccion' : Adiccion,
      'Orden' : Orden
    };
  }

  AdiccionesModel.fromMap(Map<String, dynamic> map){
    Adiccion = map['Adiccion'];
    Orden = map['Orden'];
  }
}