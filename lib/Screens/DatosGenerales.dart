import 'package:esn/Comm/Metodos/TextFormater.dart';
import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextField.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/CodigoPostalModel.dart';
import 'package:esn/Model/ComunidadesModel.dart';
import 'package:esn/Model/DatosGeneralesModel.dart';
import 'package:esn/Model/DispoModel.dart';
import 'package:esn/Model/GruposModel.dart';
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
  final _formKey = GlobalKey<FormState>();
  noTiene _noTiene;
  List<CodigoPostalModel> _CodigoPostal = [];
  List<CodigoPostalModel> _CodigoPostal2 = [];
  List<CodigoPostalModel> _Asentamiento = [];
  List<DatosGeneralesModel> _Folio = [];
  List<DatosGeneralesModel> _DatosGenerales = [];
  List<GruposModel> _Grupos = [];
  List<ComunidadesModel> _Comunidades = [];

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
        datos.TipoZona = asenta['TipoZona'];
        _Asentamiento.add(datos);
      });
    });
    _tipoAsentamiento.text = _Asentamiento.map((e) => e.TipoAsentamiento).first;
    claveTipoAsentamiento = _Asentamiento.map((e) => e.Clavetipo_asenta).first;
    tipoZona = _Asentamiento.map((e) => e.TipoZona).first;
  }

  var tipoZona;
  var claveEstado;
  var claveMunicipio;
  var claveLocalidad;
  var claveTipoAsentamiento;
  // ----------------------
  var comunidad;
  var orden_comunidad;
  var clave_comunidad;
  getComunidades() async {
    _Comunidades = [];
    var data = await DbHelper().readComunidades();
    data.forEach((dataComunidades) {
      var datos = ComunidadesModel();
      datos.pk_Comunidad = dataComunidades['pk_Comunidad'];
      datos.orden_Comunidad = dataComunidades['orden_Comunidad'];
      datos.Comunidad = dataComunidades['Comunidad'];

      _Comunidades.add(datos);
    });
  }

  var clave_grupo;
  var orden_grupo;
  getGrupos() async {
    _Grupos = [];
    var data = await DbHelper().readGrupo(_nombreComunidad.text);
    data.forEach((dataGrupos) {
      setState(() {
        var datos = GruposModel();
        datos.ClaveGrupo = dataGrupos['ClaveGrupo'];
        datos.orden_Grupo = dataGrupos['orden_Grupo'];
        datos.Grupo = dataGrupos['Grupo'];

        _Grupos.add(datos);

        _grupo.text = _Grupos.map((e) => e.Grupo).first;

        comunidad = _Grupos.map((e) => e.Grupo).first;
        clave_comunidad = _Grupos.map((e) => e.ClaveGrupo).first;
        orden_comunidad = _Grupos.map((e) => e.orden_Grupo).first;

        clave_grupo = _Grupos.map((e) => e.ClaveGrupo).first;
        orden_grupo = _Grupos.map((e) => e.orden_Grupo).first;

        print(_grupo.text);
      });
    });
  }

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
    getAllCodigoPostal();
    getAllTipoVialidad();
    getComunidades();
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
    if (_telefono.text.length < 10 || _telefono.text.length > 10) {
      alertDialog(context, 'El número de télefono debe ser de 10 digitos');
    } else {
      DatosGeneralesModel datosGeneralesModel = DatosGeneralesModel(
          folio: int.parse(_folio.text),
          fechaCaptura: _fechaCaptura.text,
          calle: _calle.text,
          entreCalles: _entreCalles.text,
          claveGrupo: clave_grupo,
          grupo: _grupo.text,
          noExt: _noExt.text,
          noInt: _noInt.text,
          fecha: _fecha.text,
          localidad: _localidad.text,
          telefono: _telefono.text,
          claveCodigoPostal: int.parse(_codigoPostalController.text),
          claveEstado: _CodigoPostal2.map((e) => e.ClaveEstado).first,
          estado: _estado.text.toString(),
          claveComunidad: clave_comunidad,
          nombreComunidad: _nombreComunidad.text,
          claveMunicipio: claveMunicipio,
          municipio: _municipio.text.toString(),
          claveAsentamiento: claveTipoAsentamiento,
          nombreAsentamiento: _nombreAsentamiento.text.toString(),
          claveTipoAsentamiento: claveTipoAsentamiento,
          ordentipoAsentamiento: claveTipoAsentamiento,
          tipoAsentamiento: _tipoAsentamiento.text,
          claveTipoVialidad:
              int.parse(_TiposVialidad2.map((e) => e.Orden).first),
          ordentipovialidad:
              int.parse(_TiposVialidad2.map((e) => e.Orden).first),
          tipoVialidad: r.replaceNum(_tipoVialidad.text).toString().trimRight(),
          dispositivo: _cdispo.text,
          folioDisp: _folioDispo.text,
          usuario: widget.usuario,
          tipoZona: tipoZona,
          incompleto: 'INCOMPLETO');

      await DbHelper().insertFolioServ(
          _folio.text, widget.usuario, _cdispo.text, _folioDispo.text);
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
  }

  actualizar() async {
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
        claveGrupo: clave_grupo,
        grupo: _grupo.text,
        noExt: _noExt.text,
        noInt: _noInt.text,
        fecha: _fecha.text,
        localidad: _localidad.text,
        telefono: _telefono.text,
        claveCodigoPostal: int.parse(_codigoPostalController.text),
        claveEstado: _CodigoPostal2.map((e) => e.ClaveEstado).first,
        estado: _estado.text.toString(),
        claveComunidad: clave_comunidad,
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
        .upDateDatosGenerales(datosGeneralesModel)
        .then((datosGeneralesData) {
      alertDialog(context, "Se registro correctamente");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => ServBano(
                folio: _folio.text,
                dispositivo: _cdispo.text,
                folioDisp: _folioDispo.text,
                usuario: widget.usuario)),
        (Route<dynamic> route) => false,
      );
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

      _folio.text = _DatosGenerales.map((e) => e.folio.toString()).first;
      _fechaCaptura.text = _DatosGenerales.map((e) => e.fechaCaptura).first;
      _calle.text = _DatosGenerales.map((e) => e.calle).first;
      _entreCalles.text = _DatosGenerales.map((e) => e.entreCalles).first;

      _grupo.text = _DatosGenerales.map((e) => e.grupo).first;
      _noExt.text = _DatosGenerales.map((e) => e.noExt).first;
      _noInt.text = _DatosGenerales.map((e) => e.noInt).first;
      _fecha.text = _DatosGenerales.map((e) => e.fecha).first;
      _localidad.text = _DatosGenerales.map((e) => e.localidad).first;
      _telefono.text = _DatosGenerales.map((e) => e.telefono).first;
      _codigoPostalController.text =
          _DatosGenerales.map((e) => e.claveCodigoPostal.toString()).first;

      _nombreComunidad.text =
          _DatosGenerales.map((e) => e.nombreComunidad).first;
      _estado.text = _DatosGenerales.map((e) => e.estado.toString()).first;
      _municipio.text = _DatosGenerales.map((e) => e.municipio).first;
      _nombreAsentamiento.text =
          _DatosGenerales.map((e) => e.nombreAsentamiento).first;
      _tipoAsentamiento.text =
          _DatosGenerales.map((e) => e.claveTipoAsentamiento.toString()).first +
              " " +
              _DatosGenerales.map((e) => e.tipoAsentamiento).first;
      _tipoVialidad.text =
          _DatosGenerales.map((e) => e.claveTipoVialidad.toString()).first +
              " " +
              _DatosGenerales.map((e) => e.tipoVialidad).first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DATOS GENERALES')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(children: [
              SizedBox(height: 10.0),
              getTextQuestion(question: 'DISPOSITIVO'),
              SizedBox(height: 5.0),
              getTextField(controller: _cdispo, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'FOLIO'),
              SizedBox(height: 5.0),
              getTextField(controller: _folio, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'FOLIO - DISPOSITIVO'),
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
                      "CARGAR DATOS",
                      style: TextStyle(color: Colors.white),
                    )),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'FECHA'),
              getTextField(controller: _fecha, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'CÓDIGO POSTAL'),
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
              getTextQuestion(question: 'ESTADO'),
              SizedBox(height: 5.0),
              getTextField(controller: _estado, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'MUNICIPIO'),
              SizedBox(height: 5.0),
              getTextField(controller: _municipio, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'NOMBRE DEL ASENTAMIENTO'),
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
              getTextQuestion(question: 'NOMBRE COMUNIDAD/ PROGRAMA'),
              SizedBox(height: 5.0),
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
                  suggestions: _Comunidades.map((e) => SearchFieldListItem(
                      e.Comunidad,
                      item: e,
                      child: Text(e.orden_Comunidad.toString() +
                          " " +
                          e.Comunidad))).toList(),
                  textInputAction: TextInputAction.next,
                  hasOverlay: false,
                  controller: _nombreComunidad,
                  maxSuggestionsInViewPort: 5,
                  itemHeight: 45,
                  onSuggestionTap: (x) {
                    getGrupos();
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'TIPO ASENTAMIENTO'),
              SizedBox(height: 5.0),
              getTextField(controller: _tipoAsentamiento, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'LOCALIDAD'),
              SizedBox(height: 5.0),
              getTextField(controller: _localidad, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'CALLE'),
              SizedBox(height: 5.0),
              getTextField(controller: _calle),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'ENTRE CALLES'),
              SizedBox(height: 5.0),
              getTextField(controller: _entreCalles),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'NO.EXTERIOR'),
              SizedBox(height: 5.0),
              getTextField(controller: _noExt),

              SizedBox(height: 10.0),
              getTextQuestion(question: 'NO.INTERIOR'),
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
              getTextQuestion(question: 'GRUPO'),
              SizedBox(height: 5.0),
              getTextField(controller: _grupo, readOnly: true),
              SizedBox(height: 10.0),
              getTextQuestion(question: 'TIPO DE VIALIDAD'),
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
                      title: Text('NO CUENTA CON TÉLEFONO'),
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
              getTextQuestion(question: 'TÉLEFONO (10 DIGITOS)'),
              SizedBox(height: 5.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  inputFormatters: [NumericInputFormatter()],
                  keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.characters,
                  controller: _telefono,
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

              Container(
                margin: EdgeInsets.all(20.0),
                width: double.infinity,
                child: TextButton.icon(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        insertarDatos();
                      }
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    label: Text(
                      'CONTINUAR',
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
                    'ACTUALIZAR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
