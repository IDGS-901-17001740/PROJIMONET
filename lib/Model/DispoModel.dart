class DispoModel {
  String dispositivo;


  DispoModel({this.dispositivo});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'dispositivo' : dispositivo
    };
    return map;
  }

  DispoModel.fromMap(Map<String, dynamic> map){
    dispositivo = map['dispositivo'];
  }
}