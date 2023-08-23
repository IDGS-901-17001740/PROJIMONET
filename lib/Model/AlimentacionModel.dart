// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AlimentacionModel {
  int folio;
  String pregunta1;
  String pregunta2;
  String pregunta3;
  String pregunta4;
  String pregunta5;
  String pregunta6;
  String pregunta7;
  String pregunta8;
  String pregunta9;
  String pregunta10;
  String pregunta11;
  String pregunta12;

  String folioDisp;
  String usuario;
  String dispositivo;

  AlimentacionModel(
      {this.folio,
      this.pregunta1,
      this.pregunta2,
      this.pregunta3,
      this.pregunta4,
      this.pregunta5,
      this.pregunta6,
      this.pregunta7,
      this.pregunta8,
      this.pregunta9,
      this.pregunta10,
      this.pregunta11,
      this.pregunta12,
      this.folioDisp,
      this.usuario,
      this.dispositivo});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'folio': folio,
      'pregunta1': pregunta1,
      'pregunta2': pregunta2,
      'pregunta3': pregunta3,
      'pregunta4': pregunta4,
      'pregunta5': pregunta5,
      'pregunta6': pregunta6,
      'pregunta7': pregunta7,
      'pregunta8': pregunta8,
      'pregunta9': pregunta9,
      'pregunta10': pregunta10,
      'pregunta11': pregunta11,
      'pregunta12': pregunta12,
      'folioDisp': folioDisp,
      'usuario': usuario,
      'dispositivo': dispositivo,
    };
  }

  AlimentacionModel.fromMap(Map<String, dynamic> map) {
    folio = map['folio'];
    pregunta1 = map['pregunta1'];
    pregunta2 = map['pregunta2'];
    pregunta3 = map['pregunta3'];
    pregunta4 = map['pregunta4'];
    pregunta5 = map['pregunta5'];
    pregunta6 = map['pregunta6'];
    pregunta7 = map['pregunta7'];
    pregunta8 = map['pregunta8'];
    pregunta9 = map['pregunta9'];
    pregunta10 = map['pregunta10'];
    pregunta11 = map['pregunta11'];
    pregunta12 = map['pregunta12'];

    folioDisp = map['folioDisp'];
    dispositivo = map['dispositivo'];
    usuario = map['usuario'];
  }

  @override
  String toString() {
    return 'AlimentacionModel(folio: $folio, pregunta1: $pregunta1, pregunta2: $pregunta2, pregunta3: $pregunta3, pregunta4: $pregunta4, pregunta5: $pregunta5, pregunta6: $pregunta6, pregunta7: $pregunta7, pregunta8: $pregunta8, pregunta9: $pregunta9, pregunta10: $pregunta10, pregunta11: $pregunta11, pregunta12: $pregunta12, folioDisp: $folioDisp, usuario: $usuario, dispositivo: $dispositivo)';
  }
}
