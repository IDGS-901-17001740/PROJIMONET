class VersionModel{
  String versionApp;


  VersionModel({this.versionApp});

  Map<String, dynamic> toMap(){
    return{
      'versionApp' : versionApp,

    };
  }

  VersionModel.fromMap(Map<String, dynamic> map){
    versionApp = map['versionApp'];

  }
}