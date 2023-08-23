class NombreAsentamiento {
   String NombreAsentamientos;


   NombreAsentamiento({this.NombreAsentamientos});

  Map<String, dynamic> toMap() {
    return{
      'NombreAsentamientos': NombreAsentamientos,
    };
  }

   NombreAsentamiento.fromMap(Map<String, dynamic> map){
     NombreAsentamientos = map['NombreAsentamientos'];
   }
}