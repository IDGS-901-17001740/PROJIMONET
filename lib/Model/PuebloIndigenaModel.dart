class PuebloIndigenaModel{
  String Orden;
  String EtniaIndigena;

  PuebloIndigenaModel({this.Orden, this.EtniaIndigena});

  Map<String, dynamic> toMap(){
    return {
      'Orden' : Orden,
      'EtniaIndigena' : EtniaIndigena
    };
  }

  PuebloIndigenaModel.fromMap(Map<String, dynamic> map){
    Orden = map['Orden'];
    EtniaIndigena = map['EtniaIndigena'];
  }
}