import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextField.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/CodigoPostalModel.dart';
import 'package:esn/Model/DatosGeneralesModel.dart';
import 'package:esn/Model/DispoModel.dart';
import 'package:esn/Model/TipoVialidad.dart';
import 'package:esn/Screens/Servicios/ServBano.dart';
import 'package:esn/replaceAll/replaceAllLetter.dart';
import 'package:esn/replaceAll/replaceAllNum.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:searchfield/searchfield.dart';

enum noTiene { no }

class DatosGenerales extends StatefulWidget {
  String usuario;
  DatosGenerales({this.usuario});

  @override
  State<DatosGenerales> createState() => _DatosGeneralesState();
}

class _DatosGeneralesState extends State<DatosGenerales> {
  noTiene _noTiene;
  List<CodigoPostalModel> _CodigoPostal = [];
  List<CodigoPostalModel> _CodigoPostal2 = [];
  List<CodigoPostalModel> _Asentamiento = [];
  List<DatosGeneralesModel> _Folio = [];
  List<DatosGeneralesModel> _DatosGenerales = [];

  List<TiposVialidad> _TiposVialidad = [];
  List<TiposVialidad> _TiposVialidad2 = [];
  final _fechaCaptura = TextEditingController();
  final _folio = TextEditingController();
  final _nombreComunidad = TextEditingController();
  final _estado = TextEditingController();
  final _tipoAsentamiento = TextEditingController();
  final _calle = TextEditingController();
  final _entreCalles = TextEditingController();
  final _grupo = TextEditingController();
  final _municipio = TextEditingController();
  final _nombreAsentamiento = TextEditingController();
  final _noExt = TextEditingController();
  final _noInt = TextEditingController();
  final _fecha = TextEditingController();
  final _localidad = TextEditingController();
  final _tipoVialidad = TextEditingController();
  final _telefono = TextEditingController();
  final _cdispo = TextEditingController();
  final _folioDispo = TextEditingController();
  final _codigoPostalController = TextEditingController();

  //Variables para el folio dispositivo;
  var disp = '';
  var fol = '';
  getFolioDisp() async {
    if (fol.isEmpty) {
      fol = '1';
    } else {
      _folioDispo.text = disp + '-' + fol;
    }
  }

  getLastFolio() async {
    print(_Folio.toString());
    if (_Folio.isEmpty) {
      _folio.text = "1";
    } else {
      getFolio();
    }
  }

