// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClasificacionModel {
  String ClaveClasCondicionesSalud;
  String OrdenClasCondicionesSalud;
  String ClasCondicionesSalud;
  bool value;

  ClasificacionModel(
      {this.ClaveClasCondicionesSalud,
      this.OrdenClasCondicionesSalud,
      this.ClasCondicionesSalud,
      this.value = false});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ClaveClasCondicionesSalud': ClaveClasCondicionesSalud,
      'OrdenClasCondicionesSalud': OrdenClasCondicionesSalud,
      'ClasCondicionesSalud': ClasCondicionesSalud,
      'value': value,
    };
  }

  ClasificacionModel.fromMap(Map<String, dynamic> map) {
    ClaveClasCondicionesSalud = map['ClaveClasCondicionesSalud'];
    OrdenClasCondicionesSalud = map['OrdenClasCondicionesSalud'];
    ClasCondicionesSalud = map['ClasCondicionesSalud'];
  }

  @override
  String toString() {
    return '$ClasCondicionesSalud';
  }

  // ----------------------
}
