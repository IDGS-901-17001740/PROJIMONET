class EquipamientoMovil {
  int folio;

  String pk_equipamientosRefri;
  String txt_desc_equipamientosRefri;
  String tieneRefri;
  String sirveRefri;

  String pk_equipamientosEstufa;
  String txt_desc_equipamientosEstufa;
  String tieneEstufa;
  String sirveEstufa;

  String pk_equipamientosVideoDVDBlueRay;
  String txt_desc_equipamientosVideoDVDBlueRay;
  String tieneVideoDVDBlueRay;
  String sirveVideoDVDBlueRay;

  String pk_equipamientosLavadora;
  String txt_desc_equipamientosLavadora;
  String tieneLavadora;
  String sirveLavadora;

  String pk_equipamientosLicuadora;
  String txt_desc_equipamientosLicuadora;
  String tieneLicuadora;
  String sirveLicuadora;

  String pk_equipamientosTelevision;
  String txt_desc_equipamientosTelevision;
  String tieneTelevision;
  String sirveTelevision;

  String pk_equipamientosRadio;
  String txt_desc_equipamientosRadio;
  String tieneRadio;
  String sirveRadio;

  String pk_equipamientosSala;
  String txt_desc_equipamientosSala;
  String tieneSala;
  String sirveSala;

  String pk_equipamientosComedor;
  String txt_desc_equipamientosComedor;
  String tieneComedor;
  String sirveComedor;

  String pk_equipamientosAutoMovil;
  String txt_desc_equipamientosAutoMovil;
  String tieneAutoMovil;
  String sirveAutoMovil;

  String pk_equipamientosCama;
  String txt_desc_equipamientosCama;
  String tieneCama;
  String sirveCama;

  String pk_equipamientosCelular;
  String txt_desc_equipamientosCelular;
  String tieneCelular;
  String sirveCelular;

  String pk_equipamientosMotocicleta;
  String txt_desc_equipamientosMotocicleta;
  String tieneMotocicleta;
  String sirveMotocicleta;

  String pk_equipamientosComputadora;
  String txt_desc_equipamientosComputadora;
  String tieneComputadora;
  String sirveComputadora;

  String pk_equipamientosHorno;
  String txt_desc_equipamientosHorno;
  String tieneHorno;
  String sirveHorno;

  String pk_equipamientosTelefono;
  String txt_desc_equipamientosTelefono;
  String tieneTelefono;
  String sirveTelefono;

  String CondicionesGenerales;

  String folioDisp;
  String usuario;
  String dispositivo;

  EquipamientoMovil(
      {this.folio,
      this.pk_equipamientosRefri,
      this.txt_desc_equipamientosRefri,
      this.tieneRefri,
      this.sirveRefri,
      this.pk_equipamientosEstufa,
      this.txt_desc_equipamientosEstufa,
      this.tieneEstufa,
      this.sirveEstufa,
      this.pk_equipamientosVideoDVDBlueRay,
      this.txt_desc_equipamientosVideoDVDBlueRay,
      this.tieneVideoDVDBlueRay,
      this.sirveVideoDVDBlueRay,
      this.pk_equipamientosLavadora,
      this.txt_desc_equipamientosLavadora,
      this.tieneLavadora,
      this.sirveLavadora,
      this.pk_equipamientosLicuadora,
      this.txt_desc_equipamientosLicuadora,
      this.tieneLicuadora,
      this.sirveLicuadora,
      this.pk_equipamientosTelevision,
      this.txt_desc_equipamientosTelevision,
      this.tieneTelevision,
      this.sirveTelevision,
      this.pk_equipamientosRadio,
      this.txt_desc_equipamientosRadio,
      this.tieneRadio,
      this.sirveRadio,
      this.pk_equipamientosSala,
      this.txt_desc_equipamientosSala,
      this.tieneSala,
      this.sirveSala,
      this.pk_equipamientosComedor,
      this.txt_desc_equipamientosComedor,
      this.tieneComedor,
      this.sirveComedor,
      this.pk_equipamientosAutoMovil,
      this.txt_desc_equipamientosAutoMovil,
      this.tieneAutoMovil,
      this.sirveAutoMovil,
      this.pk_equipamientosCama,
      this.txt_desc_equipamientosCama,
      this.tieneCama,
      this.sirveCama,
      this.pk_equipamientosCelular,
      this.txt_desc_equipamientosCelular,
      this.tieneCelular,
      this.sirveCelular,
      this.pk_equipamientosMotocicleta,
      this.txt_desc_equipamientosMotocicleta,
      this.tieneMotocicleta,
      this.sirveMotocicleta,
      this.pk_equipamientosComputadora,
      this.txt_desc_equipamientosComputadora,
      this.tieneComputadora,
      this.sirveComputadora,
      this.pk_equipamientosHorno,
      this.txt_desc_equipamientosHorno,
      this.tieneHorno,
      this.sirveHorno,
      this.pk_equipamientosTelefono,
      this.txt_desc_equipamientosTelefono,
      this.tieneTelefono,
      this.sirveTelefono,
      this.CondicionesGenerales,
      this.folioDisp,
      this.dispositivo,
      this.usuario});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folio': folio,
      'pk_equipamientosRefri': pk_equipamientosRefri,
      'txt_desc_equipamientosRefri': txt_desc_equipamientosRefri,
      'tieneRefri': tieneRefri,
      'sirveRefri': sirveRefri,
      'pk_equipamientosEstufa': pk_equipamientosEstufa,
      'txt_desc_equipamientosEstufa': txt_desc_equipamientosEstufa,
      'tieneEstufa': tieneEstufa,
      'sirveEstufa': sirveEstufa,
      'pk_equipamientosVideoDVDBlueRay': pk_equipamientosVideoDVDBlueRay,
      'txt_desc_equipamientosVideoDVDBlueRay':
          txt_desc_equipamientosVideoDVDBlueRay,
      'tieneVideoDVDBlueRay': tieneVideoDVDBlueRay,
      'sirveVideoDVDBlueRay': sirveVideoDVDBlueRay,
      'pk_equipamientosLavadora': pk_equipamientosLavadora,
      'txt_desc_equipamientosLavadora': txt_desc_equipamientosLavadora,
      'tieneLavadora': tieneLavadora,
      'sirveLavadora': sirveLavadora,
      'pk_equipamientosLicuadora': pk_equipamientosLicuadora,
      'txt_desc_equipamientosLicuadora': txt_desc_equipamientosLicuadora,
      'tieneLicuadora': tieneLicuadora,
      'sirveLicuadora': sirveLicuadora,
      'pk_equipamientosTelevision': pk_equipamientosTelevision,
      'txt_desc_equipamientosTelevision': txt_desc_equipamientosTelevision,
      'tieneTelevision': tieneTelevision,
      'sirveTelevision': sirveTelevision,
      'pk_equipamientosRadio': pk_equipamientosRadio,
      'txt_desc_equipamientosRadio': txt_desc_equipamientosRadio,
      'tieneRadio': tieneRadio,
      'sirveRadio': sirveRadio,
      'pk_equipamientosSala': pk_equipamientosSala,
      'txt_desc_equipamientosSala': txt_desc_equipamientosSala,
      'tieneSala': tieneSala,
      'sirveSala': sirveSala,
      'pk_equipamientosComedor': pk_equipamientosComedor,
      'txt_desc_equipamientosComedor': txt_desc_equipamientosComedor,
      'tieneComedor': tieneComedor,
      'sirveComedor': sirveComedor,
      'pk_equipamientosAutoMovil': pk_equipamientosAutoMovil,
      'txt_desc_equipamientosAutoMovil': txt_desc_equipamientosAutoMovil,
      'tieneAutoMovil': tieneAutoMovil,
      'sirveAutoMovil': sirveAutoMovil,
      'pk_equipamientosCama': pk_equipamientosCama,
      'txt_desc_equipamientosCama': txt_desc_equipamientosCama,
      'tieneCama': tieneCama,
      'sirveCama': sirveCama,
      'pk_equipamientosCelular': pk_equipamientosCelular,
      'txt_desc_equipamientosCelular': txt_desc_equipamientosCelular,
      'tieneCelular': tieneCelular,
      'sirveCelular': sirveCelular,
      'pk_equipamientosMotocicleta': pk_equipamientosMotocicleta,
      'txt_desc_equipamientosMotocicleta': txt_desc_equipamientosMotocicleta,
      'tieneMotocicleta': tieneMotocicleta,
      'sirveMotocicleta': sirveMotocicleta,
      'pk_equipamientosComputadora': pk_equipamientosComputadora,
      'txt_desc_equipamientosComputadora': txt_desc_equipamientosComputadora,
      'tieneComputadora': tieneComputadora,
      'sirveComputadora': sirveComputadora,
      'pk_equipamientosHorno': pk_equipamientosHorno,
      'txt_desc_equipamientosHorno': txt_desc_equipamientosHorno,
      'tieneHorno': tieneHorno,
      'sirveHorno': sirveHorno,
      'pk_equipamientosTelefono': pk_equipamientosTelefono,
      'txt_desc_equipamientosTelefono': txt_desc_equipamientosTelefono,
      'tieneTelefono': tieneTelefono,
      'sirveTelefono': sirveTelefono,
      'CondicionesGenerales': CondicionesGenerales,
      'folioDisp': folioDisp,
      'dispositivo': dispositivo,
      'usuario': usuario
    };
    return map;
  }

  EquipamientoMovil.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];

    pk_equipamientosRefri = map['pk_equipamientosRefri'];
    txt_desc_equipamientosRefri = map['txt_desc_equipamientosRefri'];
    tieneRefri = map['tieneRefri'];
    sirveRefri = map['sirveRefri'];

    pk_equipamientosEstufa = map['pk_equipamientosEstufa'];
    txt_desc_equipamientosEstufa = map['txt_desc_equipamientosEstufa'];
    tieneEstufa = map['tieneEstufa'];
    sirveEstufa = map['sirveEstufa'];

    pk_equipamientosVideoDVDBlueRay = map['pk_equipamientosVideoDVDBlueRay'];
    txt_desc_equipamientosVideoDVDBlueRay =
        map['txt_desc_equipamientosVideoDVDBlueRay'];
    tieneVideoDVDBlueRay = map['tieneVideoDVDBlueRay'];
    sirveVideoDVDBlueRay = map['sirveVideoDVDBlueRay'];

    pk_equipamientosLavadora = map['pk_equipamientosLavadora'];
    txt_desc_equipamientosLavadora = map['txt_desc_equipamientosLavadora'];
    tieneLavadora = map['tieneLavadora'];
    sirveLavadora = map['sirveLavadora'];

    pk_equipamientosLicuadora = map['pk_equipamientosLicuadora'];
    txt_desc_equipamientosLicuadora = map['txt_desc_equipamientosLicuadora'];
    tieneLicuadora = map['tieneLicuadora'];
    sirveLicuadora = map['sirveLicuadora'];

    pk_equipamientosTelevision = map['pk_equipamientosTelevision'];
    txt_desc_equipamientosTelevision = map['txt_desc_equipamientosTelevision'];
    tieneTelevision = map['tieneTelevision'];
    sirveTelevision = map['sirveTelevision'];

    pk_equipamientosRadio = map['pk_equipamientosRadio'];
    txt_desc_equipamientosRadio = map['txt_desc_equipamientosRadio'];
    tieneRadio = map['tieneRadio'];
    sirveRadio = map['sirveRadio'];

    pk_equipamientosSala = map['pk_equipamientosSala'];
    txt_desc_equipamientosSala = map['txt_desc_equipamientosSala'];
    tieneSala = map['tieneSala'];
    sirveSala = map['sirveSala'];

    pk_equipamientosComedor = map['pk_equipamientosComedor'];
    txt_desc_equipamientosComedor = map['txt_desc_equipamientosComedor'];
    tieneComedor = map['tieneComedor'];
    sirveComedor = map['sirveComedor'];

    pk_equipamientosAutoMovil = map['pk_equipamientosAutoMovil'];
    txt_desc_equipamientosAutoMovil = map['txt_desc_equipamientosAutoMovil'];
    tieneAutoMovil = map['tieneAutoMovil'];
    sirveAutoMovil = map['sirveAutoMovil'];

    pk_equipamientosCama = map['pk_equipamientosCama'];
    txt_desc_equipamientosCama = map['txt_desc_equipamientosCama'];
    tieneCama = map['tieneCama'];
    sirveCama = map['sirveCama'];

    pk_equipamientosCelular = map['pk_equipamientosCelular'];
    txt_desc_equipamientosCelular = map['txt_desc_equipamientosCelular'];
    tieneCelular = map['tieneCelular'];
    sirveCelular = map['sirveCelular'];

    pk_equipamientosMotocicleta = map['pk_equipamientosMotocicleta'];
    txt_desc_equipamientosMotocicleta =
        map['txt_desc_equipamientosMotocicleta'];
    tieneMotocicleta = map['tieneMotocicleta'];
    sirveMotocicleta = map['sirveMotocicleta'];

    pk_equipamientosComputadora = map['pk_equipamientosComputadora'];
    txt_desc_equipamientosComputadora =
        map['txt_desc_equipamientosComputadora'];
    tieneComputadora = map['tieneComputadora'];
    sirveComputadora = map['sirveComputadora'];

    pk_equipamientosHorno = map['pk_equipamientosHorno'];
    txt_desc_equipamientosHorno = map['txt_desc_equipamientosHorno'];
    tieneHorno = map['tieneHorno'];
    sirveHorno = map['sirveHorno'];

    pk_equipamientosTelefono = map['pk_equipamientosTelefono'];
    txt_desc_equipamientosTelefono = map['txt_desc_equipamientosTelefono'];
    tieneTelefono = map['tieneTelefono'];
    sirveTelefono = map['sirveTelefono'];

    CondicionesGenerales = map['CondicionesGenerales'];

    folioDisp = map['folioDisp'];
    dispositivo = map['dispositivo'];
    usuario = map['usuario'];
  }
}
