class PrestacionesLaboralesModel {
  String Pk_PrestacionesLaborales;
  String Orden_PrestacionesLaborales;
  String txt_desc_prestacioneslab;
  bool value;

  PrestacionesLaboralesModel(
      {this.Pk_PrestacionesLaborales,
      this.Orden_PrestacionesLaborales,
      this.txt_desc_prestacioneslab,
      this.value = false});

  Map<String, dynamic> toMap() {
    return {
      'Pk_PrestacionesLaborales': Pk_PrestacionesLaborales,
      'Orden_PrestacionesLaborales': Orden_PrestacionesLaborales,
      'txt_desc_prestacioneslab': txt_desc_prestacioneslab
    };
  }

  PrestacionesLaboralesModel.fromMap(Map<String, dynamic> map) {
    Pk_PrestacionesLaborales = map['Pk_PrestacionesLaborales'];
    Orden_PrestacionesLaborales = map['Orden_PrestacionesLaborales'];
    txt_desc_prestacioneslab = map['txt_desc_prestacioneslab'];
  }

  @override
  String toString() {
    return '$Pk_PrestacionesLaborales,$Orden_PrestacionesLaborales,$txt_desc_prestacioneslab';
  }
}
