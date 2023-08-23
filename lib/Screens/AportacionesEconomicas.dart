import 'dart:convert';

import 'package:esn/Comm/genTextConcepto.dart';
import 'package:esn/Comm/genTextFolio.dart';
import 'package:esn/Comm/genTextImporte.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/Comm/genTextAportaciones.dart';
import 'package:esn/Model/AportacionSemanal.dart';
import 'package:esn/Model/EgresoSemanal.dart';
import 'package:esn/Screens/ApoyosEnEspecie.dart';
import 'package:esn/Screens/Equipamiento.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';

import '../Comm/comHelper.dart';
import '../DatabaseHandler/DbHelper.dart';

class AportacionesEconomicas extends StatefulWidget {
  String folio;

  String folioDisp;
  String usuario;
  String dispositivo;

  AportacionesEconomicas(
      {this.folio, this.folioDisp, this.usuario, this.dispositivo});

  @override
  State<AportacionesEconomicas> createState() => _AportacionesEconomicasState();
}

class _AportacionesEconomicasState extends State<AportacionesEconomicas> {
  final _padre = TextEditingController();
  final _madre = TextEditingController();
  final _hijos = TextEditingController();
  final _prospera = TextEditingController();
  final _adultosProspera = TextEditingController();
  final _becas = TextEditingController();
  final _otros = TextEditingController();
  final _pension = TextEditingController();
  final _totalSemanalIngreso = TextEditingController();
  final _totalMensualIngreso = TextEditingController();

  final _vivienda = TextEditingController();
  final _alimentacion = TextEditingController();
  final _luz = TextEditingController();
  final _gas = TextEditingController();
  final _agua = TextEditingController();
  final _telefono = TextEditingController();
  final _transporte = TextEditingController();
  final _atencionMedica = TextEditingController();
  final _otrosGastos = TextEditingController();
  final _celular = TextEditingController();
  final _educacion = TextEditingController();
  final _totalSemanalEgreso = TextEditingController();
  final _totalMensualEgreso = TextEditingController();
  static double Suma;
  static double SumaM;
  static double SumaES;
  static double SumaEM;

  List<AportacionSemanal> _AportacionesEconomicas = [];
  List<EgresoSemanal> _Egresos = [];

  void initState() {
    super.initState();
    _totalMensualIngreso.text = '0.00';
    _totalSemanalIngreso.text = '0.00';
    _totalSemanalEgreso.text = '0.00';
    _totalMensualEgreso.text = '0.00';
  }

  SumaIngresoSemanal() {
    String padre = _padre.text;
    String madre = _madre.text;
    String hijos = _hijos.text;
    String prospera = _prospera.text;
    String adultosProspera = _adultosProspera.text;
    String becas = _becas.text;
    String otros = _otros.text;
    String pension = _pension.text;
    if (padre.isEmpty) {
      padre = "0.0";
    }
    if (madre.isEmpty) {
      madre = "0.0";
    }
    if (hijos.isEmpty) {
      hijos = "0.0";
    }
    if (prospera.isEmpty) {
      prospera = "0.0";
    }
    if (adultosProspera.isEmpty) {
      adultosProspera = "0.0";
    }
    if (becas.isEmpty) {
      becas = "0.0";
    }
    if (otros.isEmpty) {
      otros = "0.0";
    }
    if (pension.isEmpty) {
      pension = "0.0";
    }
    double ingresoSemanal = double.parse(padre) +
        double.parse(madre) +
        double.parse(hijos) +
        double.parse(prospera) +
        double.parse(adultosProspera) +
        double.parse(becas) +
        double.parse(otros) +
        double.parse(pension);

    String sumaIngresoSemanal = ingresoSemanal.toStringAsFixed(2);
    _totalSemanalIngreso.text = sumaIngresoSemanal;
    /* final _ApoyoS = TextEditingController.fromValue(TextEditingValue(text: i));
    Suma = double.parse(i);
    return _ApoyoS; */
  }

