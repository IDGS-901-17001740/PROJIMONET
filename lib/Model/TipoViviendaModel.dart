class TipoViviendaModel {
  String TipoVivienda;
  String Orden;

  TipoViviendaModel({this.TipoVivienda, this.Orden});

  Map<String, dynamic> toMap(){
    return {
      'TipoVivienda' : TipoVivienda,
      'Orden' : Orden
    };
  }

  TipoViviendaModel.fromMap(Map<String, dynamic>map){
    TipoVivienda = map['TipoVivienda'];
    Orden = map['Orden'];
  }
}