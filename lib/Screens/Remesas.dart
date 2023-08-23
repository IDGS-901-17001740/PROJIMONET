import 'package:esn/Comm/genTextEquipamiento.dart';
import 'package:esn/Comm/genTextField.dart';
import 'package:esn/Comm/genTextFolio.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/Model/FrecuenciaModel.dart';
import 'package:esn/Model/RemesasModel.dart';
import 'package:esn/Screens/ApoyosEnEspecie.dart';
import 'package:esn/Screens/Alimentacion.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import '../Comm/comHelper.dart';
import '../DatabaseHandler/DbHelper.dart';

enum OtrosPaises { SI, NO }

class Remesas extends StatefulWidget {
  String folio;

  String folioDisp;
  String usuario;
  String dispositivo;
  Remesas({this.folio, this.folioDisp, this.dispositivo, this.usuario});

  @override
  State<Remesas> createState() => _RemesasState();
}

class _RemesasState extends State<Remesas> {
  final _formKey = GlobalKey<FormState>();
  List<FrecuenciaModel> _Frecuencia = [];

  OtrosPaises _otrosPaises;
  final _frecuenciaApoyo = TextEditingController();
  var dbHelper;
  List<RemesasModel> _Remesas = [];

  getAllCategoriesFrecuencia() async {
    _Frecuencia = [];
    var categories = await CategoryService().readCategoriesFrecuancia();
    categories.forEach((category) {
      setState(() {
        var categoryModel = FrecuenciaModel();
        categoryModel.Frecuencia = category['Frecuencia'];
        categoryModel.ClaveFrecuencia = category['ClaveFrecuencia'];
        categoryModel.OrdenFrecuencia = category['OrdenFrecuencia'];
        _Frecuencia.add(categoryModel);
      });
    });
  }

  @override
  void initState() {
    getAllCategoriesFrecuencia();
    super.initState();
  }

  getAllRemesas() async {
    _Remesas = [];
    var categories =
        await CategoryService().readRemesas(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = RemesasModel();
        categoryModel.folio = category['folio'];
        categoryModel.dineroOtrosPaises = category['dineroOtrosPaises'];
        categoryModel.frecuencia = category['frecuencia'];

        _Remesas.add(categoryModel);
      });
    });

    if (_Remesas.map((e) => e.dineroOtrosPaises.toString()).first == "SI") {
      _otrosPaises = OtrosPaises.SI;
    } else if (_Remesas.map((e) => e.dineroOtrosPaises.toString()).first ==
        "NO") {
      _otrosPaises = OtrosPaises.NO;
    }
    _frecuenciaApoyo.text = _Remesas.map((e) => e.frecuencia.toString()).first;
  }

  actualizar() async {
    var clave;

    if (_frecuenciaApoyo.text == "Diario") {
      clave = "1";
    } else if (_frecuenciaApoyo.text == "Semanal") {
      clave = "2";
    } else if (_frecuenciaApoyo.text == "Quincenal") {
      clave = "3";
    } else if (_frecuenciaApoyo.text == "Mensual") {
      clave = "4";
    } else if (_frecuenciaApoyo.text == "Anual") {
      clave = "5";
    } else if (_frecuenciaApoyo.text == "Ninguno") {
      clave = "5";
    }

    RemesasModel BModel = RemesasModel(
        folio: int.parse(widget.folio),
        claveFrecuenciaApoyo: clave,
        ordenFrecuenciaApoyo: clave,
        dineroOtrosPaises: _otrosPaises.name,
        frecuencia: _frecuenciaApoyo.text.toString(),
        dispositivo: widget.dispositivo,
        folioDisp: widget.folioDisp,
        usuario: widget.usuario);

    await DbHelper().upDateRemesas(BModel).then((remesasModel) {
      alertDialog(context, "Se registro correctamente");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => Alimentacion(
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

  enviar() async {
    var clave;
    var orden;

    _Frecuencia = [];
    var categories = await DbHelper().readFrecuencia(_frecuenciaApoyo.text);
    categories.forEach((category) {
      setState(() {
        var categoryModel = FrecuenciaModel();
        categoryModel.Frecuencia = category['Frecuencia'];
        categoryModel.ClaveFrecuencia = category['ClaveFrecuencia'];
        categoryModel.OrdenFrecuencia = category['OrdenFrecuencia'];
        _Frecuencia.add(categoryModel);

        clave = _Frecuencia.map((e) => e.ClaveFrecuencia).first;
        orden = _Frecuencia.map((e) => e.OrdenFrecuencia).first;
      });
    });
    print(_frecuenciaApoyo.text);
    print(clave);
    print(orden);

    RemesasModel BModel = RemesasModel(
        folio: int.parse(widget.folio),
        claveFrecuenciaApoyo: clave.toString(),
        ordenFrecuenciaApoyo: orden.toString(),
        dineroOtrosPaises: _otrosPaises.name,
        frecuencia: _frecuenciaApoyo.text.toString(),
        dispositivo: widget.dispositivo,
        folioDisp: widget.folioDisp,
        usuario: widget.usuario);

    await DbHelper().saveRemesas(BModel).then((remesasModel) {
      alertDialog(context, "Se registro correctamente");
      print(clave);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => Alimentacion(
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

    print(_frecuenciaApoyo.text);
    print(clave);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remesas'.toUpperCase()),
        /* leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => ApoyosEnEspecie(
                        folio: widget.folio,
                        dispositivo: widget.dispositivo,
                        folioDisp: widget.folioDisp,
                        usuario: widget.usuario)),
                (Route<dynamic> route) => false);
          },
        ), */
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
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
                    onPressed: getAllRemesas,
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
                getTextQuestion(
                    question:
                        '¿Alguien en el hogar recibe dinero proveniente de otros paises?'
                            .toUpperCase()),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text('Si'.toUpperCase()),
                  leading: Radio<OtrosPaises>(
                    value: OtrosPaises.SI,
                    groupValue: _otrosPaises,
                    onChanged: (OtrosPaises value) {
                      setState(() {
                        _otrosPaises = value;
                        _frecuenciaApoyo.clear();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('No'.toUpperCase()),
                  leading: Radio<OtrosPaises>(
                    value: OtrosPaises.NO,
                    groupValue: _otrosPaises,
                    onChanged: (OtrosPaises value) {
                      setState(() {
                        _otrosPaises = value;

                        if (_otrosPaises == OtrosPaises.NO) {
                          _frecuenciaApoyo.text = 'N/A';
                        } else {
                          _frecuenciaApoyo.clear();
                        }
                      });
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(
                    question: 'Frecuencia del Apoyo:'.toUpperCase()),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchField(
                    validator: (value) {
                      if (value.isEmpty || value == '') {
                        return 'Este campo no puede estar vacio';
                      } else {
                        return null;
                      }
                    },
                    suggestionState: Suggestion.expand,
                    searchInputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.black26,
                            style: BorderStyle.solid),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.blue,
                            style: BorderStyle.solid),
                      ),
                      filled: true,
                      fillColor: Colors.grey[120],
                    ),
                    suggestions: _Frecuencia.map((frecuencia) =>
                        SearchFieldListItem(frecuencia.Frecuencia,
                            item: frecuencia)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _frecuenciaApoyo,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        enviar();
                      }
                    },
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                    label: Text(
                      'Continuar'.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
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
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        actualizar();
                      }
                    },
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