  SumaIngresoMensual() {
    String padre = _padre.text;
    String madre = _madre.text;
    String hijos = _hijos.text;
    String prospera = _prospera.text;
    String adultosProspera = _adultosProspera.text;
    String becas = _becas.text;
    String otros = _otros.text;
    String pension = _pension.text;
    if (padre.isEmpty) {
      padre = "0.0";
    }
    if (madre.isEmpty) {
      madre = "0.0";
    }
    if (hijos.isEmpty) {
      hijos = "0.0";
    }
    if (prospera.isEmpty) {
      prospera = "0.0";
    }
    if (adultosProspera.isEmpty) {
      adultosProspera = "0.0";
    }
    if (becas.isEmpty) {
      becas = "0.0";
    }
    if (otros.isEmpty) {
      otros = "0.0";
    }
    if (pension.isEmpty) {
      pension = "0.0";
    }
    double sumaIngresoSemanal = double.parse(padre) +
        double.parse(madre) +
        double.parse(hijos) +
        double.parse(prospera) +
        double.parse(adultosProspera) +
        double.parse(becas) +
        double.parse(otros) +
        double.parse(pension);

    double ingresoSemanal = (sumaIngresoSemanal * 4);

    String sumaIngresoMensual = ingresoSemanal.toStringAsFixed(2);
    _totalMensualIngreso.text = sumaIngresoMensual;
    /* final _ApoyosM = TextEditingController.fromValue(TextEditingValue(text: i));
    SumaM = double.parse(i);
    return _ApoyosM; */
  }

  SumaEgresoSemanal() {
    String vivienda = _vivienda.text;
    String alimentacion = _alimentacion.text;
    String luz = _luz.text;
    String gas = _gas.text;
    String agua = _agua.text;
    String telefono = _telefono.text;
    String transporte = _transporte.text;
    String atencionMedica = _atencionMedica.text;
    String otrosGastos = _otrosGastos.text;
    String celular = _celular.text;
    String educacion = _educacion.text;

    if (vivienda == "") {
      vivienda = "0.0";
    }
    if (alimentacion.isEmpty) {
      alimentacion = "0.0";
    }
    if (luz.isEmpty) {
      luz = "0.0";
    }
    if (gas.isEmpty) {
      gas = "0.0";
    }
    if (agua.isEmpty) {
      agua = "0.0";
    }
    if (telefono.isEmpty) {
      telefono = "0.0";
    }
    if (transporte.isEmpty) {
      transporte = "0.0";
    }
    if (atencionMedica.isEmpty) {
      atencionMedica = "0.0";
    }
    if (otrosGastos.isEmpty) {
      otrosGastos = "0.0";
    }
    if (celular.isEmpty) {
      celular = "0.0";
    }
    if (educacion.isEmpty) {
      educacion = "0.0";
    }
    double sumaEgresoSemanal = double.parse(vivienda) +
        double.parse(alimentacion) +
        double.parse(luz) +
        double.parse(gas) +
        double.parse(agua) +
        double.parse(telefono) +
        double.parse(transporte) +
        double.parse(atencionMedica) +
        double.parse(otrosGastos) +
        double.parse(celular) +
        double.parse(educacion);

    String egresoSemanal = sumaEgresoSemanal.toStringAsFixed(2);
    /* final _EgresoS = TextEditingController.fromValue(TextEditingValue(text: i));
    SumaES = double.parse(i);
    return _EgresoS; */
    _totalSemanalEgreso.text = egresoSemanal;
  }

  SumaEgresoMensual() {
    String vivienda = _vivienda.text;
    String alimentacion = _alimentacion.text;
    String luz = _luz.text;
    String gas = _gas.text;
    String agua = _agua.text;
    String telefono = _telefono.text;
    String transporte = _transporte.text;
    String atencionMedica = _atencionMedica.text;
    String otrosGastos = _otrosGastos.text;
    String celular = _celular.text;
    String educacion = _educacion.text;

    if (vivienda.isEmpty) {
      vivienda = "0.0";
    }
    if (alimentacion.isEmpty) {
      alimentacion = "0.0";
    }
    if (luz.isEmpty) {
      luz = "0.0";
    }
    if (gas.isEmpty) {
      gas = "0.0";
    }
    if (agua.isEmpty) {
      agua = "0.0";
    }
    if (telefono.isEmpty) {
      telefono = "0.0";
    }
    if (transporte.isEmpty) {
      transporte = "0.0";
    }
    if (atencionMedica.isEmpty) {
      atencionMedica = "0.0";
    }
    if (otrosGastos.isEmpty) {
      otrosGastos = "0.0";
    }
    if (celular.isEmpty) {
      celular = "0.0";
    }
    if (educacion.isEmpty) {
      educacion = "0.0";
    }
    double sumaEgresoSemanal = double.parse(vivienda) +
        double.parse(alimentacion) +
        double.parse(luz) +
        double.parse(gas) +
        double.parse(agua) +
        double.parse(telefono) +
        double.parse(transporte) +
        double.parse(atencionMedica) +
        double.parse(otrosGastos) +
        double.parse(celular) +
        double.parse(educacion);

    double egresoMensual = (sumaEgresoSemanal * 4);

    String SumaEgresoMensual = egresoMensual.toStringAsFixed(2);
    /* final _EgresoM = TextEditingController.fromValue(TextEditingValue(text: i));
    SumaEM = double.parse(i);
    return _EgresoM; */

    _totalMensualEgreso.text = SumaEgresoMensual;
  }

