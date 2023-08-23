class TipoPisoModel{

  String TipoPiso;
  String Orden;

  TipoPisoModel({this.TipoPiso, this.Orden});

  Map<String, dynamic> toMap(){
    return {
      'TipoPiso' : TipoPiso,
      'Orden' : Orden
    };
  }

  TipoPisoModel.fromMap(Map<String, dynamic> map){
    TipoPiso = map['TipoPiso'];
    Orden = map['Orden'];
  }
}