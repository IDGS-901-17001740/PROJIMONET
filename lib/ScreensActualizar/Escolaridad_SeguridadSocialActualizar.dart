import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genSearchField.dart';
import 'package:esn/Comm/genTextDataTable.dart';
import 'package:esn/Comm/genTextFolio.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/DerechohabienciasModel.dart';
import 'package:esn/Model/EscolaridadSeguridadSocial.dart';
import 'package:esn/Model/EscolaridadesModel.dart';
import 'package:esn/Model/EstructuraFamiliarModel.dart';
import 'package:esn/Model/GradosEscolaresModel.dart';
import 'package:esn/Model/MotivoDerechoHabiencia.dart';
import 'package:esn/Model/OcupacionesModel.dart';
import 'package:esn/Model/PrestacionesLaboralesModel.dart';
import 'package:esn/Model/TipoEmpleoModel.dart';
import 'package:esn/Screens/EstructuraFamiliarTabla.dart';
import 'package:esn/Screens/Salud_PertenenciaIndigenaTabla.dart';
import 'package:esn/ScreensActualizar/ActualizarEstudio.dart';
import 'package:esn/replaceAll/replaceAllLetter.dart';
import 'package:esn/replaceAll/replaceAllNum.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

enum AsisteEscuela { NA, SI, NO }

enum JubilacionPensionado { NA, SI, NO }

class Escolaridad_SeguridadSocialTabla extends StatefulWidget {
  String folio;

  String folioDisp;
  String usuario;
  String dispositivo;
  Escolaridad_SeguridadSocialTabla(
      {this.folio, this.folioDisp, this.dispositivo, this.usuario});
  @override
  State<Escolaridad_SeguridadSocialTabla> createState() =>
      _Escolaridad_SeguridadSocialTablaState();
}