  getAllAportaciones() async {
    _AportacionesEconomicas = [];
    var categories =
        await CategoryService().readAportaciones(int.parse(widget.folio));
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

        _AportacionesEconomicas.add(categoryModel);
      });
    });

    _padre.text = _AportacionesEconomicas.map((e) => e.padre.toString()).first;
    _madre.text = _AportacionesEconomicas.map((e) => e.madre.toString()).first;
    _hijos.text = _AportacionesEconomicas.map((e) => e.hijos.toString()).first;
    _prospera.text =
        _AportacionesEconomicas.map((e) => e.prospera.toString()).first;
    _adultosProspera.text =
        _AportacionesEconomicas.map((e) => e.adultosMayoresProspera.toString())
            .first;
    _becas.text = _AportacionesEconomicas.map((e) => e.becas.toString()).first;
    _otros.text = _AportacionesEconomicas.map((e) => e.otros.toString()).first;
    _pension.text =
        _AportacionesEconomicas.map((e) => e.pension.toString()).first;
    _totalSemanalIngreso.text =
        _AportacionesEconomicas.map((e) => e.totalSemanal.toString()).first;
    _totalMensualIngreso.text =
        _AportacionesEconomicas.map((e) => e.totalMensual.toString()).first;
  }

  getAllEgresos() async {
    _Egresos = [];
    var categories =
        await CategoryService().readEgresos(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EgresoSemanal();
        categoryModel.folio = category['folio'];
        categoryModel.vivienda = category['vivienda'];
        categoryModel.alimentacion = category['alimentacion'];
        categoryModel.luz = category['luz'];
        categoryModel.gas = category['gas'];
        categoryModel.agua = category['agua'];
        categoryModel.telefono = category['telefono'];
        categoryModel.transporte = category['transporte'];
        categoryModel.atencionMedica = category['atencionMedica'];
        categoryModel.otrosGastos = category['otrosGastos'];
        categoryModel.celular = category['celular'];
        categoryModel.educacion = category['educacion'];
        categoryModel.totalSemanal = category['totalSemanal'];
        categoryModel.totalMensual = category['totalMensual'];

        _Egresos.add(categoryModel);
      });
    });

    _vivienda.text = _Egresos.map((e) => e.vivienda.toString()).first;
    _alimentacion.text = _Egresos.map((e) => e.alimentacion.toString()).first;
    _luz.text = _Egresos.map((e) => e.luz.toString()).first;
    _gas.text = _Egresos.map((e) => e.gas.toString()).first;
    _agua.text = _Egresos.map((e) => e.agua.toString()).first;
    _telefono.text = _Egresos.map((e) => e.telefono.toString()).first;
    _transporte.text = _Egresos.map((e) => e.transporte.toString()).first;
    _atencionMedica.text =
        _Egresos.map((e) => e.atencionMedica.toString()).first;
    _otrosGastos.text = _Egresos.map((e) => e.otrosGastos.toString()).first;
    _celular.text = _Egresos.map((e) => e.celular.toString()).first;
    _educacion.text = _Egresos.map((e) => e.educacion.toString()).first;
    _totalSemanalEgreso.text =
        _Egresos.map((e) => e.totalSemanal.toString()).first;
    _totalMensualEgreso.text =
        _Egresos.map((e) => e.totalMensual.toString()).first;
  }

  cargarDatos() {
    getAllAportaciones();
    getAllEgresos();
  }

  actualizar() async {
    String padre = _padre.text;
    String madre = _madre.text;
    String hijos = _hijos.text;
    String prospera = _prospera.text;
    String adultosProspera = _adultosProspera.text;
    String becas = _becas.text;
    String otros = _otros.text;
    String pension = _pension.text;

    if (padre.isEmpty) {
      padre = "0.0";
    }
    if (madre.isEmpty) {
      madre = "0.0";
    }
    if (hijos.isEmpty) {
      hijos = "0.0";
    }
    if (prospera.isEmpty) {
      prospera = "0.0";
    }
    if (adultosProspera.isEmpty) {
      adultosProspera = "0.0";
    }
    if (becas.isEmpty) {
      becas = "0.0";
    }
    if (otros.isEmpty) {
      otros = "0.0";
    }
    if (pension.isEmpty) {
      pension = "0.0";
    }

    String vivienda = _vivienda.text;
    String alimentacion = _alimentacion.text;
    String luz = _luz.text;
    String gas = _gas.text;
    String agua = _agua.text;
    String telefono = _telefono.text;
    String transporte = _transporte.text;
    String atencionMedica = _atencionMedica.text;
    String otrosGastos = _otrosGastos.text;
    String celular = _celular.text;
    String educacion = _educacion.text;
    if (vivienda.isEmpty) {
      vivienda = "0.0";
    }
    if (alimentacion.isEmpty) {
      alimentacion = "0.0";
    }
    if (luz.isEmpty) {
      luz = "0.0";
    }
    if (gas.isEmpty) {
      gas = "0.0";
    }
    if (agua.isEmpty) {
      agua = "0.0";
    }
    if (telefono.isEmpty) {
      telefono = "0.0";
    }
    if (transporte.isEmpty) {
      transporte = "0.0";
    }
    if (atencionMedica.isEmpty) {
      atencionMedica = "0.0";
    }
    if (otrosGastos.isEmpty) {
      otrosGastos = "0.0";
    }
    if (celular.isEmpty) {
      celular = "0.0";
    }
    if (educacion.isEmpty) {
      educacion = "0.0";
    }

    AportacionSemanal DModel = AportacionSemanal(
        folio: int.parse(widget.folio),
        padre: double.parse(padre.toString()),
        madre: double.parse(madre.toString()),
        hijos: double.parse(hijos.toString()),
        prospera: double.parse(prospera.toString()),
        adultosMayoresProspera: double.parse(adultosProspera.toString()),
        becas: double.parse(becas.toString()),
        otros: double.parse(otros.toString()),
        pension: double.parse(pension.toString()),
        totalSemanal: Suma,
        totalMensual: SumaM,
        folioDisp: widget.folioDisp,
        dispositivo: widget.dispositivo,
        usuario: widget.usuario);

    EgresoSemanal Model = EgresoSemanal(
        folio: int.parse(widget.folio),
        vivienda: double.parse(vivienda.toString()),
        alimentacion: double.parse(alimentacion.toString()),
        luz: double.parse(luz.toString()),
        gas: double.parse(gas.toString()),
        agua: double.parse(agua.toString()),
        telefono: double.parse(telefono.toString()),
        transporte: double.parse(transporte.toString()),
        atencionMedica: double.parse(atencionMedica.toString()),
        otrosGastos: double.parse(otrosGastos.toString()),
        celular: double.parse(celular.toString()),
        educacion: double.parse(educacion.toString()),
        totalSemanal: SumaES,
        totalMensual: SumaEM,
        folioDisp: widget.folioDisp,
        dispositivo: widget.dispositivo,
        usuario: widget.usuario);

    await DbHelper().upDateApoyo(DModel).then((aportacionSemanal) {
      alertDialog(context, "Se registro correctamente");
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos");
    });

    await DbHelper().upDateEgreso(Model).then((egresoSemanal) {
      alertDialog(context, "Se registro correctamente");
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new ApoyosEnEspecie(
            folio: widget.folio,
            dispositivo: widget.dispositivo,
            folioDisp: widget.folioDisp,
            usuario: widget.usuario);
      }));
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos");
    });
  }

  insertDatos() async {
    String padre = _padre.text;
    String madre = _madre.text;
    String hijos = _hijos.text;
    String prospera = _prospera.text;
    String adultosProspera = _adultosProspera.text;
    String becas = _becas.text;
    String otros = _otros.text;
    String pension = _pension.text;

    if (padre.isEmpty) {
      padre = "0.0";
    }
    if (madre.isEmpty) {
      madre = "0.0";
    }
    if (hijos.isEmpty) {
      hijos = "0.0";
    }
    if (prospera.isEmpty) {
      prospera = "0.0";
    }
    if (adultosProspera.isEmpty) {
      adultosProspera = "0.0";
    }
    if (becas.isEmpty) {
      becas = "0.0";
    }
    if (otros.isEmpty) {
      otros = "0.0";
    }
    if (pension.isEmpty) {
      pension = "0.0";
    }

    String vivienda = _vivienda.text;
    String alimentacion = _alimentacion.text;
    String luz = _luz.text;
    String gas = _gas.text;
    String agua = _agua.text;
    String telefono = _telefono.text;
    String transporte = _transporte.text;
    String atencionMedica = _atencionMedica.text;
    String otrosGastos = _otrosGastos.text;
    String celular = _celular.text;
    String educacion = _educacion.text;
    if (vivienda.isEmpty) {
      vivienda = "0.0";
    }
    if (alimentacion.isEmpty) {
      alimentacion = "0.0";
    }
    if (luz.isEmpty) {
      luz = "0.0";
    }
    if (gas.isEmpty) {
      gas = "0.0";
    }
    if (agua.isEmpty) {
      agua = "0.0";
    }
    if (telefono.isEmpty) {
      telefono = "0.0";
    }
    if (transporte.isEmpty) {
      transporte = "0.0";
    }
    if (atencionMedica.isEmpty) {
      atencionMedica = "0.0";
    }
    if (otrosGastos.isEmpty) {
      otrosGastos = "0.0";
    }
    if (celular.isEmpty) {
      celular = "0.0";
    }
    if (educacion.isEmpty) {
      educacion = "0.0";
    }

    double ingresoMensual = double.parse(_totalMensualIngreso.text);
    double egresoMensual = double.parse(_totalMensualEgreso.text);
    if (_totalMensualIngreso.text == '0.00' ||
        _totalMensualEgreso.text == '0.00'.toUpperCase()) {
      alertDialog(
          context, 'Porfavor genera la suma de las aportaciones'.toUpperCase());
    } else {
      var egreso = egresoMensual - ingresoMensual;
      print(egreso);
      print(egresoMensual);
      if (egreso >= 2000) {
        alertDialog(
            context, 'Tú egreso no puede ser mayor a tu ingreso'.toUpperCase());
      } else {
        AportacionSemanal DModel = AportacionSemanal(
            folio: int.parse(widget.folio),
            padre: double.parse(padre.toString()),
            madre: double.parse(madre.toString()),
            hijos: double.parse(hijos.toString()),
            prospera: double.parse(prospera.toString()),
            adultosMayoresProspera: double.parse(adultosProspera.toString()),
            becas: double.parse(becas.toString()),
            otros: double.parse(otros.toString()),
            pension: double.parse(pension.toString()),
            totalSemanal: double.parse(_totalSemanalIngreso.text),
            totalMensual: ingresoMensual,
            folioDisp: widget.folioDisp,
            dispositivo: widget.dispositivo,
            usuario: widget.usuario);

        EgresoSemanal Model = EgresoSemanal(
            folio: int.parse(widget.folio),
            vivienda: double.parse(vivienda.toString()),
            alimentacion: double.parse(alimentacion.toString()),
            luz: double.parse(luz.toString()),
            gas: double.parse(gas.toString()),
            agua: double.parse(agua.toString()),
            telefono: double.parse(telefono.toString()),
            transporte: double.parse(transporte.toString()),
            atencionMedica: double.parse(atencionMedica.toString()),
            otrosGastos: double.parse(otrosGastos.toString()),
            celular: double.parse(celular.toString()),
            educacion: double.parse(educacion.toString()),
            totalSemanal: double.parse(_totalSemanalEgreso.text),
            totalMensual: egresoMensual,
            folioDisp: widget.folioDisp,
            dispositivo: widget.dispositivo,
            usuario: widget.usuario);

        await DbHelper().saveApoyoSemanal(DModel).then((aportacionSemanal) {
          alertDialog(context, "Se registro correctamente");
        }).catchError((error) {
          print(error);
          alertDialog(context, "Error: No se guardaron los datos");
        });

        await DbHelper().saveEgresoSemanal(Model).then((egresoSemanal) {
          alertDialog(context, "Se registro correctamente");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (_) => ApoyosEnEspecie(
                    folio: widget.folio,
                    dispositivo: widget.dispositivo,
                    folioDisp: widget.folioDisp,
                    usuario: widget.usuario)),
            (Route<dynamic> route) => false,
          );
        }).catchError((error) {
          print(error);
          alertDialog(context, "Error: No se guardaron los datos");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aportaciones Economicas'.toUpperCase()),
        /* leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => Equipamiento(
                        folio: widget.folio,
                        dispositivo: widget.dispositivo,
                        folioDisp: widget.folioDisp,
                        usuario: widget.usuario)),
                (Route<dynamic> route) => false);
          },
        ), */
      ),
      body: Form(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                getTextQuestion(question: 'FOLIo'.toUpperCase()),
                SizedBox(height: 5.0),
                getTextFolio(
                  controller: TextEditingController.fromValue(
                      TextEditingValue(text: widget.folio)),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: cargarDatos,
                    icon: Icon(Icons.add_circle_outline, color: Colors.white),
                    label: Text(
                      'Cargar datos'.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                getTextAportaciones(
                    encabezado: 'Aportación Semanal'.toUpperCase()),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: DataTable(
                              dataRowHeight: 100,
                              columnSpacing: 10,
                              columns: [
                                DataColumn(
                                    label: getTextCocepto(
                                        concepto: 'Concepto'.toUpperCase())),
                                DataColumn(
                                    label: getTextCocepto(
                                        concepto: 'Importe'.toUpperCase()))
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('Padre'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(getTextImporte(controller: _padre))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Madre'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(getTextImporte(controller: _madre))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Hijos'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(getTextImporte(controller: _hijos))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('PROSPERA'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(
                                      getTextImporte(controller: _prospera))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text(
                                      'Adultos Mayores \n PROSPERA'
                                          .toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(getTextImporte(
                                      controller: _adultosProspera))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Becas'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(getTextImporte(controller: _becas))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Otros'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(getTextImporte(controller: _otros))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Pensión'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(getTextImporte(controller: _pension))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total Semanal'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(Container(
                                    padding: EdgeInsets.only(top: 5),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _totalSemanalIngreso,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          SumaIngresoSemanal();
                                        });
                                      },
                                    ),
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total Mensual'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(Container(
                                    padding: EdgeInsets.only(top: 5),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _totalMensualIngreso,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          SumaIngresoMensual();
                                        });
                                      },
                                    ),
                                  ))
                                ]),
                              ]),
                        )
                      ],
                    )),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                SizedBox(height: 10.0),
                getTextAportaciones(encabezado: 'Egreso Semanal'.toUpperCase()),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: DataTable(
                              dataRowHeight: 100,
                              columnSpacing: 10,
                              columns: [
                                DataColumn(
                                    label: getTextCocepto(
                                        concepto: 'Concepto'.toUpperCase())),
                                DataColumn(
                                    label: getTextCocepto(
                                        concepto: 'Importe'.toUpperCase()))
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('Vivienda'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(
                                      getTextImporte(controller: _vivienda))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Alimentación'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(
                                      getTextImporte(controller: _alimentacion))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Luz'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(getTextImporte(controller: _luz))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Gas'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(getTextImporte(controller: _gas))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Agua'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(getTextImporte(controller: _agua))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Teléfono'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(
                                      getTextImporte(controller: _telefono))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Transporte'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(
                                      getTextImporte(controller: _transporte))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Atención Médica'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(getTextImporte(
                                      controller: _atencionMedica))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Otros Gastos'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(
                                      getTextImporte(controller: _otrosGastos))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Celular'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(getTextImporte(controller: _celular))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Educación'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(
                                      getTextImporte(controller: _educacion))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total Semanal'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(Container(
                                    padding: EdgeInsets.only(top: 5),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _totalSemanalEgreso,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          SumaEgresoSemanal();
                                        });
                                      },
                                    ),
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total Mensual'.toUpperCase(),
                                      style: TextStyle(fontSize: 20))),
                                  DataCell(Container(
                                    padding: EdgeInsets.only(top: 5),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _totalMensualEgreso,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          SumaEgresoMensual();
                                        });
                                      },
                                    ),
                                  ))
                                ]),
                              ]),
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: TextButton.icon(
                      onPressed: insertDatos,
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Continuar'.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      )),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                SizedBox(height: 70.0),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: actualizar,
                    icon: Icon(Icons.arrow_circle_right_outlined,
                        color: Colors.white),
                    label: Text(
                      'Actualizar'.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
