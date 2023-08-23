class EstadosModel {
  String Estado;
  String Orden;

  EstadosModel({this.Estado, this.Orden});

  Map<String, dynamic> toMap(){
    return {
      'Estado' : Estado,
      'Orden' : Orden
    };
  }

  EstadosModel.fromMap(Map<String, dynamic> map){
    Estado = map['Estado'];
    Orden = map['Orden'];
  }
}