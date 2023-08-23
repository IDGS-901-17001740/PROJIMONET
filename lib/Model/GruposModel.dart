class GruposModel {
  int ClaveGrupo;
  int orden_Grupo;
  String Grupo;

  GruposModel({this.ClaveGrupo, this.Grupo, this.orden_Grupo});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'ClaveGrupo': ClaveGrupo,
      'Grupo': Grupo,
      'orden_Grupo': orden_Grupo
    };
    return map;
  }

  GruposModel.fromMap(Map<String, dynamic> map) {
    ClaveGrupo = map['ClaveGrupo'];
    Grupo = map['Grupo'];
    orden_Grupo = map['orden_Grupo'];
  }
}
