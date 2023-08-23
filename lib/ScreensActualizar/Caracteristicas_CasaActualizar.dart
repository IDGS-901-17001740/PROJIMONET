import 'package:esn/Comm/genTextField.dart';
import 'package:esn/Comm/genTextFolio.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/Model/CaracteristicasCasa.dart';
import 'package:esn/Screens/Equipamiento.dart';
import 'package:esn/Screens/Infraestructura_Vivienda.dart';
import 'package:esn/ScreensActualizar/ActualizarEstudio.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';
import '../Comm/comHelper.dart';
import '../DatabaseHandler/DbHelper.dart';

enum CocinaSeparada { SI, NO }

enum CuartoBanio { SI, NO }

class Caracteristicas_Casa extends StatefulWidget {
  String folio;

  String folioDisp;
  String usuario;
  String dispositivo;
  Caracteristicas_Casa(
      {this.folio, this.dispositivo, this.usuario, this.folioDisp});

  @override
  State<Caracteristicas_Casa> createState() => _Caracteristicas_CasaState();
}

class _Caracteristicas_CasaState extends State<Caracteristicas_Casa> {
  final _numCuartos = TextEditingController();
  final _numCuartosDormir = TextEditingController();
  CocinaSeparada _cocinaSeparada;
  CuartoBanio _cuartoBanio;
  var dbHelper;
  List<CaracteristicasCasa> _CaracteristicasCasa = [];

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  getAllCasa() async {
    _CaracteristicasCasa = [];
    var categories = await CategoryService().readCasa(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = CaracteristicasCasa();
        categoryModel.folio = category['folio'];
        categoryModel.numCuartos = category['numCuartos'];
        categoryModel.cuartosDormir = category['cuartosDormir'];
        categoryModel.cocinaSeparada = category['cocinaSeparada'];
        categoryModel.cuartoBanioExclusivo = category['cuartoBanioExclusivo'];

        _CaracteristicasCasa.add(categoryModel);
      });
    });

    _numCuartos.text = _CaracteristicasCasa.map((e) => e.numCuartos).first;
    _numCuartosDormir.text =
        _CaracteristicasCasa.map((e) => e.cuartosDormir).first;

    if (_CaracteristicasCasa.map((e) => e.cocinaSeparada.toString()).first ==
        "SI") {
      _cocinaSeparada = CocinaSeparada.SI;
    } else if (_CaracteristicasCasa.map((e) => e.cocinaSeparada.toString())
            .first ==
        "NO") {
      _cocinaSeparada = CocinaSeparada.NO;
    }

    if (_CaracteristicasCasa.map((e) => e.cuartoBanioExclusivo.toString())
            .first ==
        "SI") {
      _cuartoBanio = CuartoBanio.SI;
    } else if (_CaracteristicasCasa.map(
            (e) => e.cuartoBanioExclusivo.toString()).first ==
        "NO") {
      _cuartoBanio = CuartoBanio.NO;
    }
  }

  actualizar() async {
    if (int.parse(_numCuartos.text) < int.parse(_numCuartosDormir.text)) {
      alertDialog(context, 'Verificar el número de cuartos');
    } else {
      CaracteristicasCasa DModel = CaracteristicasCasa(
        folio: int.parse(widget.folio),
        numCuartos: _numCuartos.text.toString(),
        cuartosDormir: _numCuartosDormir.text.toString(),
        cocinaSeparada: _cocinaSeparada.name,
        cuartoBanioExclusivo: _cuartoBanio.name,
        folioDisp: widget.folioDisp,
        dispositivo: widget.dispositivo,
        usuario: widget.usuario,
      );

      await dbHelper.upDateCasa(DModel).then((caracteristicasCasa) {
        alertDialog(context, "Se actualizo correctamente");
        Navigator.of(context)
            .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          return new ActualizarEstudio(
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
  }

  insertDatos() async {
    if (int.parse(_numCuartos.text) < int.parse(_numCuartosDormir.text)) {
      alertDialog(context, 'Verificar el número de cuartos');
    } else {
      CaracteristicasCasa DModel = CaracteristicasCasa(
          folio: int.parse(widget.folio),
          numCuartos: _numCuartos.text.toString(),
          cuartosDormir: _numCuartosDormir.text.toString(),
          cocinaSeparada: _cocinaSeparada.name,
          cuartoBanioExclusivo: _cuartoBanio.name,
          folioDisp: widget.folioDisp,
          dispositivo: widget.dispositivo,
          usuario: widget.usuario);

      await dbHelper.saveCasa(DModel).then((caracteristicasCasa) {
        alertDialog(context, "Se registro correctamente");
        Navigator.of(context)
            .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          return new ActualizarEstudio(
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
  }

  save() async {
    if (_CaracteristicasCasa.isEmpty) {
      insertDatos();
    } else {
      actualizar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Folio'.toUpperCase()),
                SizedBox(height: 5.0),
                getTextFolio(
                  controller: TextEditingController.fromValue(
                      TextEditingValue(text: widget.folio)),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: getAllCasa,
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
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Número de Cuartos'.toUpperCase()),
                SizedBox(height: 5.0),
                getTextField(
                    controller: _numCuartos, inputType: TextInputType.number),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Cuartos para Dormir'.toUpperCase()),
                SizedBox(height: 5.0),
                getTextField(
                    controller: _numCuartosDormir,
                    inputType: TextInputType.number),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Cocina Separada'.toUpperCase()),
                ListTile(
                  title: Text('Si'.toUpperCase()),
                  leading: Radio<CocinaSeparada>(
                    value: CocinaSeparada.SI,
                    groupValue: _cocinaSeparada,
                    onChanged: (CocinaSeparada value) {
                      setState(() {
                        _cocinaSeparada = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('No'.toUpperCase()),
                  leading: Radio<CocinaSeparada>(
                    value: CocinaSeparada.NO,
                    groupValue: _cocinaSeparada,
                    onChanged: (CocinaSeparada value) {
                      setState(() {
                        _cocinaSeparada = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(
                    question: 'Cuarto de Baño Exclusivo'.toUpperCase()),
                ListTile(
                  title: Text('Si'.toUpperCase()),
                  leading: Radio<CuartoBanio>(
                    value: CuartoBanio.SI,
                    groupValue: _cuartoBanio,
                    onChanged: (CuartoBanio value) {
                      setState(() {
                        _cuartoBanio = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('No'.toUpperCase()),
                  leading: Radio<CuartoBanio>(
                    value: CuartoBanio.NO,
                    groupValue: _cuartoBanio,
                    onChanged: (CuartoBanio value) {
                      setState(() {
                        _cuartoBanio = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: save,
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
