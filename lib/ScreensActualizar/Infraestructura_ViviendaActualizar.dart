import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextFolio.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/EstadoCasaConstruccionModel.dart';
import 'package:esn/Model/TipoMuroModel.dart';
import 'package:esn/Model/TipoPisoModel.dart';
import 'package:esn/Model/TipoTechoModel.dart';
import 'package:esn/Model/TipoTenenciaModel.dart';
import 'package:esn/Model/TipoViviendaModel.dart';
import 'package:esn/Screens/Caracteristicas_Casa.dart';
import 'package:esn/Screens/Salud_PertenenciaIndigenaTabla.dart';
import 'package:esn/ScreensActualizar/ActualizarEstudio.dart';
import 'package:esn/replaceAll/replaceAllLetter.dart';
import 'package:esn/replaceAll/replaceAllNum.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class Infraestructura_Vivienda extends StatefulWidget {
  String folio;
  String folioDisp;
  String usuario;
  String dispositivo;
  Infraestructura_Vivienda(
      {this.folio, this.folioDisp, this.dispositivo, this.usuario});

  @override
  State<Infraestructura_Vivienda> createState() =>
      _Infraestructura_ViviendaState();
}

class _Infraestructura_ViviendaState extends State<Infraestructura_Vivienda> {
  List<TipoViviendaModel> _TipoVivienda = [];
  List<TipoPisoModel> _TipoPiso = [];
  List<TipoTenenciaModel> _TipoTenencia = [];
  List<TipoTechoModel> _TipoTecho = [];
  List<TipoMuroModel> _TipoMuro = [];

  List<TipoViviendaModel> _TipoVivienda2 = [];
  List<TipoPisoModel> _TipoPiso2 = [];
  List<TipoTenenciaModel> _TipoTenencia2 = [];
  List<TipoTechoModel> _TipoTecho2 = [];
  List<TipoMuroModel> _TipoMuro2 = [];

  final _tipoCasa = TextEditingController();
  final _otroTipoCasa = TextEditingController();
  final _tipoPiso = TextEditingController();
  final _otroPiso = TextEditingController();
  final _tipoTenencia = TextEditingController();
  final _otroTenencia = TextEditingController();
  final _tipoTecho = TextEditingController();
  final _otroTecho = TextEditingController();
  final _tipoMuro = TextEditingController();
  final _otroMuro = TextEditingController();
  List<EstadoCasaConstruccionModel> _EstadoCasa = [];
  var dbHelper = DbHelper();

  bool valTipoCasa = false;
  bool valPiso = false;
  bool valTecho = false;
  bool valTenencia = false;
  bool valMuro = false;

  @override
  void initState() {
    getAllCategoriesTipoMuro();
    getAllCategoriesTipoPiso();
    getAllCategoriesTipoTecho();
    getAllCategoriesTipoTenencia();
    getAllCtegoriesTipoVivienda();

    super.initState();
  }

