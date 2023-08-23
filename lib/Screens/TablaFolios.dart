import 'dart:convert';

import 'package:esn/Comm/comHelper.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/AlimentacionModel.dart';
import 'package:esn/Model/AportacionSemanal.dart';
import 'package:esn/Model/ApoyoEnEspecieModel.dart';
import 'package:esn/Model/CaracteristicasCasa.dart';
import 'package:esn/Model/DatosGeneralesModel.dart';
import 'package:esn/Model/DispoModel.dart';
import 'package:esn/Model/DocumentosModel.dart';
import 'package:esn/Model/EgresoSemanal.dart';
import 'package:esn/Model/EquipamientoModel.dart';
import 'package:esn/Model/EscolaridadSeguridadSocial.dart';
import 'package:esn/Model/EstadoCasaConstruccionModel.dart';
import 'package:esn/Model/EstructuraFamiliarModel.dart';
import 'package:esn/Model/FotoModel.dart';
import 'package:esn/Model/RemesasModel.dart';
import 'package:esn/Model/ResolucionBALModel.dart';
import 'package:esn/Model/ResolucionModel.dart';
import 'package:esn/Model/Salud_PertenenciaIndigenaTablaModel.dart';
import 'package:esn/Model/ServiciosModel.dart';
import 'package:esn/Model/integrante_clasificacionModel.dart';
import 'package:esn/Model/integrante_condicionModel.dart';
import 'package:esn/Model/integrante_prestacionLaboral.dart';
import 'package:esn/SQLBD/Sql.dart';
import 'package:esn/Screens/DatosGenerales.dart';
import 'package:esn/Screens/LoginForm.dart';
import 'package:esn/ScreensActualizar/ActualizarEstudio.dart';
import 'package:esn/replaceAll/replaceAllLetter.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sql_conn/sql_conn.dart';

class TablaFolios extends StatefulWidget {
  String usuario;
  TablaFolios({this.usuario});
  @override
  State<TablaFolios> createState() => _TablaFoliosState();
}

