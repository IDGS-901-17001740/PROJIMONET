class TipoTenenciaModel{

  String Tenencia;
  String Orden;

  TipoTenenciaModel({this.Tenencia, this.Orden});

  Map<String, dynamic>toMap(){
    return {
      'Tenencia' : Tenencia,
      'Orden' : Orden
    };
  }

  TipoTenenciaModel.fromMap(Map<String, dynamic> map){
    Tenencia = map['Tenencia'];
    Orden = map['Orden'];
  }

}