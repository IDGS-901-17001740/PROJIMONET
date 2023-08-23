class DuracionModel {

  String Duracion;

  DuracionModel({this.Duracion});


  Map<String, dynamic> toMap(){
    return{
      'Duracion' : Duracion
    };
  }

  DuracionModel.fromMap(Map<String, dynamic> map){
    Duracion = map['Duracion'];
  }

}