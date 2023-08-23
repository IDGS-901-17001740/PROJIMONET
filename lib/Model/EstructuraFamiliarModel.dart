// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EstructuraFamilarModel {
  int folio;
  String nombre;
  String primerApellido = '';
  String segundoApellido = '';
  String claveSexo;
  String ordenSexo;
  String sexo;
  String fechaNacimiento;
  String claveEntidad;
  String entidadNacimiento;
  String curp;
  String claveEstadoCivil;
  String ordenEstadoCivil;
  String estadoCivil;
  String claveParentesco;
  String ordenParentesco;
  String parentesco;
  String otroEstadoCivil;
  String otroParentesco;

  String folioDisp;
  String usuario;
  String dispositivo;
  String orden;

  EstructuraFamilarModel(
      {this.folio,
      this.nombre,
      this.primerApellido,
      this.segundoApellido,
      this.claveSexo,
      this.ordenSexo,
      this.sexo,
      this.fechaNacimiento,
      this.claveEntidad,
      this.entidadNacimiento,
      this.curp,
      this.claveEstadoCivil,
      this.ordenEstadoCivil,
      this.estadoCivil,
      this.claveParentesco,
      this.ordenParentesco,
      this.parentesco,
      this.otroEstadoCivil,
      this.otroParentesco,
      this.folioDisp,
      this.usuario,
      this.dispositivo,
      this.orden});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'folio': folio,
      'nombre': nombre,
      'primerApellido': primerApellido,
      'segundoApellido': segundoApellido,
      'claveSexo': claveSexo,
      'ordenSexo': ordenSexo,
      'sexo': sexo,
      'fechaNacimiento': fechaNacimiento,
      'claveEntidad': claveEntidad,
      'entidadNacimiento': entidadNacimiento,
      'curp': curp,
      'claveEstadoCivil': claveEstadoCivil,
      'ordenEstadoCivil': ordenEstadoCivil,
      'estadoCivil': estadoCivil,
      'claveParentesco': claveParentesco,
      'ordenParentesco': ordenParentesco,
      'parentesco': parentesco,
      'otroEstadoCivil': otroEstadoCivil,
      'otroParentesco': otroParentesco,
      'folioDisp': folioDisp,
      'usuario': usuario,
      'dispositivo': dispositivo,
      'orden': orden,
    };
  }

  EstructuraFamilarModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    nombre = map['nombre'];
    primerApellido = map['primerApellido'];
    segundoApellido = map['segundoApellido'];
    claveSexo = map['claveSexo'];
    ordenSexo = map['ordenSexo'];
    sexo = map['sexo'];
    fechaNacimiento = map['fechaNacimiento'];
    claveEntidad = map['claveEntidad'];
    entidadNacimiento = map['entidadNacimiento'];
    curp = map['curp'];
    claveEstadoCivil = map['claveEstadoCivil'];
    ordenEstadoCivil = map['ordenEstadoCivil'];
    estadoCivil = map['estadoCivil'];
    claveParentesco = map['claveParentesco'];
    ordenParentesco = map['ordenParentesco'];
    parentesco = map['parentesco'];
    otroEstadoCivil = map['otroEstadoCivil'];
    otroParentesco = map['otroParentesco'];

    folioDisp = map['folioDisp'];
    dispositivo = map['dispositivo'];
    usuario = map['usuario'];
    orden = map['orden'];
  }

  @override
  String toString() {
    return 'EstructuraFamilarModel(folio: $folio, nombre: $nombre, primerApellido: $primerApellido, segundoApellido: $segundoApellido, claveSexo: $claveSexo, ordenSexo: $ordenSexo, sexo: $sexo, fechaNacimiento: $fechaNacimiento, claveEntidad: $claveEntidad, entidadNacimiento: $entidadNacimiento, curp: $curp, claveEstadoCivil: $claveEstadoCivil, ordenEstadoCivil: $ordenEstadoCivil, estadoCivil: $estadoCivil, claveParentesco: $claveParentesco, ordenParentesco: $ordenParentesco, parentesco: $parentesco, otroEstadoCivil: $otroEstadoCivil, otroParentesco: $otroParentesco, folioDisp: $folioDisp, usuario: $usuario, dispositivo: $dispositivo, orden: $orden)';
  }
}