class _TablaFoliosState extends State<TablaFolios> {
  var dbHelper = DbHelper();
  var disp;
  List<DatosGeneralesModel> _Datos = [];
  getAll() async {
    var d = await dbHelper.datos();
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _Datos = d;
    });
  }

  List<DispoModel> _dispo = [];
  getDispo() async {
    _dispo = [];
    var categories = await CategoryService().readDisp();
    categories.forEach((category) {
      setState(() {
        var categoryModel = DispoModel();
        categoryModel.dispositivo = category['dispositivo'];
        _dispo.add(categoryModel);
      });
    });

    disp = _dispo.map((e) => e.dispositivo.toString()).first;
  }

  @override
  void initState() {
    getAll();
    getDispo();
    mostrar_Usuario();
    super.initState();
  }

  // Recuperar el usuario de las SharedPreferences
  var u;
  Future<void> mostrar_Usuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    u = prefs.getString('txt_usuario_usu');
    if (u != null) {
      widget.usuario = u;
    } else {
      widget.usuario = 'Se perdio el usaurio, inicia sesión de nuevo';
    }
  }

  _buildTable() {
    if (_Datos.isEmpty) {
      return Container(
        child: Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 50.0),
              Text(
                'NO HAY ESTUDIOS REALIZADOS',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'GENERA UNO NUEVO PRESIONANADO EL BOTÓN',
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
      );
    }
    return DataTable(
      headingTextStyle: TextStyle(fontSize: 25, color: Colors.black),
      dataTextStyle: TextStyle(fontSize: 20, color: Colors.black),
      showBottomBorder: true,
      columns: [
        DataColumn(label: Text('No.'.toUpperCase())),
        DataColumn(label: Text('Fecha'.toUpperCase())),
        DataColumn(label: Text('Estatus'.toUpperCase())),
        DataColumn(label: Text('Editar'.toUpperCase())),
        DataColumn(label: Text('ELIMINAR'))
      ],
      rows: _Datos.map((e) => DataRow(cells: [
            DataCell(Text(e.folio.toString())),
            DataCell(Text(e.fecha)),
            DataCell(Text(e.incompleto.toString())),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                print(widget.usuario);
                print(e.folioDisp);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ActualizarEstudio(
                            folio: e.folio.toString(),
                            dispositivo: disp,
                            folioDisp: e.folioDisp,
                            usuario: widget.usuario,
                          )),
                  (Route<dynamic> route) => false,
                );
              },
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                _showAlertDelete(context, e.folio);
              },
            ))
          ])).toList(),
    );
  }

  getAllAlimentacion() async {
    var categories = await DbHelper().readAlimentacionSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = AlimentacionModel();
        categoryModel.folio = category['folio'];
        categoryModel.pregunta1 = category['pregunta1'];
        categoryModel.pregunta2 = category['pregunta2'];
        categoryModel.pregunta3 = category['pregunta3'];
        categoryModel.pregunta4 = category['pregunta4'];
        categoryModel.pregunta5 = category['pregunta5'];
        categoryModel.pregunta6 = category['pregunta6'];
        categoryModel.pregunta7 = category['pregunta7'];
        categoryModel.pregunta8 = category['pregunta8'];
        categoryModel.pregunta9 = category['pregunta9'];
        categoryModel.pregunta10 = category['pregunta10'];
        categoryModel.pregunta11 = category['pregunta11'];
        categoryModel.pregunta12 = category['pregunta12'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];

        try {
          Sql().guardarAlimentacion(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.pregunta1,
              categoryModel.pregunta2,
              categoryModel.pregunta3,
              categoryModel.pregunta4,
              categoryModel.pregunta5,
              categoryModel.pregunta6,
              categoryModel.pregunta7,
              categoryModel.pregunta8,
              categoryModel.pregunta9,
              categoryModel.pregunta10,
              categoryModel.pregunta11,
              categoryModel.pregunta12,
              widget.usuario,
              categoryModel.dispositivo);
          alertDialog(context, 'Datos enviados con exito'.toUpperCase());
        } catch (error) {
          print('error en alimentacion'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllAportaciones() async {
    var categories = await DbHelper().readAportacionSemanalIngresosSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = AportacionSemanal();
        categoryModel.folio = category['folio'];
        categoryModel.padre = category['padre'];
        categoryModel.madre = category['madre'];
        categoryModel.hijos = category['hijos'];
        categoryModel.prospera = category['prospera'];
        categoryModel.adultosMayoresProspera =
            category['adultosMayoresProspera'];
        categoryModel.becas = category['becas'];
        categoryModel.otros = category['otros'];
        categoryModel.pension = category['pension'];
        categoryModel.totalSemanal = category['totalSemanal'];
        categoryModel.totalMensual = category['totalMensual'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];
        try {
          Sql().guardarAportacionSemanalIngresos(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.padre,
              categoryModel.madre,
              categoryModel.hijos,
              categoryModel.prospera,
              categoryModel.adultosMayoresProspera,
              categoryModel.becas,
              categoryModel.otros,
              categoryModel.pension,
              categoryModel.totalSemanal,
              categoryModel.totalMensual,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en ingresos'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllEgresos() async {
    var categories = await DbHelper().readAportacionSemanalEgresosSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = EgresoSemanal();
        categoryModel.folio = category['folio'];
        categoryModel.vivienda = category['vivienda'];
        categoryModel.alimentacion = category['alimentacion'];
        categoryModel.luz = category['luz'];
        categoryModel.gas = category['gas'];
        categoryModel.agua = category['agua'];
        categoryModel.telefono = category['telefono:1'];
        categoryModel.transporte = category['transporte'];
        categoryModel.atencionMedica = category['atencionMedica'];
        categoryModel.otrosGastos = category['otrosGastos'];
        categoryModel.celular = category['celular'];
        categoryModel.educacion = category['educacion'];
        categoryModel.totalSemanal = category['totalSemanal'];
        categoryModel.totalMensual = category['totalMensual'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];

        try {
          Sql().guardarAportacionSemanalEgresos(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.vivienda,
              categoryModel.alimentacion,
              categoryModel.luz,
              categoryModel.gas,
              categoryModel.agua,
              categoryModel.telefono,
              categoryModel.transporte,
              categoryModel.atencionMedica,
              categoryModel.otrosGastos,
              categoryModel.celular,
              categoryModel.educacion,
              categoryModel.totalSemanal,
              categoryModel.totalMensual,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en egresos'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllApoyo() async {
    var categories = await DbHelper().readApoyoEnEspecieSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ApoyoEnEspecieModel();
        categoryModel.folio = category['folio'];
        categoryModel.apoyo = category['apoyo'];
        categoryModel.claveApoyo = category['claveApoyo'];
        categoryModel.ordenApoyo = category['ordenApoyo'];
        categoryModel.proporcionadoPor = category['proporcionadoPor'];
        categoryModel.frecuencia = category['frecuencia'];
        categoryModel.ordenFrecuencia = category['ordenFrecuencia'];
        categoryModel.claveFrecuencia = category['claveFrecuencia'];
        categoryModel.otro = category['otro'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];

        try {
          Sql().guardarApoyoEnEspecie(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.claveApoyo,
              categoryModel.ordenApoyo,
              categoryModel.apoyo,
              categoryModel.proporcionadoPor,
              categoryModel.claveFrecuencia,
              categoryModel.ordenFrecuencia,
              categoryModel.frecuencia,
              categoryModel.otro,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en apoyo'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllCasa() async {
    var categories = await DbHelper().readCaracteristicasCasaSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CaracteristicasCasa();
        categoryModel.folio = category['folio'];
        categoryModel.numCuartos = category['numCuartos'];
        categoryModel.cuartosDormir = category['cuartosDormir'];
        categoryModel.cocinaSeparada = category['cocinaSeparada'];
        categoryModel.cuartoBanioExclusivo = category['cuartoBanioExclusivo'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];

        try {
          Sql().guardarCaracteristicasCasa(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.numCuartos,
              categoryModel.cuartosDormir,
              categoryModel.cocinaSeparada,
              categoryModel.cuartoBanioExclusivo,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en casa'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllDatosgenerales() async {
    var categories = await DbHelper().readDatosGeneralesSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = DatosGeneralesModel();
        categoryModel.folio = category['folio'];
        categoryModel.fechaCaptura = category['fechaCaptura'];
        categoryModel.calle = category['calle'];
        categoryModel.entreCalles = category['entreCalles'];
        categoryModel.claveGrupo = category['claveGrupo'];
        categoryModel.grupo = category['grupo'];
        categoryModel.noExt = category['noExt'];
        categoryModel.noInt = category['noInt'];
        categoryModel.fecha = category['fecha'];

        categoryModel.localidad = category['localidad'];
        categoryModel.telefono = category['telefono'];
        categoryModel.claveCodigoPostal =
            int.parse(category['claveCodigoPostal']);
        categoryModel.claveEstado = int.parse(category['claveEstado']);
        categoryModel.estado = category['estado'];
        categoryModel.claveComunidad = category['claveComunidad'];

        categoryModel.nombreComunidad = category['nombreComunidad'];
        categoryModel.claveMunicipio = int.parse(category['claveMunicipio']);
        categoryModel.municipio = category['municipio'];
        categoryModel.claveAsentamiento =
            int.parse(category['claveAsentamiento']);
        categoryModel.nombreAsentamiento = category['nombreAsentamiento'];
        categoryModel.claveTipoAsentamiento =
            int.parse(category['claveTipoAsentamiento']);

        categoryModel.ordentipoAsentamiento =
            int.parse(category['ordenTipoAsentamiento']);
        categoryModel.tipoAsentamiento = category['tipoAsentamiento'];
        categoryModel.claveTipoVialidad =
            int.parse(category['claveTipoVialidad']);
        categoryModel.ordentipovialidad =
            int.parse(category['ordenTipoVialidad']);
        categoryModel.tipoVialidad = category['tipoVialidad'];
        categoryModel.incompleto = category['incompleto'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];

        var now = new DateTime.now();
        var formato = new DateFormat('yyyy-MM-dd');
        String fechaCaptura = formato.format(now);
        try {
          Sql().guardarDatosGenerales(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              fechaCaptura,
              categoryModel.calle,
              categoryModel.entreCalles,
              categoryModel.claveGrupo,
              categoryModel.grupo,
              categoryModel.noExt,
              categoryModel.noInt,
              categoryModel.fecha,
              categoryModel.claveCodigoPostal,
              categoryModel.claveEstado,
              categoryModel.estado,
              categoryModel.claveComunidad,
              categoryModel.nombreComunidad,
              categoryModel.claveMunicipio,
              categoryModel.municipio,
              categoryModel.claveAsentamiento,
              categoryModel.nombreAsentamiento,
              categoryModel.claveTipoAsentamiento,
              categoryModel.ordentipoAsentamiento,
              categoryModel.tipoAsentamiento,
              categoryModel.claveTipoVialidad,
              categoryModel.ordentipovialidad,
              categoryModel.tipoVialidad,
              categoryModel.incompleto,
              categoryModel.localidad,
              categoryModel.telefono,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en generales'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllDocumentos() async {
    var categories = await DbHelper().readDocumentosSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = DocumentosModel();
        categoryModel.folio = category['folio'];
        categoryModel.curp = category['curp'];
        categoryModel.actaNacimiento = category['actaNacimiento'];
        categoryModel.comprobanteDomicilio = category['comprobanteDomicilio'];
        categoryModel.ine = category['ine'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];

        try {
          Sql().guardarDocumentos(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.curp,
              categoryModel.actaNacimiento,
              categoryModel.comprobanteDomicilio,
              categoryModel.ine,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en documentos'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllEquipamiento() async {
    var categories = await DbHelper().readEquipamientoSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = EquipamientoMovil();
        categoryModel.folio = category['folio'];
        categoryModel.tieneRefri = category['tieneRefri'];
        categoryModel.tieneEstufa = category['tieneEstufa'];
        categoryModel.tieneVideoDVDBlueRay = category['tieneVideoDVDBlueRay'];
        categoryModel.tieneLavadora = category['tieneLavadora'];
        categoryModel.tieneLicuadora = category['tieneLicuadora'];
        categoryModel.tieneTelevision = category['tieneTelevision'];
        categoryModel.tieneRadio = category['tieneRadio'];
        categoryModel.tieneSala = category['tieneSala'];
        categoryModel.tieneComedor = category['tieneComedor'];
        categoryModel.tieneAutoMovil = category['tieneAutoMovil'];
        categoryModel.tieneCama = category['tieneCama'];
        categoryModel.tieneCelular = category['tieneCelular'];
        categoryModel.tieneMotocicleta = category['tieneMotocicleta'];
        categoryModel.tieneComputadora = category['tieneComputadora'];
        categoryModel.tieneHorno = category['tieneHorno'];
        categoryModel.tieneTelefono = category['tieneTelefono'];

        categoryModel.sirveRefri = category['sirveRefri'];
        categoryModel.sirveEstufa = category['sirveEstufa'];
        categoryModel.sirveVideoDVDBlueRay = category['sirveVideoDVDBlueRay'];
        categoryModel.sirveLavadora = category['sirveLavadora'];
        categoryModel.sirveLicuadora = category['sirveLicuadora'];
        categoryModel.sirveTelevision = category['sirveTelevision'];
        categoryModel.sirveRadio = category['sirveRadio'];
        categoryModel.sirveSala = category['sirveSala'];
        categoryModel.sirveComedor = category['sirveComedor'];
        categoryModel.sirveAutoMovil = category['sirveAutoMovil'];
        categoryModel.sirveCama = category['sirveCama'];
        categoryModel.sirveCelular = category['sirveCelular'];
        categoryModel.sirveMotocicleta = category['sirveMotocicleta'];
        categoryModel.sirveComputadora = category['sirveComputadora'];
        categoryModel.sirveHorno = category['sirveHorno'];
        categoryModel.sirveTelefono = category['sirveTelefono'];

        categoryModel.pk_equipamientosRefri = category['pk_equipamientosRefri'];
        categoryModel.txt_desc_equipamientosRefri =
            category['txt_desc_equipamientosRefri'];

        categoryModel.pk_equipamientosEstufa =
            category['pk_equipamientosEstufa'];
        categoryModel.txt_desc_equipamientosEstufa =
            category['txt_desc_equipamientosEstufa'];

        categoryModel.pk_equipamientosVideoDVDBlueRay =
            category['pk_equipamientosVideoDVDBlueRay'];
        categoryModel.txt_desc_equipamientosVideoDVDBlueRay =
            category['txt_desc_equipamientosVideoDVDBlueRay'];

        categoryModel.pk_equipamientosLavadora =
            category['pk_equipamientosLavadora'];
        categoryModel.txt_desc_equipamientosLavadora =
            category['txt_desc_equipamientosLavadora'];

        categoryModel.pk_equipamientosLicuadora =
            category['pk_equipamientosLicuadora'];

        categoryModel.txt_desc_equipamientosLicuadora =
            category['txt_desc_equipamientosLicuadora'];

        categoryModel.pk_equipamientosTelevision =
            category['pk_equipamientosTelevision'];
        categoryModel.txt_desc_equipamientosTelevision =
            category['txt_desc_equipamientosTelevision'];

        categoryModel.pk_equipamientosRadio = category['pk_equipamientosRadio'];
        categoryModel.txt_desc_equipamientosRadio =
            category['txt_desc_equipamientosRadio'];

        categoryModel.pk_equipamientosSala = category['pk_equipamientosSala'];
        categoryModel.txt_desc_equipamientosSala =
            category['txt_desc_equipamientosSala'];

        categoryModel.pk_equipamientosComedor =
            category['pk_equipamientosComedor'];
        categoryModel.txt_desc_equipamientosComedor =
            category['txt_desc_equipamientosComedor'];

        categoryModel.pk_equipamientosAutoMovil =
            category['pk_equipamientosAutoMovil'];
        categoryModel.txt_desc_equipamientosAutoMovil =
            category['txt_desc_equipamientosAutoMovil'];

        categoryModel.pk_equipamientosCama = category['pk_equipamientosCama'];
        categoryModel.txt_desc_equipamientosCama =
            category['txt_desc_equipamientosCama'];

        categoryModel.pk_equipamientosCelular =
            category['pk_equipamientosCelular'];
        categoryModel.txt_desc_equipamientosCelular =
            category['txt_desc_equipamientosCelular'];

        categoryModel.pk_equipamientosMotocicleta =
            category['pk_equipamientosMotocicleta'];
        categoryModel.txt_desc_equipamientosMotocicleta =
            category['txt_desc_equipamientosMotocicleta'];

        categoryModel.pk_equipamientosComputadora =
            category['pk_equipamientosComputadora'];
        categoryModel.txt_desc_equipamientosComputadora =
            category['txt_desc_equipamientosComputadora'];

        categoryModel.pk_equipamientosHorno = category['pk_equipamientosHorno'];
        categoryModel.txt_desc_equipamientosHorno =
            category['txt_desc_equipamientosHorno'];

        categoryModel.pk_equipamientosTelefono =
            category['pk_equipamientosTelefono'];
        categoryModel.txt_desc_equipamientosTelefono =
            category['txt_desc_equipamientosTelefono'];

        categoryModel.CondicionesGenerales = category['CondicionesGenerales'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];
        try {
          Sql().guardarEquipamiento(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.pk_equipamientosRefri,
              categoryModel.txt_desc_equipamientosRefri,
              categoryModel.tieneRefri,
              categoryModel.sirveRefri,
              categoryModel.pk_equipamientosEstufa,
              categoryModel.txt_desc_equipamientosEstufa,
              categoryModel.tieneEstufa,
              categoryModel.sirveEstufa,
              categoryModel.pk_equipamientosVideoDVDBlueRay,
              categoryModel.txt_desc_equipamientosVideoDVDBlueRay,
              categoryModel.tieneVideoDVDBlueRay,
              categoryModel.sirveVideoDVDBlueRay,
              categoryModel.pk_equipamientosLavadora,
              categoryModel.txt_desc_equipamientosLavadora,
              categoryModel.tieneLavadora,
              categoryModel.sirveLavadora,
              categoryModel.pk_equipamientosLicuadora,
              categoryModel.txt_desc_equipamientosLicuadora,
              categoryModel.tieneLicuadora,
              categoryModel.sirveLicuadora,
              categoryModel.pk_equipamientosTelevision,
              categoryModel.txt_desc_equipamientosTelevision,
              categoryModel.tieneTelevision,
              categoryModel.sirveTelevision,
              categoryModel.pk_equipamientosRadio,
              categoryModel.txt_desc_equipamientosRadio,
              categoryModel.tieneRadio,
              categoryModel.sirveRadio,
              categoryModel.pk_equipamientosSala,
              categoryModel.txt_desc_equipamientosSala,
              categoryModel.tieneSala,
              categoryModel.sirveSala,
              categoryModel.pk_equipamientosComedor,
              categoryModel.txt_desc_equipamientosComedor,
              categoryModel.tieneComedor,
              categoryModel.sirveComedor,
              categoryModel.pk_equipamientosAutoMovil,
              categoryModel.txt_desc_equipamientosAutoMovil,
              categoryModel.tieneAutoMovil,
              categoryModel.sirveAutoMovil,
              categoryModel.pk_equipamientosCama,
              categoryModel.txt_desc_equipamientosCama,
              categoryModel.tieneCama,
              categoryModel.sirveCama,
              categoryModel.pk_equipamientosCelular,
              categoryModel.txt_desc_equipamientosCelular,
              categoryModel.tieneCelular,
              categoryModel.sirveCelular,
              categoryModel.pk_equipamientosMotocicleta,
              categoryModel.txt_desc_equipamientosMotocicleta,
              categoryModel.tieneMotocicleta,
              categoryModel.sirveMotocicleta,
              categoryModel.pk_equipamientosComputadora,
              categoryModel.txt_desc_equipamientosComputadora,
              categoryModel.tieneComputadora,
              categoryModel.sirveComputadora,
              categoryModel.pk_equipamientosHorno,
              categoryModel.txt_desc_equipamientosHorno,
              categoryModel.tieneHorno,
              categoryModel.sirveHorno,
              categoryModel.pk_equipamientosTelefono,
              categoryModel.txt_desc_equipamientosTelefono,
              categoryModel.tieneTelefono,
              categoryModel.sirveTelefono,
              categoryModel.CondicionesGenerales,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en equipamiento'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllEscolaridad() async {
    var categories = await DbHelper().readEscolaridadSeguridadSocialSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadSeguridadSocial();
        categoryModel.folio = category['folio'];
        categoryModel.ClaveEscolaridad =
            category['ClaveEscolaridad'].toString();
        categoryModel.OrdenEscolaridad =
            category['OrdenEscolaridad'].toString();
        categoryModel.Escolaridad = category['Escolaridad'].toString();
        categoryModel.ClaveGradoEscolar =
            category['ClaveGradoEscolar'].toString();
        categoryModel.GradoEscolar = category['GradoEscolar'].toString();
        categoryModel.ClaveAsisteEscuela =
            category['ClaveAsisteEscuela'].toString();
        categoryModel.OrdenAsisteEscuela =
            category['OrdenAsisteEscuela'].toString();
        categoryModel.AsisteEscuela = category['AsisteEscuela'].toString();
        categoryModel.ClaveOcupacion = category['ClaveOcupacion'].toString();
        categoryModel.OrdenOcupacion = category['OrdenOcupacion'].toString();
        categoryModel.Ocupacion = category['Ocupacion'].toString();
        categoryModel.ClaveTipoEmpleo = category['ClaveTipoEmpleo'].toString();
        categoryModel.OrdenTipoEmpleo = category['OrdenTipoEmpleo'].toString();
        categoryModel.TipoEmpleo = category['TipoEmpleo'].toString();
        categoryModel.pk_prestacioneslab =
            category['pk_prestacioneslab'].toString();
        categoryModel.int_OrdenPrestacionesLab =
            category['int_OrdenPrestacionesLab'].toString();
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'].toString();
        categoryModel.ClaveJubilacion = category['ClaveJubilacion'].toString();
        categoryModel.OrdenJubilacion = category['OrdenJubilacion'].toString();
        categoryModel.Jubilacion = category['Jubilacion'].toString();
        categoryModel.ClaveDerechohabiencia =
            category['ClaveDerechohabiencia'].toString();
        categoryModel.OrdenDerechohabiencia =
            category['OrdenDerechohabiencia'].toString();
        categoryModel.Derechohabiencia =
            category['Derechohabiencia'].toString();
        categoryModel.ClaveMotivoDerechohabiencia =
            category['ClaveMotivoDerechohabiencia'].toString();
        categoryModel.OrdenMotivoDerechohabiencia =
            category['OrdenMotivoDerechohabiencia'].toString();
        categoryModel.MotivoDerechohabiencia =
            category['MotivoDerechohabiencia'].toString();
        categoryModel.otroEscolaridad = category['otroEscolaridad'].toString();
        categoryModel.otroOcupacion = category['otroOcupacion'].toString();
        categoryModel.otroTipoEmpleo = category['otroTipoEmpleo'].toString();

        categoryModel.usuario = category['usuario'].toString();
        categoryModel.dispositivo = category['dispositivo'].toString();

        categoryModel.folioDisp = category['folioDisp'].toString();
        categoryModel.orden = category['orden'];
        replaceAllLetter rpl = new replaceAllLetter();
        var gradoEscolar = rpl.replaceLetter(categoryModel.ClaveGradoEscolar);
        try {
          Sql().guardarEscolaridadSeguridadSocial(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.ClaveEscolaridad,
              categoryModel.OrdenEscolaridad,
              categoryModel.Escolaridad,
              gradoEscolar,
              categoryModel.GradoEscolar,
              categoryModel.ClaveAsisteEscuela,
              categoryModel.OrdenAsisteEscuela,
              categoryModel.AsisteEscuela,
              categoryModel.ClaveOcupacion,
              categoryModel.OrdenOcupacion,
              categoryModel.Ocupacion,
              categoryModel.ClaveTipoEmpleo,
              categoryModel.OrdenTipoEmpleo,
              categoryModel.TipoEmpleo,
              categoryModel.pk_prestacioneslab,
              categoryModel.int_OrdenPrestacionesLab,
              categoryModel.txt_desc_prestacioneslab,
              categoryModel.ClaveJubilacion,
              categoryModel.OrdenJubilacion,
              categoryModel.Jubilacion,
              categoryModel.ClaveDerechohabiencia,
              categoryModel.OrdenDerechohabiencia,
              categoryModel.Derechohabiencia,
              categoryModel.ClaveMotivoDerechohabiencia,
              categoryModel.OrdenMotivoDerechohabiencia,
              categoryModel.MotivoDerechohabiencia,
              categoryModel.otroEscolaridad,
              categoryModel.otroOcupacion,
              categoryModel.otroTipoEmpleo,
              widget.usuario,
              categoryModel.dispositivo,
              categoryModel.orden);
        } catch (error) {
          print('error en escolaridad'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllEstadoCasa() async {
    var categories = await DbHelper().readEstadoDeLaCasaYConstruccionSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstadoCasaConstruccionModel();
        categoryModel.folio = category['folio'];
        categoryModel.ClaveTipoVivienda = category['ClaveTipoVivienda'];
        categoryModel.OrdenTipoVivienda = category['OrdenTipoVivienda'];
        categoryModel.TipoVivienda = category['TipoVivienda'];
        categoryModel.ClaveTipoPiso = category['ClaveTipoPiso'];
        categoryModel.OrdenTipoPiso = category['OrdenTipoPiso'];
        categoryModel.TipoPiso = category['TipoPiso'];
        categoryModel.ClaveTenencia = category['ClaveTenencia'];
        categoryModel.OrdenTenencia = category['OrdenTenencia'];
        categoryModel.Tenencia = category['Tenencia'];
        categoryModel.ClaveTecho = category['ClaveTecho'];
        categoryModel.OrdenTecho = category['OrdenTecho'];
        categoryModel.Techo = category['Techo'];
        categoryModel.ClaveTipoMuro = category['ClaveTipoMuro'];
        categoryModel.OrdenTipoMuro = category['OrdenTipoMuro'];
        categoryModel.TipoMuro = category['TipoMuro'];

        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];
        try {
          Sql().guardarEstadoDeLaCasaYConstruccion(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.ClaveTipoVivienda,
              categoryModel.OrdenTipoVivienda,
              categoryModel.TipoVivienda,
              categoryModel.ClaveTipoPiso,
              categoryModel.OrdenTipoPiso,
              categoryModel.TipoPiso,
              categoryModel.ClaveTenencia,
              categoryModel.OrdenTenencia,
              categoryModel.Tenencia,
              categoryModel.ClaveTecho,
              categoryModel.OrdenTecho,
              categoryModel.Techo,
              categoryModel.ClaveTipoMuro,
              categoryModel.OrdenTipoMuro,
              categoryModel.TipoMuro,
              categoryModel.otroMuro,
              categoryModel.otroTecho,
              categoryModel.otroTenencia,
              categoryModel.otroTipoPiso,
              categoryModel.otroTipoVivienda,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en estado casa'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllEstructuraFamiliar() async {
    var categories = await DbHelper().readEstructuraFamiliarSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.folio = category['folio'];
        categoryModel.nombre = category['nombre'];
        categoryModel.primerApellido = category['primerApellido'];
        categoryModel.segundoApellido = category['segundoApellido'];
        categoryModel.sexo = category['sexo'];
        categoryModel.claveSexo = category['claveSexo'];
        categoryModel.ordenSexo = category['ordenSexo'];
        categoryModel.fechaNacimiento = category['fechaNacimiento'];
        categoryModel.claveEntidad = category['claveEntidad'];
        categoryModel.entidadNacimiento = category['entidadNacimiento'];
        categoryModel.curp = category['curp'];
        categoryModel.claveEstadoCivil = category['claveEstadoCivil'];
        categoryModel.ordenEstadoCivil = category['ordenEstadoCivil'];
        categoryModel.estadoCivil = category['estadoCivil'];
        categoryModel.claveParentesco = category['claveParentesco'];
        categoryModel.ordenParentesco = category['OrdenParentesco'];
        categoryModel.parentesco = category['parentesco'];
        categoryModel.otroEstadoCivil = category['otroEstadoCivil'];
        categoryModel.otroParentesco = category['otroParentesco'];

        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];
        categoryModel.orden = category['orden'];
        try {
          Sql().guardarEstructuraFamiliar(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.nombre,
              categoryModel.primerApellido,
              categoryModel.segundoApellido,
              categoryModel.claveSexo,
              categoryModel.ordenSexo,
              categoryModel.sexo,
              categoryModel.fechaNacimiento,
              categoryModel.claveEntidad,
              categoryModel.entidadNacimiento,
              categoryModel.curp,
              categoryModel.claveEstadoCivil,
              categoryModel.ordenEstadoCivil,
              categoryModel.estadoCivil,
              categoryModel.claveParentesco,
              categoryModel.ordenParentesco,
              categoryModel.parentesco,
              categoryModel.otroEstadoCivil,
              categoryModel.otroParentesco,
              widget.usuario,
              categoryModel.dispositivo,
              categoryModel.orden);
        } catch (error) {
          print('error en estructura'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllFotografia() async {
    var categories = await DbHelper().readFotografiaSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = FotoModel();
        categoryModel.folio = category['folio'];
        categoryModel.fileFoto = category['fileFoto'];
        categoryModel.folioDisp = category['folioDisp'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];

        try {
          Sql().guardarFotografia(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.fileFoto,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en foto'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllRemesas() async {
    var categories = await DbHelper().readRemesasSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = RemesasModel();
        categoryModel.folio = category['folio'];
        categoryModel.dineroOtrosPaises = category['dineroOtrosPaises'];
        categoryModel.claveFrecuenciaApoyo = category['claveFrecuenciaApoyo'];
        categoryModel.ordenFrecuenciaApoyo = category['ordenFrecuenciaApoyo'];
        categoryModel.frecuencia = category['frecuencia'];

        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];

        try {
          Sql().guardarRemesas(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.dineroOtrosPaises,
              categoryModel.claveFrecuenciaApoyo,
              categoryModel.ordenFrecuenciaApoyo,
              categoryModel.frecuencia,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en remesas'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllResolucion() async {
    var categories = await DbHelper().readResolucionSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ResolucionModel();
        categoryModel.folio = category['folio'];
        categoryModel.puntaje = category['puntaje'];
        categoryModel.escalaNecesidad = category['escalaNecesidad'];
        categoryModel.inseguridadAlimenticia =
            category['inseguridadAlimenticia'];
        categoryModel.clasificacionPobresa = category['clasificacionPobresa'];

        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];

        try {
          Sql().guardarResolucion(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.puntaje,
              categoryModel.escalaNecesidad,
              categoryModel.inseguridadAlimenticia,
              categoryModel.clasificacionPobresa,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en resolucion'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllResolucionBal() async {
    var categories = await DbHelper().readResolucionBALSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ResolucionBALModel();
        categoryModel.folio = category['folio'];
        categoryModel.tipo = category['tipo'];
        categoryModel.frecuencia = category['frecuencia'];
        categoryModel.duracion = category['duracion'];
        categoryModel.otorgarApoyo = category['otorgarApoyo'];
        categoryModel.observaciones = category['observaciones'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];
        categoryModel.claveDuracion = category['claveDuracion'];
        categoryModel.ordenDuracion = category['ordenDuracion'];
        categoryModel.claveFrecuencia = category['claveFrecuencia'];
        categoryModel.ordenFrecuencia = category['ordenFrecuencia'];
        try {
          Sql().guardarResolucionBAL(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.tipo,
              categoryModel.claveFrecuencia,
              categoryModel.ordenFrecuencia,
              categoryModel.frecuencia,
              categoryModel.claveDuracion,
              categoryModel.ordenDuracion,
              categoryModel.duracion,
              categoryModel.otorgarApoyo,
              categoryModel.observaciones,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en resolicion bal'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllSaludPertenencia() async {
    var categories = await DbHelper().readSaludPertenciaIndigenaSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = Salud_PertenenciaIndigenenaTablaModel();
        categoryModel.folio = category['folio'];
        categoryModel.folioDisp = category['folioDisp'];
        categoryModel.ClaveCapacidadDiferente =
            category['ClaveCapacidadDiferente'];
        categoryModel.OrdenCapacidadDiferente =
            category['OrdenCapacidadDiferente'];
        categoryModel.CapacidadDiferente = category['CapacidadDiferente'];
        categoryModel.ClaveAdiccion = category['ClaveAdiccion'];
        categoryModel.OrdenAdiccion = category['OrdenAdiccion'];
        categoryModel.Adiccion = category['Adiccion'];
        categoryModel.peso = category['peso'];
        categoryModel.talla = category['talla'];
        categoryModel.imc = category['imc'];
        categoryModel.ClaveCondicionesSalud = category['ClaveCondicionesSalud'];
        categoryModel.OrdenCondicionesSalud = category['OrdenCondicionesSalud'];
        categoryModel.CondicionesSalud = category['CondicionesSalud'];
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        categoryModel.ClasCondicionesSalud = category['ClasCondicionesSalud'];
        categoryModel.ponderacion = int.parse(category['ponderacion']);
        categoryModel.fileFoto1 = category['fileFoto1'];
        categoryModel.fileFoto2 = category['fileFoto2'];
        categoryModel.fileFoto3 = category['fileFoto3'];
        categoryModel.fileFoto4 = category['fileFoto4'];
        categoryModel.fileFoto5 = category['fileFoto5'];
        categoryModel.ClaveEtniaIndigena = category['ClaveEtniaIndigena'];
        categoryModel.OrdenEtniaIndigena = category['OrdenEtniaIndigena'];
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        categoryModel.incompleto = category['incompleto'];
        categoryModel.otroCapacidadDiferente =
            category['otroCapacidadDiferente'];
        categoryModel.otroAdicciones = category['otroAdicciones'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.orden = category['orden'];

        try {
          Sql().guardarSaludPertenenciaIndigena(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.ClaveCapacidadDiferente,
              categoryModel.OrdenCapacidadDiferente,
              categoryModel.CapacidadDiferente,
              categoryModel.ClaveAdiccion,
              categoryModel.OrdenAdiccion,
              categoryModel.Adiccion,
              categoryModel.peso,
              categoryModel.talla,
              categoryModel.imc,
              categoryModel.ClaveCondicionesSalud,
              categoryModel.OrdenCondicionesSalud,
              categoryModel.CondicionesSalud,
              categoryModel.ClaveClasCondicionesSalud,
              categoryModel.OrdenClasCondicionesSalud,
              categoryModel.ClasCondicionesSalud,
              categoryModel.ponderacion,
              categoryModel.fileFoto1,
              categoryModel.fileFoto2,
              categoryModel.fileFoto3,
              categoryModel.fileFoto4,
              categoryModel.fileFoto5,
              categoryModel.ClaveEtniaIndigena,
              categoryModel.OrdenEtniaIndigena,
              categoryModel.EtniaIndigena,
              categoryModel.incompleto,
              categoryModel.otroCapacidadDiferente,
              categoryModel.otroAdicciones,
              widget.usuario,
              categoryModel.dispositivo,
              categoryModel.orden);
        } catch (error) {
          print('error en sulud'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllServicios() async {
    var categories = await DbHelper().readServiciosSQL();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ServiciosModel();
        categoryModel.folio = category['folio'];
        categoryModel.pk_bano = category['pk_bano'];
        categoryModel.int_orden_bano = category['int_orden_bano'];
        categoryModel.txt_desc_bano = category['txt_desc_bano'];
        categoryModel.otroBano = category['otroBano'];
        categoryModel.claveServAgua = category['claveServAgua'];
        categoryModel.ordenServAgua = category['ordenServAgua'];
        categoryModel.servAgua = category['servAgua'];
        categoryModel.otroAgua = category['otroAgua'];
        categoryModel.claveServGas = category['claveServGas'];
        categoryModel.ordenServGas = category['ordenServGas'];
        categoryModel.servGas = category['servGas'];
        categoryModel.otroGas = category['otroGas'];
        categoryModel.claveServLuz = category['claveServLuz'];
        categoryModel.ordenServLuz = category['ordenServLuz'];
        categoryModel.servLuz = category['servLuz'];
        categoryModel.otroLuz = category['otroLuz'];
        categoryModel.claveServSanitario = category['claveServSanitario'];
        categoryModel.ordenServSanitario = category['ordenServSanitario'];
        categoryModel.servSanitario = category['servSanitario'];
        categoryModel.otroSanitario = category['otroSanitario'];
        categoryModel.folioDisp = category['folioDisp'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];

        try {
          Sql().guardarServicios(
              context,
              categoryModel.folio,
              categoryModel.folioDisp,
              categoryModel.pk_bano.toString(),
              categoryModel.int_orden_bano,
              categoryModel.txt_desc_bano,
              categoryModel.otroBano,
              categoryModel.claveServAgua.toString(),
              categoryModel.ordenServAgua,
              categoryModel.servAgua,
              categoryModel.otroAgua,
              categoryModel.claveServGas.toString(),
              categoryModel.ordenServGas,
              categoryModel.servGas,
              categoryModel.otroGas,
              categoryModel.claveServLuz.toString(),
              categoryModel.ordenServLuz,
              categoryModel.servLuz,
              categoryModel.otroLuz,
              categoryModel.claveServSanitario.toString(),
              categoryModel.ordenServSanitario,
              categoryModel.servSanitario,
              categoryModel.otroSanitario,
              widget.usuario,
              categoryModel.dispositivo);
        } catch (error) {
          print('error en servics'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllIntegranteCondicion() async {
    var categories = await DbHelper().readIntegranteCondicion();
    categories.forEach((category) {
      setState(() {
        var categoryModel = integrante_condicionModel();
        categoryModel.folio = category['folio'].toString();
        categoryModel.orden_Integrante = category['orden_Integrante'];
        categoryModel.pk_condicion = category['pk_condicion'];
        categoryModel.ponderacion = category['ponderacion'];
        categoryModel.folioDisp = category['folioDisp'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];

        try {
          Sql().guardarIntegranteCondiciones(
              context,
              categoryModel.folio,
              categoryModel.orden_Integrante,
              categoryModel.pk_condicion,
              categoryModel.ponderacion,
              widget.usuario,
              categoryModel.folioDisp,
              categoryModel.dispositivo);
        } catch (error) {
          print('error eN COND'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllIntegranteClasificacion() async {
    var categories = await DbHelper().readIntegranteClasificacion();
    categories.forEach((category) {
      setState(() {
        var categoryModel = integrante_clasificacionModel();
        categoryModel.folio = category['folio'].toString();
        categoryModel.orden_integrante = category['orden_integrante'];
        categoryModel.pk_clasificacion = category['pk_clasificacion'];
        categoryModel.folioDisp = category['folioDisp'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];

        try {
          Sql().guardarIntegranteClasificacion(
              context,
              categoryModel.folio,
              categoryModel.orden_integrante,
              categoryModel.pk_clasificacion,
              widget.usuario,
              categoryModel.folioDisp,
              categoryModel.dispositivo);
        } catch (error) {
          print('error eN Clas'.toUpperCase());
          print(error);
        }
      });
    });
  }

  getAllIntegrantePrestacion() async {
    var categories = await DbHelper().readIntegrantePrestacionLab();
    categories.forEach((category) {
      setState(() {
        var categoryModel = integrante_prestacionLaboralModel();
        categoryModel.folio = category['folio'].toString();
        categoryModel.orden_Integrante = category['orden_Integrante'];
        categoryModel.pk_prestacionLaboral = category['pk_prestacionLaboral'];
        categoryModel.folioDisp = category['folioDisp'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];

        try {
          Sql().guardarIntegrantePrestacionLaboral(
              context,
              categoryModel.folio,
              categoryModel.orden_Integrante,
              categoryModel.pk_prestacionLaboral,
              widget.usuario,
              categoryModel.folioDisp,
              categoryModel.dispositivo);
        } catch (error) {
          print('error eN presta'.toUpperCase());
          print(error);
        }
      });
    });
  }

  bool c = false;
  bool i = false;

  mandarESN() async {
    print(c);

    Sql sql = new Sql();
    await sql.connect(context);

    if (SqlConn.isConnected) {
      setState(() {
        c = true;
      });
    } else {
      setState(() {
        c = false;
      });
    }

    print(c);
    if (c == true) {
      getAllAlimentacion();
      getAllAportaciones();
      getAllEgresos();
      getAllApoyo();
      getAllCasa();
      getAllDatosgenerales();
      getAllDocumentos();
      getAllEquipamiento();
      getAllEstadoCasa();
      getAllEstructuraFamiliar();
      getAllEscolaridad();
      getAllFotografia();
      getAllRemesas();
      getAllResolucion();
      getAllResolucionBal();
      getAllServicios();
      getAllSaludPertenencia();
      getAllIntegranteClasificacion();
      getAllIntegrantePrestacion();
      getAllIntegranteCondicion();
      await DbHelper().updateEstatus();
      getAll();
      alertDialog(context, 'Estudio enviado con exito'.toUpperCase());
    } else {
      alertDialog(context, 'Sin conexión al servidor'.toUpperCase());
    }
  }

  // ----------------------  Incompleto -------------

  getAlimentacionIncompleto() async {
    var data = await Sql().readAlimentacionIncompleto(context);
    List result = jsonDecode(data);
    try {
      result.forEach((datos) {
        AlimentacionModel alimentacionModel = AlimentacionModel(
            folio: datos['folio'],
            pregunta1: datos['pregunta1'],
            pregunta2: datos['pregunta2'],
            pregunta3: datos['pregunta3'],
            pregunta4: datos['pregunta4'],
            pregunta5: datos['pregunta5'],
            pregunta6: datos['pregunta6'],
            pregunta7: datos['pregunta7'],
            pregunta8: datos['pregunta8'],
            pregunta9: datos['pregunta9'],
            pregunta10: datos['pregunta10'],
            pregunta11: datos['pregunta11'],
            pregunta12: datos['pregunta12'],
            dispositivo: datos['dispositivo'],
            usuario: datos['usuario'],
            folioDisp: datos['folioDisp']);
        DbHelper().saveAlimentacion(alimentacionModel);

        print(alimentacionModel);
      });
    } catch (e) {
      print(e);
    }
  }

  getAportacionIncompleto() async {
    var data = await Sql().readAportacionesIncompleto();
    List result = jsonDecode(data);
    print(result);
    try {
      result.forEach((datos) {
        AportacionSemanal aportacionSemanal = AportacionSemanal(
            folio: datos['folio'],
            padre: datos['padre'],
            madre: datos['madre'],
            hijos: datos['hijos'],
            prospera: datos['prospera'],
            adultosMayoresProspera: datos['adultosMayoresProspera'],
            becas: datos['becas'],
            otros: datos['otros'],
            pension: datos['pension'],
            totalSemanal: datos['totalSemanl'],
            totalMensual: datos['toalMensual'],
            folioDisp: datos['folioDisp'],
            dispositivo: datos['dispositivo'],
            usuario: datos['usuario']);
        DbHelper().saveApoyoSemanal(aportacionSemanal);
      });
    } catch (e) {
      print(e);
    }
  }

  getEgresoIncompleto() async {
    var data = await Sql().readEgresoIncompleto();
    List result = jsonDecode(data);
    try {
      result.forEach((datos) {
        EgresoSemanal egresoSemanal = EgresoSemanal(
            folio: datos['folio'],
            vivienda: datos['vivienda'],
            alimentacion: datos['alimentacion'],
            luz: datos['luz'],
            gas: datos['gas'],
            agua: datos['agua'],
            telefono: datos['telefono'],
            transporte: datos['transporte'],
            atencionMedica: datos['atencioMedica'],
            otrosGastos: datos['otrosGastos'],
            celular: datos['celular'],
            educacion: datos['educacion'],
            totalSemanal: datos['totalSemanal'],
            totalMensual: datos['totalMensual'],
            folioDisp: datos['folioDisp'],
            dispositivo: datos['dispositivo'],
            usuario: datos['usuario']);

        DbHelper().saveEgresoSemanal(egresoSemanal);
      });
    } catch (e) {
      print(e);
    }
  }

  getApoyoIncompleto() async {
    var data = await Sql().readApoyoIncompleto();
    List result = jsonDecode(data);
    try {
      result.forEach((datos) {
        ApoyoEnEspecieModel apoyoEnEspecieModel = ApoyoEnEspecieModel(
            folio: datos['folio'],
            claveApoyo: datos['claveApoyo'],
            ordenApoyo: datos['ordenApoyo'],
            apoyo: datos['apoyo'],
            proporcionadoPor: datos['proporcionadoPor'],
            claveFrecuencia: datos['claveFrecuencia'],
            ordenFrecuencia: datos['ordenFrecuencia'],
            frecuencia: datos['frecuencia'],
            otro: datos['otro'],
            dispositivo: datos['dispositivo'],
            folioDisp: datos['folioDisp'],
            usuario: datos['usuario']);

        DbHelper().saveApoyoEnEspecie(apoyoEnEspecieModel);
      });
    } catch (e) {
      print(e);
    }
  }

  getCasaIncompleto() async {
    var data = await Sql().readCasaIncompleto();
    List result = jsonDecode(data);
    try {
      result.forEach((datos) {
        CaracteristicasCasa caracteristicasCasa = CaracteristicasCasa(
            folio: datos['folio'],
            numCuartos: datos['numCuartos'].toString(),
            cuartosDormir: datos['cuartosDormir'].toString(),
            cocinaSeparada: datos['cocinaSeparada'],
            cuartoBanioExclusivo: datos['cuartoBanioExclusivo'],
            folioDisp: datos['folioDisp'],
            dispositivo: datos['dispositivo'],
            usuario: datos['usuario']);

        DbHelper().saveCasa(caracteristicasCasa);
      });
    } catch (e) {
      print(e);
    }
  }

  getDatosGeneralesIncompleto() async {
    var data = await Sql().readDatosGeneralesIncompleto();
    List result = jsonDecode(data);
    try {
      result.forEach((datos) {
        DatosGeneralesModel datosGeneralesModel = DatosGeneralesModel(
            folio: datos['folio'],
            fechaCaptura: datos['fechaCaptura'],
            calle: datos['calle'],
            entreCalles: datos['entreCalles'],
            claveGrupo: datos['claveGrupo'],
            grupo: datos['grupo'],
            noExt: datos['noExt'].toString(),
            noInt: datos['noInt'].toString(),
            fecha: datos['fecha'],
            localidad: datos['localidad'],
            telefono: datos['telefono'].toString(),
            claveCodigoPostal: datos['claveCodigoPostal'],
            claveEstado: datos['claveEstado'],
            estado: datos['estado'],
            claveComunidad: datos['claveComunidad'],
            nombreComunidad: datos['nombreComunidad'],
            claveMunicipio: datos['claveMunicipio'],
            municipio: datos['municipio'],
            claveAsentamiento: datos['claveAsentamiento'],
            nombreAsentamiento: datos['nombreAsentamiento'],
            claveTipoAsentamiento: datos['claveTipoAsentamiento'],
            ordentipoAsentamiento: datos['ordenTipoAsentamiento'],
            tipoAsentamiento: datos['tipoAsentamiento'],
            claveTipoVialidad: datos['claveTipoVialidad'],
            ordentipovialidad: datos['ordenTipovialidad'],
            tipoVialidad: datos['tipoVialidad'],
            dispositivo: datos['dispositivo'],
            folioDisp: datos['folioDisp'],
            usuario: datos['usuario'],
            incompleto: datos['incompleto'],
            tipoZona: datos['tipoZona']);

        DbHelper().saveDatosGenerales(datosGeneralesModel);
      });
    } catch (e) {
      print(e);
    }
  }

  getDocumentosIncompleto() async {
    var data = await Sql().readDocumentosIncompleto();
    List result = jsonDecode(data);
    try {
      result.forEach((datos) {
        DocumentosModel documentosModel = DocumentosModel(
            folio: datos['folio'],
            curp: datos['curp'],
            actaNacimiento: datos['actaNacimiento'],
            comprobanteDomicilio: datos['comprobanteDomicilio'],
            ine: datos['ine'],
            folioDisp: datos['folioDisp'],
            dispositivo: datos['dispositivo'],
            usuario: datos['usuario']);

        DbHelper().saveDocumentos(documentosModel);
      });
    } catch (e) {
      print(e);
    }
  }

  getEquipamientoIncompleto() async {
    var data = await Sql().readEquipamientoIncompleto();
    List result = jsonDecode(data);
    try {
      result.forEach((datos) {
        EquipamientoMovil equipamientoMovil = EquipamientoMovil(
            folio: datos['folio'],
            pk_equipamientosRefri: datos['pk_equipamientosRefri'].toString(),
            txt_desc_equipamientosRefri: datos['txt_desc_equipamientosRefri'],
            tieneRefri: datos['tieneRefri'],
            sirveRefri: datos['sirveRefri'],
            pk_equipamientosEstufa: datos['pk_equipamientosEstufa'].toString(),
            txt_desc_equipamientosEstufa: datos['txt_desc_equipamientosEstufa'],
            tieneEstufa: datos['tieneEstufa'],
            sirveEstufa: datos['sirveEstufa'],
            pk_equipamientosVideoDVDBlueRay:
                datos['pk_equipamientosVideoDVDBlueRay'].toString(),
            txt_desc_equipamientosVideoDVDBlueRay:
                datos['txt_desc_equipamientosVideoDVDBlueRay'],
            tieneVideoDVDBlueRay: datos['tieneVideoDVDBlueRay'],
            sirveVideoDVDBlueRay: datos['sirveVideoDVDBlueRay'],
            pk_equipamientosLavadora:
                datos['pk_equipamientosLavadora'].toString(),
            txt_desc_equipamientosLavadora:
                datos['txt_desc_equipamientosLavadora'],
            tieneLavadora: datos['tieneLavadora'],
            sirveLavadora: datos['sirveLavadora'],
            pk_equipamientosLicuadora:
                datos['pk_equipamientosLicuadora'].toString(),
            txt_desc_equipamientosLicuadora:
                datos['txt_desc_equipamientosLicuadora'],
            tieneLicuadora: datos['tieneLicuadora'],
            sirveLicuadora: datos['sirveLicuadora'],
            pk_equipamientosTelevision:
                datos['pk_equipamientosTelevision'].toString(),
            txt_desc_equipamientosTelevision:
                datos['txt_desc_equipamientosTelevision'],
            tieneTelevision: datos['tieneTelevision'],
            sirveTelevision: datos['sirveTelevision'],
            pk_equipamientosRadio: datos['pk_equipamientosRadio'].toString(),
            txt_desc_equipamientosRadio: datos['txt_desc_equipamientosRadio'],
            tieneRadio: datos['tieneRadio'],
            sirveRadio: datos['sirveRadio'],
            pk_equipamientosSala: datos['pk_equipamientosSala'].toString(),
            txt_desc_equipamientosSala: datos['txt_desc_equipamientosSala'],
            tieneSala: datos['tieneSala'],
            sirveSala: datos['sirveSala'],
            pk_equipamientosComedor:
                datos['pk_equipamientosComedor'].toString(),
            txt_desc_equipamientosComedor:
                datos['txt_desc_equipamientosComedor'],
            tieneComedor: datos['tieneComedor'],
            sirveComedor: datos['sirveComedor'],
            pk_equipamientosAutoMovil:
                datos['pk_equipamientosAutoMovil'].toString(),
            txt_desc_equipamientosAutoMovil:
                datos['txt_desc_equipamientosAutoMovil'],
            tieneAutoMovil: datos['tieneAutoMovil'],
            sirveAutoMovil: datos['sirveAutoMovil'],
            pk_equipamientosCama: datos['pk_equipamientosCama'].toString(),
            txt_desc_equipamientosCama: datos['txt_desc_equipamientosCama'],
            tieneCama: datos['tieneCama'],
            sirveCama: datos['sirveCama'],
            pk_equipamientosCelular:
                datos['pk_equipamientosCelular'].toString(),
            txt_desc_equipamientosCelular:
                datos['txt_desc_equipamientosCelular'],
            tieneCelular: datos['tieneCelular'],
            sirveCelular: datos['sirveCelular'],
            pk_equipamientosMotocicleta:
                datos['pk_equipamientosMotocicleta'].toString(),
            txt_desc_equipamientosMotocicleta:
                datos['txt_desc_equipamientosMotocicleta'],
            tieneMotocicleta: datos['tieneMotocicleta'],
            sirveMotocicleta: datos['sirveMotocicleta'],
            pk_equipamientosComputadora:
                datos['pk_equipamientosComputadora'].toString(),
            txt_desc_equipamientosComputadora:
                datos['txt_desc_equipamientosComputadora'],
            tieneComputadora: datos['tieneComputadora'],
            sirveComputadora: datos['sirveComputadora'],
            pk_equipamientosHorno: datos['pk_equipamientosHorno'].toString(),
            txt_desc_equipamientosHorno: datos['txt_desc_equipamientosHorno'],
            tieneHorno: datos['tieneHorno'],
            sirveHorno: datos['sirveHorno'],
            pk_equipamientosTelefono:
                datos['pk_equipamientosTelefono'].toString(),
            txt_desc_equipamientosTelefono:
                datos['txt_desc_equipamientosTelefono'],
            tieneTelefono: datos['tieneTelefono'],
            sirveTelefono: datos['sirveTelefono'],
            CondicionesGenerales: datos['CondicionesGenerales'],
            dispositivo: datos['dispositivo'],
            folioDisp: datos['folioDisp'],
            usuario: datos['usuario']);

        DbHelper().saveEquipamiento(equipamientoMovil);
      });
    } catch (e) {
      print(e);
    }
  }

  getEstadoDeLaCasaIncompleto() async {
    var data = await Sql().readEstadoDeLaCasaIncompleto();
    List result = jsonDecode(data);
    try {
      result.forEach((datos) {
        EstadoCasaConstruccionModel estadoCasaConstruccionModel =
            EstadoCasaConstruccionModel(
                folio: datos['folio'],
                ClaveTipoVivienda: datos['ClaveTipoVivienda'].toString(),
                OrdenTipoVivienda: datos['OrdenTipoVivienda'].toString(),
                TipoVivienda: datos['TipoVivienda'],
                ClaveTipoPiso: datos['ClaveTipoPiso'].toString(),
                OrdenTipoPiso: datos['OrdenTipoPiso'].toString(),
                TipoPiso: datos['TipoPiso'],
                ClaveTenencia: datos['ClaveTenencia'].toString(),
                OrdenTenencia: datos['OrdenTenencia'].toString(),
                Tenencia: datos['Tenencia'],
                ClaveTecho: datos['ClaveTecho'].toString(),
                OrdenTecho: datos['OrdenTecho'].toString(),
                Techo: datos['Techo'],
                ClaveTipoMuro: datos['ClaveTipoMuro'].toString(),
                OrdenTipoMuro: datos['OrdenTipoMuro'].toString(),
                TipoMuro: datos['TipoMuro'],
                otroMuro: datos['otroMuro'],
                otroTecho: datos['otroTecho'],
                otroTenencia: datos['otroTenencia'],
                otroTipoPiso: datos['otroTipoPiso'],
                otroTipoVivienda: datos['otroTipoVivienda'],
                dispositivo: datos['dispositivo'],
                folioDisp: datos['folioDisp'],
                usuario: datos['usuario']);

        DbHelper().saveVivienda(estadoCasaConstruccionModel);
      });
    } catch (e) {
      print(e);
    }
  }

  getEstructuraIncompleto() async {
    var data = await Sql().readEstructuraFamiliarIncompleto();
    List result = jsonDecode(data);
    print(data);
    try {
      result.forEach((datos) {
        EstructuraFamilarModel ef = EstructuraFamilarModel(
            folio: datos['folio'],
            nombre: datos['nombre'],
            primerApellido: datos['primerApellido'],
            segundoApellido: datos['segundoApellido'],
            claveSexo: datos['claveSexo'].toString(),
            ordenSexo: datos['ordenSexo'].toString(),
            sexo: datos['sexo'],
            fechaNacimiento: datos['fechaNacimiento'],
            claveEntidad: datos['claveEntidad'].toString(),
            entidadNacimiento: datos['entidadNacimiento'],
            curp: datos['curp'],
            claveEstadoCivil: datos['claveEstadoCivil'].toString(),
            ordenEstadoCivil: datos['ordenEstadoCivil'].toString(),
            estadoCivil: datos['estadoCivil'],
            claveParentesco: datos['claveParentesco'].toString(),
            ordenParentesco: datos['ordenParentesco'].toString(),
            parentesco: datos['parentesco'],
            otroParentesco: datos['otroParentesco'],
            otroEstadoCivil: datos['otroEstadoCivil'],
            dispositivo: datos['dispositivo'],
            folioDisp: datos['folioDisp'],
            usuario: datos['usuario'],
            orden: datos['orden'].toString());

        DbHelper().saveEstructuraFamiliar(ef);
      });
    } catch (e) {
      print(e);
    }
  }

  getEscolaridadIncompleto() async {
    var data = await Sql().readEscolaridadIncompleto();
    List result = jsonDecode(data);
    try {
      result.forEach((datos) {
        EscolaridadSeguridadSocial escolaridadSeguridadSocial =
            EscolaridadSeguridadSocial(
                folio: datos['folio'],
                ClaveEscolaridad: datos['ClaveEscolaridad'].toString(),
                OrdenEscolaridad: datos['OrdenEscolaridad'].toString(),
                Escolaridad: datos['Escolaridad'],
                ClaveGradoEscolar: datos['ClaveGradoEscolar'].toString(),
                GradoEscolar: datos['GradoEscolar'].toString(),
                ClaveAsisteEscuela: datos['ClaveAsisteEscuela'].toString(),
                OrdenAsisteEscuela: datos['OrdenAsisteEscuela'].toString(),
                AsisteEscuela: datos['AsisteEscuela'],
                ClaveOcupacion: datos['ClaveOcupacion'].toString(),
                OrdenOcupacion: datos['OrdenOcupacion'].toString(),
                Ocupacion: datos['Ocupacion'],
                ClaveTipoEmpleo: datos['ClaveTipoEmpleo'].toString(),
                OrdenTipoEmpleo: datos['OrdenTipoEmpleo'].toString(),
                TipoEmpleo: datos['TipoEmpleo'],
                pk_prestacioneslab: datos['pk_prestacioneslab'].toString(),
                int_OrdenPrestacionesLab:
                    datos['int_OrdenPrestacionesLab'].toString(),
                txt_desc_prestacioneslab: datos['txt_desc_prestacioneslab'],
                ClaveJubilacion: datos['ClaveJubilacion'].toString(),
                OrdenJubilacion: datos['OrdenJubilacion'].toString(),
                Jubilacion: datos['Jubilacion'],
                ClaveDerechohabiencia:
                    datos['ClaveDerechohabiencia'].toString(),
                OrdenDerechohabiencia:
                    datos['OrdenDerechohabiencia'].toString(),
                Derechohabiencia: datos['Derechohabiencia'],
                ClaveMotivoDerechohabiencia:
                    datos['ClaveMotivoDerechohabiencia'].toString(),
                OrdenMotivoDerechohabiencia:
                    datos['OrdenMotivoDerechohabiencia'].toString(),
                MotivoDerechohabiencia: datos['MotivoDerechohabiencia'],
                otroEscolaridad: datos['otroEscolaridad'],
                otroOcupacion: datos['otroOcupacion'],
                otroTipoEmpleo: datos['otroTipoEmpleo'],
                dispositivo: datos['dispositivo'],
                folioDisp: datos['folioDisp'],
                usuario: datos['usuario'],
                orden: datos['orden'].toString());

        DbHelper().saveEscolaridadSocial(escolaridadSeguridadSocial);
      });
    } catch (e) {
      print(e);
    }
  }

  getFotografiaIncompleto() async {
    var data = await Sql().readFotografiaIncompleto();

    List result = jsonDecode(data);

    try {
      result.forEach((datos) {
        FotoModel fotoModel = FotoModel(
            folio: datos['folio'],
            fileFoto: datos['fileFoto'],
            dispositivo: datos['dispositivo'],
            folioDisp: datos['folioDisp'],
            usuario: datos['usuario']);
        DbHelper().saveFoto(fotoModel);
      });
    } catch (e) {
      print(e);
    }
  }

  getRemasasIncompleto() async {
    var data = await Sql().readRemesasIncompleto();

    List result = jsonDecode(data);
    try {
      result.forEach((datos) {
        RemesasModel remesasModel = RemesasModel(
            folio: datos['folio'],
            claveFrecuenciaApoyo: datos['claveFrecuenciaApoyo'].toString(),
            ordenFrecuenciaApoyo: datos['ordenFrecuenciaApoyo'].toString(),
            dineroOtrosPaises: datos['dineroOtrosPaises'],
            frecuencia: datos['frecuencia'],
            dispositivo: datos['dispositivo'],
            folioDisp: datos['folioDisp'],
            usuario: datos['usuario']);

        DbHelper().saveRemesas(remesasModel);
      });
    } catch (e) {
      print(e);
    }
  }

  getResolucionIncompleto() async {
    var data = await Sql().readResolucionIncompleto();
    List result = jsonDecode(data);

    try {
      result.forEach((datos) {
        ResolucionModel resolucionModel = ResolucionModel(
            folio: datos['folio'],
            puntaje: datos['puntaje'].toString(),
            escalaNecesidad: datos['escalaNecesidad'],
            inseguridadAlimenticia: datos['inseguridadAlimenticia'],
            clasificacionPobresa: datos['clasificacionPobresa'],
            dispositivo: datos['dispositivo'],
            folioDisp: datos['folioDisp'],
            usuario: datos['usuario']);

        DbHelper().saveResolucion(resolucionModel);
      });
    } catch (e) {
      print(e);
    }
  }

  getResolucionBalIncompleto() async {
    var data = await Sql().readResolucionBalIncompleto();
    List result = jsonDecode(data);

    try {
      result.forEach((datos) {
        ResolucionBALModel resolucionBALModel = ResolucionBALModel(
            folio: datos['folio'],
            tipo: datos['tipo'],
            claveFrecuencia: datos['claveFrecuencia'].toString(),
            ordenFrecuencia: datos['ordenFrecuencia'].toString(),
            frecuencia: datos['frecuencia'],
            claveDuracion: datos['claveDuracion'].toString(),
            ordenDuracion: datos['ordenDuracion'].toString(),
            duracion: datos['duracion'],
            otorgarApoyo: datos['otorgarApoyo'],
            observaciones: datos['observaciones'],
            usuario: datos['usuario'],
            dispositivo: datos['dispositivo'],
            folioDisp: datos['folioDisp']);

        DbHelper().saveResolucionBAL(resolucionBALModel);
      });
    } catch (e) {
      print(e);
    }
  }

  getServiciosIncompleto() async {
    var data = await Sql().readServiciosIncompleto();
    List result = jsonDecode(data);

    try {
      result.forEach((datos) {
        ServiciosModel serviciosModel = ServiciosModel(
            folio: datos['folio'],
            pk_bano: datos['pk_bano'].toString(),
            int_orden_bano: datos['int_orden_bano'].toString(),
            txt_desc_bano: datos['txt_desc_bano'],
            otroBano: datos['otroBano'],
            claveServAgua: datos['claveServAgua'].toString(),
            ordenServAgua: datos['ordenServAgua'].toString(),
            servAgua: datos['servAgua'],
            otroAgua: datos['otroAgua'],
            claveServGas: datos['claveServGas'].toString(),
            ordenServGas: datos['ordenServGas'].toString(),
            servGas: datos['servGas'],
            otroGas: datos['otroGas'],
            claveServLuz: datos['claveServLuz'].toString(),
            ordenServLuz: datos['ordenServLuz'].toString(),
            servLuz: datos['servLuz'],
            otroLuz: datos['otroLuz'],
            claveServSanitario: datos['claveServSanitario'].toString(),
            ordenServSanitario: datos['ordenServSanitario'].toString(),
            servSanitario: datos['servSanitario'],
            otroSanitario: datos['otroSanitario'],
            folioDisp: datos['folioDisp'],
            usuario: datos['usuario'],
            dispositivo: datos['dispositivo']);

        DbHelper().saveServicios(serviciosModel);
      });
    } catch (e) {
      print(e);
    }
  }

  getSaludPertenenciaIncompleto() async {
    var data = await Sql().readSaludPertenenciaIncompleto();
    List result = jsonDecode(data);
    try {
      result.forEach((datos) {
        Salud_PertenenciaIndigenenaTablaModel
            salud_pertenenciaIndigenenaTablaModel =
            Salud_PertenenciaIndigenenaTablaModel(
                folio: datos['folio'],
                ClaveCapacidadDiferente:
                    datos['ClaveCapacidadDiferente'].toString(),
                OrdenCapacidadDiferente:
                    datos['OrdenCapacidadDiferente'].toString(),
                CapacidadDiferente: datos['CapacidadDiferente'],
                ClaveAdiccion: datos['ClaveAdiccion'].toString(),
                OrdenAdiccion: datos['OrdenAdiccion'].toString(),
                Adiccion: datos['Adiccion'],
                peso: datos['peso'],
                talla: datos['talla'],
                imc: datos['imc'],
                ClaveCondicionesSalud:
                    datos['ClaveCondicionesSalud'].toString(),
                OrdenCondicionesSalud:
                    datos['OrdenCondicionesSalud'].toString(),
                CondicionesSalud: datos['CondicionesSalud'],
                ClaveClasCondicionesSalud:
                    datos['ClaveClasCondicionesSalud'].toString(),
                OrdenClasCondicionesSalud:
                    datos['OrdenClasCondicionesSalud'].toString(),
                ClasCondicionesSalud: datos['ClasCondicionesSalud'],
                ponderacion: datos['ponderacion'],
                fileFoto1: datos['fileFoto1'],
                fileFoto2: datos['fileFoto2'],
                fileFoto3: datos['fileFoto3'],
                fileFoto4: datos['fileFoto4'],
                fileFoto5: datos['fileFoto5'],
                ClaveEtniaIndigena: datos['ClaveEtniaIndigena'].toString(),
                OrdenEtniaIndigena: datos['OrdenEtniaIndigena'].toString(),
                EtniaIndigena: datos['EtniaIndigena'],
                incompleto: datos['incompleto'],
                otroCapacidadDiferente: datos['otroCapacidadDiferente'],
                otroAdicciones: datos['otroAdicciones'],
                folioDisp: datos['folioDisp'],
                dispositivo: datos['dispositivo'],
                usuario: datos['usuario'],
                orden: datos['orden'].toString());

        DbHelper().saveSalud(salud_pertenenciaIndigenenaTablaModel);
      });
    } catch (e) {
      print(e);
    }
  }

  getIntegranteClasificacionIncompleto() async {
    var data = await Sql().readIntegranteClasificacionIncompleto();
    List reslut = jsonDecode(data);

    try {
      reslut.forEach((datos) {
        DbHelper().guardarClasificacionSalud(
            datos['orden_integrante'],
            datos['pk_clasificacion'],
            datos['folio'],
            datos['folioDisp'],
            datos['usuario'],
            datos['dispositivo']);
      });
    } catch (e) {
      print(e);
    }
  }

  getIntegranteCondicionIncompleto() async {
    var data = await Sql().readIntegranteCondicionIncompleto();
    List result = jsonDecode(data);
    try {
      result.forEach((datos) {
        DbHelper().guardarCondicionSalud(
            datos['orden_Integrante'],
            datos['pk_condicion'],
            datos['folio'],
            datos['ponderacion'],
            datos['folioDisp'],
            datos['usuario'],
            datos['dispositivo']);
      });
    } catch (e) {
      print(e);
    }
  }

  getIntegrantePrestacionLabIncompleto() async {
    var data = await Sql().readIntegrantePrestacionLabIncompleto();
    List result = jsonDecode(data);

    try {
      result.forEach((datos) {
        DbHelper().guardarPrestacionLaboral(
            datos['orden_Integrante'],
            datos['pk_prestacionLaboral'],
            datos['folio'],
            datos['folioDisp'],
            datos['usuario'],
            datos['dispositivo']);
      });
    } catch (e) {
      print(e);
    }
  }

  cargarIncompletos() async {
    Sql sql = new Sql();
    await sql.connect(context);

    setState(() {
      if (SqlConn.isConnected) {
        i = true;
      } else {
        i = false;
      }
    });
    if (i == true) {
      getAlimentacionIncompleto();
      getAportacionIncompleto();
      getEgresoIncompleto();
      getApoyoIncompleto();
      getCasaIncompleto();
      getDatosGeneralesIncompleto();
      getDocumentosIncompleto();
      getEquipamientoIncompleto();
      getEstadoDeLaCasaIncompleto();
      getEstructuraIncompleto();
      getEscolaridadIncompleto();
      getFotografiaIncompleto();
      getRemasasIncompleto();
      getResolucionIncompleto();
      getResolucionBalIncompleto();
      getServiciosIncompleto();
      getSaludPertenenciaIncompleto();
      getIntegranteClasificacionIncompleto();
      getIntegranteCondicionIncompleto();
      getIntegrantePrestacionLabIncompleto();
      getAll();
      alertDialog(context, 'Estudios descargado con exito'.toUpperCase());
    } else {
      alertDialog(context, 'Sin conexión al servidor'.toUpperCase());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESTUDIOS SOCIO - NUTRICIO REALIZADOS'.toUpperCase()),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('txt_usuario_usu');
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginForm()),
                (Route<dynamic> route) => false,
              );
            }),
        elevation: 0,
        actions: [
          Text(widget.usuario),
        ],
      ),
      body: Form(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                /* ElevatedButton(
                    onPressed: () {
                      _showAlert(context);
                    },
                    child:
                        Text('DESCARGAR ESTUDIOS INCOMPLETOS'.toUpperCase())),
                SizedBox(height: 10.0), */
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: TextButton.icon(
                      onPressed: () {
                        print(widget.usuario);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    DatosGenerales(usuario: widget.usuario)),
                            (Route<dynamic> route) => false);
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      label: Text(
                        'NUEVO ESTUDIO',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                    onPressed: mandarESN,
                    child: Text('ENVIAR ESTUDIOS SOCIONUTRICIO'.toUpperCase())),
                Container(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      children: [Expanded(child: _buildTable())],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text(
                  '¿SEGURO QUE DESEAS DESCARGAR LOS ESTUDIOS INCOMPLETOS?'),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    child: Text('CANCELAR')),
                TextButton(
                    onPressed: cargarIncompletos,
                    child: Text('DESCARGAR'.toUpperCase()))
              ],
            ));
  }

  void _showAlertDelete(BuildContext context, folio) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text('¿SEGURO QUE DESEAS ELIMINAR EL ESTUDIO?'),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    child: Text('CANCELAR')),
                TextButton(
                    onPressed: () {
                      DbHelper().eliminarEstudio(folio);
                      alertDialog(
                          context, 'Estudio con el folio: $folio , eliminado');
                      getAll();
                      Navigator.pop(context);
                    },
                    child: Text('ELIMINAR'.toUpperCase()))
              ],
            ));
  }
}
