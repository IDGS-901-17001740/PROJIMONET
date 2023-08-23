import 'package:esn/Comm/genTextEquipamiento.dart';
import 'package:esn/Comm/genTextField.dart';
import 'package:esn/Comm/genTextFolio.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/Model/DuracionModel.dart';
import 'package:esn/Model/FrecuenciaModel.dart';
import 'package:esn/Model/ResolucionBALModel.dart';
import 'package:esn/Model/ResolucionModel.dart';
import 'package:esn/Screens/Alimentacion.dart';
import 'package:esn/Screens/Documentos.dart';
import 'package:esn/Screens/Fotografia.dart';
import 'package:esn/replaceAll/replaceAllLetter.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import '../Comm/comHelper.dart';
import '../DatabaseHandler/DbHelper.dart';

enum apoyo { SI, NO }

class Resolucion extends StatefulWidget {
  String folio;
  String folioDisp;
  String usuario;
  String dispositivo;
  Resolucion({this.folio, this.folioDisp, this.dispositivo, this.usuario});

  @override
  State<Resolucion> createState() => _ResolucionState();
}

class _ResolucionState extends State<Resolucion> {
  final _puntaje = TextEditingController();
  final _escalaNecesidad = TextEditingController();
  final _inseguridadAlimenticia = TextEditingController();
  final _clasificacionPobreza = TextEditingController();
  final _observaciones = TextEditingController();
  List<ResolucionModel> _Resolucion = [];
  List<ResolucionBALModel> _ResolucionBal = [];
  final _formKey = GlobalKey<FormState>();

  apoyo _apoyo;
  List<String> _Tipo = [
    'Cuota'.toUpperCase(),
    'Beca'.toUpperCase(),
    'Media Beca'.toUpperCase()
  ];
  List<FrecuenciaModel> _Frecuencia = [];
  List<DuracionModel> _Duracion = [];

  final _tipo = TextEditingController();
  final _frecuencia = TextEditingController();
  final _duracion = TextEditingController();

  @override
  void initState() {
    getAllCategoriesDuracion();
    getAllCategoriesFrecuencia();
    _observaciones.text = "N/A";
    super.initState();
  }

  getAllCategoriesFrecuencia() async {
    _Frecuencia = [];
    var categories = await CategoryService().readCategoriesFrecuancia();
    categories.forEach((category) {
      setState(() {
        var categoryModel = FrecuenciaModel();
        categoryModel.Frecuencia = category['Frecuencia'];
        _Frecuencia.add(categoryModel);
      });
    });
  }

