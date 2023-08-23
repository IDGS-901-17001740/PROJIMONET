// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ServiciosModel {
  int folio;
  String pk_bano;
  String int_orden_bano;
  String txt_desc_bano;
  String otroBano;
  String claveServAgua;
  String ordenServAgua;
  String servAgua;
  String otroAgua;
  String claveServGas;
  String ordenServGas;
  String servGas;
  String otroGas;
  String claveServLuz;
  String ordenServLuz;
  String servLuz;
  String otroLuz;
  String claveServSanitario;
  String ordenServSanitario;
  String servSanitario;
  String otroSanitario;
  String folioDisp;
  String usuario;
  String dispositivo;

  ServiciosModel(
      {this.folio,
      this.pk_bano,
      this.int_orden_bano,
      this.txt_desc_bano,
      this.otroBano,
      this.claveServAgua,
      this.ordenServAgua,
      this.servAgua,
      this.otroAgua,
      this.claveServGas,
      this.ordenServGas,
      this.servGas,
      this.otroGas,
      this.claveServLuz,
      this.ordenServLuz,
      this.servLuz,
      this.otroLuz,
      this.claveServSanitario,
      this.ordenServSanitario,
      this.servSanitario,
      this.otroSanitario,
      this.folioDisp,
      this.usuario,
      this.dispositivo});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'folio': folio,
      'pk_bano': pk_bano,
      'int_orden_bano': int_orden_bano,
      'txt_desc_bano': txt_desc_bano,
      'otroBano': otroBano,
      'claveServAgua': claveServAgua,
      'ordenServAgua': ordenServAgua,
      'servAgua': servAgua,
      'otroAgua': otroAgua,
      'claveServGas': claveServGas,
      'ordenServGas': ordenServGas,
      'servGas': servGas,
      'otroGas': otroGas,
      'claveServLuz': claveServLuz,
      'ordenServLuz': ordenServLuz,
      'servLuz': servLuz,
      'otroLuz': otroLuz,
      'claveServSanitario': claveServSanitario,
      'ordenServSanitario': ordenServSanitario,
      'servSanitario': servSanitario,
      'otroSanitario': otroSanitario,
      'folioDisp': folioDisp,
      'usuario': usuario,
      'dispositivo': dispositivo
    };
  }

  ServiciosModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    pk_bano = map['pk_bano'];
    int_orden_bano = map['int_orden_bano'];
    txt_desc_bano = map['txt_desc_bano'];
    otroBano = map['otroBano'];
    claveServAgua = map['claveServAgua'];
    ordenServAgua = map['ordenServAgua'];
    servAgua = map['servAgua'];
    otroAgua = map['otroAgua'];
    claveServGas = map['claveServGas'];
    ordenServGas = map['ordenServGas'];
    servGas = map['servGas'];
    otroGas = map['otroGas'];
    claveServLuz = map['claveServLuz'];
    ordenServLuz = map['ordenServLuz'];
    servLuz = map['servLuz'];
    otroLuz = map['otroLuz'];
    claveServSanitario = map['claveServSanitario'];
    ordenServSanitario = map['ordenServSanitario'];
    servSanitario = map['servSanitario'];
    otroSanitario = map['otroSanitario'];
    folioDisp = map['folioDisp'];
    usuario = map['usuario'];
    dispositivo = map['dispositivo'];
  }
}