class _Escolaridad_SeguridadSocialTablaState
    extends State<Escolaridad_SeguridadSocialTabla> {
  final _formKey = GlobalKey<FormState>();

  final _escolaridad1 = TextEditingController();
  final _otroEscolaridad1 = TextEditingController();
  final _gradoEscolar1 = TextEditingController();
  final _ocupacion1 = TextEditingController();
  final _otroOcupacion1 = TextEditingController();
  final _tipoEmpleo1 = TextEditingController();
  final _otroTipoEmpleo1 = TextEditingController();
  final _derechohabiencia1 = TextEditingController();
  final _otroDerechohabiencia1 = TextEditingController();
  final _motivoderechohabiencia1 = TextEditingController();
  final _otroMotivoderechohabiencia1 = TextEditingController();
  AsisteEscuela _asisteEscuela1;
  JubilacionPensionado _jubilacionPensionado1;
  final _nombre1 = TextEditingController();
  final _prestacion1 = TextEditingController();
  List<PrestacionesLaboralesModel> _selectedItem1 = [];
  List<PrestacionesLaboralesModel> _PrestacionesList1 = [];
  bool valEsc1 = false;
  bool valOcu1 = false;
  bool valTipE1 = false;
  bool valDere1 = false;
  bool valMotDere1 = false;

  final _escolaridad2 = TextEditingController();
  final _otroEscolaridad2 = TextEditingController();
  final _gradoEscolar2 = TextEditingController();
  final _ocupacion2 = TextEditingController();
  final _otroOcupacion2 = TextEditingController();
  final _tipoEmpleo2 = TextEditingController();
  final _otroTipoEmpleo2 = TextEditingController();
  final _derechohabiencia2 = TextEditingController();
  final _otroDerechohabiencia2 = TextEditingController();
  final _motivoderechohabiencia2 = TextEditingController();
  final _otroMotivoderechohabiencia2 = TextEditingController();
  AsisteEscuela _asisteEscuela2;
  JubilacionPensionado _jubilacionPensionado2;
  final _nombre2 = TextEditingController();
  final _prestacion2 = TextEditingController();
  List<PrestacionesLaboralesModel> _selectedItem2 = [];
  List<PrestacionesLaboralesModel> _PrestacionesList2 = [];
  bool valEsc2 = false;
  bool valTipE2 = false;
  bool valOcu2 = false;
  bool valDere2 = false;
  bool valMotDere2 = false;

  final _escolaridad3 = TextEditingController();
  final _otroEscolaridad3 = TextEditingController();
  final _gradoEscolar3 = TextEditingController();
  final _ocupacion3 = TextEditingController();
  final _otroOcupacion3 = TextEditingController();
  final _tipoEmpleo3 = TextEditingController();
  final _otroTipoEmpleo3 = TextEditingController();
  final _derechohabiencia3 = TextEditingController();
  final _otroDerechohabiencia3 = TextEditingController();
  final _motivoderechohabiencia3 = TextEditingController();
  final _otroMotivoderechohabiencia3 = TextEditingController();
  AsisteEscuela _asisteEscuela3;
  JubilacionPensionado _jubilacionPensionado3;
  final _nombre3 = TextEditingController();
  final _prestacion3 = TextEditingController();
  List<PrestacionesLaboralesModel> _selectedItem3 = [];
  List<PrestacionesLaboralesModel> _PrestacionesList3 = [];
  bool valEsc3 = false;
  bool valTipE3 = false;
  bool valOcu3 = false;
  bool valDere3 = false;
  bool valMotDere3 = false;

  final _escolaridad4 = TextEditingController();
  final _otroEscolaridad4 = TextEditingController();
  final _gradoEscolar4 = TextEditingController();
  final _ocupacion4 = TextEditingController();
  final _otroOcupacion4 = TextEditingController();
  final _tipoEmpleo4 = TextEditingController();
  final _otroTipoEmpleo4 = TextEditingController();
  final _derechohabiencia4 = TextEditingController();
  final _otroDerechohabiencia4 = TextEditingController();
  final _motivoderechohabiencia4 = TextEditingController();
  final _otroMotivoderechohabiencia4 = TextEditingController();
  AsisteEscuela _asisteEscuela4;
  JubilacionPensionado _jubilacionPensionado4;
  final _nombre4 = TextEditingController();
  final _prestacion4 = TextEditingController();
  List<PrestacionesLaboralesModel> _selectedItem4 = [];
  List<PrestacionesLaboralesModel> _PrestacionesList4 = [];
  bool valEsc4 = false;
  bool valTipE4 = false;
  bool valOcu4 = false;
  bool valDere4 = false;
  bool valMotDere4 = false;

  final _escolaridad5 = TextEditingController();
  final _otroEscolaridad5 = TextEditingController();
  final _gradoEscolar5 = TextEditingController();
  final _ocupacion5 = TextEditingController();
  final _otroOcupacion5 = TextEditingController();
  final _tipoEmpleo5 = TextEditingController();
  final _otroTipoEmpleo5 = TextEditingController();
  final _derechohabiencia5 = TextEditingController();
  final _otroDerechohabiencia5 = TextEditingController();
  final _motivoderechohabiencia5 = TextEditingController();
  final _otroMotivoderechohabiencia5 = TextEditingController();
  AsisteEscuela _asisteEscuela5;
  JubilacionPensionado _jubilacionPensionado5;
  final _nombre5 = TextEditingController();
  final _prestacion5 = TextEditingController();
  List<PrestacionesLaboralesModel> _selectedItem5 = [];
  List<PrestacionesLaboralesModel> _PrestacionesList5 = [];
  bool valEsc5 = false;
  bool valTipE5 = false;
  bool valOcu5 = false;
  bool valDere5 = false;
  bool valMotDere5 = false;

  final _escolaridad6 = TextEditingController();
  final _otroEscolaridad6 = TextEditingController();
  final _gradoEscolar6 = TextEditingController();
  final _ocupacion6 = TextEditingController();
  final _otroOcupacion6 = TextEditingController();
  final _tipoEmpleo6 = TextEditingController();
  final _otroTipoEmpleo6 = TextEditingController();
  final _derechohabiencia6 = TextEditingController();
  final _otroDerechohabiencia6 = TextEditingController();
  final _motivoderechohabiencia6 = TextEditingController();
  final _otroMotivoderechohabiencia6 = TextEditingController();
  AsisteEscuela _asisteEscuela6;
  JubilacionPensionado _jubilacionPensionado6;
  final _nombre6 = TextEditingController();
  final _prestacion6 = TextEditingController();
  List<PrestacionesLaboralesModel> _selectedItem6 = [];
  List<PrestacionesLaboralesModel> _PrestacionesList6 = [];
  bool valEsc6 = false;
  bool valTipE6 = false;
  bool valOcu6 = false;
  bool valDere6 = false;
  bool valMotDere6 = false;

  final _escolaridad7 = TextEditingController();
  final _otroEscolaridad7 = TextEditingController();
  final _gradoEscolar7 = TextEditingController();
  final _ocupacion7 = TextEditingController();
  final _otroOcupacion7 = TextEditingController();
  final _tipoEmpleo7 = TextEditingController();
  final _otroTipoEmpleo7 = TextEditingController();
  final _derechohabiencia7 = TextEditingController();
  final _otroDerechohabiencia7 = TextEditingController();
  final _motivoderechohabiencia7 = TextEditingController();
  final _otroMotivoderechohabiencia7 = TextEditingController();
  AsisteEscuela _asisteEscuela7;
  JubilacionPensionado _jubilacionPensionado7;
  final _nombre7 = TextEditingController();
  final _prestacion7 = TextEditingController();
  List<PrestacionesLaboralesModel> _selectedItem7 = [];
  List<PrestacionesLaboralesModel> _PrestacionesList7 = [];
  bool valEsc7 = false;
  bool valTipE7 = false;
  bool valOcu7 = false;
  bool valDere7 = false;
  bool valMotDere7 = false;

  final _escolaridad8 = TextEditingController();
  final _otroEscolaridad8 = TextEditingController();
  final _gradoEscolar8 = TextEditingController();
  final _ocupacion8 = TextEditingController();
  final _otroOcupacion8 = TextEditingController();
  final _tipoEmpleo8 = TextEditingController();
  final _otroTipoEmpleo8 = TextEditingController();
  final _derechohabiencia8 = TextEditingController();
  final _otroDerechohabiencia8 = TextEditingController();
  final _motivoderechohabiencia8 = TextEditingController();
  final _otroMotivoderechohabiencia8 = TextEditingController();
  AsisteEscuela _asisteEscuela8;
  JubilacionPensionado _jubilacionPensionado8;
  final _nombre8 = TextEditingController();
  final _prestacion8 = TextEditingController();
  List<PrestacionesLaboralesModel> _selectedItem8 = [];
  List<PrestacionesLaboralesModel> _PrestacionesList8 = [];
  bool valEsc8 = false;
  bool valTipE8 = false;
  bool valOcu8 = false;
  bool valDere8 = false;
  bool valMotDere8 = false;

  final _escolaridad9 = TextEditingController();
  final _otroEscolaridad9 = TextEditingController();
  final _gradoEscolar9 = TextEditingController();
  final _ocupacion9 = TextEditingController();
  final _otroOcupacion9 = TextEditingController();
  final _tipoEmpleo9 = TextEditingController();
  final _otroTipoEmpleo9 = TextEditingController();
  final _derechohabiencia9 = TextEditingController();
  final _otroDerechohabiencia9 = TextEditingController();
  final _motivoderechohabiencia9 = TextEditingController();
  final _otroMotivoDerechohabiencia9 = TextEditingController();

  AsisteEscuela _asisteEscuela9;
  JubilacionPensionado _jubilacionPensionado9;
  final _nombre9 = TextEditingController();
  final _prestacion9 = TextEditingController();
  List<PrestacionesLaboralesModel> _selectedItem9 = [];
  List<PrestacionesLaboralesModel> _PrestacionesList9 = [];
  bool valEsc9 = false;
  bool valTipE9 = false;
  bool valOcu9 = false;
  bool valDere9 = false;
  bool valMotDere9 = false;

  final _escolaridad10 = TextEditingController();
  final _otroEscolaridad10 = TextEditingController();
  final _gradoEscolar10 = TextEditingController();
  final _ocupacion10 = TextEditingController();
  final _otroOcupacion10 = TextEditingController();
  final _tipoEmpleo10 = TextEditingController();
  final _otroTipoEmpleo10 = TextEditingController();
  final _derechohabiencia10 = TextEditingController();
  final _otroDerechohabiencia10 = TextEditingController();
  final _motivoderechohabiencia10 = TextEditingController();
  final _otroMotivoderechohabiencia10 = TextEditingController();
  AsisteEscuela _asisteEscuela10;
  JubilacionPensionado _jubilacionPensionado10;
  final _nombre10 = TextEditingController();
  final _prestacion10 = TextEditingController();
  List<PrestacionesLaboralesModel> _selectedItem10 = [];
  List<PrestacionesLaboralesModel> _PrestacionesList10 = [];
  bool valEsc10 = false;
  bool valTipE10 = false;
  bool valOcu10 = false;
  bool valDere10 = false;
  bool valMotDere10 = false;

  List<EscolaridadesModel> _Escolaridad = [];
  List<GradosEscolaresModel> _GradoEscolar = [];
  List<OcupacionesModel> _Ocupacion = [];
  List<TipoEmpleoModel> _TipoEmpleo = [];
  List<DerechoHabienciasModel> _Derechohabiencia = [];
  List<MotivoDerechoHabienciasModel> _MotivioDerechohabiencia = [];

  List<EscolaridadesModel> _EscolaridadOrden2 = [];
  List<GradosEscolaresModel> _GradoEscolar2 = [];
  List<OcupacionesModel> _Ocupacion2 = [];
  List<TipoEmpleoModel> _TipoEmpleo2 = [];
  List<DerechoHabienciasModel> _Derechohabiencia2 = [];
  List<MotivoDerechoHabienciasModel> _MotivioDerechohabiencia2 = [];

  List<EstructuraFamilarModel> _EstructuraFamiliar1 = [];
  List<EstructuraFamilarModel> _EstructuraFamiliar2 = [];
  List<EstructuraFamilarModel> _EstructuraFamiliar3 = [];
  List<EstructuraFamilarModel> _EstructuraFamiliar4 = [];
  List<EstructuraFamilarModel> _EstructuraFamiliar5 = [];
  List<EstructuraFamilarModel> _EstructuraFamiliar6 = [];
  List<EstructuraFamilarModel> _EstructuraFamiliar7 = [];
  List<EstructuraFamilarModel> _EstructuraFamiliar8 = [];
  List<EstructuraFamilarModel> _EstructuraFamiliar9 = [];
  List<EstructuraFamilarModel> _EstructuraFamiliar10 = [];

  List<EscolaridadSeguridadSocial> _Escolaridad1 = [];
  List<EscolaridadSeguridadSocial> _Escolaridad2 = [];
  List<EscolaridadSeguridadSocial> _Escolaridad3 = [];
  List<EscolaridadSeguridadSocial> _Escolaridad4 = [];
  List<EscolaridadSeguridadSocial> _Escolaridad5 = [];
  List<EscolaridadSeguridadSocial> _Escolaridad6 = [];
  List<EscolaridadSeguridadSocial> _Escolaridad7 = [];
  List<EscolaridadSeguridadSocial> _Escolaridad8 = [];
  List<EscolaridadSeguridadSocial> _Escolaridad9 = [];
  List<EscolaridadSeguridadSocial> _Escolaridad10 = [];

  var dbHelper;

  List<EscolaridadSeguridadSocial> _EscolaridadGuardar = [];

  @override
  void initState() {
    getAllEstructura1();
    getAllEstructura2();
    getAllEstructura3();
    getAllEstructura4();
    getAllEstructura5();
    getAllEstructura6();
    getAllEstructura7();
    getAllEstructura8();
    getAllEstructura9();
    getAllEstructura10();
    getAllPrestacionesLaborales();
    getAllCategoriesDerechohabiencia();
    getAllCategoriesEscolaridades();
    getAllCategoriesGradoEscolar();
    getAllCategoriesMotivoDerechohabiencias();
    getAllCategortegoriesTipoEmpleo();
    getAllCategoriesOcupacion();
    dbHelper = DbHelper();
    super.initState();
  }

  getAllEstructura1() async {
    _EstructuraFamiliar1 = [];
    var categories =
        await CategoryService().readEstructura1(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.nombre = category['nombre'];
        _EstructuraFamiliar1.add(categoryModel);
      });
    });
    _nombre1.text = _EstructuraFamiliar1.map((e) => e.nombre).first;
    print(_nombre1.text);
  }

  getAllEstructura2() async {
    _EstructuraFamiliar2 = [];
    var categories =
        await CategoryService().readEstructura2(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.nombre = category['nombre'];
        _EstructuraFamiliar2.add(categoryModel);
      });
    });
    _nombre2.text = _EstructuraFamiliar2.map((e) => e.nombre).first;
  }

  getAllEstructura3() async {
    _EstructuraFamiliar3 = [];
    var categories =
        await CategoryService().readEstructura3(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.nombre = category['nombre'];
        _EstructuraFamiliar3.add(categoryModel);
      });
    });
    _nombre3.text = _EstructuraFamiliar3.map((e) => e.nombre).first;
  }

  getAllEstructura4() async {
    _EstructuraFamiliar4 = [];
    var categories =
        await CategoryService().readEstructura4(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.nombre = category['nombre'];
        _EstructuraFamiliar4.add(categoryModel);
      });
    });
    _nombre4.text = _EstructuraFamiliar4.map((e) => e.nombre).first;
  }

  getAllEstructura5() async {
    _EstructuraFamiliar5 = [];
    var categories =
        await CategoryService().readEstructura5(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.nombre = category['nombre'];
        _EstructuraFamiliar5.add(categoryModel);
      });
    });
    _nombre5.text = _EstructuraFamiliar5.map((e) => e.nombre).first;
  }

  getAllEstructura6() async {
    _EstructuraFamiliar6 = [];
    var categories =
        await CategoryService().readEstructura6(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.nombre = category['nombre'];
        _EstructuraFamiliar6.add(categoryModel);
      });
    });
    _nombre6.text = _EstructuraFamiliar6.map((e) => e.nombre).first;
  }

  getAllEstructura7() async {
    _EstructuraFamiliar7 = [];
    var categories =
        await CategoryService().readEstructura7(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.nombre = category['nombre'];
        _EstructuraFamiliar7.add(categoryModel);
      });
    });
    _nombre7.text = _EstructuraFamiliar7.map((e) => e.nombre).first;
  }

  getAllEstructura8() async {
    _EstructuraFamiliar8 = [];
    var categories =
        await CategoryService().readEstructura8(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.nombre = category['nombre'];
        _EstructuraFamiliar8.add(categoryModel);
      });
    });
    _nombre8.text = _EstructuraFamiliar8.map((e) => e.nombre).first;
  }

  getAllEstructura9() async {
    _EstructuraFamiliar9 = [];
    var categories =
        await CategoryService().readEstructura9(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.nombre = category['nombre'];
        _EstructuraFamiliar9.add(categoryModel);
      });
    });
    _nombre9.text = _EstructuraFamiliar9.map((e) => e.nombre).first;
  }

  getAllEstructura10() async {
    _EstructuraFamiliar10 = [];
    var categories =
        await CategoryService().readEstructura10(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.nombre = category['nombre'];
        _EstructuraFamiliar10.add(categoryModel);
      });
    });
    _nombre10.text = _EstructuraFamiliar10.map((e) => e.nombre).first;
  }

  getAllCategoriesEscolaridades() async {
    _Escolaridad = [];
    var categories = await CategoryService().readCategoriesEcolaridades();
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadesModel();
        categoryModel.escolaridad = category['Escolaridad'];
        _Escolaridad.add(categoryModel);
      });
    });
  }

  getAllCategoriesGradoEscolar() async {
    _GradoEscolar = [];
    var categories = await CategoryService().readCategoriesGradosEscolares();
    categories.forEach((category) {
      setState(() {
        var categoryModel = GradosEscolaresModel();
        categoryModel.grado = category['GradoEscolar'];
        _GradoEscolar.add(categoryModel);
      });
    });
  }

  getAllCategoriesOcupacion() async {
    _Ocupacion = [];
    var categories = await CategoryService().readCategoriesOcupaciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = OcupacionesModel();
        categoryModel.ocupacion = category['Ocupacion'];
        _Ocupacion.add(categoryModel);
      });
    });
  }

  getAllCategortegoriesTipoEmpleo() async {
    _TipoEmpleo = [];
    var categories = await CategoryService().readCategoriesTipoEmpleos();
    categories.forEach((category) {
      setState(() {
        var categoryModel = TipoEmpleoModel();
        categoryModel.TipoEmpleo = category['TipoEmpleo'];
        _TipoEmpleo.add(categoryModel);
      });
    });
  }

  getAllCategoriesDerechohabiencia() async {
    _Derechohabiencia = [];
    var categories = await CategoryService().readCategoriesDerechohabiencias();
    categories.forEach((category) {
      setState(() {
        var categoryModel = DerechoHabienciasModel();
        categoryModel.derechoHabiencia = category['Derechohabiencia'];
        _Derechohabiencia.add(categoryModel);
      });
    });
  }

  getAllCategoriesMotivoDerechohabiencias() async {
    _MotivioDerechohabiencia = [];
    var categories =
        await CategoryService().readCategoriesMotivoDerechohabiencias();
    categories.forEach((category) {
      setState(() {
        var categoryModel = MotivoDerechoHabienciasModel();
        categoryModel.motivoDerechoHabiencia =
            category['MotivoDerechohabiencia'];
        _MotivioDerechohabiencia.add(categoryModel);
      });
    });
  }

  getAllEscolaridad1() async {
    _Escolaridad1 = [];
    var categories =
        await CategoryService().readEscolaridad1(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadSeguridadSocial();
        categoryModel.folio = category['folio'];
        categoryModel.ClaveEscolaridad = category['ClaveEscolaridad'];
        categoryModel.OrdenEscolaridad = category['OrdenEscolaridad'];
        categoryModel.Escolaridad = category['Escolaridad'];
        categoryModel.ClaveGradoEscolar = category['ClaveGradoEscolar'];
        categoryModel.GradoEscolar = category['GradoEscolar'];
        categoryModel.ClaveAsisteEscuela = category['ClaveAsisteEscuela'];
        categoryModel.OrdenAsisteEscuela = category['OrdenAsisteEscuela'];
        categoryModel.AsisteEscuela = category['AsisteEscuela'];
        categoryModel.ClaveOcupacion = category['ClaveOcupacion'];
        categoryModel.OrdenOcupacion = category['OrdenOcupacion'];
        categoryModel.Ocupacion = category['Ocupacion'];
        categoryModel.ClaveTipoEmpleo = category['ClaveTipoEmpleo'];
        categoryModel.OrdenTipoEmpleo = category['OrdenTipoEmpleo'];
        categoryModel.TipoEmpleo = category['TipoEmpleo'];
        categoryModel.pk_prestacioneslab = category['pk_prestacioneslab'];
        categoryModel.int_OrdenPrestacionesLab =
            category['int_OrdenPrestacionesLab'];
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'];
        categoryModel.ClaveJubilacion = category['ClaveJubilacion'];
        categoryModel.OrdenJubilacion = category['OrdenJubilacion'];
        categoryModel.Jubilacion = category['Jubilacion'];
        categoryModel.ClaveDerechohabiencia = category['ClaveDerechohabiencia'];
        categoryModel.OrdenDerechohabiencia = category['OrdenDerechohabiencia'];
        categoryModel.Derechohabiencia = category['Derechohabiencia'];
        categoryModel.ClaveMotivoDerechohabiencia =
            category['ClaveMotivoDerechohabiencia'];
        categoryModel.OrdenMotivoDerechohabiencia =
            category['OrdenMotivoDerechohabiencia'];
        categoryModel.MotivoDerechohabiencia =
            category['MotivoDerechohabiencia'];
        categoryModel.otroEscolaridad = category['otroEscolaridad'];
        categoryModel.otroOcupacion = category['otroOcupacion'];
        categoryModel.otroTipoEmpleo = category['otroTipoEmpleo'];

        _Escolaridad1.add(categoryModel);
      });
    });
    _escolaridad1.text = _Escolaridad1.map((e) => e.ClaveEscolaridad).first +
        " " +
        _Escolaridad1.map((e) => e.Escolaridad).first;

    _gradoEscolar1.text = _Escolaridad1.map((e) => e.ClaveGradoEscolar).first;

    _ocupacion1.text = _Escolaridad1.map((e) => e.ClaveOcupacion).first +
        " " +
        _Escolaridad1.map((e) => e.Ocupacion).first;

    _tipoEmpleo1.text = _Escolaridad1.map((e) => e.ClaveTipoEmpleo).first +
        " " +
        _Escolaridad1.map((e) => e.TipoEmpleo).first;

    _derechohabiencia1.text =
        _Escolaridad1.map((e) => e.ClaveDerechohabiencia).first +
            " " +
            _Escolaridad1.map((e) => e.Derechohabiencia).first;

    _prestacion1.text =
        _Escolaridad1.map((e) => e.txt_desc_prestacioneslab).first;
    pk = _Escolaridad1.map((e) => e.pk_prestacioneslab).first;
    Orden = _Escolaridad1.map((e) => e.int_OrdenPrestacionesLab).first;

    _motivoderechohabiencia1.text =
        _Escolaridad1.map((e) => e.ClaveMotivoDerechohabiencia).first +
            " " +
            _Escolaridad1.map((e) => e.MotivoDerechohabiencia).first;

    if (_Escolaridad1.map((e) => e.AsisteEscuela).first == "SI") {
      _asisteEscuela1 = AsisteEscuela.SI;
    } else if (_Escolaridad1.map((e) => e.AsisteEscuela).first == "NO") {
      _asisteEscuela1 = AsisteEscuela.NO;
    } else {
      _asisteEscuela1 = AsisteEscuela.NA;
    }

    if (_Escolaridad1.map((e) => e.Jubilacion).first == "SI") {
      _jubilacionPensionado1 = JubilacionPensionado.SI;
    } else if (_Escolaridad1.map((e) => e.Jubilacion).first == "NO") {
      _jubilacionPensionado1 = JubilacionPensionado.NO;
    } else {
      _jubilacionPensionado1 = JubilacionPensionado.NA;
    }

    _otroEscolaridad1.text = _Escolaridad1.map((e) => e.otroEscolaridad).first;
    _otroOcupacion1.text = _Escolaridad1.map((e) => e.otroOcupacion).first;
    _otroTipoEmpleo1.text = _Escolaridad1.map((e) => e.otroTipoEmpleo).first;
  }

  getAllEscolaridad2() async {
    _Escolaridad2 = [];
    var categories =
        await CategoryService().readEscolaridad2(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadSeguridadSocial();
        categoryModel.folio = category['folio'];
        categoryModel.ClaveEscolaridad = category['ClaveEscolaridad'];
        categoryModel.OrdenEscolaridad = category['OrdenEscolaridad'];
        categoryModel.Escolaridad = category['Escolaridad'];
        categoryModel.ClaveGradoEscolar = category['ClaveGradoEscolar'];
        categoryModel.GradoEscolar = category['GradoEscolar'];
        categoryModel.ClaveAsisteEscuela = category['ClaveAsisteEscuela'];
        categoryModel.OrdenAsisteEscuela = category['OrdenAsisteEscuela'];
        categoryModel.AsisteEscuela = category['AsisteEscuela'];
        categoryModel.ClaveOcupacion = category['ClaveOcupacion'];
        categoryModel.OrdenOcupacion = category['OrdenOcupacion'];
        categoryModel.Ocupacion = category['Ocupacion'];
        categoryModel.ClaveTipoEmpleo = category['ClaveTipoEmpleo'];
        categoryModel.OrdenTipoEmpleo = category['OrdenTipoEmpleo'];
        categoryModel.TipoEmpleo = category['TipoEmpleo'];
        categoryModel.pk_prestacioneslab = category['pk_prestacioneslab'];
        categoryModel.int_OrdenPrestacionesLab =
            category['int_OrdenPrestacionesLab'];
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'];
        categoryModel.ClaveJubilacion = category['ClaveJubilacion'];
        categoryModel.OrdenJubilacion = category['OrdenJubilacion'];
        categoryModel.Jubilacion = category['Jubilacion'];
        categoryModel.ClaveDerechohabiencia = category['ClaveDerechohabiencia'];
        categoryModel.OrdenDerechohabiencia = category['OrdenDerechohabiencia'];
        categoryModel.Derechohabiencia = category['Derechohabiencia'];
        categoryModel.ClaveMotivoDerechohabiencia =
            category['ClaveMotivoDerechohabiencia'];
        categoryModel.OrdenMotivoDerechohabiencia =
            category['OrdenMotivoDerechohabiencia'];
        categoryModel.MotivoDerechohabiencia =
            category['MotivoDerechohabiencia'];
        categoryModel.otroEscolaridad = category['otroEscolaridad'];
        categoryModel.otroOcupacion = category['otroOcupacion'];
        categoryModel.otroTipoEmpleo = category['otroTipoEmpleo'];

        _Escolaridad2.add(categoryModel);
      });
    });
    _escolaridad2.text = _Escolaridad2.map((e) => e.ClaveEscolaridad).first +
        " " +
        _Escolaridad2.map((e) => e.Escolaridad).first;

    _gradoEscolar2.text = _Escolaridad2.map((e) => e.ClaveGradoEscolar).first;

    _ocupacion2.text = _Escolaridad2.map((e) => e.ClaveOcupacion).first +
        " " +
        _Escolaridad2.map((e) => e.Ocupacion).first;

    _tipoEmpleo2.text = _Escolaridad2.map((e) => e.ClaveTipoEmpleo).first +
        " " +
        _Escolaridad2.map((e) => e.TipoEmpleo).first;

    _derechohabiencia2.text =
        _Escolaridad2.map((e) => e.ClaveDerechohabiencia).first +
            " " +
            _Escolaridad2.map((e) => e.Derechohabiencia).first;

    _prestacion2.text =
        _Escolaridad2.map((e) => e.txt_desc_prestacioneslab).first;
    pk2 = _Escolaridad2.map((e) => e.pk_prestacioneslab).first;
    Orden2 = _Escolaridad2.map((e) => e.int_OrdenPrestacionesLab).first;

    _motivoderechohabiencia2.text =
        _Escolaridad2.map((e) => e.ClaveMotivoDerechohabiencia).first +
            " " +
            _Escolaridad2.map((e) => e.MotivoDerechohabiencia).first;

    if (_Escolaridad2.map((e) => e.AsisteEscuela).first == "SI") {
      _asisteEscuela2 = AsisteEscuela.SI;
    } else if (_Escolaridad2.map((e) => e.AsisteEscuela).first == "NO") {
      _asisteEscuela2 = AsisteEscuela.NO;
    } else {
      _asisteEscuela2 = AsisteEscuela.NA;
    }

    if (_Escolaridad2.map((e) => e.Jubilacion).first == "SI") {
      _jubilacionPensionado2 = JubilacionPensionado.SI;
    } else if (_Escolaridad2.map((e) => e.Jubilacion).first == "NO") {
      _jubilacionPensionado2 = JubilacionPensionado.NO;
    } else {
      _jubilacionPensionado2 = JubilacionPensionado.NA;
    }

    _otroEscolaridad2.text = _Escolaridad2.map((e) => e.otroEscolaridad).first;
    _otroOcupacion2.text = _Escolaridad2.map((e) => e.otroOcupacion).first;
    _otroTipoEmpleo2.text = _Escolaridad2.map((e) => e.otroTipoEmpleo).first;
  }

  getAllEscolaridad3() async {
    _Escolaridad3 = [];
    var categories =
        await CategoryService().readEscolaridad3(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadSeguridadSocial();
        categoryModel.folio = category['folio'];
        categoryModel.ClaveEscolaridad = category['ClaveEscolaridad'];
        categoryModel.OrdenEscolaridad = category['OrdenEscolaridad'];
        categoryModel.Escolaridad = category['Escolaridad'];
        categoryModel.ClaveGradoEscolar = category['ClaveGradoEscolar'];
        categoryModel.GradoEscolar = category['GradoEscolar'];
        categoryModel.ClaveAsisteEscuela = category['ClaveAsisteEscuela'];
        categoryModel.OrdenAsisteEscuela = category['OrdenAsisteEscuela'];
        categoryModel.AsisteEscuela = category['AsisteEscuela'];
        categoryModel.ClaveOcupacion = category['ClaveOcupacion'];
        categoryModel.OrdenOcupacion = category['OrdenOcupacion'];
        categoryModel.Ocupacion = category['Ocupacion'];
        categoryModel.ClaveTipoEmpleo = category['ClaveTipoEmpleo'];
        categoryModel.OrdenTipoEmpleo = category['OrdenTipoEmpleo'];
        categoryModel.TipoEmpleo = category['TipoEmpleo'];
        categoryModel.pk_prestacioneslab = category['pk_prestacioneslab'];
        categoryModel.int_OrdenPrestacionesLab =
            category['int_OrdenPrestacionesLab'];
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'];
        categoryModel.ClaveJubilacion = category['ClaveJubilacion'];
        categoryModel.OrdenJubilacion = category['OrdenJubilacion'];
        categoryModel.Jubilacion = category['Jubilacion'];
        categoryModel.ClaveDerechohabiencia = category['ClaveDerechohabiencia'];
        categoryModel.OrdenDerechohabiencia = category['OrdenDerechohabiencia'];
        categoryModel.Derechohabiencia = category['Derechohabiencia'];
        categoryModel.ClaveMotivoDerechohabiencia =
            category['ClaveMotivoDerechohabiencia'];
        categoryModel.OrdenMotivoDerechohabiencia =
            category['OrdenMotivoDerechohabiencia'];
        categoryModel.MotivoDerechohabiencia =
            category['MotivoDerechohabiencia'];
        categoryModel.otroEscolaridad = category['otroEscolaridad'];
        categoryModel.otroOcupacion = category['otroOcupacion'];
        categoryModel.otroTipoEmpleo = category['otroTipoEmpleo'];

        _Escolaridad3.add(categoryModel);
      });
    });
    _escolaridad3.text = _Escolaridad3.map((e) => e.ClaveEscolaridad).first +
        " " +
        _Escolaridad3.map((e) => e.Escolaridad).first;

    _gradoEscolar3.text = _Escolaridad3.map((e) => e.ClaveGradoEscolar).first;

    _ocupacion3.text = _Escolaridad3.map((e) => e.ClaveOcupacion).first +
        " " +
        _Escolaridad3.map((e) => e.Ocupacion).first;

    _tipoEmpleo3.text = _Escolaridad3.map((e) => e.ClaveTipoEmpleo).first +
        " " +
        _Escolaridad3.map((e) => e.TipoEmpleo).first;

    _derechohabiencia3.text =
        _Escolaridad3.map((e) => e.ClaveDerechohabiencia).first +
            " " +
            _Escolaridad3.map((e) => e.Derechohabiencia).first;

    _prestacion3.text =
        _Escolaridad3.map((e) => e.txt_desc_prestacioneslab).first;
    pk3 = _Escolaridad3.map((e) => e.pk_prestacioneslab).first;
    Orden3 = _Escolaridad3.map((e) => e.int_OrdenPrestacionesLab).first;

    _motivoderechohabiencia3.text =
        _Escolaridad3.map((e) => e.ClaveMotivoDerechohabiencia).first +
            " " +
            _Escolaridad3.map((e) => e.MotivoDerechohabiencia).first;

    if (_Escolaridad3.map((e) => e.AsisteEscuela).first == "SI") {
      _asisteEscuela3 = AsisteEscuela.SI;
    } else if (_Escolaridad3.map((e) => e.AsisteEscuela).first == "NO") {
      _asisteEscuela3 = AsisteEscuela.NO;
    } else {
      _asisteEscuela3 = AsisteEscuela.NA;
    }

    if (_Escolaridad3.map((e) => e.Jubilacion).first == "SI") {
      _jubilacionPensionado3 = JubilacionPensionado.SI;
    } else if (_Escolaridad3.map((e) => e.Jubilacion).first == "NO") {
      _jubilacionPensionado3 = JubilacionPensionado.NO;
    } else {
      _jubilacionPensionado3 = JubilacionPensionado.NA;
    }

    _otroEscolaridad3.text = _Escolaridad3.map((e) => e.otroEscolaridad).first;
    _otroOcupacion3.text = _Escolaridad3.map((e) => e.otroOcupacion).first;
    _otroTipoEmpleo3.text = _Escolaridad3.map((e) => e.otroTipoEmpleo).first;
  }

  getAllEscolaridad4() async {
    _Escolaridad4 = [];
    var categories =
        await CategoryService().readEscolaridad4(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadSeguridadSocial();
        categoryModel.folio = category['folio'];
        categoryModel.ClaveEscolaridad = category['ClaveEscolaridad'];
        categoryModel.OrdenEscolaridad = category['OrdenEscolaridad'];
        categoryModel.Escolaridad = category['Escolaridad'];
        categoryModel.ClaveGradoEscolar = category['ClaveGradoEscolar'];
        categoryModel.GradoEscolar = category['GradoEscolar'];
        categoryModel.ClaveAsisteEscuela = category['ClaveAsisteEscuela'];
        categoryModel.OrdenAsisteEscuela = category['OrdenAsisteEscuela'];
        categoryModel.AsisteEscuela = category['AsisteEscuela'];
        categoryModel.ClaveOcupacion = category['ClaveOcupacion'];
        categoryModel.OrdenOcupacion = category['OrdenOcupacion'];
        categoryModel.Ocupacion = category['Ocupacion'];
        categoryModel.ClaveTipoEmpleo = category['ClaveTipoEmpleo'];
        categoryModel.OrdenTipoEmpleo = category['OrdenTipoEmpleo'];
        categoryModel.TipoEmpleo = category['TipoEmpleo'];
        categoryModel.pk_prestacioneslab = category['pk_prestacioneslab'];
        categoryModel.int_OrdenPrestacionesLab =
            category['int_OrdenPrestacionesLab'];
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'];
        categoryModel.ClaveJubilacion = category['ClaveJubilacion'];
        categoryModel.OrdenJubilacion = category['OrdenJubilacion'];
        categoryModel.Jubilacion = category['Jubilacion'];
        categoryModel.ClaveDerechohabiencia = category['ClaveDerechohabiencia'];
        categoryModel.OrdenDerechohabiencia = category['OrdenDerechohabiencia'];
        categoryModel.Derechohabiencia = category['Derechohabiencia'];
        categoryModel.ClaveMotivoDerechohabiencia =
            category['ClaveMotivoDerechohabiencia'];
        categoryModel.OrdenMotivoDerechohabiencia =
            category['OrdenMotivoDerechohabiencia'];
        categoryModel.MotivoDerechohabiencia =
            category['MotivoDerechohabiencia'];
        categoryModel.otroEscolaridad = category['otroEscolaridad'];
        categoryModel.otroOcupacion = category['otroOcupacion'];
        categoryModel.otroTipoEmpleo = category['otroTipoEmpleo'];

        _Escolaridad4.add(categoryModel);
      });
    });
    _escolaridad4.text = _Escolaridad4.map((e) => e.ClaveEscolaridad).first +
        " " +
        _Escolaridad4.map((e) => e.Escolaridad).first;

    _gradoEscolar4.text = _Escolaridad4.map((e) => e.ClaveGradoEscolar).first;

    _ocupacion4.text = _Escolaridad4.map((e) => e.ClaveOcupacion).first +
        " " +
        _Escolaridad4.map((e) => e.Ocupacion).first;

    _tipoEmpleo4.text = _Escolaridad4.map((e) => e.ClaveTipoEmpleo).first +
        " " +
        _Escolaridad4.map((e) => e.TipoEmpleo).first;

    _derechohabiencia4.text =
        _Escolaridad4.map((e) => e.ClaveDerechohabiencia).first +
            " " +
            _Escolaridad4.map((e) => e.Derechohabiencia).first;

    _prestacion4.text =
        _Escolaridad4.map((e) => e.txt_desc_prestacioneslab).first;
    pk4 = _Escolaridad4.map((e) => e.pk_prestacioneslab).first;
    Orden4 = _Escolaridad4.map((e) => e.int_OrdenPrestacionesLab).first;

    _motivoderechohabiencia4.text =
        _Escolaridad4.map((e) => e.ClaveMotivoDerechohabiencia).first +
            " " +
            _Escolaridad4.map((e) => e.MotivoDerechohabiencia).first;

    if (_Escolaridad4.map((e) => e.AsisteEscuela).first == "SI") {
      _asisteEscuela4 = AsisteEscuela.SI;
    } else if (_Escolaridad4.map((e) => e.AsisteEscuela).first == "NO") {
      _asisteEscuela4 = AsisteEscuela.NO;
    } else {
      _asisteEscuela4 = AsisteEscuela.NA;
    }

    if (_Escolaridad4.map((e) => e.Jubilacion).first == "SI") {
      _jubilacionPensionado4 = JubilacionPensionado.SI;
    } else if (_Escolaridad4.map((e) => e.Jubilacion).first == "NO") {
      _jubilacionPensionado4 = JubilacionPensionado.NO;
    } else {
      _jubilacionPensionado4 = JubilacionPensionado.NA;
    }

    _otroEscolaridad4.text = _Escolaridad4.map((e) => e.otroEscolaridad).first;
    _otroOcupacion4.text = _Escolaridad4.map((e) => e.otroOcupacion).first;
    _otroTipoEmpleo4.text = _Escolaridad4.map((e) => e.otroTipoEmpleo).first;
  }

  getAllEscolaridad5() async {
    _Escolaridad5 = [];
    var categories =
        await CategoryService().readEscolaridad5(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadSeguridadSocial();
        categoryModel.folio = category['folio'];
        categoryModel.ClaveEscolaridad = category['ClaveEscolaridad'];
        categoryModel.OrdenEscolaridad = category['OrdenEscolaridad'];
        categoryModel.Escolaridad = category['Escolaridad'];
        categoryModel.ClaveGradoEscolar = category['ClaveGradoEscolar'];
        categoryModel.GradoEscolar = category['GradoEscolar'];
        categoryModel.ClaveAsisteEscuela = category['ClaveAsisteEscuela'];
        categoryModel.OrdenAsisteEscuela = category['OrdenAsisteEscuela'];
        categoryModel.AsisteEscuela = category['AsisteEscuela'];
        categoryModel.ClaveOcupacion = category['ClaveOcupacion'];
        categoryModel.OrdenOcupacion = category['OrdenOcupacion'];
        categoryModel.Ocupacion = category['Ocupacion'];
        categoryModel.ClaveTipoEmpleo = category['ClaveTipoEmpleo'];
        categoryModel.OrdenTipoEmpleo = category['OrdenTipoEmpleo'];
        categoryModel.TipoEmpleo = category['TipoEmpleo'];
        categoryModel.pk_prestacioneslab = category['pk_prestacioneslab'];
        categoryModel.int_OrdenPrestacionesLab =
            category['int_OrdenPrestacionesLab'];
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'];
        categoryModel.ClaveJubilacion = category['ClaveJubilacion'];
        categoryModel.OrdenJubilacion = category['OrdenJubilacion'];
        categoryModel.Jubilacion = category['Jubilacion'];
        categoryModel.ClaveDerechohabiencia = category['ClaveDerechohabiencia'];
        categoryModel.OrdenDerechohabiencia = category['OrdenDerechohabiencia'];
        categoryModel.Derechohabiencia = category['Derechohabiencia'];
        categoryModel.ClaveMotivoDerechohabiencia =
            category['ClaveMotivoDerechohabiencia'];
        categoryModel.OrdenMotivoDerechohabiencia =
            category['OrdenMotivoDerechohabiencia'];
        categoryModel.MotivoDerechohabiencia =
            category['MotivoDerechohabiencia'];
        categoryModel.otroEscolaridad = category['otroEscolaridad'];
        categoryModel.otroOcupacion = category['otroOcupacion'];
        categoryModel.otroTipoEmpleo = category['otroTipoEmpleo'];

        _Escolaridad5.add(categoryModel);
      });
    });
    _escolaridad5.text = _Escolaridad5.map((e) => e.ClaveEscolaridad).first +
        " " +
        _Escolaridad5.map((e) => e.Escolaridad).first;

    _gradoEscolar5.text = _Escolaridad5.map((e) => e.ClaveGradoEscolar).first;

    _ocupacion5.text = _Escolaridad5.map((e) => e.ClaveOcupacion).first +
        " " +
        _Escolaridad5.map((e) => e.Ocupacion).first;

    _tipoEmpleo5.text = _Escolaridad5.map((e) => e.ClaveTipoEmpleo).first +
        " " +
        _Escolaridad5.map((e) => e.TipoEmpleo).first;

    _derechohabiencia5.text =
        _Escolaridad5.map((e) => e.ClaveDerechohabiencia).first +
            " " +
            _Escolaridad5.map((e) => e.Derechohabiencia).first;

    _prestacion5.text =
        _Escolaridad5.map((e) => e.txt_desc_prestacioneslab).first;
    pk5 = _Escolaridad5.map((e) => e.pk_prestacioneslab).first;
    Orden5 = _Escolaridad5.map((e) => e.int_OrdenPrestacionesLab).first;

    _motivoderechohabiencia5.text =
        _Escolaridad5.map((e) => e.ClaveMotivoDerechohabiencia).first +
            " " +
            _Escolaridad5.map((e) => e.MotivoDerechohabiencia).first;

    if (_Escolaridad5.map((e) => e.AsisteEscuela).first == "SI") {
      _asisteEscuela5 = AsisteEscuela.SI;
    } else if (_Escolaridad5.map((e) => e.AsisteEscuela).first == "NO") {
      _asisteEscuela5 = AsisteEscuela.NO;
    } else {
      _asisteEscuela5 = AsisteEscuela.NA;
    }

    if (_Escolaridad5.map((e) => e.Jubilacion).first == "SI") {
      _jubilacionPensionado5 = JubilacionPensionado.SI;
    } else if (_Escolaridad5.map((e) => e.Jubilacion).first == "NO") {
      _jubilacionPensionado5 = JubilacionPensionado.NO;
    } else {
      _jubilacionPensionado5 = JubilacionPensionado.NA;
    }

    _otroEscolaridad5.text = _Escolaridad5.map((e) => e.otroEscolaridad).first;
    _otroOcupacion5.text = _Escolaridad5.map((e) => e.otroOcupacion).first;
    _otroTipoEmpleo5.text = _Escolaridad5.map((e) => e.otroTipoEmpleo).first;
  }

  getAllEscolaridad6() async {
    _Escolaridad6 = [];
    var categories =
        await CategoryService().readEscolaridad6(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadSeguridadSocial();
        categoryModel.folio = category['folio'];
        categoryModel.ClaveEscolaridad = category['ClaveEscolaridad'];
        categoryModel.OrdenEscolaridad = category['OrdenEscolaridad'];
        categoryModel.Escolaridad = category['Escolaridad'];
        categoryModel.ClaveGradoEscolar = category['ClaveGradoEscolar'];
        categoryModel.GradoEscolar = category['GradoEscolar'];
        categoryModel.ClaveAsisteEscuela = category['ClaveAsisteEscuela'];
        categoryModel.OrdenAsisteEscuela = category['OrdenAsisteEscuela'];
        categoryModel.AsisteEscuela = category['AsisteEscuela'];
        categoryModel.ClaveOcupacion = category['ClaveOcupacion'];
        categoryModel.OrdenOcupacion = category['OrdenOcupacion'];
        categoryModel.Ocupacion = category['Ocupacion'];
        categoryModel.ClaveTipoEmpleo = category['ClaveTipoEmpleo'];
        categoryModel.OrdenTipoEmpleo = category['OrdenTipoEmpleo'];
        categoryModel.TipoEmpleo = category['TipoEmpleo'];
        categoryModel.pk_prestacioneslab = category['pk_prestacioneslab'];
        categoryModel.int_OrdenPrestacionesLab =
            category['int_OrdenPrestacionesLab'];
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'];
        categoryModel.ClaveJubilacion = category['ClaveJubilacion'];
        categoryModel.OrdenJubilacion = category['OrdenJubilacion'];
        categoryModel.Jubilacion = category['Jubilacion'];
        categoryModel.ClaveDerechohabiencia = category['ClaveDerechohabiencia'];
        categoryModel.OrdenDerechohabiencia = category['OrdenDerechohabiencia'];
        categoryModel.Derechohabiencia = category['Derechohabiencia'];
        categoryModel.ClaveMotivoDerechohabiencia =
            category['ClaveMotivoDerechohabiencia'];
        categoryModel.OrdenMotivoDerechohabiencia =
            category['OrdenMotivoDerechohabiencia'];
        categoryModel.MotivoDerechohabiencia =
            category['MotivoDerechohabiencia'];
        categoryModel.otroEscolaridad = category['otroEscolaridad'];
        categoryModel.otroOcupacion = category['otroOcupacion'];
        categoryModel.otroTipoEmpleo = category['otroTipoEmpleo'];

        _Escolaridad6.add(categoryModel);
      });
    });
    _escolaridad6.text = _Escolaridad6.map((e) => e.ClaveEscolaridad).first +
        " " +
        _Escolaridad6.map((e) => e.Escolaridad).first;

    _gradoEscolar6.text = _Escolaridad6.map((e) => e.ClaveGradoEscolar).first;

    _ocupacion6.text = _Escolaridad6.map((e) => e.ClaveOcupacion).first +
        " " +
        _Escolaridad6.map((e) => e.Ocupacion).first;

    _tipoEmpleo6.text = _Escolaridad6.map((e) => e.ClaveTipoEmpleo).first +
        " " +
        _Escolaridad6.map((e) => e.TipoEmpleo).first;

    _derechohabiencia6.text =
        _Escolaridad6.map((e) => e.ClaveDerechohabiencia).first +
            " " +
            _Escolaridad6.map((e) => e.Derechohabiencia).first;

    _prestacion6.text =
        _Escolaridad6.map((e) => e.txt_desc_prestacioneslab).first;
    pk6 = _Escolaridad6.map((e) => e.pk_prestacioneslab).first;
    Orden6 = _Escolaridad6.map((e) => e.int_OrdenPrestacionesLab).first;

    _motivoderechohabiencia6.text =
        _Escolaridad6.map((e) => e.ClaveMotivoDerechohabiencia).first +
            " " +
            _Escolaridad6.map((e) => e.MotivoDerechohabiencia).first;

    if (_Escolaridad6.map((e) => e.AsisteEscuela).first == "SI") {
      _asisteEscuela6 = AsisteEscuela.SI;
    } else if (_Escolaridad6.map((e) => e.AsisteEscuela).first == "NO") {
      _asisteEscuela6 = AsisteEscuela.NO;
    } else {
      _asisteEscuela6 = AsisteEscuela.NA;
    }

    if (_Escolaridad6.map((e) => e.Jubilacion).first == "SI") {
      _jubilacionPensionado6 = JubilacionPensionado.SI;
    } else if (_Escolaridad6.map((e) => e.Jubilacion).first == "NO") {
      _jubilacionPensionado6 = JubilacionPensionado.NO;
    } else {
      _jubilacionPensionado6 = JubilacionPensionado.NA;
    }

    _otroEscolaridad6.text = _Escolaridad6.map((e) => e.otroEscolaridad).first;
    _otroOcupacion6.text = _Escolaridad6.map((e) => e.otroOcupacion).first;
    _otroTipoEmpleo6.text = _Escolaridad6.map((e) => e.otroTipoEmpleo).first;
  }

  getAllEscolaridad7() async {
    _Escolaridad7 = [];
    var categories =
        await CategoryService().readEscolaridad7(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadSeguridadSocial();
        categoryModel.folio = category['folio'];
        categoryModel.ClaveEscolaridad = category['ClaveEscolaridad'];
        categoryModel.OrdenEscolaridad = category['OrdenEscolaridad'];
        categoryModel.Escolaridad = category['Escolaridad'];
        categoryModel.ClaveGradoEscolar = category['ClaveGradoEscolar'];
        categoryModel.GradoEscolar = category['GradoEscolar'];
        categoryModel.ClaveAsisteEscuela = category['ClaveAsisteEscuela'];
        categoryModel.OrdenAsisteEscuela = category['OrdenAsisteEscuela'];
        categoryModel.AsisteEscuela = category['AsisteEscuela'];
        categoryModel.ClaveOcupacion = category['ClaveOcupacion'];
        categoryModel.OrdenOcupacion = category['OrdenOcupacion'];
        categoryModel.Ocupacion = category['Ocupacion'];
        categoryModel.ClaveTipoEmpleo = category['ClaveTipoEmpleo'];
        categoryModel.OrdenTipoEmpleo = category['OrdenTipoEmpleo'];
        categoryModel.TipoEmpleo = category['TipoEmpleo'];
        categoryModel.pk_prestacioneslab = category['pk_prestacioneslab'];
        categoryModel.int_OrdenPrestacionesLab =
            category['int_OrdenPrestacionesLab'];
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'];
        categoryModel.ClaveJubilacion = category['ClaveJubilacion'];
        categoryModel.OrdenJubilacion = category['OrdenJubilacion'];
        categoryModel.Jubilacion = category['Jubilacion'];
        categoryModel.ClaveDerechohabiencia = category['ClaveDerechohabiencia'];
        categoryModel.OrdenDerechohabiencia = category['OrdenDerechohabiencia'];
        categoryModel.Derechohabiencia = category['Derechohabiencia'];
        categoryModel.ClaveMotivoDerechohabiencia =
            category['ClaveMotivoDerechohabiencia'];
        categoryModel.OrdenMotivoDerechohabiencia =
            category['OrdenMotivoDerechohabiencia'];
        categoryModel.MotivoDerechohabiencia =
            category['MotivoDerechohabiencia'];
        categoryModel.otroEscolaridad = category['otroEscolaridad'];
        categoryModel.otroOcupacion = category['otroOcupacion'];
        categoryModel.otroTipoEmpleo = category['otroTipoEmpleo'];

        _Escolaridad7.add(categoryModel);
      });
    });
    _escolaridad7.text = _Escolaridad7.map((e) => e.ClaveEscolaridad).first +
        " " +
        _Escolaridad7.map((e) => e.Escolaridad).first;

    _gradoEscolar7.text = _Escolaridad7.map((e) => e.ClaveGradoEscolar).first;

    _ocupacion7.text = _Escolaridad7.map((e) => e.ClaveOcupacion).first +
        " " +
        _Escolaridad7.map((e) => e.Ocupacion).first;

    _tipoEmpleo7.text = _Escolaridad7.map((e) => e.ClaveTipoEmpleo).first +
        " " +
        _Escolaridad7.map((e) => e.TipoEmpleo).first;

    _derechohabiencia7.text =
        _Escolaridad7.map((e) => e.ClaveDerechohabiencia).first +
            " " +
            _Escolaridad7.map((e) => e.Derechohabiencia).first;

    _prestacion7.text =
        _Escolaridad7.map((e) => e.txt_desc_prestacioneslab).first;
    pk7 = _Escolaridad7.map((e) => e.pk_prestacioneslab).first;
    Orden7 = _Escolaridad7.map((e) => e.int_OrdenPrestacionesLab).first;

    _motivoderechohabiencia7.text =
        _Escolaridad7.map((e) => e.ClaveMotivoDerechohabiencia).first +
            " " +
            _Escolaridad7.map((e) => e.MotivoDerechohabiencia).first;

    if (_Escolaridad7.map((e) => e.AsisteEscuela).first == "SI") {
      _asisteEscuela7 = AsisteEscuela.SI;
    } else if (_Escolaridad7.map((e) => e.AsisteEscuela).first == "NO") {
      _asisteEscuela7 = AsisteEscuela.NO;
    } else {
      _asisteEscuela7 = AsisteEscuela.NA;
    }

    if (_Escolaridad7.map((e) => e.Jubilacion).first == "SI") {
      _jubilacionPensionado7 = JubilacionPensionado.SI;
    } else if (_Escolaridad7.map((e) => e.Jubilacion).first == "NO") {
      _jubilacionPensionado7 = JubilacionPensionado.NO;
    } else {
      _jubilacionPensionado7 = JubilacionPensionado.NA;
    }

    _otroEscolaridad7.text = _Escolaridad7.map((e) => e.otroEscolaridad).first;
    _otroOcupacion7.text = _Escolaridad7.map((e) => e.otroOcupacion).first;
    _otroTipoEmpleo7.text = _Escolaridad7.map((e) => e.otroTipoEmpleo).first;
  }

  getAllEscolaridad8() async {
    _Escolaridad8 = [];
    var categories =
        await CategoryService().readEscolaridad8(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadSeguridadSocial();
        categoryModel.folio = category['folio'];
        categoryModel.ClaveEscolaridad = category['ClaveEscolaridad'];
        categoryModel.OrdenEscolaridad = category['OrdenEscolaridad'];
        categoryModel.Escolaridad = category['Escolaridad'];
        categoryModel.ClaveGradoEscolar = category['ClaveGradoEscolar'];
        categoryModel.GradoEscolar = category['GradoEscolar'];
        categoryModel.ClaveAsisteEscuela = category['ClaveAsisteEscuela'];
        categoryModel.OrdenAsisteEscuela = category['OrdenAsisteEscuela'];
        categoryModel.AsisteEscuela = category['AsisteEscuela'];
        categoryModel.ClaveOcupacion = category['ClaveOcupacion'];
        categoryModel.OrdenOcupacion = category['OrdenOcupacion'];
        categoryModel.Ocupacion = category['Ocupacion'];
        categoryModel.ClaveTipoEmpleo = category['ClaveTipoEmpleo'];
        categoryModel.OrdenTipoEmpleo = category['OrdenTipoEmpleo'];
        categoryModel.TipoEmpleo = category['TipoEmpleo'];
        categoryModel.pk_prestacioneslab = category['pk_prestacioneslab'];
        categoryModel.int_OrdenPrestacionesLab =
            category['int_OrdenPrestacionesLab'];
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'];
        categoryModel.ClaveJubilacion = category['ClaveJubilacion'];
        categoryModel.OrdenJubilacion = category['OrdenJubilacion'];
        categoryModel.Jubilacion = category['Jubilacion'];
        categoryModel.ClaveDerechohabiencia = category['ClaveDerechohabiencia'];
        categoryModel.OrdenDerechohabiencia = category['OrdenDerechohabiencia'];
        categoryModel.Derechohabiencia = category['Derechohabiencia'];
        categoryModel.ClaveMotivoDerechohabiencia =
            category['ClaveMotivoDerechohabiencia'];
        categoryModel.OrdenMotivoDerechohabiencia =
            category['OrdenMotivoDerechohabiencia'];
        categoryModel.MotivoDerechohabiencia =
            category['MotivoDerechohabiencia'];
        categoryModel.otroEscolaridad = category['otroEscolaridad'];
        categoryModel.otroOcupacion = category['otroOcupacion'];
        categoryModel.otroTipoEmpleo = category['otroTipoEmpleo'];

        _Escolaridad8.add(categoryModel);
      });
    });
    _escolaridad8.text = _Escolaridad8.map((e) => e.ClaveEscolaridad).first +
        " " +
        _Escolaridad8.map((e) => e.Escolaridad).first;

    _gradoEscolar8.text = _Escolaridad8.map((e) => e.ClaveGradoEscolar).first;

    _ocupacion8.text = _Escolaridad8.map((e) => e.ClaveOcupacion).first +
        " " +
        _Escolaridad8.map((e) => e.Ocupacion).first;

    _tipoEmpleo8.text = _Escolaridad8.map((e) => e.ClaveTipoEmpleo).first +
        " " +
        _Escolaridad8.map((e) => e.TipoEmpleo).first;

    _derechohabiencia8.text =
        _Escolaridad8.map((e) => e.ClaveDerechohabiencia).first +
            " " +
            _Escolaridad8.map((e) => e.Derechohabiencia).first;

    _prestacion8.text =
        _Escolaridad8.map((e) => e.txt_desc_prestacioneslab).first;
    pk8 = _Escolaridad8.map((e) => e.pk_prestacioneslab).first;
    Orden8 = _Escolaridad8.map((e) => e.int_OrdenPrestacionesLab).first;

    _motivoderechohabiencia8.text =
        _Escolaridad8.map((e) => e.ClaveMotivoDerechohabiencia).first +
            " " +
            _Escolaridad8.map((e) => e.MotivoDerechohabiencia).first;

    if (_Escolaridad8.map((e) => e.AsisteEscuela).first == "SI") {
      _asisteEscuela8 = AsisteEscuela.SI;
    } else if (_Escolaridad8.map((e) => e.AsisteEscuela).first == "NO") {
      _asisteEscuela8 = AsisteEscuela.NO;
    } else {
      _asisteEscuela8 = AsisteEscuela.NA;
    }

    if (_Escolaridad8.map((e) => e.Jubilacion).first == "SI") {
      _jubilacionPensionado8 = JubilacionPensionado.SI;
    } else if (_Escolaridad8.map((e) => e.Jubilacion).first == "NO") {
      _jubilacionPensionado8 = JubilacionPensionado.NO;
    } else {
      _jubilacionPensionado8 = JubilacionPensionado.NA;
    }

    _otroEscolaridad8.text = _Escolaridad8.map((e) => e.otroEscolaridad).first;
    _otroOcupacion8.text = _Escolaridad8.map((e) => e.otroOcupacion).first;
    _otroTipoEmpleo8.text = _Escolaridad8.map((e) => e.otroTipoEmpleo).first;
  }

  getAllEscolaridad9() async {
    _Escolaridad9 = [];
    var categories =
        await CategoryService().readEscolaridad9(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadSeguridadSocial();
        categoryModel.folio = category['folio'];
        categoryModel.ClaveEscolaridad = category['ClaveEscolaridad'];
        categoryModel.OrdenEscolaridad = category['OrdenEscolaridad'];
        categoryModel.Escolaridad = category['Escolaridad'];
        categoryModel.ClaveGradoEscolar = category['ClaveGradoEscolar'];
        categoryModel.GradoEscolar = category['GradoEscolar'];
        categoryModel.ClaveAsisteEscuela = category['ClaveAsisteEscuela'];
        categoryModel.OrdenAsisteEscuela = category['OrdenAsisteEscuela'];
        categoryModel.AsisteEscuela = category['AsisteEscuela'];
        categoryModel.ClaveOcupacion = category['ClaveOcupacion'];
        categoryModel.OrdenOcupacion = category['OrdenOcupacion'];
        categoryModel.Ocupacion = category['Ocupacion'];
        categoryModel.ClaveTipoEmpleo = category['ClaveTipoEmpleo'];
        categoryModel.OrdenTipoEmpleo = category['OrdenTipoEmpleo'];
        categoryModel.TipoEmpleo = category['TipoEmpleo'];
        categoryModel.pk_prestacioneslab = category['pk_prestacioneslab'];
        categoryModel.int_OrdenPrestacionesLab =
            category['int_OrdenPrestacionesLab'];
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'];
        categoryModel.ClaveJubilacion = category['ClaveJubilacion'];
        categoryModel.OrdenJubilacion = category['OrdenJubilacion'];
        categoryModel.Jubilacion = category['Jubilacion'];
        categoryModel.ClaveDerechohabiencia = category['ClaveDerechohabiencia'];
        categoryModel.OrdenDerechohabiencia = category['OrdenDerechohabiencia'];
        categoryModel.Derechohabiencia = category['Derechohabiencia'];
        categoryModel.ClaveMotivoDerechohabiencia =
            category['ClaveMotivoDerechohabiencia'];
        categoryModel.OrdenMotivoDerechohabiencia =
            category['OrdenMotivoDerechohabiencia'];
        categoryModel.MotivoDerechohabiencia =
            category['MotivoDerechohabiencia'];
        categoryModel.otroEscolaridad = category['otroEscolaridad'];
        categoryModel.otroOcupacion = category['otroOcupacion'];
        categoryModel.otroTipoEmpleo = category['otroTipoEmpleo'];

        _Escolaridad9.add(categoryModel);
      });
    });
    _escolaridad9.text = _Escolaridad9.map((e) => e.ClaveEscolaridad).first +
        " " +
        _Escolaridad9.map((e) => e.Escolaridad).first;

    _gradoEscolar9.text = _Escolaridad9.map((e) => e.ClaveGradoEscolar).first;

    _ocupacion9.text = _Escolaridad9.map((e) => e.ClaveOcupacion).first +
        " " +
        _Escolaridad9.map((e) => e.Ocupacion).first;

    _tipoEmpleo9.text = _Escolaridad9.map((e) => e.ClaveTipoEmpleo).first +
        " " +
        _Escolaridad9.map((e) => e.TipoEmpleo).first;

    _derechohabiencia9.text =
        _Escolaridad9.map((e) => e.ClaveDerechohabiencia).first +
            " " +
            _Escolaridad9.map((e) => e.Derechohabiencia).first;

    _prestacion9.text =
        _Escolaridad9.map((e) => e.txt_desc_prestacioneslab).first;
    pk9 = _Escolaridad9.map((e) => e.pk_prestacioneslab).first;
    Orden9 = _Escolaridad9.map((e) => e.int_OrdenPrestacionesLab).first;

    _motivoderechohabiencia9.text =
        _Escolaridad9.map((e) => e.ClaveMotivoDerechohabiencia).first +
            " " +
            _Escolaridad9.map((e) => e.MotivoDerechohabiencia).first;

    if (_Escolaridad9.map((e) => e.AsisteEscuela).first == "SI") {
      _asisteEscuela9 = AsisteEscuela.SI;
    } else if (_Escolaridad9.map((e) => e.AsisteEscuela).first == "NO") {
      _asisteEscuela9 = AsisteEscuela.NO;
    } else {
      _asisteEscuela9 = AsisteEscuela.NA;
    }

    if (_Escolaridad9.map((e) => e.Jubilacion).first == "SI") {
      _jubilacionPensionado9 = JubilacionPensionado.SI;
    } else if (_Escolaridad9.map((e) => e.Jubilacion).first == "NO") {
      _jubilacionPensionado9 = JubilacionPensionado.NO;
    } else {
      _jubilacionPensionado9 = JubilacionPensionado.NA;
    }

    _otroEscolaridad9.text = _Escolaridad9.map((e) => e.otroEscolaridad).first;
    _otroOcupacion9.text = _Escolaridad9.map((e) => e.otroOcupacion).first;
    _otroTipoEmpleo9.text = _Escolaridad9.map((e) => e.otroTipoEmpleo).first;
  }

  getAllEscolaridad10() async {
    _Escolaridad10 = [];
    var categories =
        await CategoryService().readEscolaridad10(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadSeguridadSocial();
        categoryModel.folio = category['folio'];
        categoryModel.ClaveEscolaridad = category['ClaveEscolaridad'];
        categoryModel.OrdenEscolaridad = category['OrdenEscolaridad'];
        categoryModel.Escolaridad = category['Escolaridad'];
        categoryModel.ClaveGradoEscolar = category['ClaveGradoEscolar'];
        categoryModel.GradoEscolar = category['GradoEscolar'];
        categoryModel.ClaveAsisteEscuela = category['ClaveAsisteEscuela'];
        categoryModel.OrdenAsisteEscuela = category['OrdenAsisteEscuela'];
        categoryModel.AsisteEscuela = category['AsisteEscuela'];
        categoryModel.ClaveOcupacion = category['ClaveOcupacion'];
        categoryModel.OrdenOcupacion = category['OrdenOcupacion'];
        categoryModel.Ocupacion = category['Ocupacion'];
        categoryModel.ClaveTipoEmpleo = category['ClaveTipoEmpleo'];
        categoryModel.OrdenTipoEmpleo = category['OrdenTipoEmpleo'];
        categoryModel.TipoEmpleo = category['TipoEmpleo'];
        categoryModel.pk_prestacioneslab = category['pk_prestacioneslab'];
        categoryModel.int_OrdenPrestacionesLab =
            category['int_OrdenPrestacionesLab'];
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'];
        categoryModel.ClaveJubilacion = category['ClaveJubilacion'];
        categoryModel.OrdenJubilacion = category['OrdenJubilacion'];
        categoryModel.Jubilacion = category['Jubilacion'];
        categoryModel.ClaveDerechohabiencia = category['ClaveDerechohabiencia'];
        categoryModel.OrdenDerechohabiencia = category['OrdenDerechohabiencia'];
        categoryModel.Derechohabiencia = category['Derechohabiencia'];
        categoryModel.ClaveMotivoDerechohabiencia =
            category['ClaveMotivoDerechohabiencia'];
        categoryModel.OrdenMotivoDerechohabiencia =
            category['OrdenMotivoDerechohabiencia'];
        categoryModel.MotivoDerechohabiencia =
            category['MotivoDerechohabiencia'];
        categoryModel.otroEscolaridad = category['otroEscolaridad'];
        categoryModel.otroOcupacion = category['otroOcupacion'];
        categoryModel.otroTipoEmpleo = category['otroTipoEmpleo'];

        _Escolaridad10.add(categoryModel);
      });
    });
    _escolaridad10.text = _Escolaridad10.map((e) => e.ClaveEscolaridad).first +
        " " +
        _Escolaridad10.map((e) => e.Escolaridad).first;

    _gradoEscolar10.text = _Escolaridad10.map((e) => e.ClaveGradoEscolar).first;

    _ocupacion10.text = _Escolaridad10.map((e) => e.ClaveOcupacion).first +
        " " +
        _Escolaridad10.map((e) => e.Ocupacion).first;

    _tipoEmpleo10.text = _Escolaridad10.map((e) => e.ClaveTipoEmpleo).first +
        " " +
        _Escolaridad10.map((e) => e.TipoEmpleo).first;

    _derechohabiencia10.text =
        _Escolaridad10.map((e) => e.ClaveDerechohabiencia).first +
            " " +
            _Escolaridad10.map((e) => e.Derechohabiencia).first;

    _prestacion10.text =
        _Escolaridad10.map((e) => e.txt_desc_prestacioneslab).first;
    pk10 = _Escolaridad10.map((e) => e.pk_prestacioneslab).first;
    Orden10 = _Escolaridad10.map((e) => e.int_OrdenPrestacionesLab).first;

    _motivoderechohabiencia10.text =
        _Escolaridad10.map((e) => e.ClaveMotivoDerechohabiencia).first +
            " " +
            _Escolaridad10.map((e) => e.MotivoDerechohabiencia).first;

    if (_Escolaridad10.map((e) => e.AsisteEscuela).first == "SI") {
      _asisteEscuela10 = AsisteEscuela.SI;
    } else if (_Escolaridad10.map((e) => e.AsisteEscuela).first == "NO") {
      _asisteEscuela10 = AsisteEscuela.NO;
    } else {
      _asisteEscuela10 = AsisteEscuela.NA;
    }

    if (_Escolaridad10.map((e) => e.Jubilacion).first == "SI") {
      _jubilacionPensionado10 = JubilacionPensionado.SI;
    } else if (_Escolaridad10.map((e) => e.Jubilacion).first == "NO") {
      _jubilacionPensionado10 = JubilacionPensionado.NO;
    } else {
      _jubilacionPensionado10 = JubilacionPensionado.NA;
    }

    _otroEscolaridad10.text =
        _Escolaridad10.map((e) => e.otroEscolaridad).first;
    _otroOcupacion10.text = _Escolaridad10.map((e) => e.otroOcupacion).first;
    _otroTipoEmpleo10.text = _Escolaridad10.map((e) => e.otroTipoEmpleo).first;
  }

  getAllPrestacionesLaborales() async {
    // Obtener elementos de la base de datos
    List<PrestacionesLaboralesModel> items = await DbHelper().getItems();
    setState(() {
      _PrestacionesList1 = items;
      _PrestacionesList2 = items;
      _PrestacionesList3 = items;
      _PrestacionesList4 = items;
      _PrestacionesList5 = items;
      _PrestacionesList6 = items;
      _PrestacionesList7 = items;
      _PrestacionesList8 = items;
      _PrestacionesList9 = items;
      _PrestacionesList10 = items;
    });
  }