  getAllCategoriesDuracion() async {
    _Duracion = [];
    var categories = await CategoryService().readCategoriesDuraciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = DuracionModel();
        categoryModel.Duracion = category['Duracion'];
        _Duracion.add(categoryModel);
      });
    });
  }

  getAllResolucion() async {
    _Resolucion = [];
    var categories =
        await CategoryService().readResolucion(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = ResolucionModel();
        categoryModel.folio = category['folio'];
        categoryModel.puntaje = category['puntaje'];
        categoryModel.escalaNecesidad = category['escalaNecesidad'];
        categoryModel.inseguridadAlimenticia =
            category['inseguridadAlimenticia'];
        categoryModel.clasificacionPobresa = category['clasificacionPobresa'];

        _Resolucion.add(categoryModel);
      });
    });

    _puntaje.text = _Resolucion.map((e) => e.puntaje).first;
    _escalaNecesidad.text = _Resolucion.map((e) => e.escalaNecesidad).first;
    _inseguridadAlimenticia.text =
        _Resolucion.map((e) => e.inseguridadAlimenticia).first;
    _clasificacionPobreza.text =
        _Resolucion.map((e) => e.clasificacionPobresa).first;
  }

  getAllResolucionBal() async {
    _ResolucionBal = [];
    var categories =
        await CategoryService().readResolucionBal(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = ResolucionBALModel();
        categoryModel.folio = category['folio'];
        categoryModel.tipo = category['tipo'];
        categoryModel.frecuencia = category['frecuencia'];
        categoryModel.duracion = category['duracion'];
        categoryModel.otorgarApoyo = category['otorgarApoyo'];
        categoryModel.observaciones = category['observaciones'];
        _ResolucionBal.add(categoryModel);
      });
    });

    _tipo.text = _ResolucionBal.map((e) => e.tipo).first;
    _frecuencia.text = _ResolucionBal.map((e) => e.frecuencia).first;
    _duracion.text = _ResolucionBal.map((e) => e.duracion).first;
    _observaciones.text = _ResolucionBal.map((e) => e.observaciones).first;

    if (_ResolucionBal.map((e) => e.otorgarApoyo).first == "SI".toUpperCase()) {
      _apoyo = apoyo.SI;
    } else if (_ResolucionBal.map((e) => e.otorgarApoyo).first ==
        "NO".toUpperCase()) {
      _apoyo = apoyo.NO;
    }
  }

  cargarDatos() {
    getAllResolucion();
    getAllResolucionBal();
  }

  actualizar() async {
    var clave;

    if (_frecuencia.text == "Diario".toUpperCase()) {
      clave = "1";
    } else if (_frecuencia.text == "Semanal".toUpperCase()) {
      clave = "2";
    } else if (_frecuencia.text == "Quincenal".toUpperCase()) {
      clave = "3";
    } else if (_frecuencia.text == "Mensual".toUpperCase()) {
      clave = "4";
    } else if (_frecuencia.text == "BIMESTRAL".toUpperCase()) {
      clave = "5";
    } else if (_frecuencia.text == "ANUAL".toUpperCase()) {
      clave = "6";
    } else if (_frecuencia.text == "N/A".toUpperCase()) {
      clave = "0";
    } else if (_frecuencia.text == "NINGUNO") {
      clave = "6";
    }

    ResolucionModel BModel = ResolucionModel(
        folio: int.parse(widget.folio),
        puntaje: _puntaje.text.toString(),
        escalaNecesidad: _escalaNecesidad.text.toString(),
        inseguridadAlimenticia: _inseguridadAlimenticia.text.toString(),
        clasificacionPobresa: _clasificacionPobreza.text.toString(),
        usuario: widget.usuario,
        dispositivo: widget.dispositivo,
        folioDisp: widget.folioDisp);

    await DbHelper()
        .upDateResolucion(BModel)
        .then((resolucionModel) {})
        .catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos".toUpperCase());
    });

    ResolucionBALModel RModel = ResolucionBALModel(
        folio: int.parse(widget.folio),
        tipo: _tipo.text.toString(),
        claveFrecuencia: clave,
        ordenFrecuencia: clave,
        frecuencia: _frecuencia.text.toString(),
        claveDuracion: _duracion.text.substring(0, 2).trimRight(),
        ordenDuracion: _duracion.text.substring(0, 2).trimRight(),
        duracion: _duracion.text.toString(),
        otorgarApoyo: _apoyo.name,
        observaciones: _observaciones.text.toString(),
        dispositivo: widget.dispositivo,
        folioDisp: widget.folioDisp,
        usuario: widget.usuario);

    await DbHelper().saveResolucionBAL(RModel).then((resolucionBALModel) {
      alertDialog(context, "Se registro correctamente".toUpperCase());
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new Fotografia(
            folio: widget.folio,
            dispositivo: widget.dispositivo,
            folioDisp: widget.folioDisp,
            usuario: widget.usuario);
      }));
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos".toUpperCase());
    });
  }

  enviar() async {
    var clave;

    if (_frecuencia.text == "Diario".toUpperCase()) {
      clave = "1";
    } else if (_frecuencia.text == "Semanal".toUpperCase()) {
      clave = "2";
    } else if (_frecuencia.text == "Quincenal".toUpperCase()) {
      clave = "3";
    } else if (_frecuencia.text == "Mensual".toUpperCase()) {
      clave = "4";
    } else if (_frecuencia.text == "BIMESTRAL".toUpperCase()) {
      clave = "5";
    } else if (_frecuencia.text == "ANUAL".toUpperCase()) {
      clave = "6";
    } else if (_frecuencia.text == "N/A".toUpperCase()) {
      clave = "0";
    } else if (_frecuencia.text == "NINGUNO") {
      clave = "6";
    }

    //Duracion y Frecuencia
    ResolucionModel BModel = ResolucionModel(
        folio: int.parse(widget.folio),
        puntaje: _puntaje.text.toString(),
        escalaNecesidad: _escalaNecesidad.text.toString(),
        inseguridadAlimenticia: _inseguridadAlimenticia.text.toString(),
        clasificacionPobresa: _clasificacionPobreza.text.toString(),
        dispositivo: widget.dispositivo,
        folioDisp: widget.folioDisp,
        usuario: widget.usuario);

    await DbHelper()
        .saveResolucion(BModel)
        .then((resolucionModel) {})
        .catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos".toUpperCase());
    });
    replaceAllLetter rp = new replaceAllLetter();
    ResolucionBALModel RModel = ResolucionBALModel(
        folio: int.parse(widget.folio),
        tipo: _tipo.text.toString(),
        claveFrecuencia: clave,
        ordenFrecuencia: clave,
        frecuencia: _frecuencia.text.toString(),
        claveDuracion: rp.replaceLetter(_duracion.text),
        ordenDuracion: rp.replaceLetter(_duracion.text),
        duracion: _duracion.text.toString(),
        otorgarApoyo: _apoyo.name,
        observaciones: _observaciones.text.toString(),
        usuario: widget.usuario,
        dispositivo: widget.dispositivo,
        folioDisp: widget.folioDisp);

    await DbHelper().saveResolucionBAL(RModel).then((resolucionBALModel) {
      alertDialog(context, "Se registro correctamente".toUpperCase());
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => Fotografia(
                folio: widget.folio,
                dispositivo: widget.dispositivo,
                folioDisp: widget.folioDisp,
                usuario: widget.usuario)),
        (Route<dynamic> route) => false,
      );
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos".toUpperCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resolución'.toUpperCase()),
        /* leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => Documentos(
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
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Puntaje'.toUpperCase()),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    controller: _puntaje,
                    decoration: InputDecoration(
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
                        fillColor: Colors.grey[120],
                        filled: true),
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Escala de Necesidad'.toUpperCase()),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    controller: _escalaNecesidad,
                    decoration: InputDecoration(
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
                        fillColor: Colors.grey[120],
                        filled: true),
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(
                    question: 'Inseguridad Alimenticia'.toUpperCase()),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    controller: _inseguridadAlimenticia,
                    decoration: InputDecoration(
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
                        fillColor: Colors.grey[120],
                        filled: true),
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(
                    question: 'Clasificación de Pobreza'.toUpperCase()),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    controller: _clasificacionPobreza,
                    decoration: InputDecoration(
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
                        fillColor: Colors.grey[120],
                        filled: true),
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                getTextEquipamiento(
                    encabezado:
                        'Resolución del Banco de Alimentos'.toUpperCase()),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Tipo:'.toUpperCase()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchField(
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Este campo no puede estar vacio';
                      }
                      return null;
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
                    suggestions: _Tipo.map((tipo) =>
                            SearchFieldListItem(tipo.toString(), item: tipo))
                        .toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipo,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x) {},
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Frecuencia:'.toUpperCase()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchField(
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Este campo no puede estar vacio';
                      }
                      return null;
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
                    controller: _frecuencia,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x) {},
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Duracion:'.toUpperCase()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchField(
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Este campo no puede estar vacio';
                      }
                      return null;
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
                    suggestions: _Duracion.map((duracion) =>
                        SearchFieldListItem(duracion.Duracion,
                            item: duracion)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _duracion,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x) {},
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Otorgar Apoyo'.toUpperCase()),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text('Si'.toUpperCase()),
                        leading: Radio<apoyo>(
                          value: apoyo.SI,
                          groupValue: _apoyo,
                          toggleable: true,
                          onChanged: (apoyo value) {
                            setState(() {
                              _apoyo = value;
                            });
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'.toUpperCase()),
                        leading: Radio<apoyo>(
                          value: apoyo.NO,
                          groupValue: _apoyo,
                          toggleable: true,
                          onChanged: (apoyo value) {
                            setState(() {
                              _apoyo = value;
                            });
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Observaciones'.toUpperCase()),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    onTap: () {
                      _observaciones.clear();
                    },
                    textCapitalization: TextCapitalization.characters,
                    controller: _observaciones,
                    decoration: InputDecoration(
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
                        fillColor: Colors.grey[120],
                        filled: true),
                  ),
                ),
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