  getAllEstadoCasa() async {
    _EstadoCasa = [];
    var categories =
        await CategoryService().readEstadoCasa(int.parse(widget.folio));
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

        categoryModel.otroMuro = category['otroMuro'];
        categoryModel.otroTecho = category['otroTecho'];
        categoryModel.otroTenencia = category['otroTenencia'];
        categoryModel.otroTipoPiso = category['otroTipoPiso'];
        categoryModel.otroTipoVivienda = category['otroTipoVivienda'];

        _EstadoCasa.add(categoryModel);
      });
    });

    _tipoCasa.text = _EstadoCasa.map((e) => e.ClaveTipoVivienda).first +
        " " +
        _EstadoCasa.map((e) => e.TipoVivienda).first;

    _tipoPiso.text = _EstadoCasa.map((e) => e.ClaveTipoPiso).first +
        " " +
        _EstadoCasa.map((e) => e.TipoPiso).first;

    _tipoTenencia.text = _EstadoCasa.map((e) => e.ClaveTenencia).first +
        " " +
        _EstadoCasa.map((e) => e.Tenencia).first;

    _tipoTecho.text = _EstadoCasa.map((e) => e.ClaveTecho).first +
        " " +
        _EstadoCasa.map((e) => e.Techo).first;

    _tipoMuro.text = _EstadoCasa.map((e) => e.ClaveTipoMuro).first +
        " " +
        _EstadoCasa.map((e) => e.TipoMuro).first;

    _otroMuro.text = _EstadoCasa.map((e) => e.otroMuro).first;
    _otroPiso.text = _EstadoCasa.map((e) => e.otroTipoPiso).first;
    _otroTecho.text = _EstadoCasa.map((e) => e.otroTecho).first;
    _otroTenencia.text = _EstadoCasa.map((e) => e.otroTenencia).first;
    _otroTipoCasa.text = _EstadoCasa.map((e) => e.otroTipoVivienda).first;
  }

  actualizar() async {
    replaceAllNum rpn = new replaceAllNum();
    _TipoVivienda2 = [];
    var categories = await CategoryService().readOrdencasa(_tipoCasa.text);
    categories.forEach((category) {
      setState(() {
        var categoryModel = TipoViviendaModel();
        categoryModel.Orden = category['Orden'];
        _TipoVivienda2.add(categoryModel);
      });
    });

    _TipoPiso2 = [];
    var categories1 = await CategoryService().readOrdenPiso(_tipoPiso.text);
    categories1.forEach((category) {
      setState(() {
        var categoryModel1 = TipoPisoModel();
        categoryModel1.Orden = category['Orden'];
        _TipoPiso2.add(categoryModel1);
      });
    });

    _TipoTenencia2 = [];
    var categories2 =
        await CategoryService().readOrdenTenencia(_tipoTenencia.text);
    categories2.forEach((category) {
      setState(() {
        var categoryModel3 = TipoTenenciaModel();
        categoryModel3.Orden = category['Orden'];
        _TipoTenencia2.add(categoryModel3);
      });
    });

    _TipoTecho2 = [];
    var categories4 = await CategoryService().readOrdenTecho(_tipoTecho.text);
    categories4.forEach((category) {
      setState(() {
        var categoryModel5 = TipoTechoModel();
        categoryModel5.Orden = category['Orden'];
        _TipoTecho2.add(categoryModel5);
      });
    });

    _TipoMuro2 = [];
    var categories3 = await CategoryService().readOrdenMuro(_tipoMuro.text);
    categories3.forEach((category) {
      setState(() {
        var categoryModel4 = TipoMuroModel();
        categoryModel4.Orden = category['Orden'];
        _TipoMuro2.add(categoryModel4);
      });
    });

    var TipoCasa = _tipoCasa.text.toString();
    final tipoCasa = rpn.replaceNum(TipoCasa);

    var TipoPiso = _tipoPiso.text.toString();
    final tipoPiso = rpn.replaceNum(TipoPiso);

    var TipoTenencia = _tipoTenencia.text.toString();
    final tipoTenencia = rpn.replaceNum(TipoTenencia);

    var TipoMuro = _tipoMuro.text.toString();
    final tipoMuro = rpn.replaceNum(TipoMuro);

    var TipoTecho = _tipoTecho.text.toString();
    final tipoTecho = rpn.replaceNum(TipoTecho);

    EstadoCasaConstruccionModel DModel = EstadoCasaConstruccionModel(
        folio: int.parse(widget.folio),
        ClaveTipoVivienda: _tipoCasa.text.toString().substring(0, 1),
        OrdenTipoVivienda: _TipoVivienda2.map((e) => e.Orden).first,
        TipoVivienda: tipoCasa.trimLeft(),
        ClaveTipoPiso: _tipoPiso.text.toString().substring(0, 1),
        OrdenTipoPiso: _TipoPiso2.map((e) => e.Orden).first,
        TipoPiso: tipoPiso.trimLeft(),
        ClaveTenencia: _tipoTenencia.text.toString().substring(0, 1),
        OrdenTenencia: _TipoTenencia2.map((e) => e.Orden).first,
        Tenencia: tipoTenencia.trimLeft(),
        ClaveTecho: _tipoTecho.text.toString().substring(0, 1),
        OrdenTecho: _TipoTecho2.map((e) => e.Orden).first,
        Techo: tipoTecho.trimLeft(),
        ClaveTipoMuro: _tipoMuro.text.toString().substring(0, 1),
        OrdenTipoMuro: _TipoMuro2.map((e) => e.Orden).first,
        TipoMuro: tipoMuro.trimLeft(),
        otroMuro: _otroMuro.text,
        otroTecho: _otroTecho.text,
        otroTenencia: _otroTenencia.text,
        otroTipoPiso: _otroPiso.text,
        otroTipoVivienda: _otroTipoCasa.text,
        dispositivo: widget.dispositivo,
        folioDisp: widget.folioDisp,
        usuario: widget.usuario);

    await dbHelper.upDateVivienda(DModel).then((estadoCasaConstruccionModel) {
      alertDialog(context, "Se Acualizar correctamente");
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new ActualizarEstudio(
            usuario: widget.usuario,
            folio: widget.folio,
            folioDisp: widget.folioDisp,
            dispositivo: widget.dispositivo);
      }));
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos");
    });
  }

  getAllCtegoriesTipoVivienda() async {
    _TipoVivienda = [];
    var categories = await CategoryService().readCategoriesTipoVivienda();
    categories.forEach((category) {
      setState(() {
        var categoryModel = TipoViviendaModel();
        categoryModel.TipoVivienda = category['TipoVivienda'];
        _TipoVivienda.add(categoryModel);
      });
    });
  }

  getAllCategoriesTipoPiso() async {
    _TipoPiso = [];
    var categories = await CategoryService().readCategoriesTipoPiso();
    categories.forEach((category) {
      setState(() {
        var categoryModel = TipoPisoModel();
        categoryModel.TipoPiso = category['TipoPiso'];
        _TipoPiso.add(categoryModel);
      });
    });
  }

  getAllCategoriesTipoTenencia() async {
    _TipoTenencia = [];
    var categories = await CategoryService().readCategoriesTipoTenencia();
    categories.forEach((category) {
      setState(() {
        var categoryModel = TipoTenenciaModel();
        categoryModel.Tenencia = category['Tenencia'];
        _TipoTenencia.add(categoryModel);
      });
    });
  }

  getAllCategoriesTipoTecho() async {
    _TipoTecho = [];
    var categories = await CategoryService().readCategoriesTipoTecho();
    categories.forEach((category) {
      setState(() {
        var categoryModel = TipoTechoModel();
        categoryModel.Techo = category['Techo'];
        _TipoTecho.add(categoryModel);
      });
    });
  }

  getAllCategoriesTipoMuro() async {
    _TipoMuro = [];
    var categories = await CategoryService().readCategoriesTipoMuro();
    categories.forEach((category) {
      setState(() {
        var categoryModel = TipoMuroModel();
        categoryModel.TipoMuro = category['TipoMuro'];
        _TipoMuro.add(categoryModel);
      });
    });
  }

  insertDatos() async {
    replaceAllNum rpn = new replaceAllNum();
    _TipoVivienda2 = [];
    var categories = await CategoryService().readOrdencasa(_tipoCasa.text);
    categories.forEach((category) {
      setState(() {
        var categoryModel = TipoViviendaModel();
        categoryModel.Orden = category['Orden'];
        _TipoVivienda2.add(categoryModel);
      });
    });

    _TipoPiso2 = [];
    var categories1 = await CategoryService().readOrdenPiso(_tipoPiso.text);
    categories1.forEach((category) {
      setState(() {
        var categoryModel1 = TipoPisoModel();
        categoryModel1.Orden = category['Orden'];
        _TipoPiso2.add(categoryModel1);
      });
    });

    _TipoTenencia2 = [];
    var categories2 =
        await CategoryService().readOrdenTenencia(_tipoTenencia.text);
    categories2.forEach((category) {
      setState(() {
        var categoryModel3 = TipoTenenciaModel();
        categoryModel3.Orden = category['Orden'];
        _TipoTenencia2.add(categoryModel3);
      });
    });

    _TipoTecho2 = [];
    var categories4 = await CategoryService().readOrdenTecho(_tipoTecho.text);
    categories4.forEach((category) {
      setState(() {
        var categoryModel5 = TipoTechoModel();
        categoryModel5.Orden = category['Orden'];
        _TipoTecho2.add(categoryModel5);
      });
    });

    _TipoMuro2 = [];
    var categories3 = await CategoryService().readOrdenMuro(_tipoMuro.text);
    categories3.forEach((category) {
      setState(() {
        var categoryModel4 = TipoMuroModel();
        categoryModel4.Orden = category['Orden'];
        _TipoMuro2.add(categoryModel4);
      });
    });

    var TipoCasa = _tipoCasa.text.toString();
    final tipoCasa = rpn.replaceNum(TipoCasa);

    var TipoPiso = _tipoPiso.text.toString();
    final tipoPiso = rpn.replaceNum(TipoPiso);

    var TipoTenencia = _tipoTenencia.text.toString();
    final tipoTenencia = rpn.replaceNum(TipoTenencia);

    var TipoMuro = _tipoMuro.text.toString();
    final tipoMuro = rpn.replaceNum(TipoMuro);

    var TipoTecho = _tipoTecho.text.toString();
    final tipoTecho = rpn.replaceNum(TipoTecho);

    EstadoCasaConstruccionModel DModel = EstadoCasaConstruccionModel(
        folio: int.parse(widget.folio),
        ClaveTipoVivienda: _tipoCasa.text.toString().substring(0, 1),
        OrdenTipoVivienda: _TipoVivienda2.map((e) => e.Orden).first,
        TipoVivienda: tipoCasa.trimLeft(),
        ClaveTipoPiso: _tipoPiso.text.toString().substring(0, 1),
        OrdenTipoPiso: _TipoPiso2.map((e) => e.Orden).first,
        TipoPiso: tipoPiso.trimLeft(),
        ClaveTenencia: _tipoTenencia.text.toString().substring(0, 1),
        OrdenTenencia: _TipoTenencia2.map((e) => e.Orden).first,
        Tenencia: tipoTenencia.trimLeft(),
        ClaveTecho: _tipoTecho.text.toString().substring(0, 1),
        OrdenTecho: _TipoTecho2.map((e) => e.Orden).first,
        Techo: tipoTecho.trimLeft(),
        ClaveTipoMuro: _tipoMuro.text.toString().substring(0, 1),
        OrdenTipoMuro: _TipoMuro2.map((e) => e.Orden).first,
        TipoMuro: tipoMuro.trimLeft(),
        otroMuro: _otroMuro.text,
        otroTecho: _otroTecho.text,
        otroTenencia: _otroTenencia.text,
        otroTipoPiso: _otroPiso.text,
        otroTipoVivienda: _otroTipoCasa.text,
        dispositivo: widget.dispositivo,
        folioDisp: widget.folioDisp,
        usuario: widget.usuario);

    await dbHelper.saveVivienda(DModel).then((estadoCasaConstruccionModel) {
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

  save() async {
    if (_EstadoCasa.isEmpty) {
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
                    onPressed: getAllEstadoCasa,
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
                getTextQuestion(question: 'Tipo de Vivienda'.toUpperCase()),
                SizedBox(height: 5.0),
                //Menu desplegable Tipo de casa
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                    suggestions: _TipoVivienda.map((tipoCasa) =>
                        SearchFieldListItem(tipoCasa.TipoVivienda,
                            item: tipoCasa)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoCasa,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x) {
                      setState(() {
                        if (_tipoCasa.text == '4 OTRA') {
                          valTipoCasa = true;
                        } else {
                          valTipoCasa = false;
                          _otroTipoCasa.clear();
                        }
                      });
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    controller: _otroTipoCasa,
                    enabled: valTipoCasa,
                    autofocus: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: 'Otro Tipo De Vivienda'.toUpperCase(),
                      labelText: 'Otro Tipo De Vivienda'.toUpperCase(),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Mayor parte del Piso'.toUpperCase()),
                SizedBox(height: 5.0),
                //Menu desplegable Escolaridades
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                    suggestions: _TipoPiso.map((tipoPiso) =>
                        SearchFieldListItem(tipoPiso.TipoPiso,
                            item: tipoPiso)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoPiso,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x) {
                      setState(() {
                        if (_tipoPiso.text == "5 OTRO") {
                          valPiso = true;
                        } else {
                          valPiso = false;
                          _otroPiso.clear();
                        }
                      });
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    controller: _otroPiso,
                    enabled: valPiso,
                    autofocus: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: 'Otro Tipo De Piso'.toUpperCase(),
                      labelText: 'Otro Tipo De Piso'.toUpperCase(),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Tenencia'.toUpperCase()),
                SizedBox(height: 5.0),
                //Menu desplegable Escolaridades
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                    suggestions: _TipoTenencia.map((tipoTenencia) =>
                        SearchFieldListItem(tipoTenencia.Tenencia,
                            item: tipoTenencia)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoTenencia,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x) {
                      setState(() {
                        if (_tipoTenencia.text == "6 OTRO") {
                          valTenencia = true;
                        } else {
                          valTenencia = false;
                          _otroTenencia.clear();
                        }
                      });
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    controller: _otroTenencia,
                    enabled: valTenencia,
                    autofocus: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: 'Otro Tipo De Tenencia'.toUpperCase(),
                      labelText: 'Otro Tipo De Tenencia'.toUpperCase(),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                getTextQuestion(
                    question: 'Mayor Parte  del Techo'.toUpperCase()),
                SizedBox(height: 5.0),
                //Menu desplegable Escolaridades
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                    suggestions: _TipoTecho.map((tipoTecho) =>
                        SearchFieldListItem(tipoTecho.Techo,
                            item: tipoTecho)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoTecho,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x) {
                      setState(() {
                        if (_tipoTecho.text == "6 OTROS") {
                          valTecho = true;
                        } else {
                          valTecho = false;
                          _otroTecho.clear();
                        }
                      });
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    controller: _otroTecho,
                    enabled: valTecho,
                    autofocus: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: 'Otro Tipo De Techo'.toUpperCase(),
                      labelText: 'Otro Tipo De Techo'.toUpperCase(),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 10.0),
                getTextQuestion(question: 'Mayor parte de Muros'.toUpperCase()),
                SizedBox(height: 5.0),
                //Menu desplegable Escolaridades
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                    suggestions: _TipoMuro.map((tipoMuro) =>
                        SearchFieldListItem(tipoMuro.TipoMuro,
                            item: tipoMuro)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _tipoMuro,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x) {
                      setState(() {
                        if (_tipoMuro.text == "7 OTROS".toUpperCase()) {
                          valMuro = true;
                        } else {
                          valMuro = false;
                          _otroMuro.clear();
                        }
                      });
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    controller: _otroMuro,
                    enabled: valMuro,
                    autofocus: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: 'Otro Tipo De Muro'.toUpperCase(),
                      labelText: 'Otro Tipo De Muro'.toUpperCase(),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
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