//Variables del renglon 1
  var pk = '';
  var Orden = '';
  var presta1 = '';
//Variables del renglon 2
  var pk2 = '';
  var Orden2 = '';
  var presta2 = '';
  //Variables del renglon 3
  var pk3 = '';
  var Orden3 = '';
  var presta3 = '';
//Variables del renglon 4
  var pk4 = '';
  var Orden4 = '';
  var presta4 = '';
  //Variables del renglon 5
  var pk5 = '';
  var Orden5 = '';
  var presta5 = '';
//Variables del renglon 6
  var pk6 = '';
  var Orden6 = '';
  var presta6 = '';
  //Variables del renglon 7
  var pk7 = '';
  var Orden7 = '';
  var presta7 = '';
//Variables del renglon 8
  var pk8 = '';
  var Orden8 = '';
  var presta8 = '';
  //Variables del renglon 9
  var pk9 = '';
  var Orden9 = '';
  var presta9 = '';
  //Variables del renglon 10
  var pk10 = '';
  var Orden10 = '';
  var presta10 = '';

  addChecked1() async {
    // Guardar descripciones seleccionadas en un textfield
    presta1 = _selectedItem1.map((e) => e.txt_desc_prestacioneslab).join(', ');
    Orden = _selectedItem1.map((e) => e.Orden_PrestacionesLaborales).join(', ');
    pk = _selectedItem1.map((e) => e.Pk_PrestacionesLaborales).join(', ');
    print('Descripciones seleccionadas: $presta1');
    print('Claves seleccionadas: $pk');
    print('Orden seleccionado: $Orden');

    _prestacion1.text = presta1;
  }

  addChecked2() async {
    // Guardar descripciones seleccionadas en un textfield
    presta2 = _selectedItem2.map((e) => e.txt_desc_prestacioneslab).join(', ');
    Orden2 =
        _selectedItem2.map((e) => e.Orden_PrestacionesLaborales).join(', ');
    pk2 = _selectedItem2.map((e) => e.Pk_PrestacionesLaborales).join(', ');
    print('Descripciones seleccionadas: $presta2');
    print('Claves seleccionadas: $pk2');
    print('Orden seleccionado: $Orden2');

    _prestacion2.text = presta2;
  }

  addChecked3() async {
    // Guardar descripciones seleccionadas en un textfield
    presta3 = _selectedItem3.map((e) => e.txt_desc_prestacioneslab).join(', ');
    Orden3 =
        _selectedItem3.map((e) => e.Orden_PrestacionesLaborales).join(', ');
    pk3 = _selectedItem3.map((e) => e.Pk_PrestacionesLaborales).join(', ');
    print('Descripciones seleccionadas: $presta3');
    print('Claves seleccionadas: $pk3');
    print('Orden seleccionado: $Orden3');

    _prestacion3.text = presta3;
  }

  addChecked4() async {
    // Guardar descripciones seleccionadas en un textfield
    presta4 = _selectedItem4.map((e) => e.txt_desc_prestacioneslab).join(', ');
    Orden4 =
        _selectedItem4.map((e) => e.Orden_PrestacionesLaborales).join(', ');
    pk4 = _selectedItem4.map((e) => e.Pk_PrestacionesLaborales).join(', ');
    print('Descripciones seleccionadas: $presta4');
    print('Claves seleccionadas: $pk4');
    print('Orden seleccionado: $Orden4');

    _prestacion4.text = presta4;
  }

  addChecked5() async {
    // Guardar descripciones seleccionadas en un textfield
    presta5 = _selectedItem5.map((e) => e.txt_desc_prestacioneslab).join(', ');
    Orden5 =
        _selectedItem5.map((e) => e.Orden_PrestacionesLaborales).join(', ');
    pk5 = _selectedItem5.map((e) => e.Pk_PrestacionesLaborales).join(', ');
    print('Descripciones seleccionadas: $presta5');
    print('Claves seleccionadas: $pk5');
    print('Orden seleccionado: $Orden5');

    _prestacion5.text = presta5;
  }

  addChecked6() async {
    // Guardar descripciones seleccionadas en un textfield
    presta6 = _selectedItem6.map((e) => e.txt_desc_prestacioneslab).join(', ');
    Orden6 =
        _selectedItem6.map((e) => e.Orden_PrestacionesLaborales).join(', ');
    pk6 = _selectedItem6.map((e) => e.Pk_PrestacionesLaborales).join(', ');
    print('Descripciones seleccionadas: $presta6');
    print('Claves seleccionadas: $pk6');
    print('Orden seleccionado: $Orden6');

    _prestacion6.text = presta6;
  }

  addChecked7() async {
    // Guardar descripciones seleccionadas en un textfield
    presta7 = _selectedItem7.map((e) => e.txt_desc_prestacioneslab).join(', ');
    Orden7 =
        _selectedItem7.map((e) => e.Orden_PrestacionesLaborales).join(', ');
    pk7 = _selectedItem7.map((e) => e.Pk_PrestacionesLaborales).join(', ');
    print('Descripciones seleccionadas: $presta7');
    print('Claves seleccionadas: $pk7');
    print('Orden seleccionado: $Orden7');

    _prestacion7.text = presta7;
  }

  addChecked8() async {
    // Guardar descripciones seleccionadas en un textfield
    presta8 = _selectedItem8.map((e) => e.txt_desc_prestacioneslab).join(', ');
    Orden8 =
        _selectedItem8.map((e) => e.Orden_PrestacionesLaborales).join(', ');
    pk8 = _selectedItem8.map((e) => e.Pk_PrestacionesLaborales).join(', ');
    print('Descripciones seleccionadas: $presta8');
    print('Claves seleccionadas: $pk8');
    print('Orden seleccionado: $Orden8');

    _prestacion8.text = presta8;
  }

  addChecked9() async {
    // Guardar descripciones seleccionadas en un textfield
    presta9 = _selectedItem9.map((e) => e.txt_desc_prestacioneslab).join(', ');
    Orden9 =
        _selectedItem9.map((e) => e.Orden_PrestacionesLaborales).join(', ');
    pk9 = _selectedItem9.map((e) => e.Pk_PrestacionesLaborales).join(', ');
    print('Descripciones seleccionadas: $presta9');
    print('Claves seleccionadas: $pk9');
    print('Orden seleccionado: $Orden9');

    _prestacion9.text = presta9;
  }

  addChecked10() async {
    // Guardar descripciones seleccionadas en un textfield
    presta10 =
        _selectedItem10.map((e) => e.txt_desc_prestacioneslab).join(', ');
    Orden10 =
        _selectedItem10.map((e) => e.Orden_PrestacionesLaborales).join(', ');
    pk10 = _selectedItem10.map((e) => e.Pk_PrestacionesLaborales).join(', ');
    print('Descripciones seleccionadas: $presta10');
    print('Claves seleccionadas: $pk10');
    print('Orden seleccionado: $Orden10');

    _prestacion10.text = presta10;
  }

  cargarDatos() {
    print(widget.folioDisp);
    getAllEscolaridad1();
    getAllEscolaridad2();
    getAllEscolaridad3();
    getAllEscolaridad4();
    getAllEscolaridad5();
    getAllEscolaridad6();
    getAllEscolaridad7();
    getAllEscolaridad8();
    getAllEscolaridad9();
    getAllEscolaridad10();
  }

  renglon1() async {
    if (_nombre1.text != '') {
      replaceAllLetter rpl1 = new replaceAllLetter();
      replaceAllNum rpn1 = new replaceAllNum();

      var Escolaridad = _escolaridad1.text.toString();
      final escolaridad = rpn1.replaceNum(Escolaridad);

      var Ocupacion = _ocupacion1.text.toString();
      final ocupacion = rpn1.replaceNum(Ocupacion);

      var TipoEmpleo = _tipoEmpleo1.text.toString();
      final tipoEmpleo = rpn1.replaceNum(TipoEmpleo);

      var derecho = _derechohabiencia1.text.toString();
      final Derecho = rpn1.replaceNum(derecho);

      var motivoDerecho = _motivoderechohabiencia1.text.toString();
      final motivoDereHab = rpn1.replaceNum(motivoDerecho);

      String asisteEscuela = _asisteEscuela1.name.toString();
      if (asisteEscuela == 'SI') {
        asisteEscuela = '1 1 SI';
      } else if (asisteEscuela == 'NO') {
        asisteEscuela = '2 2 NO';
      } else if (asisteEscuela == 'NA') {
        asisteEscuela = '3 3 OTRO';
      }

      String Jubilado = _jubilacionPensionado1.name.toString();
      if (Jubilado == 'SI') {
        Jubilado = '1 1 SI';
      } else if (Jubilado == 'NO') {
        Jubilado = '2 2 NO';
      } else if (Jubilado == 'NA') {
        Jubilado = '3 3 OTRO';
      }

      _EscolaridadOrden2 = [];
      var categories =
          await CategoryService().readOrdenEscolaridad(_escolaridad1.text);
      categories.forEach((category) {
        setState(() {
          var categoryModel = EscolaridadesModel();
          categoryModel.Orden = category['Orden'];
          _EscolaridadOrden2.add(categoryModel);
        });
      });

      _GradoEscolar2 = [];
      var categories1 =
          await CategoryService().readOrdenGrado(_gradoEscolar1.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel1 = GradosEscolaresModel();
          categoryModel1.Orden = category['Orden'];
          _GradoEscolar2.add(categoryModel1);
        });
      });

      _Ocupacion2 = [];
      var categories2 =
          await CategoryService().readOrdenOcupacion(_ocupacion1.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel2 = OcupacionesModel();
          categoryModel2.Orden = category['Orden'];
          _Ocupacion2.add(categoryModel2);
        });
      });

      _TipoEmpleo2 = [];
      var categories3 =
          await CategoryService().readOrdenTipoEmpl(_tipoEmpleo1.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel3 = TipoEmpleoModel();
          categoryModel3.Orden = category['Orden'];
          _TipoEmpleo2.add(categoryModel3);
        });
      });

      _Derechohabiencia2 = [];
      var categories4 =
          await CategoryService().readOrdenDerecho(_derechohabiencia1.text);
      categories4.forEach((category) {
        setState(() {
          var categoryModel4 = DerechoHabienciasModel();
          categoryModel4.Orden = category['Orden'];
          _Derechohabiencia2.add(categoryModel4);
        });
      });

      _MotivioDerechohabiencia2 = [];
      var categories5 = await CategoryService()
          .readOrdenMotivoDerecho(_motivoderechohabiencia1.text);
      categories5.forEach((category) {
        setState(() {
          var categoryModel5 = MotivoDerechoHabienciasModel();
          categoryModel5.Orden = category['Orden'];
          _MotivioDerechohabiencia2.add(categoryModel5);
        });
      });

      EscolaridadSeguridadSocial DModel11 = EscolaridadSeguridadSocial(
          folio: int.parse(widget.folio),
          ClaveEscolaridad: _escolaridad1.text.substring(0, 2).trimRight(),
          OrdenEscolaridad:
              _EscolaridadOrden2.map((e) => e.Orden.toString()).first,
          Escolaridad: escolaridad.trimLeft(),
          ClaveGradoEscolar: _gradoEscolar1.text,
          GradoEscolar: _GradoEscolar2.map((e) => e.Orden).first,
          ClaveAsisteEscuela: asisteEscuela.substring(0, 1),
          OrdenAsisteEscuela: asisteEscuela.substring(0, 1),
          AsisteEscuela: _asisteEscuela1.name,
          ClaveOcupacion: _ocupacion1.text.substring(0, 2).trimRight(),
          OrdenOcupacion: _Ocupacion2.map((e) => e.Orden).first,
          Ocupacion: ocupacion.trimLeft(),
          ClaveTipoEmpleo: _tipoEmpleo1.text.substring(0, 2).trimRight(),
          OrdenTipoEmpleo: _TipoEmpleo2.map((e) => e.Orden).first,
          TipoEmpleo: tipoEmpleo.trimLeft(),
          pk_prestacioneslab: pk,
          int_OrdenPrestacionesLab: Orden,
          txt_desc_prestacioneslab: _prestacion1.text,
          ClaveJubilacion: Jubilado.substring(0, 1),
          OrdenJubilacion: Jubilado.substring(0, 1),
          Jubilacion: _jubilacionPensionado1.name,
          ClaveDerechohabiencia: _derechohabiencia1.text.substring(0, 1),
          OrdenDerechohabiencia: _Derechohabiencia2.map((e) => e.Orden).first,
          Derechohabiencia: Derecho.trimLeft(),
          ClaveMotivoDerechohabiencia:
              _motivoderechohabiencia1.text.substring(0, 2).trimRight(),
          OrdenMotivoDerechohabiencia:
              _MotivioDerechohabiencia2.map((e) => e.Orden).first,
          MotivoDerechohabiencia: motivoDereHab.trimLeft(),
          otroEscolaridad: _otroEscolaridad1.text,
          otroOcupacion: _otroOcupacion1.text,
          otroTipoEmpleo: _otroTipoEmpleo1.text,
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '0');
      print(widget.folioDisp);
      if (_selectedItem1.isEmpty) {
        for (var i = 0; i < _selectedItem1.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '0',
              _selectedItem1[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      } else {
        await DbHelper().eliminarIngtegrante_prestacion(widget.folio, 0);
        for (var i = 0; i < _selectedItem1.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '0',
              _selectedItem1[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      }

      _EscolaridadGuardar.add(DModel11);
    } else {
      alertDialog(context, 'El renglon 1 NO puede estar vacio');
    }
  }

  renglon2() async {
    if (_nombre2.text != '') {
      replaceAllNum rpn2 = new replaceAllNum();
      replaceAllLetter rpl2 = new replaceAllLetter();
      var Escolaridad2 = _escolaridad2.text.toString();
      final escolaridad2 = rpn2.replaceNum(Escolaridad2);

      var Ocupacion2 = _ocupacion2.text.toString();
      final ocupacion2 = rpn2.replaceNum(Ocupacion2);

      var TipoEmpleo2 = _tipoEmpleo2.text.toString();
      final tipoEmpleo2 = rpn2.replaceNum(TipoEmpleo2);

      var derecho2 = _derechohabiencia2.text.toString();
      final Derecho2 = rpn2.replaceNum(derecho2);

      var motivoDerecho2 = _motivoderechohabiencia2.text.toString();
      final motivoDereHab2 = rpn2.replaceNum(motivoDerecho2);

      String asisteEscuela2 = _asisteEscuela2.name.toString();
      if (asisteEscuela2 == 'SI') {
        asisteEscuela2 = '1 1 SI';
      } else if (asisteEscuela2 == 'NO') {
        asisteEscuela2 = '2 2 NO';
      } else if (asisteEscuela2 == 'NA') {
        asisteEscuela2 = '3 3 OTRO';
      }

      String Jubilado2 = _jubilacionPensionado2.name.toString();
      if (Jubilado2 == 'SI') {
        Jubilado2 = '1 1 SI';
      } else if (Jubilado2 == 'NO') {
        Jubilado2 = '2 2 NO';
      } else if (Jubilado2 == 'NA') {
        Jubilado2 = '3 3 OTRO';
      }

      _EscolaridadOrden2 = [];
      var categories =
          await CategoryService().readOrdenEscolaridad(_escolaridad2.text);
      categories.forEach((category) {
        setState(() {
          var categoryModel = EscolaridadesModel();
          categoryModel.Orden = category['Orden'];
          _EscolaridadOrden2.add(categoryModel);
        });
      });

      _GradoEscolar2 = [];
      var categories1 =
          await CategoryService().readOrdenGrado(_gradoEscolar2.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel1 = GradosEscolaresModel();
          categoryModel1.Orden = category['Orden'];
          _GradoEscolar2.add(categoryModel1);
        });
      });

      _Ocupacion2 = [];
      var categories2 =
          await CategoryService().readOrdenOcupacion(_ocupacion2.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel2 = OcupacionesModel();
          categoryModel2.Orden = category['Orden'];
          _Ocupacion2.add(categoryModel2);
        });
      });

      _TipoEmpleo2 = [];
      var categories3 =
          await CategoryService().readOrdenTipoEmpl(_tipoEmpleo2.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel3 = TipoEmpleoModel();
          categoryModel3.Orden = category['Orden'];
          _TipoEmpleo2.add(categoryModel3);
        });
      });

      _Derechohabiencia2 = [];
      var categories4 =
          await CategoryService().readOrdenDerecho(_derechohabiencia2.text);
      categories4.forEach((category) {
        setState(() {
          var categoryModel4 = DerechoHabienciasModel();
          categoryModel4.Orden = category['Orden'];
          _Derechohabiencia2.add(categoryModel4);
        });
      });

      _MotivioDerechohabiencia2 = [];
      var categories5 = await CategoryService()
          .readOrdenMotivoDerecho(_motivoderechohabiencia2.text);
      categories5.forEach((category) {
        setState(() {
          var categoryModel5 = MotivoDerechoHabienciasModel();
          categoryModel5.Orden = category['Orden'];
          _MotivioDerechohabiencia2.add(categoryModel5);
        });
      });

      EscolaridadSeguridadSocial DModel2 = EscolaridadSeguridadSocial(
          folio: int.parse(widget.folio),
          ClaveEscolaridad: _escolaridad2.text.substring(0, 2).trimRight(),
          OrdenEscolaridad: _EscolaridadOrden2.map((e) => e.Orden).first,
          Escolaridad: escolaridad2.trimLeft(),
          ClaveGradoEscolar: _gradoEscolar2.text,
          //arreglar
          GradoEscolar: _GradoEscolar2.map((e) => e.Orden).first,
          ClaveAsisteEscuela: asisteEscuela2.substring(0, 1),
          OrdenAsisteEscuela: asisteEscuela2.substring(0, 1),
          AsisteEscuela: _asisteEscuela2.name,
          ClaveOcupacion: _ocupacion2.text.substring(0, 2).trimRight(),
          OrdenOcupacion: _Ocupacion2.map((e) => e.Orden).first,
          Ocupacion: ocupacion2.trimLeft(),
          ClaveTipoEmpleo: _tipoEmpleo2.text.substring(0, 2).trimRight(),
          OrdenTipoEmpleo: _TipoEmpleo2.map((e) => e.Orden).first,
          TipoEmpleo: tipoEmpleo2.trimLeft(),
          pk_prestacioneslab: pk2,
          int_OrdenPrestacionesLab: Orden2,
          txt_desc_prestacioneslab: _prestacion2.text,
          ClaveJubilacion: Jubilado2.substring(0, 1),
          OrdenJubilacion: Jubilado2.substring(0, 1),
          Jubilacion: _jubilacionPensionado2.name,
          ClaveDerechohabiencia: _derechohabiencia2.text.substring(0, 1),
          OrdenDerechohabiencia: _Derechohabiencia2.map((e) => e.Orden).first,
          Derechohabiencia: Derecho2.trimLeft(),
          ClaveMotivoDerechohabiencia:
              _motivoderechohabiencia2.text.substring(0, 2).trimRight(),
          OrdenMotivoDerechohabiencia:
              _MotivioDerechohabiencia2.map((e) => e.Orden).first,
          MotivoDerechohabiencia: motivoDereHab2.trimLeft(),
          otroEscolaridad: _otroEscolaridad2.text,
          otroOcupacion: _otroOcupacion2.text,
          otroTipoEmpleo: _otroTipoEmpleo2.text,
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '1');
      if (_selectedItem2.isEmpty) {
        for (var i = 0; i < _selectedItem2.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '1',
              _selectedItem2[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      } else {
        await DbHelper().eliminarIngtegrante_prestacion(widget.folio, 1);
        for (var i = 0; i < _selectedItem2.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '1',
              _selectedItem2[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      }
      _EscolaridadGuardar.add(DModel2);
    } else {}
  }

  renglon3() async {
    if (_nombre3.text != '') {
      replaceAllLetter rpl3 = new replaceAllLetter();
      replaceAllNum rpn3 = new replaceAllNum();
      var Escolaridad3 = _escolaridad3.text.toString();
      final escolaridad3 = rpn3.replaceNum(Escolaridad3);

      var Ocupacion3 = _ocupacion3.text.toString();
      final ocupacion3 = rpn3.replaceNum(Ocupacion3);

      var TipoEmpleo3 = _tipoEmpleo3.text.toString();
      final tipoEmpleo3 = rpn3.replaceNum(TipoEmpleo3);

      var derecho3 = _derechohabiencia3.text.toString();
      final Derecho3 = rpn3.replaceNum(derecho3);

      var motivoDerecho3 = _motivoderechohabiencia3.text.toString();
      final motivoDereHab3 = rpn3.replaceNum(motivoDerecho3);

      String asisteEscuela3 = _asisteEscuela3.name.toString();
      if (asisteEscuela3 == 'SI') {
        asisteEscuela3 = '1 1 SI';
      } else if (asisteEscuela3 == 'NO') {
        asisteEscuela3 = '2 2 NO';
      } else if (asisteEscuela3 == 'NA') {
        asisteEscuela3 = '3 3 OTRO';
      }

      String Jubilado3 = _jubilacionPensionado3.name.toString();
      if (Jubilado3 == 'SI') {
        Jubilado3 = '1 1 SI';
      } else if (Jubilado3 == 'NO') {
        Jubilado3 = '2 2 NO';
      } else if (Jubilado3 == 'NA') {
        Jubilado3 = '3 3 OTRO';
      }

      _EscolaridadOrden2 = [];
      var categories =
          await CategoryService().readOrdenEscolaridad(_escolaridad3.text);
      categories.forEach((category) {
        setState(() {
          var categoryModel = EscolaridadesModel();
          categoryModel.Orden = category['Orden'];
          _EscolaridadOrden2.add(categoryModel);
        });
      });

      _GradoEscolar2 = [];
      var categories1 =
          await CategoryService().readOrdenGrado(_gradoEscolar3.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel1 = GradosEscolaresModel();
          categoryModel1.Orden = category['Orden'];
          _GradoEscolar2.add(categoryModel1);
        });
      });

      _Ocupacion2 = [];
      var categories2 =
          await CategoryService().readOrdenOcupacion(_ocupacion3.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel2 = OcupacionesModel();
          categoryModel2.Orden = category['Orden'];
          _Ocupacion2.add(categoryModel2);
        });
      });

      _TipoEmpleo2 = [];
      var categories3 =
          await CategoryService().readOrdenTipoEmpl(_tipoEmpleo3.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel3 = TipoEmpleoModel();
          categoryModel3.Orden = category['Orden'];
          _TipoEmpleo2.add(categoryModel3);
        });
      });

      _Derechohabiencia2 = [];
      var categories4 =
          await CategoryService().readOrdenDerecho(_derechohabiencia3.text);
      categories4.forEach((category) {
        setState(() {
          var categoryModel4 = DerechoHabienciasModel();
          categoryModel4.Orden = category['Orden'];
          _Derechohabiencia2.add(categoryModel4);
        });
      });

      _MotivioDerechohabiencia2 = [];
      var categories5 = await CategoryService()
          .readOrdenMotivoDerecho(_motivoderechohabiencia3.text);
      categories5.forEach((category) {
        setState(() {
          var categoryModel5 = MotivoDerechoHabienciasModel();
          categoryModel5.Orden = category['Orden'];
          _MotivioDerechohabiencia2.add(categoryModel5);
        });
      });

      EscolaridadSeguridadSocial DModel3 = EscolaridadSeguridadSocial(
          folio: int.parse(widget.folio),
          ClaveEscolaridad: _escolaridad3.text.substring(0, 2).trimRight(),
          OrdenEscolaridad: _EscolaridadOrden2.map((e) => e.Orden).first,
          Escolaridad: escolaridad3.trimLeft(),
          ClaveGradoEscolar: _gradoEscolar3.text,
          //arreglar
          GradoEscolar: _GradoEscolar2.map((e) => e.Orden).first,
          ClaveAsisteEscuela: asisteEscuela3.substring(0, 1),
          OrdenAsisteEscuela: asisteEscuela3.substring(0, 1),
          AsisteEscuela: _asisteEscuela3.name,
          ClaveOcupacion: _ocupacion3.text.substring(0, 2).trimRight(),
          OrdenOcupacion: _Ocupacion2.map((e) => e.Orden).first,
          Ocupacion: ocupacion3.trimLeft(),
          ClaveTipoEmpleo: _tipoEmpleo3.text.substring(0, 2).trimRight(),
          OrdenTipoEmpleo: _TipoEmpleo2.map((e) => e.Orden).first,
          TipoEmpleo: tipoEmpleo3.trimLeft(),
          pk_prestacioneslab: pk3,
          int_OrdenPrestacionesLab: Orden3,
          txt_desc_prestacioneslab: _prestacion3.text,
          ClaveJubilacion: Jubilado3.substring(0, 1),
          OrdenJubilacion: Jubilado3.substring(0, 1),
          Jubilacion: _jubilacionPensionado3.name,
          ClaveDerechohabiencia: _derechohabiencia3.text.substring(0, 1),
          OrdenDerechohabiencia: _Derechohabiencia2.map((e) => e.Orden).first,
          Derechohabiencia: Derecho3.trimLeft(),
          ClaveMotivoDerechohabiencia:
              _motivoderechohabiencia3.text.substring(0, 2).trimRight(),
          OrdenMotivoDerechohabiencia:
              _MotivioDerechohabiencia2.map((e) => e.Orden).first,
          MotivoDerechohabiencia: motivoDereHab3.trimLeft(),
          otroEscolaridad: _otroEscolaridad3.text,
          otroOcupacion: _otroOcupacion3.text,
          otroTipoEmpleo: _otroTipoEmpleo3.text,
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '2');
      if (_selectedItem3.isEmpty) {
        for (var i = 0; i < _selectedItem3.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '2',
              _selectedItem3[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      } else {
        await DbHelper().eliminarIngtegrante_prestacion(widget.folio, 2);
        for (var i = 0; i < _selectedItem3.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '2',
              _selectedItem3[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      }
      _EscolaridadGuardar.add(DModel3);
    } else {}
  }

  renglon4() async {
    if (_nombre4.text != '') {
      replaceAllLetter rpl4 = new replaceAllLetter();
      replaceAllNum rpn4 = new replaceAllNum();
      var Escolaridad4 = _escolaridad4.text.toString();
      final escolaridad4 = rpn4.replaceNum(Escolaridad4);

      var Ocupacion4 = _ocupacion4.text.toString();
      final ocupacion4 = rpn4.replaceNum(Ocupacion4);

      var TipoEmpleo4 = _tipoEmpleo4.text.toString();
      final tipoEmpleo4 = rpn4.replaceNum(TipoEmpleo4);

      var derecho4 = _derechohabiencia4.text.toString();
      final Derecho4 = rpn4.replaceNum(derecho4);

      var motivoDerecho4 = _motivoderechohabiencia4.text.toString();
      final motivoDereHab4 = rpn4.replaceNum(motivoDerecho4);

      String asisteEscuela4 = _asisteEscuela4.name.toString();
      if (asisteEscuela4 == 'SI') {
        asisteEscuela4 = '1 1 SI';
      } else if (asisteEscuela4 == 'NO') {
        asisteEscuela4 = '2 2 NO';
      } else if (asisteEscuela4 == 'NA') {
        asisteEscuela4 = '3 3 OTRO';
      }

      String Jubilado4 = _jubilacionPensionado4.name.toString();
      if (Jubilado4 == 'SI') {
        Jubilado4 = '1 1 SI';
      } else if (Jubilado4 == 'NO') {
        Jubilado4 = '2 2 NO';
      } else if (Jubilado4 == 'NA') {
        Jubilado4 = '3 3 OTRO';
      }

      _EscolaridadOrden2 = [];
      var categories =
          await CategoryService().readOrdenEscolaridad(_escolaridad4.text);
      categories.forEach((category) {
        setState(() {
          var categoryModel = EscolaridadesModel();
          categoryModel.Orden = category['Orden'];
          _EscolaridadOrden2.add(categoryModel);
        });
      });

      _GradoEscolar2 = [];
      var categories1 =
          await CategoryService().readOrdenGrado(_gradoEscolar4.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel1 = GradosEscolaresModel();
          categoryModel1.Orden = category['Orden'];
          _GradoEscolar2.add(categoryModel1);
        });
      });

      _Ocupacion2 = [];
      var categories2 =
          await CategoryService().readOrdenOcupacion(_ocupacion4.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel2 = OcupacionesModel();
          categoryModel2.Orden = category['Orden'];
          _Ocupacion2.add(categoryModel2);
        });
      });

      _TipoEmpleo2 = [];
      var categories3 =
          await CategoryService().readOrdenTipoEmpl(_tipoEmpleo4.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel3 = TipoEmpleoModel();
          categoryModel3.Orden = category['Orden'];
          _TipoEmpleo2.add(categoryModel3);
        });
      });

      _Derechohabiencia2 = [];
      var categories4 =
          await CategoryService().readOrdenDerecho(_derechohabiencia4.text);
      categories4.forEach((category) {
        setState(() {
          var categoryModel4 = DerechoHabienciasModel();
          categoryModel4.Orden = category['Orden'];
          _Derechohabiencia2.add(categoryModel4);
        });
      });

      _MotivioDerechohabiencia2 = [];
      var categories5 = await CategoryService()
          .readOrdenMotivoDerecho(_motivoderechohabiencia4.text);
      categories5.forEach((category) {
        setState(() {
          var categoryModel5 = MotivoDerechoHabienciasModel();
          categoryModel5.Orden = category['Orden'];
          _MotivioDerechohabiencia2.add(categoryModel5);
        });
      });

      EscolaridadSeguridadSocial DModel4 = EscolaridadSeguridadSocial(
          folio: int.parse(widget.folio),
          ClaveEscolaridad: _escolaridad4.text.substring(0, 2).trimRight(),
          OrdenEscolaridad: _EscolaridadOrden2.map((e) => e.Orden).first,
          Escolaridad: escolaridad4.trimLeft(),
          ClaveGradoEscolar: _gradoEscolar4.text,
          //arreglar
          GradoEscolar: _GradoEscolar2.map((e) => e.Orden).first,
          ClaveAsisteEscuela: asisteEscuela4.substring(0, 1),
          OrdenAsisteEscuela: asisteEscuela4.substring(0, 1),
          AsisteEscuela: _asisteEscuela4.name,
          ClaveOcupacion: _ocupacion4.text.substring(0, 2).trimRight(),
          OrdenOcupacion: _Ocupacion2.map((e) => e.Orden).first,
          Ocupacion: ocupacion4.trimLeft(),
          ClaveTipoEmpleo: _tipoEmpleo4.text.substring(0, 2).trimRight(),
          OrdenTipoEmpleo: _TipoEmpleo2.map((e) => e.Orden).first,
          TipoEmpleo: tipoEmpleo4.trimLeft(),
          pk_prestacioneslab: pk4,
          int_OrdenPrestacionesLab: Orden4,
          txt_desc_prestacioneslab: _prestacion3.text,
          ClaveJubilacion: Jubilado4.substring(0, 1),
          OrdenJubilacion: Jubilado4.substring(0, 1),
          Jubilacion: _jubilacionPensionado4.name,
          ClaveDerechohabiencia: _derechohabiencia4.text.substring(0, 1),
          OrdenDerechohabiencia: _Derechohabiencia2.map((e) => e.Orden).first,
          Derechohabiencia: Derecho4.trimLeft(),
          ClaveMotivoDerechohabiencia:
              _motivoderechohabiencia4.text.substring(0, 2).trimRight(),
          OrdenMotivoDerechohabiencia:
              _MotivioDerechohabiencia2.map((e) => e.Orden).first,
          MotivoDerechohabiencia: motivoDereHab4.trimLeft(),
          otroEscolaridad: _otroEscolaridad4.text,
          otroOcupacion: _otroOcupacion4.text,
          otroTipoEmpleo: _otroTipoEmpleo4.text,
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '3');
      if (_selectedItem3.isEmpty) {
        for (var i = 0; i < _selectedItem4.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '3',
              _selectedItem4[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      } else {
        await DbHelper().eliminarIngtegrante_prestacion(widget.folio, 3);
        for (var i = 0; i < _selectedItem4.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '3',
              _selectedItem4[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      }
      _EscolaridadGuardar.add(DModel4);
    } else {}
  }

  renglon5() async {
    if (_nombre5.text != '') {
      replaceAllLetter rpl5 = new replaceAllLetter();
      replaceAllNum rpn5 = new replaceAllNum();
      var Escolaridad5 = _escolaridad5.text.toString();
      final escolaridad5 = rpn5.replaceNum(Escolaridad5);

      var Ocupacion5 = _ocupacion5.text.toString();
      final ocupacion5 = rpn5.replaceNum(Ocupacion5);

      var TipoEmpleo5 = _tipoEmpleo5.text.toString();
      final tipoEmpleo5 = rpn5.replaceNum(TipoEmpleo5);

      var derecho5 = _derechohabiencia5.text.toString();
      final Derecho5 = rpn5.replaceNum(derecho5);

      var motivoDerecho5 = _motivoderechohabiencia5.text.toString();
      final motivoDereHab5 = rpn5.replaceNum(motivoDerecho5);

      String asisteEscuela5 = _asisteEscuela5.name.toString();
      if (asisteEscuela5 == 'SI') {
        asisteEscuela5 = '1 1 SI';
      } else if (asisteEscuela5 == 'NO') {
        asisteEscuela5 = '2 2 NO';
      } else if (asisteEscuela5 == 'NA') {
        asisteEscuela5 = '3 3 OTRO';
      }

      String Jubilado5 = _jubilacionPensionado5.name.toString();
      if (Jubilado5 == 'SI') {
        Jubilado5 = '1 1 SI';
      } else if (Jubilado5 == 'NO') {
        Jubilado5 = '2 2 NO';
      } else if (Jubilado5 == 'NA') {
        Jubilado5 = '3 3 OTRO';
      }

      _EscolaridadOrden2 = [];
      var categories =
          await CategoryService().readOrdenEscolaridad(_escolaridad5.text);
      categories.forEach((category) {
        setState(() {
          var categoryModel = EscolaridadesModel();
          categoryModel.Orden = category['Orden'];
          _EscolaridadOrden2.add(categoryModel);
        });
      });

      _GradoEscolar2 = [];
      var categories1 =
          await CategoryService().readOrdenGrado(_gradoEscolar5.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel1 = GradosEscolaresModel();
          categoryModel1.Orden = category['Orden'];
          _GradoEscolar2.add(categoryModel1);
        });
      });

      _Ocupacion2 = [];
      var categories2 =
          await CategoryService().readOrdenOcupacion(_ocupacion5.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel2 = OcupacionesModel();
          categoryModel2.Orden = category['Orden'];
          _Ocupacion2.add(categoryModel2);
        });
      });

      _TipoEmpleo2 = [];
      var categories3 =
          await CategoryService().readOrdenTipoEmpl(_tipoEmpleo5.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel3 = TipoEmpleoModel();
          categoryModel3.Orden = category['Orden'];
          _TipoEmpleo2.add(categoryModel3);
        });
      });

      _Derechohabiencia2 = [];
      var categories4 =
          await CategoryService().readOrdenDerecho(_derechohabiencia5.text);
      categories4.forEach((category) {
        setState(() {
          var categoryModel4 = DerechoHabienciasModel();
          categoryModel4.Orden = category['Orden'];
          _Derechohabiencia2.add(categoryModel4);
        });
      });

      _MotivioDerechohabiencia2 = [];
      var categories5 = await CategoryService()
          .readOrdenMotivoDerecho(_motivoderechohabiencia5.text);
      categories5.forEach((category) {
        setState(() {
          var categoryModel5 = MotivoDerechoHabienciasModel();
          categoryModel5.Orden = category['Orden'];
          _MotivioDerechohabiencia2.add(categoryModel5);
        });
      });

      EscolaridadSeguridadSocial DModel5 = EscolaridadSeguridadSocial(
          folio: int.parse(widget.folio),
          ClaveEscolaridad: _escolaridad5.text.substring(0, 2).trimRight(),
          OrdenEscolaridad: _EscolaridadOrden2.map((e) => e.Orden).first,
          Escolaridad: escolaridad5.trimLeft(),
          ClaveGradoEscolar: _gradoEscolar5.text,
          //arreglar
          GradoEscolar: _GradoEscolar2.map((e) => e.Orden).first,
          ClaveAsisteEscuela: asisteEscuela5.substring(0, 1),
          OrdenAsisteEscuela: asisteEscuela5.substring(0, 1),
          AsisteEscuela: _asisteEscuela5.name,
          ClaveOcupacion: _ocupacion5.text.substring(0, 2).trimRight(),
          OrdenOcupacion: _Ocupacion2.map((e) => e.Orden).first,
          Ocupacion: ocupacion5.trimLeft(),
          ClaveTipoEmpleo: _tipoEmpleo5.text.substring(0, 2).trimRight(),
          OrdenTipoEmpleo: _TipoEmpleo2.map((e) => e.Orden).first,
          TipoEmpleo: tipoEmpleo5.trimLeft(),
          pk_prestacioneslab: pk5,
          int_OrdenPrestacionesLab: Orden5,
          txt_desc_prestacioneslab: _prestacion5.text,
          ClaveJubilacion: Jubilado5.substring(0, 1),
          OrdenJubilacion: Jubilado5.substring(0, 1),
          Jubilacion: _jubilacionPensionado5.name,
          ClaveDerechohabiencia: _derechohabiencia5.text.substring(0, 1),
          OrdenDerechohabiencia: _Derechohabiencia2.map((e) => e.Orden).first,
          Derechohabiencia: Derecho5.trimLeft(),
          ClaveMotivoDerechohabiencia:
              _motivoderechohabiencia5.text.substring(0, 2).trimRight(),
          OrdenMotivoDerechohabiencia:
              _MotivioDerechohabiencia2.map((e) => e.Orden).first,
          MotivoDerechohabiencia: motivoDereHab5.trimLeft(),
          otroEscolaridad: _otroEscolaridad5.text,
          otroOcupacion: _otroOcupacion5.text,
          otroTipoEmpleo: _otroTipoEmpleo5.text,
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '4');
      if (_selectedItem5.isEmpty) {
        for (var i = 0; i < _selectedItem5.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '4',
              _selectedItem5[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      } else {
        await DbHelper().eliminarIngtegrante_prestacion(widget.folio, 4);
        for (var i = 0; i < _selectedItem5.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '4',
              _selectedItem5[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      }

      _EscolaridadGuardar.add(DModel5);
    } else {}
  }

  renglon6() async {
    if (_nombre6.text != '') {
      replaceAllLetter rpl6 = new replaceAllLetter();
      replaceAllNum rpn6 = new replaceAllNum();
      var Escolaridad6 = _escolaridad6.text.toString();
      final escolaridad6 = rpn6.replaceNum(Escolaridad6);

      var Ocupacion6 = _ocupacion6.text.toString();
      final ocupacion6 = rpn6.replaceNum(Ocupacion6);

      var TipoEmpleo6 = _tipoEmpleo6.text.toString();
      final tipoEmpleo6 = rpn6.replaceNum(TipoEmpleo6);

      var derecho6 = _derechohabiencia6.text.toString();
      final Derecho6 = rpn6.replaceNum(derecho6);

      var motivoDerecho6 = _motivoderechohabiencia6.text.toString();
      final motivoDereHab6 = rpn6.replaceNum(motivoDerecho6);

      String asisteEscuela6 = _asisteEscuela6.name.toString();
      if (asisteEscuela6 == 'SI') {
        asisteEscuela6 = '1 1 SI';
      } else if (asisteEscuela6 == 'NO') {
        asisteEscuela6 = '2 2 NO';
      } else if (asisteEscuela6 == 'NA') {
        asisteEscuela6 = '3 3 OTRO';
      }

      String Jubilado6 = _jubilacionPensionado6.name.toString();
      if (Jubilado6 == 'SI') {
        Jubilado6 = '1 1 SI';
      } else if (Jubilado6 == 'NO') {
        Jubilado6 = '2 2 NO';
      } else if (Jubilado6 == 'NA') {
        Jubilado6 = '3 3 OTRO';
      }

      _EscolaridadOrden2 = [];
      var categories =
          await CategoryService().readOrdenEscolaridad(_escolaridad6.text);
      categories.forEach((category) {
        setState(() {
          var categoryModel = EscolaridadesModel();
          categoryModel.Orden = category['Orden'];
          _EscolaridadOrden2.add(categoryModel);
        });
      });

      _GradoEscolar2 = [];
      var categories1 =
          await CategoryService().readOrdenGrado(_gradoEscolar6.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel1 = GradosEscolaresModel();
          categoryModel1.Orden = category['Orden'];
          _GradoEscolar2.add(categoryModel1);
        });
      });

      _Ocupacion2 = [];
      var categories2 =
          await CategoryService().readOrdenOcupacion(_ocupacion6.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel2 = OcupacionesModel();
          categoryModel2.Orden = category['Orden'];
          _Ocupacion2.add(categoryModel2);
        });
      });

      _TipoEmpleo2 = [];
      var categories3 =
          await CategoryService().readOrdenTipoEmpl(_tipoEmpleo6.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel3 = TipoEmpleoModel();
          categoryModel3.Orden = category['Orden'];
          _TipoEmpleo2.add(categoryModel3);
        });
      });

      _Derechohabiencia2 = [];
      var categories4 =
          await CategoryService().readOrdenDerecho(_derechohabiencia6.text);
      categories4.forEach((category) {
        setState(() {
          var categoryModel4 = DerechoHabienciasModel();
          categoryModel4.Orden = category['Orden'];
          _Derechohabiencia2.add(categoryModel4);
        });
      });

      _MotivioDerechohabiencia2 = [];
      var categories5 = await CategoryService()
          .readOrdenMotivoDerecho(_motivoderechohabiencia6.text);
      categories5.forEach((category) {
        setState(() {
          var categoryModel5 = MotivoDerechoHabienciasModel();
          categoryModel5.Orden = category['Orden'];
          _MotivioDerechohabiencia2.add(categoryModel5);
        });
      });

      EscolaridadSeguridadSocial DModel6 = EscolaridadSeguridadSocial(
          folio: int.parse(widget.folio),
          ClaveEscolaridad: _escolaridad6.text.substring(0, 2).trimRight(),
          OrdenEscolaridad: _EscolaridadOrden2.map((e) => e.Orden).first,
          Escolaridad: escolaridad6.trimLeft(),
          ClaveGradoEscolar: _gradoEscolar6.text,
          //arreglar
          GradoEscolar: _GradoEscolar2.map((e) => e.Orden).first,
          ClaveAsisteEscuela: asisteEscuela6.substring(0, 1),
          OrdenAsisteEscuela: asisteEscuela6.substring(0, 1),
          AsisteEscuela: _asisteEscuela6.name,
          ClaveOcupacion: _ocupacion6.text.substring(0, 2).trimRight(),
          OrdenOcupacion: _Ocupacion2.map((e) => e.Orden).first,
          Ocupacion: ocupacion6.trimLeft(),
          ClaveTipoEmpleo: _tipoEmpleo6.text.substring(0, 2).trimRight(),
          OrdenTipoEmpleo: _TipoEmpleo2.map((e) => e.Orden).first,
          TipoEmpleo: tipoEmpleo6.trimLeft(),
          pk_prestacioneslab: pk6,
          int_OrdenPrestacionesLab: Orden6,
          txt_desc_prestacioneslab: _prestacion6.text,
          ClaveJubilacion: Jubilado6.substring(0, 1),
          OrdenJubilacion: Jubilado6.substring(0, 1),
          Jubilacion: _jubilacionPensionado6.name,
          ClaveDerechohabiencia: _derechohabiencia6.text.substring(0, 1),
          OrdenDerechohabiencia: _Derechohabiencia2.map((e) => e.Orden).first,
          Derechohabiencia: Derecho6.trimLeft(),
          ClaveMotivoDerechohabiencia:
              _motivoderechohabiencia6.text.substring(0, 2).trimRight(),
          OrdenMotivoDerechohabiencia:
              _MotivioDerechohabiencia2.map((e) => e.Orden).first,
          MotivoDerechohabiencia: motivoDereHab6.trimLeft(),
          otroEscolaridad: _otroEscolaridad6.text,
          otroOcupacion: _otroOcupacion6.text,
          otroTipoEmpleo: _otroTipoEmpleo6.text,
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '5');
      if (_selectedItem6.isEmpty) {
        for (var i = 0; i < _selectedItem6.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '5',
              _selectedItem6[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      } else {
        await DbHelper().eliminarIngtegrante_prestacion(widget.folio, 5);
        for (var i = 0; i < _selectedItem6.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '5',
              _selectedItem6[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      }
      _EscolaridadGuardar.add(DModel6);
    } else {}
  }

  renglon7() async {
    if (_nombre7.text != '') {
      replaceAllLetter rpl7 = new replaceAllLetter();
      replaceAllNum rpn7 = new replaceAllNum();
      var Escolaridad7 = _escolaridad7.text.toString();
      final escolaridad7 = rpn7.replaceNum(Escolaridad7);

      var Ocupacion7 = _ocupacion7.text.toString();
      final ocupacion7 = rpn7.replaceNum(Ocupacion7);

      var TipoEmpleo7 = _tipoEmpleo7.text.toString();
      final tipoEmpleo7 = rpn7.replaceNum(TipoEmpleo7);

      var derecho7 = _derechohabiencia7.text.toString();
      final Derecho7 = rpn7.replaceNum(derecho7);

      var motivoDerecho7 = _motivoderechohabiencia7.text.toString();
      final motivoDereHab7 = rpn7.replaceNum(motivoDerecho7);

      String asisteEscuela7 = _asisteEscuela7.name.toString();
      if (asisteEscuela7 == 'SI') {
        asisteEscuela7 = '1 1 SI';
      } else if (asisteEscuela7 == 'NO') {
        asisteEscuela7 = '2 2 NO';
      } else if (asisteEscuela7 == 'NA') {
        asisteEscuela7 = '3 3 OTRO';
      }

      String Jubilado7 = _jubilacionPensionado7.name.toString();
      if (Jubilado7 == 'SI') {
        Jubilado7 = '1 1 SI';
      } else if (Jubilado7 == 'NO') {
        Jubilado7 = '2 2 NO';
      } else if (Jubilado7 == 'NA') {
        Jubilado7 = '3 3 OTRO';
      }

      _EscolaridadOrden2 = [];
      var categories =
          await CategoryService().readOrdenEscolaridad(_escolaridad7.text);
      categories.forEach((category) {
        setState(() {
          var categoryModel = EscolaridadesModel();
          categoryModel.Orden = category['Orden'];
          _EscolaridadOrden2.add(categoryModel);
        });
      });

      _GradoEscolar2 = [];
      var categories1 =
          await CategoryService().readOrdenGrado(_gradoEscolar7.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel1 = GradosEscolaresModel();
          categoryModel1.Orden = category['Orden'];
          _GradoEscolar2.add(categoryModel1);
        });
      });

      _Ocupacion2 = [];
      var categories2 =
          await CategoryService().readOrdenOcupacion(_ocupacion7.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel2 = OcupacionesModel();
          categoryModel2.Orden = category['Orden'];
          _Ocupacion2.add(categoryModel2);
        });
      });

      _TipoEmpleo2 = [];
      var categories3 =
          await CategoryService().readOrdenTipoEmpl(_tipoEmpleo7.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel3 = TipoEmpleoModel();
          categoryModel3.Orden = category['Orden'];
          _TipoEmpleo2.add(categoryModel3);
        });
      });

      _Derechohabiencia2 = [];
      var categories4 =
          await CategoryService().readOrdenDerecho(_derechohabiencia7.text);
      categories4.forEach((category) {
        setState(() {
          var categoryModel4 = DerechoHabienciasModel();
          categoryModel4.Orden = category['Orden'];
          _Derechohabiencia2.add(categoryModel4);
        });
      });

      _MotivioDerechohabiencia2 = [];
      var categories5 = await CategoryService()
          .readOrdenMotivoDerecho(_motivoderechohabiencia7.text);
      categories5.forEach((category) {
        setState(() {
          var categoryModel5 = MotivoDerechoHabienciasModel();
          categoryModel5.Orden = category['Orden'];
          _MotivioDerechohabiencia2.add(categoryModel5);
        });
      });

      EscolaridadSeguridadSocial DModel7 = EscolaridadSeguridadSocial(
          folio: int.parse(widget.folio),
          ClaveEscolaridad: _escolaridad7.text.substring(0, 2).trimRight(),
          OrdenEscolaridad: _EscolaridadOrden2.map((e) => e.Orden).first,
          Escolaridad: escolaridad7.trimLeft(),
          ClaveGradoEscolar: _gradoEscolar7.text,
          //arreglar
          GradoEscolar: _GradoEscolar2.map((e) => e.Orden).first,
          ClaveAsisteEscuela: asisteEscuela7.substring(0, 1),
          OrdenAsisteEscuela: asisteEscuela7.substring(0, 1),
          AsisteEscuela: _asisteEscuela7.name,
          ClaveOcupacion: _ocupacion7.text.substring(0, 2).trimRight(),
          OrdenOcupacion: _Ocupacion2.map((e) => e.Orden).first,
          Ocupacion: ocupacion7.trimLeft(),
          ClaveTipoEmpleo: _tipoEmpleo7.text.substring(0, 2).trimRight(),
          OrdenTipoEmpleo: _TipoEmpleo2.map((e) => e.Orden).first,
          TipoEmpleo: tipoEmpleo7.trimLeft(),
          pk_prestacioneslab: pk7,
          int_OrdenPrestacionesLab: Orden7,
          txt_desc_prestacioneslab: _prestacion7.text,
          ClaveJubilacion: Jubilado7.substring(0, 1),
          OrdenJubilacion: Jubilado7.substring(0, 1),
          Jubilacion: _jubilacionPensionado7.name,
          ClaveDerechohabiencia: _derechohabiencia7.text.substring(0, 1),
          OrdenDerechohabiencia: _Derechohabiencia2.map((e) => e.Orden).first,
          Derechohabiencia: Derecho7.trimLeft(),
          ClaveMotivoDerechohabiencia:
              _motivoderechohabiencia7.text.substring(0, 2).trimRight(),
          OrdenMotivoDerechohabiencia:
              _MotivioDerechohabiencia2.map((e) => e.Orden).first,
          MotivoDerechohabiencia: motivoDereHab7.trimLeft(),
          otroEscolaridad: _otroEscolaridad7.text,
          otroOcupacion: _otroOcupacion7.text,
          otroTipoEmpleo: _otroTipoEmpleo7.text,
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '6');
      if (_selectedItem7.isEmpty) {
        for (var i = 0; i < _selectedItem7.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '6',
              _selectedItem7[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      } else {
        await DbHelper().eliminarIngtegrante_prestacion(widget.folio, 6);
        for (var i = 0; i < _selectedItem7.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '6',
              _selectedItem7[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      }
      _EscolaridadGuardar.add(DModel7);
    } else {}
  }

  renglon8() async {
    if (_nombre8.text != '') {
      replaceAllLetter rpl8 = new replaceAllLetter();
      replaceAllNum rpn8 = new replaceAllNum();
      var Escolaridad8 = _escolaridad8.text.toString();
      final escolaridad8 = rpn8.replaceNum(Escolaridad8);

      var Ocupacion8 = _ocupacion8.text.toString();
      final ocupacion8 = rpn8.replaceNum(Ocupacion8);

      var TipoEmpleo8 = _tipoEmpleo8.text.toString();
      final tipoEmpleo8 = rpn8.replaceNum(TipoEmpleo8);

      var derecho8 = _derechohabiencia8.text.toString();
      final Derecho8 = rpn8.replaceNum(derecho8);

      var motivoDerecho8 = _motivoderechohabiencia8.text.toString();
      final motivoDereHab8 = rpn8.replaceNum(motivoDerecho8);

      String asisteEscuela8 = _asisteEscuela8.name.toString();
      if (asisteEscuela8 == 'SI') {
        asisteEscuela8 = '1 1 SI';
      } else if (asisteEscuela8 == 'NO') {
        asisteEscuela8 = '2 2 NO';
      } else if (asisteEscuela8 == 'NA') {
        asisteEscuela8 = '3 3 OTRO';
      }

      String Jubilado8 = _jubilacionPensionado8.name.toString();
      if (Jubilado8 == 'SI') {
        Jubilado8 = '1 1 SI';
      } else if (Jubilado8 == 'NO') {
        Jubilado8 = '2 2 NO';
      } else if (Jubilado8 == 'NA') {
        Jubilado8 = '3 3 OTRO';
      }

      _EscolaridadOrden2 = [];
      var categories =
          await CategoryService().readOrdenEscolaridad(_escolaridad8.text);
      categories.forEach((category) {
        setState(() {
          var categoryModel = EscolaridadesModel();
          categoryModel.Orden = category['Orden'];
          _EscolaridadOrden2.add(categoryModel);
        });
      });

      _GradoEscolar2 = [];
      var categories1 =
          await CategoryService().readOrdenGrado(_gradoEscolar8.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel1 = GradosEscolaresModel();
          categoryModel1.Orden = category['Orden'];
          _GradoEscolar2.add(categoryModel1);
        });
      });

      _Ocupacion2 = [];
      var categories2 =
          await CategoryService().readOrdenOcupacion(_ocupacion8.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel2 = OcupacionesModel();
          categoryModel2.Orden = category['Orden'];
          _Ocupacion2.add(categoryModel2);
        });
      });

      _TipoEmpleo2 = [];
      var categories3 =
          await CategoryService().readOrdenTipoEmpl(_tipoEmpleo8.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel3 = TipoEmpleoModel();
          categoryModel3.Orden = category['Orden'];
          _TipoEmpleo2.add(categoryModel3);
        });
      });

      _Derechohabiencia2 = [];
      var categories4 =
          await CategoryService().readOrdenDerecho(_derechohabiencia8.text);
      categories4.forEach((category) {
        setState(() {
          var categoryModel4 = DerechoHabienciasModel();
          categoryModel4.Orden = category['Orden'];
          _Derechohabiencia2.add(categoryModel4);
        });
      });

      _MotivioDerechohabiencia2 = [];
      var categories5 = await CategoryService()
          .readOrdenMotivoDerecho(_motivoderechohabiencia8.text);
      categories5.forEach((category) {
        setState(() {
          var categoryModel5 = MotivoDerechoHabienciasModel();
          categoryModel5.Orden = category['Orden'];
          _MotivioDerechohabiencia2.add(categoryModel5);
        });
      });

      EscolaridadSeguridadSocial DModel8 = EscolaridadSeguridadSocial(
          folio: int.parse(widget.folio),
          ClaveEscolaridad: _escolaridad8.text.substring(0, 2).trimRight(),
          OrdenEscolaridad: _EscolaridadOrden2.map((e) => e.Orden).first,
          Escolaridad: escolaridad8.trimLeft(),
          ClaveGradoEscolar: _gradoEscolar8.text,
          //arreglar
          GradoEscolar: _GradoEscolar2.map((e) => e.Orden).first,
          ClaveAsisteEscuela: asisteEscuela8.substring(0, 1),
          OrdenAsisteEscuela: asisteEscuela8.substring(0, 1),
          AsisteEscuela: _asisteEscuela8.name,
          ClaveOcupacion: _ocupacion8.text.substring(0, 2).trimRight(),
          OrdenOcupacion: _Ocupacion2.map((e) => e.Orden).first,
          Ocupacion: ocupacion8.trimLeft(),
          ClaveTipoEmpleo: _tipoEmpleo8.text.substring(0, 2).trimRight(),
          OrdenTipoEmpleo: _TipoEmpleo2.map((e) => e.Orden).first,
          TipoEmpleo: tipoEmpleo8.trimLeft(),
          pk_prestacioneslab: pk8,
          int_OrdenPrestacionesLab: Orden8,
          txt_desc_prestacioneslab: _prestacion8.text,
          ClaveJubilacion: Jubilado8.substring(0, 1),
          OrdenJubilacion: Jubilado8.substring(0, 1),
          Jubilacion: _jubilacionPensionado8.name,
          ClaveDerechohabiencia: _derechohabiencia8.text.substring(0, 1),
          OrdenDerechohabiencia: _Derechohabiencia2.map((e) => e.Orden).first,
          Derechohabiencia: Derecho8.trimLeft(),
          ClaveMotivoDerechohabiencia:
              _motivoderechohabiencia8.text.substring(0, 2).trimRight(),
          OrdenMotivoDerechohabiencia:
              _MotivioDerechohabiencia2.map((e) => e.Orden).first,
          MotivoDerechohabiencia: motivoDereHab8.trimLeft(),
          otroEscolaridad: _otroEscolaridad8.text,
          otroOcupacion: _otroOcupacion8.text,
          otroTipoEmpleo: _otroTipoEmpleo8.text,
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '7');
      if (_selectedItem8.isEmpty) {
        for (var i = 0; i < _selectedItem8.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '7',
              _selectedItem8[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      } else {
        await DbHelper().eliminarIngtegrante_prestacion(widget.folio, 7);
        for (var i = 0; i < _selectedItem8.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '7',
              _selectedItem8[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      }
      _EscolaridadGuardar.add(DModel8);
    } else {}
  }

  renglon9() async {
    if (_nombre9.text != '') {
      replaceAllLetter rpl9 = new replaceAllLetter();
      replaceAllNum rpn9 = new replaceAllNum();
      var Escolaridad9 = _escolaridad9.text.toString();
      final escolaridad9 = rpn9.replaceNum(Escolaridad9);

      var Ocupacion9 = _ocupacion9.text.toString();
      final ocupacion9 = rpn9.replaceNum(Ocupacion9);

      var TipoEmpleo9 = _tipoEmpleo9.text.toString();
      final tipoEmpleo9 = rpn9.replaceNum(TipoEmpleo9);

      var derecho9 = _derechohabiencia9.text.toString();
      final Derecho9 = rpn9.replaceNum(derecho9);

      var motivoDerecho9 = _motivoderechohabiencia9.text.toString();
      final motivoDereHab9 = rpn9.replaceNum(motivoDerecho9);

      String asisteEscuela9 = _asisteEscuela9.name.toString();
      if (asisteEscuela9 == 'SI') {
        asisteEscuela9 = '1 1 SI';
      } else if (asisteEscuela9 == 'NO') {
        asisteEscuela9 = '2 2 NO';
      } else if (asisteEscuela9 == 'NA') {
        asisteEscuela9 = '3 3 OTRO';
      }

      String Jubilado9 = _jubilacionPensionado9.name.toString();
      if (Jubilado9 == 'SI') {
        Jubilado9 = '1 1 SI';
      } else if (Jubilado9 == 'NO') {
        Jubilado9 = '2 2 NO';
      } else if (Jubilado9 == 'NA') {
        Jubilado9 = '3 3 OTRO';
      }

      _EscolaridadOrden2 = [];
      var categories =
          await CategoryService().readOrdenEscolaridad(_escolaridad9.text);
      categories.forEach((category) {
        setState(() {
          var categoryModel = EscolaridadesModel();
          categoryModel.Orden = category['Orden'];
          _EscolaridadOrden2.add(categoryModel);
        });
      });

      _GradoEscolar2 = [];
      var categories1 =
          await CategoryService().readOrdenGrado(_gradoEscolar9.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel1 = GradosEscolaresModel();
          categoryModel1.Orden = category['Orden'];
          _GradoEscolar2.add(categoryModel1);
        });
      });

      _Ocupacion2 = [];
      var categories2 =
          await CategoryService().readOrdenOcupacion(_ocupacion9.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel2 = OcupacionesModel();
          categoryModel2.Orden = category['Orden'];
          _Ocupacion2.add(categoryModel2);
        });
      });

      _TipoEmpleo2 = [];
      var categories3 =
          await CategoryService().readOrdenTipoEmpl(_tipoEmpleo9.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel3 = TipoEmpleoModel();
          categoryModel3.Orden = category['Orden'];
          _TipoEmpleo2.add(categoryModel3);
        });
      });

      _Derechohabiencia2 = [];
      var categories4 =
          await CategoryService().readOrdenDerecho(_derechohabiencia9.text);
      categories4.forEach((category) {
        setState(() {
          var categoryModel4 = DerechoHabienciasModel();
          categoryModel4.Orden = category['Orden'];
          _Derechohabiencia2.add(categoryModel4);
        });
      });

      _MotivioDerechohabiencia2 = [];
      var categories5 = await CategoryService()
          .readOrdenMotivoDerecho(_motivoderechohabiencia9.text);
      categories5.forEach((category) {
        setState(() {
          var categoryModel5 = MotivoDerechoHabienciasModel();
          categoryModel5.Orden = category['Orden'];
          _MotivioDerechohabiencia2.add(categoryModel5);
        });
      });

      EscolaridadSeguridadSocial DModel9 = EscolaridadSeguridadSocial(
          folio: int.parse(widget.folio),
          ClaveEscolaridad: _escolaridad9.text.substring(0, 2).trimRight(),
          OrdenEscolaridad: _EscolaridadOrden2.map((e) => e.Orden).first,
          Escolaridad: escolaridad9.trimLeft(),
          ClaveGradoEscolar: _gradoEscolar9.text,
          //arreglar
          GradoEscolar: _GradoEscolar2.map((e) => e.Orden).first,
          ClaveAsisteEscuela: asisteEscuela9.substring(0, 1),
          OrdenAsisteEscuela: asisteEscuela9.substring(0, 1),
          AsisteEscuela: _asisteEscuela9.name,
          ClaveOcupacion: _ocupacion9.text.substring(0, 2).trimRight(),
          OrdenOcupacion: _Ocupacion2.map((e) => e.Orden).first,
          Ocupacion: ocupacion9.trimLeft(),
          ClaveTipoEmpleo: _tipoEmpleo9.text.substring(0, 2).trimRight(),
          OrdenTipoEmpleo: _TipoEmpleo2.map((e) => e.Orden).first,
          TipoEmpleo: tipoEmpleo9.trimLeft(),
          pk_prestacioneslab: pk9,
          int_OrdenPrestacionesLab: Orden9,
          txt_desc_prestacioneslab: _prestacion9.text,
          ClaveJubilacion: Jubilado9.substring(0, 1),
          OrdenJubilacion: Jubilado9.substring(0, 1),
          Jubilacion: _jubilacionPensionado9.name,
          ClaveDerechohabiencia: _derechohabiencia9.text.substring(0, 1),
          OrdenDerechohabiencia: _Derechohabiencia2.map((e) => e.Orden).first,
          Derechohabiencia: Derecho9.trimLeft(),
          ClaveMotivoDerechohabiencia:
              _motivoderechohabiencia9.text.substring(0, 2).trimRight(),
          OrdenMotivoDerechohabiencia:
              _MotivioDerechohabiencia2.map((e) => e.Orden).first,
          MotivoDerechohabiencia: motivoDereHab9.trimLeft(),
          otroEscolaridad: _otroEscolaridad9.text,
          otroOcupacion: _otroOcupacion9.text,
          otroTipoEmpleo: _otroTipoEmpleo9.text,
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '8');
      if (_selectedItem9.isEmpty) {
        for (var i = 0; i < _selectedItem9.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '8',
              _selectedItem9[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      } else {
        await DbHelper().eliminarIngtegrante_prestacion(widget.folio, 8);
        for (var i = 0; i < _selectedItem9.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '8',
              _selectedItem9[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      }
      _EscolaridadGuardar.add(DModel9);
    } else {}
  }

  renglon10() async {
    if (_nombre10.text != '') {
      replaceAllLetter rpl10 = new replaceAllLetter();
      replaceAllNum rpn10 = new replaceAllNum();
      var Escolaridad10 = _escolaridad10.text.toString();
      final escolaridad10 = rpn10.replaceNum(Escolaridad10);

      var Ocupacion10 = _ocupacion10.text.toString();
      final ocupacion10 = rpn10.replaceNum(Ocupacion10);

      var TipoEmpleo10 = _tipoEmpleo10.text.toString();
      final tipoEmpleo10 = rpn10.replaceNum(TipoEmpleo10);

      var derecho10 = _derechohabiencia10.text.toString();
      final Derecho10 = rpn10.replaceNum(derecho10);

      var motivoDerecho10 = _motivoderechohabiencia10.text.toString();
      final motivoDereHab10 = rpn10.replaceNum(motivoDerecho10);

      String asisteEscuela10 = _asisteEscuela10.name.toString();
      if (asisteEscuela10 == 'SI') {
        asisteEscuela10 = '1 1 SI';
      } else if (asisteEscuela10 == 'NO') {
        asisteEscuela10 = '2 2 NO';
      } else if (asisteEscuela10 == 'NA') {
        asisteEscuela10 = '3 3 OTRO';
      }

      String Jubilado10 = _jubilacionPensionado10.name.toString();
      if (Jubilado10 == 'SI') {
        Jubilado10 = '1 1 SI';
      } else if (Jubilado10 == 'NO') {
        Jubilado10 = '2 2 NO';
      } else if (Jubilado10 == 'NA') {
        Jubilado10 = '3 3 OTRO';
      }

      _EscolaridadOrden2 = [];
      var categories =
          await CategoryService().readOrdenEscolaridad(_escolaridad10.text);
      categories.forEach((category) {
        setState(() {
          var categoryModel = EscolaridadesModel();
          categoryModel.Orden = category['Orden'];
          _EscolaridadOrden2.add(categoryModel);
        });
      });

      _GradoEscolar2 = [];
      var categories1 =
          await CategoryService().readOrdenGrado(_gradoEscolar10.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel1 = GradosEscolaresModel();
          categoryModel1.Orden = category['Orden'];
          _GradoEscolar2.add(categoryModel1);
        });
      });

      _Ocupacion2 = [];
      var categories2 =
          await CategoryService().readOrdenOcupacion(_ocupacion10.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel2 = OcupacionesModel();
          categoryModel2.Orden = category['Orden'];
          _Ocupacion2.add(categoryModel2);
        });
      });

      _TipoEmpleo2 = [];
      var categories3 =
          await CategoryService().readOrdenTipoEmpl(_tipoEmpleo10.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel3 = TipoEmpleoModel();
          categoryModel3.Orden = category['Orden'];
          _TipoEmpleo2.add(categoryModel3);
        });
      });

      _Derechohabiencia2 = [];
      var categories4 =
          await CategoryService().readOrdenDerecho(_derechohabiencia10.text);
      categories4.forEach((category) {
        setState(() {
          var categoryModel4 = DerechoHabienciasModel();
          categoryModel4.Orden = category['Orden'];
          _Derechohabiencia2.add(categoryModel4);
        });
      });

      _MotivioDerechohabiencia2 = [];
      var categories5 = await CategoryService()
          .readOrdenMotivoDerecho(_motivoderechohabiencia10.text);
      categories5.forEach((category) {
        setState(() {
          var categoryModel5 = MotivoDerechoHabienciasModel();
          categoryModel5.Orden = category['Orden'];
          _MotivioDerechohabiencia2.add(categoryModel5);
        });
      });

      EscolaridadSeguridadSocial DModel10 = EscolaridadSeguridadSocial(
          folio: int.parse(widget.folio),
          ClaveEscolaridad: _escolaridad10.text.substring(0, 2).trimRight(),
          OrdenEscolaridad: _EscolaridadOrden2.map((e) => e.Orden).first,
          Escolaridad: escolaridad10.trimLeft(),
          ClaveGradoEscolar: _gradoEscolar10.text,
          //arreglar
          GradoEscolar: _GradoEscolar2.map((e) => e.Orden).first,
          ClaveAsisteEscuela: asisteEscuela10.substring(0, 1),
          OrdenAsisteEscuela: asisteEscuela10.substring(0, 1),
          AsisteEscuela: _asisteEscuela10.name,
          ClaveOcupacion: _ocupacion10.text.substring(0, 2).trimRight(),
          OrdenOcupacion: _Ocupacion2.map((e) => e.Orden).first,
          Ocupacion: ocupacion10.trimLeft(),
          ClaveTipoEmpleo: _tipoEmpleo10.text.substring(0, 2).trimRight(),
          OrdenTipoEmpleo: _TipoEmpleo2.map((e) => e.Orden).first,
          TipoEmpleo: tipoEmpleo10.trimLeft(),
          pk_prestacioneslab: pk10,
          int_OrdenPrestacionesLab: Orden10,
          txt_desc_prestacioneslab: _prestacion10.text,
          ClaveJubilacion: Jubilado10.substring(0, 1),
          OrdenJubilacion: Jubilado10.substring(0, 1),
          Jubilacion: _jubilacionPensionado10.name,
          ClaveDerechohabiencia: _derechohabiencia10.text.substring(0, 1),
          OrdenDerechohabiencia: _Derechohabiencia2.map((e) => e.Orden).first,
          Derechohabiencia: Derecho10.trimLeft(),
          ClaveMotivoDerechohabiencia:
              _motivoderechohabiencia10.text.substring(0, 2).trimRight(),
          OrdenMotivoDerechohabiencia:
              _MotivioDerechohabiencia2.map((e) => e.Orden).first,
          MotivoDerechohabiencia: motivoDereHab10.trimLeft(),
          otroEscolaridad: _otroEscolaridad10.text,
          otroOcupacion: _otroOcupacion10.text,
          otroTipoEmpleo: _otroTipoEmpleo10.text,
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '9');
      if (_selectedItem10.isEmpty) {
        for (var i = 0; i < _selectedItem10.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '9',
              _selectedItem10[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      } else {
        await DbHelper().eliminarIngtegrante_prestacion(widget.folio, 9);
        for (var i = 0; i < _selectedItem10.length; i++) {
          DbHelper().guardarPrestacionLaboral(
              '9',
              _selectedItem10[i].Pk_PrestacionesLaborales,
              widget.folio,
              widget.folioDisp,
              widget.usuario,
              widget.dispositivo);
        }
      }
      _EscolaridadGuardar.add(DModel10);
    } else {}
  }

  guardar() async {
    _EscolaridadGuardar.clear();
    print(_EscolaridadGuardar.toString());
    try {
      await renglon1();
      await renglon2();
      await renglon3();
      await renglon4();
      await renglon5();
      await renglon6();
      await renglon7();
      await renglon8();
      await renglon9();
      await renglon10();

      print(_EscolaridadGuardar.toString());
      for (var i = 0; i < _EscolaridadGuardar.length; i++) {
        await DbHelper().saveEscolaridadSocial(_EscolaridadGuardar[i]);
      }
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return ActualizarEstudio(
            folio: widget.folio,
            dispositivo: widget.dispositivo,
            folioDisp: widget.folioDisp,
            usuario: widget.usuario);
      }));
      alertDialog(context, 'Datos Actualizados');
    } catch (error) {
      print(error);
      print(_EscolaridadGuardar.toString());
      alertDialog(context, 'Ocurrio un error al guardar los datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(children: [
              SizedBox(height: 5.0),
              getTextQuestion(question: 'FOLIO'),
              getTextFolio(
                  controller: TextEditingController.fromValue(
                      TextEditingValue(text: widget.folio))),
              Container(
                margin: EdgeInsets.all(20.0),
                width: double.infinity,
                child: TextButton.icon(
                    onPressed: cargarDatos,
                    icon: Icon(Icons.add_circle_outline, color: Colors.white),
                    label: Text(
                      'CARGAR DATOS',
                      style: TextStyle(color: Colors.white),
                    )),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: DataTable(
                          dataRowHeight: 170,
                          columns: [
                            DataColumn(label: Text('NO.')),
                            DataColumn(label: Text('NOMBRES')),
                            DataColumn(label: Text('ESCOLARIDAD')),
                            DataColumn(label: Text('OTRA ESCOLARIDAD')),
                            DataColumn(label: Text('GRADO')),
                            DataColumn(label: Text('ASISTE ESCUELA')),
                            DataColumn(label: Text('OCUPACIÓN')),
                            DataColumn(label: Text('OTRA OCUPACIÓN')),
                            DataColumn(label: Text('TIPO DE EMPLEO')),
                            DataColumn(label: Text('OTRO TIPO DE EMPLEO')),
                            DataColumn(label: Text('PRESTACIONES LABORALES')),
                            DataColumn(label: Text('JUBILADO O PENSIONADO')),
                            DataColumn(label: Text('DERECHOHABIENCIA')),
                            DataColumn(label: Text('MOTIVO DERECHOHABIENCIA')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text('1')),
                              DataCell(getTextDataTable(
                                  controller: _nombre1,
                                  hintName: 'NOMBRES',
                                  isEnable: false)),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'ESCOLARIDAD',
                                      labelText: 'ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Escolaridad.map(
                                        (escolaridad) => SearchFieldListItem(
                                            escolaridad.escolaridad,
                                            item: escolaridad)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _escolaridad1,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_escolaridad1.text == "99 OTRA") {
                                          valEsc1 = true;
                                        } else {
                                          valEsc1 = false;
                                          _otroEscolaridad1.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroEscolaridad1,
                                    enabled: valEsc1,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA ESCOLARIDAD',
                                      labelText: 'OTRA ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(getSearchField(
                                  controller: _gradoEscolar1,
                                  suggestions: _GradoEscolar.map(
                                      (gradoEscolar) => SearchFieldListItem(
                                          gradoEscolar.grado,
                                          item: gradoEscolar)).toList(),
                                  hintName: 'GRADO')),
                              DataCell(
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text('1 SI'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.SI,
                                          groupValue: _asisteEscuela1,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela1 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('2 NO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NO,
                                          groupValue: _asisteEscuela1,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela1 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('3 OTRO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NA,
                                          groupValue: _asisteEscuela1,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela1 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OCUPACIÓN',
                                      labelText: 'OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Ocupacion.map((ocupacion) =>
                                        SearchFieldListItem(ocupacion.ocupacion,
                                            item: ocupacion)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _ocupacion1,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_ocupacion1.text ==
                                            "21 OTRA OCUPACIÓN") {
                                          valOcu1 = true;
                                        } else {
                                          valOcu1 = false;
                                          _otroOcupacion1.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroOcupacion1,
                                    enabled: valOcu1,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA OCUPACIÓN',
                                      labelText: 'OTRA OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'TIPO DE EMPLEO',
                                      labelText: 'TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _TipoEmpleo.map((tipoEmpleo) =>
                                        SearchFieldListItem(
                                            tipoEmpleo.TipoEmpleo,
                                            item: tipoEmpleo)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _tipoEmpleo1,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_tipoEmpleo1.text == "99 OTRO") {
                                          valTipE1 = true;
                                        } else {
                                          valTipE1 = false;
                                          _otroTipoEmpleo1.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroTipoEmpleo1,
                                    enabled: valTipE1,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRO TIPO DE EMPLEO',
                                      labelText: 'OTRO TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                margin: EdgeInsets.only(top: 30),
                                width: 600,
                                child: Container(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if ((value.isEmpty ||
                                                  value == null) &&
                                              (_nombre1.text != null ||
                                                  _nombre1.text != '')) {
                                            alertDialog(context,
                                                'Prestaciones en el reglon 1 vacias');
                                            return 'Este campo no puede estar vacio';
                                          }
                                          return null;
                                        },
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        controller: _prestacion1,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            hintText: 'PRESTACIONES LABORALES',
                                            labelText: 'PRESTACIONES LABORALES',
                                            fillColor: Colors.grey[200],
                                            filled: true),
                                        onTap: () => showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30.0)),
                                          ),
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 500,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount:
                                                              _PrestacionesList1
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return CheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              title: Text(_PrestacionesList1[
                                                                          index]
                                                                      .Orden_PrestacionesLaborales +
                                                                  " " +
                                                                  _PrestacionesList1[
                                                                          index]
                                                                      .txt_desc_prestacioneslab),
                                                              value: _selectedItem1
                                                                  .contains(
                                                                      _PrestacionesList1[
                                                                          index]),
                                                              onChanged:
                                                                  (bool value) {
                                                                setState(() {
                                                                  if (value ==
                                                                      true) {
                                                                    _selectedItem1.add(
                                                                        _PrestacionesList1[
                                                                            index]);
                                                                  } else {
                                                                    _selectedItem1
                                                                        .remove(
                                                                            _PrestacionesList1[index]);
                                                                  }
                                                                });
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: addChecked1,
                                          child: Text('AGREGAR')),
                                    ],
                                  ),
                                ),
                              )),
                              DataCell(Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('SI'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.SI,
                                        groupValue: _jubilacionPensionado1,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado1 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('NO'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NO,
                                        groupValue: _jubilacionPensionado1,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado1 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('N/A'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NA,
                                        groupValue: _jubilacionPensionado1,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado1 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                              DataCell(getSearchField(
                                  controller: _derechohabiencia1,
                                  suggestions: _Derechohabiencia.map(
                                      (derechohabiencia) => SearchFieldListItem(
                                          derechohabiencia.derechoHabiencia,
                                          item: derechohabiencia)).toList(),
                                  hintName: 'DERECHOHABIENCIA')),
                              DataCell(getSearchField(
                                  controller: _motivoderechohabiencia1,
                                  suggestions: _MotivioDerechohabiencia.map(
                                          (motivoderechohabiencia) =>
                                              SearchFieldListItem(
                                                  motivoderechohabiencia
                                                      .motivoDerechoHabiencia,
                                                  item: motivoderechohabiencia))
                                      .toList(),
                                  hintName: 'MOTIVO DERECHOHABIENCIA'))
                            ]),
                            DataRow(cells: [
                              DataCell(Text('2')),
                              DataCell(getTextDataTable(
                                  controller: _nombre2,
                                  hintName: 'NOMBRES',
                                  isEnable: false)),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'ESCOLARIDAD',
                                      labelText: 'ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Escolaridad.map(
                                        (escolaridad) => SearchFieldListItem(
                                            escolaridad.escolaridad,
                                            item: escolaridad)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _escolaridad2,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_escolaridad2.text == "99 OTRA") {
                                          valEsc2 = true;
                                        } else {
                                          valEsc2 = false;
                                          _otroEscolaridad2.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroEscolaridad2,
                                    enabled: valEsc2,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA ESCOLARIDAD',
                                      labelText: 'OTRA ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(getSearchField(
                                  controller: _gradoEscolar2,
                                  suggestions: _GradoEscolar.map(
                                      (gradoEscolar) => SearchFieldListItem(
                                          gradoEscolar.grado,
                                          item: gradoEscolar)).toList(),
                                  hintName: 'GRADO')),
                              DataCell(
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text('1 SI'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.SI,
                                          groupValue: _asisteEscuela2,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela2 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('2 NO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NO,
                                          groupValue: _asisteEscuela2,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela2 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('3 OTRO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NA,
                                          groupValue: _asisteEscuela2,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela2 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OCUPACIÓN',
                                      labelText: 'OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Ocupacion.map((ocupacion) =>
                                        SearchFieldListItem(ocupacion.ocupacion,
                                            item: ocupacion)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _ocupacion2,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_ocupacion2.text ==
                                            "21 OTRA OCUPACIÓN") {
                                          valOcu2 = true;
                                        } else {
                                          valOcu2 = false;
                                          _otroOcupacion2.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroOcupacion2,
                                    enabled: valOcu2,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA OCUPACIÓN',
                                      labelText: 'OTRA OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'TIPO DE EMPLEO',
                                      labelText: 'TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _TipoEmpleo.map((tipoEmpleo) =>
                                        SearchFieldListItem(
                                            tipoEmpleo.TipoEmpleo,
                                            item: tipoEmpleo)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _tipoEmpleo2,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_tipoEmpleo2.text == "99 OTRO") {
                                          valTipE2 = true;
                                        } else {
                                          valTipE2 = false;
                                          _otroTipoEmpleo2.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroTipoEmpleo2,
                                    enabled: valTipE2,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRO TIPO DE EMPLEO',
                                      labelText: 'OTRO TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                margin: EdgeInsets.only(top: 30),
                                width: 600,
                                child: Container(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if ((_nombre2.text.length != 0) &&
                                              (value.isEmpty || value == '')) {
                                            alertDialog(context,
                                                'Prestaciones en el reglon 2 vacias');
                                            return 'Este campo no puede estar vacio';
                                          }
                                          return null;
                                        },
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        controller: _prestacion2,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            hintText: 'PRESTACIONES LABORALES',
                                            labelText: 'PRESTACIONES LABORALES',
                                            fillColor: Colors.grey[200],
                                            filled: true),
                                        onTap: () => showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30.0)),
                                          ),
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 500,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount:
                                                              _PrestacionesList2
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return CheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              title: Text(_PrestacionesList2[
                                                                          index]
                                                                      .Orden_PrestacionesLaborales +
                                                                  " " +
                                                                  _PrestacionesList2[
                                                                          index]
                                                                      .txt_desc_prestacioneslab),
                                                              value: _selectedItem2
                                                                  .contains(
                                                                      _PrestacionesList2[
                                                                          index]),
                                                              onChanged:
                                                                  (bool value) {
                                                                setState(() {
                                                                  if (value ==
                                                                      true) {
                                                                    _selectedItem2.add(
                                                                        _PrestacionesList2[
                                                                            index]);
                                                                  } else {
                                                                    _selectedItem2
                                                                        .remove(
                                                                            _PrestacionesList2[index]);
                                                                  }
                                                                });
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: addChecked2,
                                          child: Text('AGREGAR')),
                                    ],
                                  ),
                                ),
                              )),
                              DataCell(Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('SI'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.SI,
                                        groupValue: _jubilacionPensionado2,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado2 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('NO'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NO,
                                        groupValue: _jubilacionPensionado2,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado2 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('N/A'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NA,
                                        groupValue: _jubilacionPensionado2,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado2 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                              DataCell(getSearchField(
                                  controller: _derechohabiencia2,
                                  suggestions: _Derechohabiencia.map(
                                      (derechohabiencia) => SearchFieldListItem(
                                          derechohabiencia.derechoHabiencia,
                                          item: derechohabiencia)).toList(),
                                  hintName: 'DERECHOHABIENCIA')),
                              DataCell(getSearchField(
                                  controller: _motivoderechohabiencia2,
                                  suggestions: _MotivioDerechohabiencia.map(
                                          (motivoderechohabiencia) =>
                                              SearchFieldListItem(
                                                  motivoderechohabiencia
                                                      .motivoDerechoHabiencia,
                                                  item: motivoderechohabiencia))
                                      .toList(),
                                  hintName: 'MOTIVO DERECHOHABIENCIA'))
                            ]),
                            DataRow(cells: [
                              DataCell(Text('3')),
                              DataCell(getTextDataTable(
                                  controller: _nombre3,
                                  hintName: 'NOMBRES',
                                  isEnable: false)),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'ESCOLARIDAD',
                                      labelText: 'ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Escolaridad.map(
                                        (escolaridad) => SearchFieldListItem(
                                            escolaridad.escolaridad,
                                            item: escolaridad)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _escolaridad3,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_escolaridad3.text == "99 OTRA") {
                                          valEsc3 = true;
                                        } else {
                                          valEsc3 = false;
                                          _otroEscolaridad3.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroEscolaridad3,
                                    enabled: valEsc3,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA ESCOLARIDAD',
                                      labelText: 'OTRA ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(getSearchField(
                                  controller: _gradoEscolar3,
                                  suggestions: _GradoEscolar.map(
                                      (gradoEscolar) => SearchFieldListItem(
                                          gradoEscolar.grado,
                                          item: gradoEscolar)).toList(),
                                  hintName: 'GRADO')),
                              DataCell(
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text('1 SI'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.SI,
                                          groupValue: _asisteEscuela3,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela3 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('2 NO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NO,
                                          groupValue: _asisteEscuela3,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela3 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('3 OTRO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NA,
                                          groupValue: _asisteEscuela3,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela3 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OCUPACIÓN',
                                      labelText: 'OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Ocupacion.map((ocupacion) =>
                                        SearchFieldListItem(ocupacion.ocupacion,
                                            item: ocupacion)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _ocupacion3,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_ocupacion3.text ==
                                            "21 OTRA OCUPACIÓN") {
                                          valOcu3 = true;
                                        } else {
                                          valOcu3 = false;
                                          _otroOcupacion3.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroOcupacion3,
                                    enabled: valOcu3,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA OCUPACIÓN',
                                      labelText: 'OTRA OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'TIPO DE EMPLEO',
                                      labelText: 'TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _TipoEmpleo.map((tipoEmpleo) =>
                                        SearchFieldListItem(
                                            tipoEmpleo.TipoEmpleo,
                                            item: tipoEmpleo)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _tipoEmpleo3,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_tipoEmpleo3.text == "99 OTRO") {
                                          valTipE3 = true;
                                        } else {
                                          valTipE3 = false;
                                          _otroTipoEmpleo3.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroTipoEmpleo3,
                                    enabled: valTipE3,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRO TIPO DE EMPLEO',
                                      labelText: 'OTRO TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                margin: EdgeInsets.only(top: 30),
                                width: 600,
                                child: Container(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if ((_nombre3.text.length != 0) &&
                                              (value.isEmpty || value == '')) {
                                            alertDialog(context,
                                                'Prestaciones en el reglon 3 vacias');
                                            return 'Este campo no puede estar vacio';
                                          }
                                          return null;
                                        },
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        controller: _prestacion3,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            hintText: 'PRESTACIONES LABORALES',
                                            labelText: 'PRESTACIONES LABORALES',
                                            fillColor: Colors.grey[200],
                                            filled: true),
                                        onTap: () => showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30.0)),
                                          ),
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 500,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount:
                                                              _PrestacionesList3
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return CheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              title: Text(_PrestacionesList3[
                                                                          index]
                                                                      .Orden_PrestacionesLaborales +
                                                                  " " +
                                                                  _PrestacionesList3[
                                                                          index]
                                                                      .txt_desc_prestacioneslab),
                                                              value: _selectedItem3
                                                                  .contains(
                                                                      _PrestacionesList3[
                                                                          index]),
                                                              onChanged:
                                                                  (bool value) {
                                                                setState(() {
                                                                  if (value ==
                                                                      true) {
                                                                    _selectedItem3.add(
                                                                        _PrestacionesList3[
                                                                            index]);
                                                                  } else {
                                                                    _selectedItem3
                                                                        .remove(
                                                                            _PrestacionesList3[index]);
                                                                  }
                                                                });
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: addChecked3,
                                          child: Text('AGREGAR')),
                                    ],
                                  ),
                                ),
                              )),
                              DataCell(Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('SI'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.SI,
                                        groupValue: _jubilacionPensionado3,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado3 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('NO'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NO,
                                        groupValue: _jubilacionPensionado3,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado3 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('N/A'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NA,
                                        groupValue: _jubilacionPensionado3,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado3 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                              DataCell(getSearchField(
                                  controller: _derechohabiencia3,
                                  suggestions: _Derechohabiencia.map(
                                      (derechohabiencia) => SearchFieldListItem(
                                          derechohabiencia.derechoHabiencia,
                                          item: derechohabiencia)).toList(),
                                  hintName: 'DERECHOHABIENCIA')),
                              DataCell(getSearchField(
                                  controller: _motivoderechohabiencia3,
                                  suggestions: _MotivioDerechohabiencia.map(
                                          (motivoderechohabiencia) =>
                                              SearchFieldListItem(
                                                  motivoderechohabiencia
                                                      .motivoDerechoHabiencia,
                                                  item: motivoderechohabiencia))
                                      .toList(),
                                  hintName: 'MOTIVO DERECHOHABIENCIA'))
                            ]),
                            DataRow(cells: [
                              DataCell(Text('4')),
                              DataCell(getTextDataTable(
                                  controller: _nombre4,
                                  hintName: 'NOMBRES',
                                  isEnable: false)),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'ESCOLARIDAD',
                                      labelText: 'ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Escolaridad.map(
                                        (escolaridad) => SearchFieldListItem(
                                            escolaridad.escolaridad,
                                            item: escolaridad)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _escolaridad4,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_escolaridad4.text == "99 OTRA") {
                                          valEsc4 = true;
                                        } else {
                                          valEsc4 = false;
                                          _otroEscolaridad4.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroEscolaridad4,
                                    enabled: valEsc4,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA ESCOLARIDAD',
                                      labelText: 'OTRA ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(getSearchField(
                                  controller: _gradoEscolar4,
                                  suggestions: _GradoEscolar.map(
                                      (gradoEscolar) => SearchFieldListItem(
                                          gradoEscolar.grado,
                                          item: gradoEscolar)).toList(),
                                  hintName: 'GRADO')),
                              DataCell(
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text('1 SI'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.SI,
                                          groupValue: _asisteEscuela4,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela4 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('2 NO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NO,
                                          groupValue: _asisteEscuela4,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela4 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('3 OTRO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NA,
                                          groupValue: _asisteEscuela4,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela4 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OCUPACIÓN',
                                      labelText: 'OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Ocupacion.map((ocupacion) =>
                                        SearchFieldListItem(ocupacion.ocupacion,
                                            item: ocupacion)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _ocupacion4,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_ocupacion4.text ==
                                            "21 OTRA OCUPACIÓN") {
                                          valOcu4 = true;
                                        } else {
                                          valOcu4 = false;
                                          _otroOcupacion4.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroOcupacion4,
                                    enabled: valOcu4,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA OCUPACIÓN',
                                      labelText: 'OTRA OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'TIPO DE EMPLEO',
                                      labelText: 'TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _TipoEmpleo.map((tipoEmpleo) =>
                                        SearchFieldListItem(
                                            tipoEmpleo.TipoEmpleo,
                                            item: tipoEmpleo)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _tipoEmpleo4,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_tipoEmpleo4.text == "99 OTRO") {
                                          valTipE4 = true;
                                        } else {
                                          valTipE4 = false;
                                          _otroTipoEmpleo4.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroTipoEmpleo4,
                                    enabled: valTipE4,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRO TIPO DE EMPLEO',
                                      labelText: 'OTRO TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                margin: EdgeInsets.only(top: 30),
                                width: 600,
                                child: Container(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if ((_nombre4.text.length != 0) &&
                                              (value.isEmpty || value == '')) {
                                            alertDialog(context,
                                                'Prestaciones en el reglon 4 vacias');
                                            return 'Este campo no puede estar vacio';
                                          }
                                          return null;
                                        },
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        controller: _prestacion4,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            hintText: 'PRESTACIONES LABORALES',
                                            labelText: 'PRESTACIONES LABORALES',
                                            fillColor: Colors.grey[200],
                                            filled: true),
                                        onTap: () => showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30.0)),
                                          ),
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 500,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount:
                                                              _PrestacionesList4
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return CheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              title: Text(_PrestacionesList4[
                                                                          index]
                                                                      .Orden_PrestacionesLaborales +
                                                                  " " +
                                                                  _PrestacionesList4[
                                                                          index]
                                                                      .txt_desc_prestacioneslab),
                                                              value: _selectedItem4
                                                                  .contains(
                                                                      _PrestacionesList4[
                                                                          index]),
                                                              onChanged:
                                                                  (bool value) {
                                                                setState(() {
                                                                  if (value ==
                                                                      true) {
                                                                    _selectedItem4.add(
                                                                        _PrestacionesList4[
                                                                            index]);
                                                                  } else {
                                                                    _selectedItem4
                                                                        .remove(
                                                                            _PrestacionesList4[index]);
                                                                  }
                                                                });
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: addChecked4,
                                          child: Text('AGREGAR')),
                                    ],
                                  ),
                                ),
                              )),
                              DataCell(Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('SI'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.SI,
                                        groupValue: _jubilacionPensionado4,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado4 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('NO'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NO,
                                        groupValue: _jubilacionPensionado4,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado4 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('N/A'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NA,
                                        groupValue: _jubilacionPensionado4,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado4 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                              DataCell(getSearchField(
                                  controller: _derechohabiencia4,
                                  suggestions: _Derechohabiencia.map(
                                      (derechohabiencia) => SearchFieldListItem(
                                          derechohabiencia.derechoHabiencia,
                                          item: derechohabiencia)).toList(),
                                  hintName: 'DERECHOHABIENCIA')),
                              DataCell(getSearchField(
                                  controller: _motivoderechohabiencia4,
                                  suggestions: _MotivioDerechohabiencia.map(
                                          (motivoderechohabiencia) =>
                                              SearchFieldListItem(
                                                  motivoderechohabiencia
                                                      .motivoDerechoHabiencia,
                                                  item: motivoderechohabiencia))
                                      .toList(),
                                  hintName: 'MOTIVO DERECHOHABIENCIA'))
                            ]),
                            DataRow(cells: [
                              DataCell(Text('5')),
                              DataCell(getTextDataTable(
                                  controller: _nombre5,
                                  hintName: 'NOMBRES',
                                  isEnable: false)),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'ESCOLARIDAD',
                                      labelText: 'ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Escolaridad.map(
                                        (escolaridad) => SearchFieldListItem(
                                            escolaridad.escolaridad,
                                            item: escolaridad)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _escolaridad5,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_escolaridad5.text == "99 OTRA") {
                                          valEsc5 = true;
                                        } else {
                                          valEsc5 = false;
                                          _otroEscolaridad5.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroEscolaridad5,
                                    enabled: valEsc5,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA ESCOLARIDAD',
                                      labelText: 'OTRA ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(getSearchField(
                                  controller: _gradoEscolar5,
                                  suggestions: _GradoEscolar.map(
                                      (gradoEscolar) => SearchFieldListItem(
                                          gradoEscolar.grado,
                                          item: gradoEscolar)).toList(),
                                  hintName: 'GRADO')),
                              DataCell(
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text('1 SI'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.SI,
                                          groupValue: _asisteEscuela5,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela5 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('2 NO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NO,
                                          groupValue: _asisteEscuela5,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela5 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('3 OTRO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NA,
                                          groupValue: _asisteEscuela5,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela5 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OCUPACIÓN',
                                      labelText: 'OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Ocupacion.map((ocupacion) =>
                                        SearchFieldListItem(ocupacion.ocupacion,
                                            item: ocupacion)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _ocupacion5,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_ocupacion5.text ==
                                            "21 OTRA OCUPACIÓN") {
                                          valOcu5 = true;
                                        } else {
                                          valOcu5 = false;
                                          _otroOcupacion5.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroOcupacion5,
                                    enabled: valOcu5,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA OCUPACIÓN',
                                      labelText: 'OTRA OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'TIPO DE EMPLEO',
                                      labelText: 'TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _TipoEmpleo.map((tipoEmpleo) =>
                                        SearchFieldListItem(
                                            tipoEmpleo.TipoEmpleo,
                                            item: tipoEmpleo)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _tipoEmpleo5,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_tipoEmpleo5.text == "99 OTRO") {
                                          valTipE5 = true;
                                        } else {
                                          valTipE5 = false;
                                          _otroTipoEmpleo5.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroTipoEmpleo5,
                                    enabled: valTipE5,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRO TIPO DE EMPLEO',
                                      labelText: 'OTRO TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                margin: EdgeInsets.only(top: 30),
                                width: 600,
                                child: Container(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if ((_nombre5.text.length != 0) &&
                                              (value.isEmpty || value == '')) {
                                            alertDialog(context,
                                                'Prestaciones en el reglon 5 vacias');
                                            return 'Este campo no puede estar vacio';
                                          }
                                          return null;
                                        },
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        controller: _prestacion5,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            hintText: 'PRESTACIONES LABORALES',
                                            labelText: 'PRESTACIONES LABORALES',
                                            fillColor: Colors.grey[200],
                                            filled: true),
                                        onTap: () => showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30.0)),
                                          ),
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 500,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount:
                                                              _PrestacionesList5
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return CheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              title: Text(_PrestacionesList5[
                                                                          index]
                                                                      .Orden_PrestacionesLaborales +
                                                                  " " +
                                                                  _PrestacionesList5[
                                                                          index]
                                                                      .txt_desc_prestacioneslab),
                                                              value: _selectedItem5
                                                                  .contains(
                                                                      _PrestacionesList5[
                                                                          index]),
                                                              onChanged:
                                                                  (bool value) {
                                                                setState(() {
                                                                  if (value ==
                                                                      true) {
                                                                    _selectedItem5.add(
                                                                        _PrestacionesList5[
                                                                            index]);
                                                                  } else {
                                                                    _selectedItem5
                                                                        .remove(
                                                                            _PrestacionesList5[index]);
                                                                  }
                                                                });
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: addChecked5,
                                          child: Text('AGREGAR')),
                                    ],
                                  ),
                                ),
                              )),
                              DataCell(Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('SI'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.SI,
                                        groupValue: _jubilacionPensionado5,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado5 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('NO'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NO,
                                        groupValue: _jubilacionPensionado5,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado5 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('N/A'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NA,
                                        groupValue: _jubilacionPensionado5,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado5 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                              DataCell(getSearchField(
                                  controller: _derechohabiencia5,
                                  suggestions: _Derechohabiencia.map(
                                      (derechohabiencia) => SearchFieldListItem(
                                          derechohabiencia.derechoHabiencia,
                                          item: derechohabiencia)).toList(),
                                  hintName: 'DERECHOHABIENCIA')),
                              DataCell(getSearchField(
                                  controller: _motivoderechohabiencia5,
                                  suggestions: _MotivioDerechohabiencia.map(
                                          (motivoderechohabiencia) =>
                                              SearchFieldListItem(
                                                  motivoderechohabiencia
                                                      .motivoDerechoHabiencia,
                                                  item: motivoderechohabiencia))
                                      .toList(),
                                  hintName: 'MOTIVO DERECHOHABIENCIA'))
                            ]),
                            DataRow(cells: [
                              DataCell(Text('6')),
                              DataCell(getTextDataTable(
                                  controller: _nombre6,
                                  hintName: 'NOMBRES',
                                  isEnable: false)),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'ESCOLARIDAD',
                                      labelText: 'ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Escolaridad.map(
                                        (escolaridad) => SearchFieldListItem(
                                            escolaridad.escolaridad,
                                            item: escolaridad)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _escolaridad6,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_escolaridad6.text == "99 OTRA") {
                                          valEsc6 = true;
                                        } else {
                                          valEsc6 = false;
                                          _otroEscolaridad6.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroEscolaridad6,
                                    enabled: valEsc6,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA ESCOLARIDAD',
                                      labelText: 'OTRA ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(getSearchField(
                                  controller: _gradoEscolar6,
                                  suggestions: _GradoEscolar.map(
                                      (gradoEscolar) => SearchFieldListItem(
                                          gradoEscolar.grado,
                                          item: gradoEscolar)).toList(),
                                  hintName: 'GRADO')),
                              DataCell(
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text('1 SI'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.SI,
                                          groupValue: _asisteEscuela6,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela6 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('2 NO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NO,
                                          groupValue: _asisteEscuela6,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela6 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('3 OTRO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NA,
                                          groupValue: _asisteEscuela6,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela6 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OCUPACIÓN',
                                      labelText: 'OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Ocupacion.map((ocupacion) =>
                                        SearchFieldListItem(ocupacion.ocupacion,
                                            item: ocupacion)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _ocupacion6,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_ocupacion6.text ==
                                            "21 OTRA OCUPACIÓN") {
                                          valOcu6 = true;
                                        } else {
                                          valOcu6 = false;
                                          _otroOcupacion6.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroOcupacion6,
                                    enabled: valOcu6,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA OCUPACIÓN',
                                      labelText: 'OTRA OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'TIPO DE EMPLEO',
                                      labelText: 'TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _TipoEmpleo.map((tipoEmpleo) =>
                                        SearchFieldListItem(
                                            tipoEmpleo.TipoEmpleo,
                                            item: tipoEmpleo)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _tipoEmpleo6,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_tipoEmpleo6.text == "99 OTRO") {
                                          valTipE6 = true;
                                        } else {
                                          valTipE6 = false;
                                          _otroTipoEmpleo6.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroTipoEmpleo6,
                                    enabled: valTipE6,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRO TIPO DE EMPLEO',
                                      labelText: 'OTRO TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                margin: EdgeInsets.only(top: 30),
                                width: 600,
                                child: Container(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if ((_nombre6.text.length != 0) &&
                                              (value.isEmpty || value == '')) {
                                            alertDialog(context,
                                                'Prestaciones en el reglon 6 vacias');
                                            return 'Este campo no puede estar vacio';
                                          }
                                          return null;
                                        },
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        controller: _prestacion6,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            hintText: 'PRESTACIONES LABORALES',
                                            labelText: 'PRESTACIONES LABORALES',
                                            fillColor: Colors.grey[200],
                                            filled: true),
                                        onTap: () => showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30.0)),
                                          ),
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 500,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount:
                                                              _PrestacionesList6
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return CheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              title: Text(_PrestacionesList6[
                                                                          index]
                                                                      .Orden_PrestacionesLaborales +
                                                                  " " +
                                                                  _PrestacionesList6[
                                                                          index]
                                                                      .txt_desc_prestacioneslab),
                                                              value: _selectedItem6
                                                                  .contains(
                                                                      _PrestacionesList6[
                                                                          index]),
                                                              onChanged:
                                                                  (bool value) {
                                                                setState(() {
                                                                  if (value ==
                                                                      true) {
                                                                    _selectedItem6.add(
                                                                        _PrestacionesList6[
                                                                            index]);
                                                                  } else {
                                                                    _selectedItem6
                                                                        .remove(
                                                                            _PrestacionesList6[index]);
                                                                  }
                                                                });
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: addChecked6,
                                          child: Text('AGREGAR')),
                                    ],
                                  ),
                                ),
                              )),
                              DataCell(Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('SI'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.SI,
                                        groupValue: _jubilacionPensionado6,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado6 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('NO'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NO,
                                        groupValue: _jubilacionPensionado6,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado6 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('N/A'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NA,
                                        groupValue: _jubilacionPensionado6,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado6 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                              DataCell(getSearchField(
                                  controller: _derechohabiencia6,
                                  suggestions: _Derechohabiencia.map(
                                      (derechohabiencia) => SearchFieldListItem(
                                          derechohabiencia.derechoHabiencia,
                                          item: derechohabiencia)).toList(),
                                  hintName: 'DERECHOHABIENCIA')),
                              DataCell(getSearchField(
                                  controller: _motivoderechohabiencia6,
                                  suggestions: _MotivioDerechohabiencia.map(
                                          (motivoderechohabiencia) =>
                                              SearchFieldListItem(
                                                  motivoderechohabiencia
                                                      .motivoDerechoHabiencia,
                                                  item: motivoderechohabiencia))
                                      .toList(),
                                  hintName: 'MOTIVO DERECHOHABIENCIA'))
                            ]),
                            DataRow(cells: [
                              DataCell(Text('7')),
                              DataCell(getTextDataTable(
                                  controller: _nombre7,
                                  hintName: 'NOMBRES',
                                  isEnable: false)),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'ESCOLARIDAD',
                                      labelText: 'ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Escolaridad.map(
                                        (escolaridad) => SearchFieldListItem(
                                            escolaridad.escolaridad,
                                            item: escolaridad)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _escolaridad7,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_escolaridad7.text == "99 OTRA") {
                                          valEsc7 = true;
                                        } else {
                                          valEsc7 = false;
                                          _otroEscolaridad7.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroEscolaridad7,
                                    enabled: valEsc7,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA ESCOLARIDAD',
                                      labelText: 'OTRA ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(getSearchField(
                                  controller: _gradoEscolar7,
                                  suggestions: _GradoEscolar.map(
                                      (gradoEscolar) => SearchFieldListItem(
                                          gradoEscolar.grado,
                                          item: gradoEscolar)).toList(),
                                  hintName: 'GRADO')),
                              DataCell(
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text('1 SI'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.SI,
                                          groupValue: _asisteEscuela7,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela7 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('2 NO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NO,
                                          groupValue: _asisteEscuela7,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela7 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('3 OTRO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NA,
                                          groupValue: _asisteEscuela7,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela7 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OCUPACIÓN',
                                      labelText: 'OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Ocupacion.map((ocupacion) =>
                                        SearchFieldListItem(ocupacion.ocupacion,
                                            item: ocupacion)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _ocupacion7,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_ocupacion7.text ==
                                            "21 OTRA OCUPACIÓN") {
                                          valOcu7 = true;
                                        } else {
                                          valOcu7 = false;
                                          _otroOcupacion7.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroOcupacion7,
                                    enabled: valOcu7,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA OCUPACIÓN',
                                      labelText: 'OTRA OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'TIPO DE EMPLEO',
                                      labelText: 'TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _TipoEmpleo.map((tipoEmpleo) =>
                                        SearchFieldListItem(
                                            tipoEmpleo.TipoEmpleo,
                                            item: tipoEmpleo)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _tipoEmpleo7,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_tipoEmpleo7.text == "99 OTRO") {
                                          valTipE7 = true;
                                        } else {
                                          valTipE7 = false;
                                          _otroTipoEmpleo7.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroTipoEmpleo7,
                                    enabled: valTipE7,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRO TIPO DE EMPLEO',
                                      labelText: 'OTRO TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                margin: EdgeInsets.only(top: 30),
                                width: 600,
                                child: Container(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if ((_nombre7.text.length != 0) &&
                                              (value.isEmpty || value == '')) {
                                            alertDialog(context,
                                                'Prestaciones en el reglon 7 vacias');
                                            return 'Este campo no puede estar vacio';
                                          }
                                          return null;
                                        },
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        controller: _prestacion7,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            hintText: 'PRESTACIONES LABORALES',
                                            labelText: 'PRESTACIONES LABORALES',
                                            fillColor: Colors.grey[200],
                                            filled: true),
                                        onTap: () => showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30.0)),
                                          ),
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 500,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount:
                                                              _PrestacionesList7
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return CheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              title: Text(_PrestacionesList7[
                                                                          index]
                                                                      .Orden_PrestacionesLaborales +
                                                                  " " +
                                                                  _PrestacionesList7[
                                                                          index]
                                                                      .txt_desc_prestacioneslab),
                                                              value: _selectedItem7
                                                                  .contains(
                                                                      _PrestacionesList7[
                                                                          index]),
                                                              onChanged:
                                                                  (bool value) {
                                                                setState(() {
                                                                  if (value ==
                                                                      true) {
                                                                    _selectedItem7.add(
                                                                        _PrestacionesList7[
                                                                            index]);
                                                                  } else {
                                                                    _selectedItem7
                                                                        .remove(
                                                                            _PrestacionesList7[index]);
                                                                  }
                                                                });
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: addChecked7,
                                          child: Text('AGREGAR')),
                                    ],
                                  ),
                                ),
                              )),
                              DataCell(Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('SI'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.SI,
                                        groupValue: _jubilacionPensionado7,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado7 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('NO'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NO,
                                        groupValue: _jubilacionPensionado7,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado7 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('N/A'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NA,
                                        groupValue: _jubilacionPensionado7,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado7 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                              DataCell(getSearchField(
                                  controller: _derechohabiencia7,
                                  suggestions: _Derechohabiencia.map(
                                      (derechohabiencia) => SearchFieldListItem(
                                          derechohabiencia.derechoHabiencia,
                                          item: derechohabiencia)).toList(),
                                  hintName: 'DERECHOHABIENCIA')),
                              DataCell(getSearchField(
                                  controller: _motivoderechohabiencia7,
                                  suggestions: _MotivioDerechohabiencia.map(
                                          (motivoderechohabiencia) =>
                                              SearchFieldListItem(
                                                  motivoderechohabiencia
                                                      .motivoDerechoHabiencia,
                                                  item: motivoderechohabiencia))
                                      .toList(),
                                  hintName: 'MOTIVO DERECHOHABIENCIA'))
                            ]),
                            DataRow(cells: [
                              DataCell(Text('8')),
                              DataCell(getTextDataTable(
                                  controller: _nombre8,
                                  hintName: 'NOMBRES',
                                  isEnable: false)),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'ESCOLARIDAD',
                                      labelText: 'ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Escolaridad.map(
                                        (escolaridad) => SearchFieldListItem(
                                            escolaridad.escolaridad,
                                            item: escolaridad)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _escolaridad8,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_escolaridad8.text == "99 OTRA") {
                                          valEsc8 = true;
                                        } else {
                                          valEsc8 = false;
                                          _otroEscolaridad8.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroEscolaridad8,
                                    enabled: valEsc8,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA ESCOLARIDAD',
                                      labelText: 'OTRA ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(getSearchField(
                                  controller: _gradoEscolar8,
                                  suggestions: _GradoEscolar.map(
                                      (gradoEscolar) => SearchFieldListItem(
                                          gradoEscolar.grado,
                                          item: gradoEscolar)).toList(),
                                  hintName: 'GRADO')),
                              DataCell(
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text('1 SI'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.SI,
                                          groupValue: _asisteEscuela8,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela8 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('2 NO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NO,
                                          groupValue: _asisteEscuela8,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela8 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('3 OTRO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NA,
                                          groupValue: _asisteEscuela8,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela8 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OCUPACIÓN',
                                      labelText: 'OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Ocupacion.map((ocupacion) =>
                                        SearchFieldListItem(ocupacion.ocupacion,
                                            item: ocupacion)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _ocupacion8,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_ocupacion8.text ==
                                            "21 OTRA OCUPACIÓN") {
                                          valOcu8 = true;
                                        } else {
                                          valOcu8 = false;
                                          _otroOcupacion8.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroOcupacion8,
                                    enabled: valOcu8,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA OCUPACIÓN',
                                      labelText: 'OTRA OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'TIPO DE EMPLEO',
                                      labelText: 'TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _TipoEmpleo.map((tipoEmpleo) =>
                                        SearchFieldListItem(
                                            tipoEmpleo.TipoEmpleo,
                                            item: tipoEmpleo)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _tipoEmpleo8,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_tipoEmpleo8.text == "99 OTRO") {
                                          valTipE8 = true;
                                        } else {
                                          valTipE8 = false;
                                          _otroTipoEmpleo8.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroTipoEmpleo8,
                                    enabled: valTipE8,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRO TIPO DE EMPLEO',
                                      labelText: 'OTRO TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                margin: EdgeInsets.only(top: 30),
                                width: 600,
                                child: Container(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if ((_nombre8.text.length != 0) &&
                                              (value.isEmpty || value == '')) {
                                            alertDialog(context,
                                                'Prestaciones en el reglon 8 vacias');
                                            return 'Este campo no puede estar vacio';
                                          }
                                          return null;
                                        },
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        controller: _prestacion8,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            hintText: 'PRESTACIONES LABORALES',
                                            labelText: 'PRESTACIONES LABORALES',
                                            fillColor: Colors.grey[200],
                                            filled: true),
                                        onTap: () => showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30.0)),
                                          ),
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 500,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount:
                                                              _PrestacionesList8
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return CheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              title: Text(_PrestacionesList8[
                                                                          index]
                                                                      .Orden_PrestacionesLaborales +
                                                                  " " +
                                                                  _PrestacionesList8[
                                                                          index]
                                                                      .txt_desc_prestacioneslab),
                                                              value: _selectedItem8
                                                                  .contains(
                                                                      _PrestacionesList8[
                                                                          index]),
                                                              onChanged:
                                                                  (bool value) {
                                                                setState(() {
                                                                  if (value ==
                                                                      true) {
                                                                    _selectedItem8.add(
                                                                        _PrestacionesList8[
                                                                            index]);
                                                                  } else {
                                                                    _selectedItem8
                                                                        .remove(
                                                                            _PrestacionesList8[index]);
                                                                  }
                                                                });
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: addChecked8,
                                          child: Text('AGREGAR')),
                                    ],
                                  ),
                                ),
                              )),
                              DataCell(Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('SI'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.SI,
                                        groupValue: _jubilacionPensionado8,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado8 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('NO'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NO,
                                        groupValue: _jubilacionPensionado8,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado8 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('N/A'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NA,
                                        groupValue: _jubilacionPensionado8,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado8 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                              DataCell(getSearchField(
                                  controller: _derechohabiencia8,
                                  suggestions: _Derechohabiencia.map(
                                      (derechohabiencia) => SearchFieldListItem(
                                          derechohabiencia.derechoHabiencia,
                                          item: derechohabiencia)).toList(),
                                  hintName: 'DERECHOHABIENCIA')),
                              DataCell(getSearchField(
                                  controller: _motivoderechohabiencia8,
                                  suggestions: _MotivioDerechohabiencia.map(
                                          (motivoderechohabiencia) =>
                                              SearchFieldListItem(
                                                  motivoderechohabiencia
                                                      .motivoDerechoHabiencia,
                                                  item: motivoderechohabiencia))
                                      .toList(),
                                  hintName: 'MOTIVO DERECHOHABIENCIA'))
                            ]),
                            DataRow(cells: [
                              DataCell(Text('9')),
                              DataCell(getTextDataTable(
                                  controller: _nombre9,
                                  hintName: 'NOMBRES',
                                  isEnable: false)),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'ESCOLARIDAD',
                                      labelText: 'ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Escolaridad.map(
                                        (escolaridad) => SearchFieldListItem(
                                            escolaridad.escolaridad,
                                            item: escolaridad)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _escolaridad9,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_escolaridad9.text == "99 OTRA") {
                                          valEsc9 = true;
                                        } else {
                                          valEsc9 = false;
                                          _otroEscolaridad9.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroEscolaridad9,
                                    enabled: valEsc9,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA ESCOLARIDAD',
                                      labelText: 'OTRA ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(getSearchField(
                                  controller: _gradoEscolar9,
                                  suggestions: _GradoEscolar.map(
                                      (gradoEscolar) => SearchFieldListItem(
                                          gradoEscolar.grado,
                                          item: gradoEscolar)).toList(),
                                  hintName: 'GRADO')),
                              DataCell(
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text('1 SI'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.SI,
                                          groupValue: _asisteEscuela9,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela9 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('2 NO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NO,
                                          groupValue: _asisteEscuela9,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela9 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('3 OTRO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NA,
                                          groupValue: _asisteEscuela9,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela9 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OCUPACIÓN',
                                      labelText: 'OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Ocupacion.map((ocupacion) =>
                                        SearchFieldListItem(ocupacion.ocupacion,
                                            item: ocupacion)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _ocupacion9,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_ocupacion9.text ==
                                            "21 OTRA OCUPACIÓN") {
                                          valOcu9 = true;
                                        } else {
                                          valOcu9 = false;
                                          _otroOcupacion9.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroOcupacion9,
                                    enabled: valOcu9,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA OCUPACIÓN',
                                      labelText: 'OTRA OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'TIPO DE EMPLEO',
                                      labelText: 'TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _TipoEmpleo.map((tipoEmpleo) =>
                                        SearchFieldListItem(
                                            tipoEmpleo.TipoEmpleo,
                                            item: tipoEmpleo)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _tipoEmpleo9,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_tipoEmpleo9.text == "99 OTRO") {
                                          valTipE9 = true;
                                        } else {
                                          valTipE9 = false;
                                          _otroTipoEmpleo9.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroTipoEmpleo9,
                                    enabled: valTipE9,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRO TIPO DE EMPLEO',
                                      labelText: 'OTRO TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                margin: EdgeInsets.only(top: 30),
                                width: 600,
                                child: Container(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if ((_nombre9.text.length != 0) &&
                                              (value.isEmpty || value == '')) {
                                            alertDialog(context,
                                                'Prestaciones en el reglon 9 vacias');
                                            return 'Este campo no puede estar vacio';
                                          }
                                          return null;
                                        },
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        controller: _prestacion9,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            hintText: 'PRESTACIONES LABORALES',
                                            labelText: 'PRESTACIONES LABORALES',
                                            fillColor: Colors.grey[200],
                                            filled: true),
                                        onTap: () => showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30.0)),
                                          ),
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 500,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount:
                                                              _PrestacionesList9
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return CheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              title: Text(_PrestacionesList9[
                                                                          index]
                                                                      .Orden_PrestacionesLaborales +
                                                                  " " +
                                                                  _PrestacionesList9[
                                                                          index]
                                                                      .txt_desc_prestacioneslab),
                                                              value: _selectedItem9
                                                                  .contains(
                                                                      _PrestacionesList9[
                                                                          index]),
                                                              onChanged:
                                                                  (bool value) {
                                                                setState(() {
                                                                  if (value ==
                                                                      true) {
                                                                    _selectedItem9.add(
                                                                        _PrestacionesList9[
                                                                            index]);
                                                                  } else {
                                                                    _selectedItem9
                                                                        .remove(
                                                                            _PrestacionesList9[index]);
                                                                  }
                                                                });
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: addChecked9,
                                          child: Text('AGREGAR')),
                                    ],
                                  ),
                                ),
                              )),
                              DataCell(Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('SI'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.SI,
                                        groupValue: _jubilacionPensionado9,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado9 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('NO'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NO,
                                        groupValue: _jubilacionPensionado9,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado9 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('N/A'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NA,
                                        groupValue: _jubilacionPensionado9,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado9 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                              DataCell(getSearchField(
                                  controller: _derechohabiencia9,
                                  suggestions: _Derechohabiencia.map(
                                      (derechohabiencia) => SearchFieldListItem(
                                          derechohabiencia.derechoHabiencia,
                                          item: derechohabiencia)).toList(),
                                  hintName: 'DERECHOHABIENCIA')),
                              DataCell(getSearchField(
                                  controller: _motivoderechohabiencia9,
                                  suggestions: _MotivioDerechohabiencia.map(
                                          (motivoderechohabiencia) =>
                                              SearchFieldListItem(
                                                  motivoderechohabiencia
                                                      .motivoDerechoHabiencia,
                                                  item: motivoderechohabiencia))
                                      .toList(),
                                  hintName: 'MOTIVO DERECHOHABIENCIA'))
                            ]),
                            DataRow(cells: [
                              DataCell(Text('10')),
                              DataCell(getTextDataTable(
                                  controller: _nombre10,
                                  hintName: 'NOMBRES',
                                  isEnable: false)),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'ESCOLARIDAD',
                                      labelText: 'ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Escolaridad.map(
                                        (escolaridad) => SearchFieldListItem(
                                            escolaridad.escolaridad,
                                            item: escolaridad)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _escolaridad10,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_escolaridad10.text == "99 OTRA") {
                                          valEsc10 = true;
                                        } else {
                                          valEsc10 = false;
                                          _otroEscolaridad10.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroEscolaridad10,
                                    enabled: valEsc10,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA ESCOLARIDAD',
                                      labelText: 'OTRA ESCOLARIDAD',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(getSearchField(
                                  controller: _gradoEscolar10,
                                  suggestions: _GradoEscolar.map(
                                      (gradoEscolar) => SearchFieldListItem(
                                          gradoEscolar.grado,
                                          item: gradoEscolar)).toList(),
                                  hintName: 'GRADO')),
                              DataCell(
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text('1 SI'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.SI,
                                          groupValue: _asisteEscuela10,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela10 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('2 NO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NO,
                                          groupValue: _asisteEscuela10,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela10 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text('3 OTRO'),
                                        leading: Radio<AsisteEscuela>(
                                          value: AsisteEscuela.NA,
                                          groupValue: _asisteEscuela10,
                                          toggleable: true,
                                          onChanged: (AsisteEscuela value) {
                                            setState(() {
                                              _asisteEscuela10 = value;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OCUPACIÓN',
                                      labelText: 'OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _Ocupacion.map((ocupacion) =>
                                        SearchFieldListItem(ocupacion.ocupacion,
                                            item: ocupacion)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _ocupacion10,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_ocupacion10.text ==
                                            "21 OTRA OCUPACIÓN") {
                                          valOcu10 = true;
                                        } else {
                                          valOcu10 = false;
                                          _otroOcupacion10.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroOcupacion10,
                                    enabled: valOcu10,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRA OCUPACIÓN',
                                      labelText: 'OTRA OCUPACIÓN',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 400,
                                  child: SearchField(
                                    suggestionState: Suggestion.expand,
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'TIPO DE EMPLEO',
                                      labelText: 'TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    suggestions: _TipoEmpleo.map((tipoEmpleo) =>
                                        SearchFieldListItem(
                                            tipoEmpleo.TipoEmpleo,
                                            item: tipoEmpleo)).toList(),
                                    textInputAction: TextInputAction.next,
                                    hasOverlay: true,
                                    controller: _tipoEmpleo10,
                                    maxSuggestionsInViewPort: 5,
                                    itemHeight: 45,
                                    onSuggestionTap: (x) {
                                      setState(() {
                                        if (_tipoEmpleo10.text == "99 OTRO") {
                                          valTipE10 = true;
                                        } else {
                                          valTipE10 = false;
                                          _otroTipoEmpleo10.clear();
                                        }
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  width: 300,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _otroTipoEmpleo10,
                                    enabled: valTipE10,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'OTRO TIPO DE EMPLEO',
                                      labelText: 'OTRO TIPO DE EMPLEO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                margin: EdgeInsets.only(top: 30),
                                width: 600,
                                child: Container(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if ((_nombre10.text.length != 0) &&
                                              (value.isEmpty || value == '')) {
                                            alertDialog(context,
                                                'Prestaciones en el reglon 10 vacias');
                                            return 'Este campo no puede estar vacio';
                                          }
                                          return null;
                                        },
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        controller: _prestacion10,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            hintText: 'PRESTACIONES LABORALES',
                                            labelText: 'PRESTACIONES LABORALES',
                                            fillColor: Colors.grey[200],
                                            filled: true),
                                        onTap: () => showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30.0)),
                                          ),
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 500,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount:
                                                              _PrestacionesList10
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return CheckboxListTile(
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .leading,
                                                              title: Text(_PrestacionesList10[
                                                                          index]
                                                                      .Orden_PrestacionesLaborales +
                                                                  " " +
                                                                  _PrestacionesList10[
                                                                          index]
                                                                      .txt_desc_prestacioneslab),
                                                              value: _selectedItem10
                                                                  .contains(
                                                                      _PrestacionesList10[
                                                                          index]),
                                                              onChanged:
                                                                  (bool value) {
                                                                setState(() {
                                                                  if (value ==
                                                                      true) {
                                                                    _selectedItem10.add(
                                                                        _PrestacionesList10[
                                                                            index]);
                                                                  } else {
                                                                    _selectedItem10
                                                                        .remove(
                                                                            _PrestacionesList10[index]);
                                                                  }
                                                                });
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: addChecked10,
                                          child: Text('AGREGAR')),
                                    ],
                                  ),
                                ),
                              )),
                              DataCell(Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('SI'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.SI,
                                        groupValue: _jubilacionPensionado10,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado10 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('NO'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NO,
                                        groupValue: _jubilacionPensionado10,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado10 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('N/A'),
                                      leading: Radio<JubilacionPensionado>(
                                        value: JubilacionPensionado.NA,
                                        groupValue: _jubilacionPensionado10,
                                        toggleable: true,
                                        onChanged:
                                            (JubilacionPensionado value) {
                                          setState(() {
                                            _jubilacionPensionado10 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                              DataCell(getSearchField(
                                  controller: _derechohabiencia10,
                                  suggestions: _Derechohabiencia.map(
                                      (derechohabiencia) => SearchFieldListItem(
                                          derechohabiencia.derechoHabiencia,
                                          item: derechohabiencia)).toList(),
                                  hintName: 'DERECHOHABIENCIA')),
                              DataCell(getSearchField(
                                  controller: _motivoderechohabiencia10,
                                  suggestions: _MotivioDerechohabiencia.map(
                                          (motivoderechohabiencia) =>
                                              SearchFieldListItem(
                                                  motivoderechohabiencia
                                                      .motivoDerechoHabiencia,
                                                  item: motivoderechohabiencia))
                                      .toList(),
                                  hintName: 'MOTIVO DERECHOHABIENCIA'))
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /* Container(
                margin: EdgeInsets.all(20.0),
                width: double.infinity,
                child: TextButton.icon(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        guardar();
                      }
                      print(_nombre1.text);
                      print(_nombre2.text.length);
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
              ), */
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.all(20.0),
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () {
                    _showAlertAct(context);
                    DbHelper()
                        .eliminarEscolaridad(widget.folio, widget.dispositivo);
                  },
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

  void _showAlertAct(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text('LOS DATOS SE ACTUALIZARAN'),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    child: Text('REVISAR')),
                TextButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        guardar();
                      }
                    },
                    child: Text('ACTUALIZAR'))
              ],
            ));
  }

  void _showAlertSave(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text('FAVOR DE REVISAR QUE TODOS LOS CAMPOS ESTEN LLENOS'),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    child: Text('REVISAR')),
                TextButton(onPressed: guardar, child: Text('GUARDAR'))
              ],
            ));
  }

  otroDerechohabiencia() {
    setState(() {
      if (_derechohabiencia1.text == '6 OTRA') {
        valDere1 = true;
      } else {
        valDere1 = false;
        _otroDerechohabiencia1.clear();
      }
    });
  }
}
