// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Salud_PertenenciaIndigenenaTablaModel {
  int folio;

  //Capacidades Diferente
  String ClaveCapacidadDiferente;
  String OrdenCapacidadDiferente;
  String CapacidadDiferente;

  //Adicciones
  String ClaveAdiccion;
  String OrdenAdiccion;
  String Adiccion;

  //Peso, Talla, IMC
  double peso;
  double talla;
  double imc;

  //Condiciones de salud
  String ClaveCondicionesSalud;
  String OrdenCondicionesSalud;
  String CondicionesSalud;

  //Clasificación Condición de salud
  String ClaveClasCondicionesSalud;
  String OrdenClasCondicionesSalud;
  String ClasCondicionesSalud;

  //Ponderación
  int ponderacion;

  //Foto
  String fileFoto1;
  String fileFoto2;
  String fileFoto3;
  String fileFoto4;
  String fileFoto5;

  //Pueblo indigena
  String ClaveEtniaIndigena;
  String OrdenEtniaIndigena;
  String EtniaIndigena;

  String incompleto;

  String otroCapacidadDiferente;
  String otroAdicciones;

  String folioDisp;
  String usuario;
  String dispositivo;

  String orden;

  //?Foto de aviso
  String fotoAviso;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'folio': folio,
      'ClaveCapacidadDiferente': ClaveCapacidadDiferente,
      'OrdenCapacidadDiferente': OrdenCapacidadDiferente,
      'CapacidadDiferente': CapacidadDiferente,
      'ClaveAdiccion': ClaveAdiccion,
      'OrdenAdiccion': OrdenAdiccion,
      'Adiccion': Adiccion,
      'peso': peso,
      'talla': talla,
      'imc': imc,
      'ClaveCondicionesSalud': ClaveCondicionesSalud,
      'OrdenCondicionesSalud': OrdenCondicionesSalud,
      'CondicionesSalud': CondicionesSalud,
      'ClaveClasCondicionesSalud': ClaveClasCondicionesSalud,
      'OrdenClasCondicionesSalud': OrdenClasCondicionesSalud,
      'ClasCondicionesSalud': ClasCondicionesSalud,
      'ponderacion': ponderacion,
      'fileFoto1': fileFoto1,
      'fileFoto2': fileFoto2,
      'fileFoto3': fileFoto3,
      'fileFoto4': fileFoto4,
      'fileFoto5': fileFoto5,
      'ClaveEtniaIndigena': ClaveEtniaIndigena,
      'OrdenEtniaIndigena': OrdenEtniaIndigena,
      'EtniaIndigena': EtniaIndigena,
      'incompleto': incompleto,
      'otroCapacidadDiferente': otroCapacidadDiferente,
      'otroAdicciones': otroAdicciones,
      'folioDisp': folioDisp,
      'usuario': usuario,
      'dispositivo': dispositivo,
      'orden': orden,
      'fotoAviso': fotoAviso
    };
  }

  Salud_PertenenciaIndigenenaTablaModel(
      {this.folio,
      this.ClaveCapacidadDiferente,
      this.OrdenCapacidadDiferente,
      this.CapacidadDiferente,
      this.ClaveAdiccion,
      this.OrdenAdiccion,
      this.Adiccion,
      this.peso,
      this.talla,
      this.imc,
      this.ClaveCondicionesSalud,
      this.OrdenCondicionesSalud,
      this.CondicionesSalud,
      this.ClaveClasCondicionesSalud,
      this.OrdenClasCondicionesSalud,
      this.ClasCondicionesSalud,
      this.ponderacion,
      this.fileFoto1,
      this.fileFoto2,
      this.fileFoto3,
      this.fileFoto4,
      this.fileFoto5,
      this.ClaveEtniaIndigena,
      this.OrdenEtniaIndigena,
      this.EtniaIndigena,
      this.incompleto,
      this.otroCapacidadDiferente,
      this.otroAdicciones,
      this.folioDisp,
      this.usuario,
      this.dispositivo,
      this.orden,
      this.fotoAviso});

  Salud_PertenenciaIndigenenaTablaModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    //Capacidades Diferentes
    ClaveCapacidadDiferente = map['ClaveCapacidadDiferente'];
    OrdenCapacidadDiferente = map['OrdenCapacidadDiferente'];
    CapacidadDiferente = map['CapacidadDiferente'];

    //Adicciones
    ClaveAdiccion = map['ClaveAdiccion'];
    OrdenAdiccion = map['OrdenAdiccion'];
    Adiccion = map['Adiccion'];

    //Peso, Talla, IMC
    peso = map['peso'];
    talla = map['talla'];
    imc = map['imc'];

    //Condiciones de salud
    ClaveCondicionesSalud = map['ClaveCondicionesSalud'];
    OrdenCondicionesSalud = map['OrdenCondicionesSalud'];
    CondicionesSalud = map['CondicionesSalud'];

    //Clasificación Condición de salud
    ClaveClasCondicionesSalud = map['ClaveClasCondicionesSalud'];
    OrdenClasCondicionesSalud = map['OrdenClasCondicionesSalud'];
    ClasCondicionesSalud = map['ClasCondicionesSalud'];

    //Ponderación
    ponderacion = map['ponderacion'];

    //Foto
    fileFoto1 = map['fileFoto1'];
    fileFoto2 = map['fileFoto2'];
    fileFoto3 = map['fileFoto3'];
    fileFoto4 = map['fileFoto4'];
    fileFoto5 = map['fileFoto5'];

    //Pueblo indigena
    ClaveEtniaIndigena = map['ClaveEtniaIndigena'];
    OrdenEtniaIndigena = map['OrdenEtniaIndigena'];
    EtniaIndigena = map['EtniaIndigena'];
    incompleto = map['incompleto'];

    otroCapacidadDiferente = map['otroCapacidadDiferente'];
    otroAdicciones = map['otroAdicciones'];

    folioDisp = map['folioDisp'];
    dispositivo = map['dispositivo'];
    usuario = map['usuario'];

    orden = map['orden'];

    fotoAviso = map['fotoAviso'];
  }

  @override
  String toString() {
    return 'Salud_PertenenciaIndigenenaTablaModel(folio: $folio, ClaveCapacidadDiferente: $ClaveCapacidadDiferente, OrdenCapacidadDiferente: $OrdenCapacidadDiferente, CapacidadDiferente: $CapacidadDiferente, ClaveAdiccion: $ClaveAdiccion, OrdenAdiccion: $OrdenAdiccion, Adiccion: $Adiccion, peso: $peso, talla: $talla, imc: $imc, ClaveCondicionesSalud: $ClaveCondicionesSalud, OrdenCondicionesSalud: $OrdenCondicionesSalud, CondicionesSalud: $CondicionesSalud, ClaveClasCondicionesSalud: $ClaveClasCondicionesSalud, OrdenClasCondicionesSalud: $OrdenClasCondicionesSalud, ClasCondicionesSalud: $ClasCondicionesSalud, ponderacion: $ponderacion, fileFoto1: $fileFoto1, fileFoto2: $fileFoto2, fileFoto3: $fileFoto3, fileFoto4: $fileFoto4, fileFoto5: $fileFoto5, ClaveEtniaIndigena: $ClaveEtniaIndigena, OrdenEtniaIndigena: $OrdenEtniaIndigena, EtniaIndigena: $EtniaIndigena, incompleto: $incompleto, otroCapacidadDiferente: $otroCapacidadDiferente, otroAdicciones: $otroAdicciones, folioDisp: $folioDisp, usuario: $usuario, dispositivo: $dispositivo, orden: $orden, fotoAviso: $fotoAviso)';
  }
}