  getFolio() async {
    var categories = await CategoryService().Folio();
    categories.forEach((category) {
      setState(() {
        var categoryModel = DatosGeneralesModel();
        categoryModel.folio = category['folio'];
        _Folio.add(categoryModel);
        var ltFolio = _Folio.map((e) => e.folio + 1);
        final lastFolio =
            ltFolio.toString().replaceAll("(", "").replaceAll(")", "");
        _folio.text = lastFolio;
        fol = _folio.text;
        print(lastFolio);
        getFolioDisp();
      });
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

    _cdispo.text = _dispo.map((e) => e.dispositivo.toString()).first;
    disp = _cdispo.text;
    getFolioDisp();
  }

  getAllCodigoPostal() async {
    _CodigoPostal = [];
    var categories = await CategoryService().readCategoriesCodigoPostal();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CodigoPostalModel();
        categoryModel.ClaveCP = category['ClaveCP'];
        _CodigoPostal.add(categoryModel);
      });
    });
  }

  getAllCodigoPostal2() async {
    _CodigoPostal2 = [];
    var categories = await CategoryService()
        .readCategoriesCodigoPostal2(_codigoPostalController.text);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CodigoPostalModel();
        categoryModel.ClaveCP = category['ClaveCP'];
        categoryModel.Asentamiento = category['Asentamiento'];
        categoryModel.TipoAsentamiento = category['TipoAsentamiento'];
        categoryModel.Municipio = category['Municipio'];
        categoryModel.Estado = category['Estado'];
        categoryModel.Ciudad = category['Ciudad'];
        categoryModel.ClaveEstado = category['ClaveEstado'];
        categoryModel.Clavetipo_asenta = category['Clavetipo_asenta'];
        categoryModel.ClaveMunicipio = category['ClaveMunicipio'];
        categoryModel.TipoZona = category['TipoZona'];
        categoryModel.ClaveCiudad = category['ClaveCiudad'];
        _CodigoPostal2.add(categoryModel);
      });
    });

    _estado.text = _CodigoPostal2.map((e) => e.Estado).first;
    _municipio.text = _CodigoPostal2.map((e) => e.Municipio).first;
    _localidad.text = _CodigoPostal2.map((e) => e.Ciudad).first;

    claveEstado = _CodigoPostal2.map((e) => e.ClaveEstado).first;
    claveLocalidad = _CodigoPostal2.map((e) => e.ClaveCiudad).first;
    claveMunicipio = _CodigoPostal2.map((e) => e.ClaveMunicipio).first;
  }

  getAllTipoVialidad() async {
    _TiposVialidad = [];
    var categories = await CategoryService().readCtegoriesTipoVialidad();
    categories.forEach((category) {
      setState(() {
        var categoryModel = TiposVialidad();
        categoryModel.TipoVialidad = category['TipoVialidad'];
        categoryModel.Orden = category['Orden'];
        _TiposVialidad.add(categoryModel);
      });
    });
  }

  getAllAsentamiento() async {
    _Asentamiento = [];
    var data = await DbHelper().readAsentamientos(_nombreAsentamiento.text);
    data.forEach((asenta) {
      setState(() {
        var datos = CodigoPostalModel();
        datos.Asentamiento = asenta['Asentamiento'];
        datos.TipoAsentamiento = asenta['TipoAsentamiento'];
        datos.Clavetipo_asenta = asenta['Clavetipo_asenta'];
        _Asentamiento.add(datos);
      });
    });

    _nombreComunidad.text = _Asentamiento.map((e) => e.Asentamiento).first;
    _tipoAsentamiento.text = _Asentamiento.map((e) => e.TipoAsentamiento).first;
    _grupo.text = _Asentamiento.map((e) => e.Asentamiento).first;
    claveTipoAsentamiento = _Asentamiento.map((e) => e.Clavetipo_asenta).first;
  }

  var claveEstado;
  var claveMunicipio;
  var claveLocalidad;
  var claveTipoAsentamiento;

  getDate() {
    var now = new DateTime.now();
    var formato = new DateFormat('yyyy-MM-dd');
    String fecha = formato.format(now);
    _fecha.text = fecha;
    _noInt.text = 'N/A';
  }

  @override
  void initState() {
    super.initState();
    getLastFolio();
    getFolio();
    getDate();
    getDispo();
    getFolioDisp();
  }

  insertarDatos() async {
    _TiposVialidad2 = [];
    var datos = await CategoryService().readTipoVialidad(_tipoVialidad.text);
    datos.forEach((category) {
      setState(() {
        var data = TiposVialidad();
        data.Orden = category['Orden'];
        _TiposVialidad2.add(data);
      });
    });

    replaceAllNum r = new replaceAllNum();
    DatosGeneralesModel datosGeneralesModel = DatosGeneralesModel(
        folio: int.parse(_folio.text),
        fechaCaptura: _fechaCaptura.text,
        calle: _calle.text,
        entreCalles: _entreCalles.text,
        claveGrupo: claveTipoAsentamiento,
        grupo: _grupo.text,
        noExt: _noExt.text,
        noInt: _noInt.text,
        fecha: _fecha.text,
        localidad: _localidad.text,
        telefono: _telefono.text,
        claveCodigoPostal: int.parse(_codigoPostalController.text),
        claveEstado: _CodigoPostal2.map((e) => e.ClaveEstado).first,
        estado: _estado.text.toString(),
        claveComunidad: claveTipoAsentamiento,
        nombreComunidad: _nombreComunidad.text,
        claveMunicipio: claveMunicipio,
        municipio: _municipio.text.toString(),
        claveAsentamiento: claveTipoAsentamiento,
        nombreAsentamiento: _nombreAsentamiento.text.toString(),
        claveTipoAsentamiento: claveTipoAsentamiento,
        ordentipoAsentamiento: claveTipoAsentamiento,
        tipoAsentamiento: _tipoAsentamiento.text,
        claveTipoVialidad: int.parse(_TiposVialidad2.map((e) => e.Orden).first),
        ordentipovialidad: int.parse(_TiposVialidad2.map((e) => e.Orden).first),
        tipoVialidad: r.replaceNum(_tipoVialidad.text).toString().trimRight(),
        dispositivo: _cdispo.text,
        folioDisp: _folioDispo.text,
        usuario: widget.usuario);

    await DbHelper()
        .saveDatosGenerales(datosGeneralesModel)
        .then((datosGeneralesData) {
      alertDialog(context, "Se registro correctamente");

      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new ServBano(
            folio: _folio.text,
            dispositivo: _cdispo.text,
            folioDisp: _folioDispo.text,
            usuario: widget.usuario);
      }));
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos");
    });
  }

  getAllDatosgenerales() async {
    _DatosGenerales = [];
    var categories =
        await CategoryService().readDatosGeenerales(int.parse(_folio.text) - 1);
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

        categoryModel.ordentipoAsentamiento = category['ordentipoAsentamiento'];
        categoryModel.tipoAsentamiento = category['tipoAsentamiento'];
        categoryModel.claveTipoVialidad =
            int.parse(category['claveTipoVialidad']);
        categoryModel.ordentipovialidad = category['ordentipovialidad'];
        categoryModel.tipoVialidad = category['tipoVialidad'];

        _DatosGenerales.add(categoryModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Datos Generales')),
      body: Form(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(children: [
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Dispositivo'),
              SizedBox(height: 5.0),
              getTextField(controller: _cdispo, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Folio'),
              SizedBox(height: 5.0),
              getTextField(controller: _folio, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Folio - Dispositivo'),
              SizedBox(height: 5.0),
              getTextField(controller: _folioDispo, readOnly: true),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.all(20.0),
                width: double.infinity,
                child: TextButton.icon(
                    onPressed: getAllDatosgenerales,
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Cargar Datos",
                      style: TextStyle(color: Colors.white),
                    )),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Fecha'),
              getTextField(controller: _fecha, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Código Postal'),
              SizedBox(height: 5.0),
              //Menu desplegable
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SearchField(
                  inputType: TextInputType.number,
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
                  suggestions: _CodigoPostal.map((codigoPostal) =>
                      SearchFieldListItem(codigoPostal.ClaveCP.toString(),
                          item: codigoPostal)).toList(),
                  textInputAction: TextInputAction.next,
                  hasOverlay: false,
                  controller: _codigoPostalController,
                  maxSuggestionsInViewPort: 5,
                  itemHeight: 45,
                  onSuggestionTap: (x) {
                    getAllCodigoPostal2();
                    _nombreAsentamiento.clear();
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Estado'),
              SizedBox(height: 5.0),
              getTextField(controller: _estado, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Municipio'),
              SizedBox(height: 5.0),
              getTextField(controller: _municipio, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Nombre del Asentamiento'),
              SizedBox(height: 5.0),
              //Menu desplegable Nombre Asentamiento
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SearchField(
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
                  suggestions: _CodigoPostal2.map((nombreAsentamiento) =>
                      SearchFieldListItem(nombreAsentamiento.Asentamiento,
                          item: nombreAsentamiento)).toList(),
                  textInputAction: TextInputAction.next,
                  hasOverlay: false,
                  controller: _nombreAsentamiento,
                  maxSuggestionsInViewPort: 5,
                  itemHeight: 45,
                  onSuggestionTap: (x) {
                    getAllAsentamiento();
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Nombre Comunidad/ Programa'),
              SizedBox(height: 5.0),
              getTextField(controller: _nombreComunidad, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Tipo Asentamiento'),
              SizedBox(height: 5.0),
              getTextField(controller: _tipoAsentamiento, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Localidad'),
              SizedBox(height: 5.0),
              getTextField(controller: _localidad, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Calle'),
              SizedBox(height: 5.0),
              getTextField(controller: _calle),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Entre Calles'),
              SizedBox(height: 5.0),
              getTextField(controller: _entreCalles),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'No.Exterior'),
              SizedBox(height: 5.0),
              getTextField(controller: _noExt),

              SizedBox(height: 10.0),
              getTextQuestion(question: 'No.Interior'),
              SizedBox(height: 5.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  textCapitalization: TextCapitalization.characters,
                  controller: _noInt,
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
                  onTap: () async {
                    setState(() {
                      _noInt.clear();
                    });
                  },
                ),
              ),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Grupo'),
              SizedBox(height: 5.0),
              getTextField(controller: _grupo, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'Tipo de Vialidad'),
              SizedBox(height: 5.0),
              //Menu desplegable
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SearchField(
                  inputType: TextInputType.text,
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
                  suggestions: _TiposVialidad.map((tipovialidad) =>
                      SearchFieldListItem(tipovialidad.TipoVialidad,
                          item: tipovialidad)).toList(),
                  textInputAction: TextInputAction.next,
                  hasOverlay: false,
                  controller: _tipoVialidad,
                  maxSuggestionsInViewPort: 5,
                  itemHeight: 45,
                  onSuggestionTap: (x) {},
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: Text('No cuenta con télefono'),
                      leading: Radio<noTiene>(
                        value: noTiene.no,
                        toggleable: true,
                        groupValue: _noTiene,
                        onChanged: (noTiene value) {
                          setState(() {
                            _noTiene = value;

                            if (value != noTiene.no) {
                              _telefono.clear();
                            } else {
                              _telefono.text = "0000000000";
                            }
                            FocusScope.of(context).unfocus();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.0),
              getTextQuestion(question: 'Télefono (10 digitos)'),
              SizedBox(height: 5.0),
              getTextField(
                  controller: _telefono, inputType: TextInputType.number)
            ]),
          ),
        ),
      ),
    );
  }
}
