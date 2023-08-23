class Parentescos{
  String Parentesco;
  String Orden;

  Parentescos({this.Parentesco});

Map<String, dynamic> toMap(){
  return {
    'Parentesco' : Parentesco,
    'Orden' : Orden
    };
  }

  Parentescos.fromMap(Map<String, dynamic> map){
  Parentesco = map['Parentesco'];
  Orden = map['Orden'];
  }

  @override
  String toString() => Parentesco;
}