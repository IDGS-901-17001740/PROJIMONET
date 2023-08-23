class EgresoSemanal {
  int folio;
  double vivienda;
  double alimentacion;
  double luz;
  double gas;
  double agua;
  double telefono;
  double transporte;
  double atencionMedica;
  double otrosGastos;
  double celular;
  double educacion;
  double totalSemanal;
  double totalMensual;

  String folioDisp;
  String usuario;
  String dispositivo;

  EgresoSemanal(
      {this.folio,
      this.vivienda,
      this.alimentacion,
      this.luz,
      this.gas,
      this.agua,
      this.telefono,
      this.transporte,
      this.atencionMedica,
      this.otrosGastos,
      this.celular,
      this.educacion,
      this.totalSemanal,
      this.totalMensual,
      this.folioDisp,
      this.dispositivo,
      this.usuario});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'vivienda': vivienda,
      'alimentacion': alimentacion,
      'luz': luz,
      'gas': gas,
      'agua': agua,
      'telefono': telefono,
      'transporte': transporte,
      'atencionMedica': atencionMedica,
      'otrosGastos': otrosGastos,
      'celular': celular,
      'educacion': educacion,
      'totalSemanal': totalSemanal,
      'totalMensual': totalMensual,
      'folioDisp': folioDisp,
      'dispositivo': dispositivo,
      'usuario': usuario
    };
    return map;
  }

  EgresoSemanal.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    vivienda = map['vivienda'];
    alimentacion = map['alimentacion'];
    luz = map['luz'];
    gas = map['gas'];
    telefono = map['telefono'];
    transporte = map['transporte'];
    atencionMedica = map['atencionMedica'];
    otrosGastos = map['otrosGastos'];
    celular = map['celular'];
    educacion = map['educacion'];
    telefono = map['telefono'];
    totalSemanal = map['totalSemanal'];
    totalMensual = map['totalMensual'];

    folioDisp = map['folioDisp'];
    dispositivo = map['dispositivo'];
    usuario = map['usuario'];
  }
}
