import 'package:esn/Screens/TablaFolios.dart';
import 'package:esn/ScreensActualizar/AlimentacionActualizar.dart';
import 'package:esn/ScreensActualizar/AportacionesEconomicasActualizar.dart';
import 'package:esn/ScreensActualizar/ApoyosEnEspecieActualizar.dart';
import 'package:esn/ScreensActualizar/Caracteristicas_CasaActualizar.dart';
import 'package:esn/ScreensActualizar/DatosGeneralesActualizar.dart';

import 'package:esn/ScreensActualizar/DocumentosActualizar.dart';
import 'package:esn/ScreensActualizar/EquipamientoActualizar.dart';
import 'package:esn/ScreensActualizar/Escolaridad_SeguridadSocialActualizar.dart';
import 'package:esn/ScreensActualizar/EstructuraFamiliarActualizar.dart';
import 'package:esn/ScreensActualizar/FotografiaActualizar.dart';
import 'package:esn/ScreensActualizar/Infraestructura_ViviendaActualizar.dart';
import 'package:esn/ScreensActualizar/RemesasActualizar.dart';
import 'package:esn/ScreensActualizar/ResolucionActualizar.dart';
import 'package:esn/ScreensActualizar/Salud_PertenenciaIndigenaActualizar.dart';
import 'package:esn/ScreensActualizar/ServiciosActualizar/ServAguaActualizar.dart';
import 'package:esn/ScreensActualizar/ServiciosActualizar/ServBanoActualizar.dart';
import 'package:esn/ScreensActualizar/ServiciosActualizar/ServGasActualizar.dart';
import 'package:esn/ScreensActualizar/ServiciosActualizar/ServLuzActualizar.dart';
import 'package:esn/ScreensActualizar/ServiciosActualizar/ServSanitarioActualizar.dart';
import 'package:flutter/material.dart';

class ActualizarEstudio extends StatefulWidget {
  String folio;
  String dispositivo;
  String usuario;
  String folioDisp;

  ActualizarEstudio(
      {this.folio, this.dispositivo, this.usuario, this.folioDisp});

  @override
  State<ActualizarEstudio> createState() => _ActualizarEstudioState();
}

class _ActualizarEstudioState extends State<ActualizarEstudio> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 19,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Actualizar Estudio'.toUpperCase()),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => TablaFolios()),
                    (Route<dynamic> route) => false);
              },
            ),
            bottom: TabBar(
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 17),
              tabs: <Widget>[
                Tab(
                    icon: Icon(Icons.home),
                    child: Text('Datos Generales'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.bathroom_outlined),
                    child: Text('Servicio Baño'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.flashlight_on_outlined),
                    child: Text('Servicio Luz'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.water_damage_outlined),
                    child: Text('Servicio Agua'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.water_damage_outlined),
                    child: Text('Servicio Drenaje'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.gas_meter_outlined),
                    child: Text('Servicio Gas'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.family_restroom_outlined),
                    child: Text('Estructura Familiar'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.school_outlined),
                    child:
                        Text('Escolaridad y Seguridad Social'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.health_and_safety_outlined),
                    child: Text('Salud'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.holiday_village_outlined),
                    child: Text('Infraestura de Vivienda'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.holiday_village_outlined),
                    child: Text('Caracteristicas Casa'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.phone_android_outlined),
                    child: Text('Equipamiento'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.attach_money_outlined),
                    child: Text('Aportaciones Económicas'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.attach_money_outlined),
                    child: Text('Apoyos en Especie'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.attach_money_outlined),
                    child: Text('Remesas'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.food_bank_outlined),
                    child: Text('Alimentación'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.document_scanner_outlined),
                    child: Text('Documentos'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.check_box_outlined),
                    child: Text('Resolución'.toUpperCase())),
                Tab(
                    icon: Icon(Icons.camera_alt_outlined),
                    child: Text('Fotografia'.toUpperCase())),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DatosGenerales(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              ServBano(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              ServLuz(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              ServAgua(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              ServSanitario(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              ServGas(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              EstructuraFamiliarTabla(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              Escolaridad_SeguridadSocialTabla(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              Salud_PertenenciaIndigenaTabla(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              Infraestructura_Vivienda(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              Caracteristicas_Casa(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              Equipamiento(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              AportacionesEconomicas(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              ApoyosEnEspecie(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              Remesas(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              Alimentacion(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              Documentos(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              Resolucion(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
              Fotografia(
                  folio: widget.folio,
                  usuario: widget.usuario,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp),
            ],
          ),
        ));
  }
}
