import 'dart:io';

import 'dart:math';
import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genBotonFotografia.dart';
import 'package:esn/Comm/genSearchField.dart';
import 'package:esn/Comm/genTextDataTable.dart';
import 'package:esn/Comm/genTextExpand.dart';
import 'package:esn/Comm/genTextFolio.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/AdiccionesModel.dart';
import 'package:esn/Model/ClasificacionModel.dart';
import 'package:esn/Model/CondicionesSaludModel.dart';
import 'package:esn/Model/DiscapacidadesModel.dart';
import 'package:esn/Model/EstructuraFamiliarModel.dart';
import 'package:esn/Model/PuebloIndigenaModel.dart';
import 'package:esn/Model/Salud_PertenenciaIndigenaTablaModel.dart';
import 'package:esn/Screens/Escolaridad_SeguridadSocialTabla.dart';
import 'package:esn/Screens/Infraestructura_Vivienda.dart';
import 'package:esn/replaceAll/replaceAllLetter.dart';
import 'package:esn/replaceAll/replaceAllNum.dart';
import 'package:esn/services/Utility.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:image_picker/image_picker.dart';

enum Check { INCOMPLETO, COMPLETO }

class Salud_PertenenciaIndigenaTabla extends StatefulWidget {
  String folio;

  String folioDisp;
  String usuario;
  String dispositivo;

  Salud_PertenenciaIndigenaTabla(
      {this.folio, this.folioDisp, this.dispositivo, this.usuario});
  @override
  State<Salud_PertenenciaIndigenaTabla> createState() =>
      _Salud_PertenenciaIndigenaTablaState();
}

class _Salud_PertenenciaIndigenaTablaState
    extends State<Salud_PertenenciaIndigenaTabla> {
  final _formKey = GlobalKey<FormState>();

  List<Salud_PertenenciaIndigenenaTablaModel> _SaludGuardar = [];
  final _nombre1 = TextEditingController();
  final _discapacidades1 = TextEditingController();
  final _adicciones1 = TextEditingController();
  final _condicionSalud1 = TextEditingController();
  final _peso1 = TextEditingController();
  final _talla1 = TextEditingController();
  var _imc1 = TextEditingController();
  final _puebloIndigena1 = TextEditingController();
  final _clasificacion1 = TextEditingController();
  final _ponderacion1 = TextEditingController();

  final _otroCapacidadDiferente1 = TextEditingController();
  bool valCD1 = false;
  final _otroAdicciones1 = TextEditingController();
  bool valA1 = false;
  List<CondicioneSaludModel> _Condiciones1 = [];
  List<ClasificacionModel> _Clasificaciones1 = [];

  File _image1_1;
  File _image1_2;
  File _image1_3;
  File _image1_4;
  File _image1_5;
  File _fotoAviso1;
  Check _incompleto1 = Check.COMPLETO;

  var foto1_1 = null;
  var foto1_2 = null;
  var foto1_3 = null;
  var foto1_4 = null;
  var foto1_5 = null;
  var fotoAviso1 = null;
  List<CondicioneSaludModel> selectedItemsCond1 = [];
  List<ClasificacionModel> selectedItemsClas1 = [];

  final _nombre2 = TextEditingController();
  final _discapacidades2 = TextEditingController();
  final _adicciones2 = TextEditingController();
  final _condicionSalud2 = TextEditingController();
  final _peso2 = TextEditingController();
  final _talla2 = TextEditingController();
  var _imc2 = TextEditingController();
  final _puebloIndigena2 = TextEditingController();
  final _clasificacion2 = TextEditingController();
  final _ponderacion2 = TextEditingController();

  final _otroCapacidadDiferente2 = TextEditingController();
  bool valCD2 = false;
  final _otroAdicciones2 = TextEditingController();
  bool valA2 = false;
  List<CondicioneSaludModel> _Condiciones2 = [];
  List<ClasificacionModel> _Clasificaciones2 = [];

  File _image2_1;
  File _image2_2;
  File _image2_3;
  File _image2_4;
  File _image2_5;
  File _fotoAviso2;
  Check _incompleto2 = Check.COMPLETO;

  var foto2_1 = null;
  var foto2_2 = null;
  var foto2_3 = null;
  var foto2_4 = null;
  var foto2_5 = null;

  var fotoAviso2 = null;
  List<CondicioneSaludModel> selectedItemsCond2 = [];
  List<ClasificacionModel> selectedItemsClas2 = [];

  final _nombre3 = TextEditingController();
  final _discapacidades3 = TextEditingController();
  final _adicciones3 = TextEditingController();
  final _condicionSalud3 = TextEditingController();
  final _peso3 = TextEditingController();
  final _talla3 = TextEditingController();
  var _imc3 = TextEditingController();
  final _puebloIndigena3 = TextEditingController();
  final _clasificacion3 = TextEditingController();
  final _ponderacion3 = TextEditingController();

  final _otroCapacidadDiferente3 = TextEditingController();
  bool valCD3 = false;
  final _otroAdicciones3 = TextEditingController();
  bool valA3 = false;
  List<CondicioneSaludModel> _Condiciones3 = [];
  List<ClasificacionModel> _Clasificaciones3 = [];

  File _image3_1;
  File _image3_2;
  File _image3_3;
  File _image3_4;
  File _image3_5;
  File _fotoAviso3;
  Check _incompleto3 = Check.COMPLETO;

  var foto3_1 = null;
  var foto3_2 = null;
  var foto3_3 = null;
  var foto3_4 = null;
  var foto3_5 = null;

  var fotoAviso3 = null;
  List<CondicioneSaludModel> selectedItemsCond3 = [];
  List<ClasificacionModel> selectedItemsClas3 = [];

  final _nombre4 = TextEditingController();
  final _discapacidades4 = TextEditingController();
  final _adicciones4 = TextEditingController();
  final _condicionSalud4 = TextEditingController();
  final _peso4 = TextEditingController();
  final _talla4 = TextEditingController();
  var _imc4 = TextEditingController();
  final _puebloIndigena4 = TextEditingController();
  final _clasificacion4 = TextEditingController();
  final _ponderacion4 = TextEditingController();

  final _otroCapacidadDiferente4 = TextEditingController();
  bool valCD4 = false;
  final _otroAdicciones4 = TextEditingController();
  bool valA4 = false;
  List<CondicioneSaludModel> _Condiciones4 = [];
  List<ClasificacionModel> _Clasificaciones4 = [];

  File _image4_1;
  File _image4_2;
  File _image4_3;
  File _image4_4;
  File _image4_5;
  File _fotoAviso4;
  Check _incompleto4 = Check.COMPLETO;

  var foto4_1 = null;
  var foto4_2 = null;
  var foto4_3 = null;
  var foto4_4 = null;
  var foto4_5 = null;

  var fotoAviso4 = null;
  List<CondicioneSaludModel> selectedItemsCond4 = [];
  List<ClasificacionModel> selectedItemsClas4 = [];

  final _nombre5 = TextEditingController();
  final _discapacidades5 = TextEditingController();
  final _adicciones5 = TextEditingController();
  final _condicionSalud5 = TextEditingController();
  final _peso5 = TextEditingController();
  final _talla5 = TextEditingController();
  var _imc5 = TextEditingController();
  final _puebloIndigena5 = TextEditingController();
  final _clasificacion5 = TextEditingController();
  final _ponderacion5 = TextEditingController();

  final _otroCapacidadDiferente5 = TextEditingController();
  bool valCD5 = false;
  final _otroAdicciones5 = TextEditingController();
  bool valA5 = false;
  List<CondicioneSaludModel> _Condiciones5 = [];
  List<ClasificacionModel> _Clasificaciones5 = [];

  File _image5_1;
  File _image5_2;
  File _image5_3;
  File _image5_4;
  File _image5_5;
  File _fotoAviso5;
  Check _incompleto5 = Check.COMPLETO;

  var foto5_1 = null;
  var foto5_2 = null;
  var foto5_3 = null;
  var foto5_4 = null;
  var foto5_5 = null;

  var fotoAviso5 = null;
  List<CondicioneSaludModel> selectedItemsCond5 = [];
  List<ClasificacionModel> selectedItemsClas5 = [];

  final _nombre6 = TextEditingController();
  final _discapacidades6 = TextEditingController();
  final _adicciones6 = TextEditingController();
  final _condicionSalud6 = TextEditingController();
  final _peso6 = TextEditingController();
  final _talla6 = TextEditingController();
  var _imc6 = TextEditingController();
  final _puebloIndigena6 = TextEditingController();
  final _clasificacion6 = TextEditingController();
  final _ponderacion6 = TextEditingController();

  final _otroCapacidadDiferente6 = TextEditingController();
  bool valCD6 = false;
  final _otroAdicciones6 = TextEditingController();
  bool valA6 = false;
  List<CondicioneSaludModel> _Condiciones6 = [];
  List<ClasificacionModel> _Clasificaciones6 = [];

  File _image6_1;
  File _image6_2;
  File _image6_3;
  File _image6_4;
  File _image6_5;
  File _fotoAviso6;
  Check _incompleto6 = Check.COMPLETO;

  var foto6_1 = null;
  var foto6_2 = null;
  var foto6_3 = null;
  var foto6_4 = null;
  var foto6_5 = null;

  var fotoAviso6 = null;
  List<CondicioneSaludModel> selectedItemsCond6 = [];
  List<ClasificacionModel> selectedItemsClas6 = [];

  final _nombre7 = TextEditingController();
  final _discapacidades7 = TextEditingController();
  final _adicciones7 = TextEditingController();
  final _condicionSalud7 = TextEditingController();
  final _peso7 = TextEditingController();
  final _talla7 = TextEditingController();
  var _imc7 = TextEditingController();
  final _puebloIndigena7 = TextEditingController();
  final _clasificacion7 = TextEditingController();
  final _ponderacion7 = TextEditingController();

  final _otroCapacidadDiferente7 = TextEditingController();
  bool valCD7 = false;
  final _otroAdicciones7 = TextEditingController();
  bool valA7 = false;
  List<CondicioneSaludModel> _Condiciones7 = [];
  List<ClasificacionModel> _Clasificaciones7 = [];

  File _image7_1;
  File _image7_2;
  File _image7_3;
  File _image7_4;
  File _image7_5;
  File _fotoAviso7;
  Check _incompleto7 = Check.COMPLETO;

  var foto7_1 = null;
  var foto7_2 = null;
  var foto7_3 = null;
  var foto7_4 = null;
  var foto7_5 = null;

  var fotoAviso7 = null;
  List<CondicioneSaludModel> selectedItemsCond7 = [];
  List<ClasificacionModel> selectedItemsClas7 = [];

  final _nombre8 = TextEditingController();
  final _discapacidades8 = TextEditingController();
  final _adicciones8 = TextEditingController();
  final _condicionSalud8 = TextEditingController();
  final _peso8 = TextEditingController();
  final _talla8 = TextEditingController();
  var _imc8 = TextEditingController();
  final _puebloIndigena8 = TextEditingController();
  final _clasificacion8 = TextEditingController();
  final _ponderacion8 = TextEditingController();

  final _otroCapacidadDiferente8 = TextEditingController();
  bool valCD8 = false;
  final _otroAdicciones8 = TextEditingController();
  bool valA8 = false;
  List<CondicioneSaludModel> _Condiciones8 = [];
  List<ClasificacionModel> _Clasificaciones8 = [];

  File _image8_1;
  File _image8_2;
  File _image8_3;
  File _image8_4;
  File _image8_5;
  File _fotoAviso8;
  Check _incompleto8 = Check.COMPLETO;

  var foto8_1 = null;
  var foto8_2 = null;
  var foto8_3 = null;
  var foto8_4 = null;
  var foto8_5 = null;

  var fotoAviso8 = null;
  List<CondicioneSaludModel> selectedItemsCond8 = [];
  List<ClasificacionModel> selectedItemsClas8 = [];

  final _nombre9 = TextEditingController();
  final _discapacidades9 = TextEditingController();
  final _adicciones9 = TextEditingController();
  final _condicionSalud9 = TextEditingController();
  final _peso9 = TextEditingController();
  final _talla9 = TextEditingController();
  var _imc9 = TextEditingController();
  final _puebloIndigena9 = TextEditingController();
  final _clasificacion9 = TextEditingController();
  final _ponderacion9 = TextEditingController();

  final _otroCapacidadDiferente9 = TextEditingController();
  bool valCD9 = false;
  final _otroAdicciones9 = TextEditingController();
  bool valA9 = false;
  List<CondicioneSaludModel> _Condiciones9 = [];
  List<ClasificacionModel> _Clasificaciones9 = [];

  File _image9_1;
  File _image9_2;
  File _image9_3;
  File _image9_4;
  File _image9_5;
  File _fotoAviso9;
  Check _incompleto9 = Check.COMPLETO;

  var foto9_1 = null;
  var foto9_2 = null;
  var foto9_3 = null;
  var foto9_4 = null;
  var foto9_5 = null;

  var fotoAviso9 = null;
  List<CondicioneSaludModel> selectedItemsCond9 = [];
  List<ClasificacionModel> selectedItemsClas9 = [];

  final _nombre10 = TextEditingController();
  final _discapacidades10 = TextEditingController();
  final _adicciones10 = TextEditingController();
  final _condicionSalud10 = TextEditingController();
  final _peso10 = TextEditingController();
  final _talla10 = TextEditingController();
  var _imc10 = TextEditingController();
  final _puebloIndigena10 = TextEditingController();
  final _clasificacion10 = TextEditingController();
  final _ponderacion10 = TextEditingController();

  final _otroCapacidadDiferente10 = TextEditingController();
  bool valCD10 = false;
  final _otroAdicciones10 = TextEditingController();
  bool valA10 = false;
  List<CondicioneSaludModel> _Condiciones10 = [];
  List<ClasificacionModel> _Clasificaciones10 = [];

  File _image10_1;
  File _image10_2;
  File _image10_3;
  File _image10_4;
  File _image10_5;
  File _fotoAviso10;
  Check _incompleto10 = Check.COMPLETO;

  var foto10_1 = null;
  var foto10_2 = null;
  var foto10_3 = null;
  var foto10_4 = null;
  var foto10_5 = null;

  var fotoAviso10 = null;
  List<CondicioneSaludModel> selectedItemsCond10 = [];
  List<ClasificacionModel> selectedItemsClas10 = [];

  //Variables del renglon 1
  var ponderacionr1 = '';
  var Ordenr1 = '';
  var Pk1 = '';
  var OrdenC1 = '';
//Variables del renglon 2
  var ponderacionr2 = '';
  var Ordenr2 = '';
  var Pk2 = '';
  var OrdenC2 = '';
  //Variables del renglon 3
  var ponderacionr3 = '';
  var Ordenr3 = '';
  var Pk3 = '';
  var OrdenC3 = '';
//Variables del renglon 4
  var ponderacionr4 = '';
  var Ordenr4 = '';
  var Pk4 = '';
  var OrdenC4 = '';
  //Variables del renglon 5
  var ponderacionr5 = '';
  var Ordenr5 = '';
  var Pk5 = '';
  var OrdenC5 = '';
//Variables del renglon 6
  var ponderacionr6 = '';
  var Ordenr6 = '';
  var Pk6 = '';
  var OrdenC6 = '';
  //Variables del renglon 7
  var ponderacionr7 = '';
  var Ordenr7 = '';
  var Pk7 = '';
  var OrdenC7 = '';
//Variables del renglon 8
  var ponderacionr8 = '';
  var Ordenr8 = '';
  var Pk8 = '';
  var OrdenC8 = '';
  //Variables del renglon 9
  var ponderacionr9 = '';
  var Ordenr9 = '';
  var Pk9 = '';
  var OrdenC9 = '';
  //Variables del renglon 10
  var ponderacionr10 = '';
  var Ordenr10 = '';
  var Pk10 = '';
  var OrdenC10 = '';

  final picker = ImagePicker();

  var dbHelper;

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

  List<CapacidadesDiferentes> _Discapacidades = [];
  List<AdiccionesModel> _Adicciones = [];
  List<PuebloIndigenaModel> _PueblosIndigenas = [];

  List<Salud_PertenenciaIndigenenaTablaModel> _SaludPertenencia1 = [];
  List<Salud_PertenenciaIndigenenaTablaModel> _SaludPertenencia2 = [];
  List<Salud_PertenenciaIndigenenaTablaModel> _SaludPertenencia3 = [];
  List<Salud_PertenenciaIndigenenaTablaModel> _SaludPertenencia4 = [];
  List<Salud_PertenenciaIndigenenaTablaModel> _SaludPertenencia5 = [];
  List<Salud_PertenenciaIndigenenaTablaModel> _SaludPertenencia6 = [];
  List<Salud_PertenenciaIndigenenaTablaModel> _SaludPertenencia7 = [];
  List<Salud_PertenenciaIndigenenaTablaModel> _SaludPertenencia8 = [];
  List<Salud_PertenenciaIndigenenaTablaModel> _SaludPertenencia9 = [];
  List<Salud_PertenenciaIndigenenaTablaModel> _SaludPertenencia10 = [];

  List<CapacidadesDiferentes> _OrdenCapacidades = [];
  List<AdiccionesModel> _OrdenAdicciones = [];
  List<PuebloIndigenaModel> _OrdenPuebloIndigena = [];

  List<CondicioneSaludModel> _Ponderaciones1 = [];
  List<CondicioneSaludModel> _Ponderaciones2 = [];
  List<CondicioneSaludModel> _Ponderaciones3 = [];
  List<CondicioneSaludModel> _Ponderaciones4 = [];
  List<CondicioneSaludModel> _Ponderaciones5 = [];
  List<CondicioneSaludModel> _Ponderaciones6 = [];
  List<CondicioneSaludModel> _Ponderaciones7 = [];
  List<CondicioneSaludModel> _Ponderaciones8 = [];
  List<CondicioneSaludModel> _Ponderaciones9 = [];
  List<CondicioneSaludModel> _Ponderaciones10 = [];

  List<CondicioneSaludModel> _OrdenCon1 = [];
  List<CondicioneSaludModel> _OrdenCon2 = [];
  List<CondicioneSaludModel> _OrdenCon3 = [];
  List<CondicioneSaludModel> _OrdenCon4 = [];
  List<CondicioneSaludModel> _OrdenCon5 = [];
  List<CondicioneSaludModel> _OrdenCon6 = [];
  List<CondicioneSaludModel> _OrdenCon7 = [];
  List<CondicioneSaludModel> _OrdenCon8 = [];
  List<CondicioneSaludModel> _OrdenCon9 = [];
  List<CondicioneSaludModel> _OrdenCon10 = [];

  List<ClasificacionModel> _ClaveClas1 = [];
  List<ClasificacionModel> _ClaveClas2 = [];
  List<ClasificacionModel> _ClaveClas3 = [];
  List<ClasificacionModel> _ClaveClas4 = [];
  List<ClasificacionModel> _ClaveClas5 = [];
  List<ClasificacionModel> _ClaveClas6 = [];
  List<ClasificacionModel> _ClaveClas7 = [];
  List<ClasificacionModel> _ClaveClas8 = [];
  List<ClasificacionModel> _ClaveClas9 = [];
  List<ClasificacionModel> _ClaveClas10 = [];

  List<ClasificacionModel> _OrdenClas1 = [];
  List<ClasificacionModel> _OrdenClas2 = [];
  List<ClasificacionModel> _OrdenClas3 = [];
  List<ClasificacionModel> _OrdenClas4 = [];
  List<ClasificacionModel> _OrdenClas5 = [];
  List<ClasificacionModel> _OrdenClas6 = [];
  List<ClasificacionModel> _OrdenClas7 = [];
  List<ClasificacionModel> _OrdenClas8 = [];
  List<ClasificacionModel> _OrdenClas9 = [];
  List<ClasificacionModel> _OrdenClas10 = [];

  @override
  void initState() {
    getAllCategoriesAdicciones();
    getAllCategoriesCondicionesSalud1();
    getAllCategoriesCondicionesSalud2();
    getAllCategoriesCondicionesSalud3();
    getAllCategoriesCondicionesSalud4();
    getAllCategoriesCondicionesSalud5();
    getAllCategoriesCondicionesSalud6();
    getAllCategoriesCondicionesSalud7();
    getAllCategoriesCondicionesSalud8();
    getAllCategoriesCondicionesSalud9();
    getAllCategoriesCondicionesSalud10();
    getAllCategoriesDiscapacidades();
    getAllCategoriesPuebloIndigena();
    getAllCategoriesClasificacionSalud1();
    getAllCategoriesClasificacionSalud2();
    getAllCategoriesClasificacionSalud3();
    getAllCategoriesClasificacionSalud4();
    getAllCategoriesClasificacionSalud5();
    getAllCategoriesClasificacionSalud6();
    getAllCategoriesClasificacionSalud7();
    getAllCategoriesClasificacionSalud8();
    getAllCategoriesClasificacionSalud9();
    getAllCategoriesClasificacionSalud10();
    cargarnombres();
    dbHelper = DbHelper();
  }

  getAllOrdenCondicion1(String condicion) async {
    _OrdenCon1 = [];
    var categories = await CategoryService().readOrdenCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Orden = category['Orden'];
        _OrdenCon1.add(categoryModel);
      });
    });
  }

  getAllPonderaciones1(String condicion) async {
    _Ponderaciones1 = [];
    var categories =
        await CategoryService().readPonderacionCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Ponderacion = category['Ponderacion'];
        _Ponderaciones1.add(categoryModel);
      });
    });
  }

  getAllOrdenCondicion2(String condicion) async {
    _OrdenCon2 = [];
    var categories = await CategoryService().readOrdenCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Orden = category['Orden'];
        _OrdenCon2.add(categoryModel);
      });
    });
  }

  getAllPonderaciones2(String condicion) async {
    _Ponderaciones2 = [];
    var categories =
        await CategoryService().readPonderacionCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Ponderacion = category['Ponderacion'];
        _Ponderaciones2.add(categoryModel);
      });
    });
  }

  getAllOrdenCondicion3(String condicion) async {
    _OrdenCon3 = [];
    var categories = await CategoryService().readOrdenCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Orden = category['Orden'];
        _OrdenCon3.add(categoryModel);
      });
    });
  }

  getAllPonderaciones3(String condicion) async {
    _Ponderaciones3 = [];
    var categories =
        await CategoryService().readPonderacionCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Ponderacion = category['Ponderacion'];
        _Ponderaciones3.add(categoryModel);
      });
    });
  }

  getAllOrdenCondicion4(String condicion) async {
    _OrdenCon4 = [];
    var categories = await CategoryService().readOrdenCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Orden = category['Orden'];
        _OrdenCon4.add(categoryModel);
      });
    });
  }

  getAllPonderaciones4(String condicion) async {
    _Ponderaciones4 = [];
    var categories =
        await CategoryService().readPonderacionCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Ponderacion = category['Ponderacion'];
        _Ponderaciones4.add(categoryModel);
      });
    });
  }

  getAllOrdenCondicion5(String condicion) async {
    _OrdenCon5 = [];
    var categories = await CategoryService().readOrdenCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Orden = category['Orden'];
        _OrdenCon5.add(categoryModel);
      });
    });
  }

  getAllPonderaciones5(String condicion) async {
    _Ponderaciones5 = [];
    var categories =
        await CategoryService().readPonderacionCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Ponderacion = category['Ponderacion'];
        _Ponderaciones5.add(categoryModel);
      });
    });
  }

  getAllOrdenCondicion6(String condicion) async {
    _OrdenCon6 = [];
    var categories = await CategoryService().readOrdenCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Orden = category['Orden'];
        _OrdenCon6.add(categoryModel);
      });
    });
  }

  getAllPonderaciones6(String condicion) async {
    _Ponderaciones6 = [];
    var categories =
        await CategoryService().readPonderacionCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Ponderacion = category['Ponderacion'];
        _Ponderaciones6.add(categoryModel);
      });
    });
  }

  getAllOrdenCondicion7(String condicion) async {
    _OrdenCon7 = [];
    var categories = await CategoryService().readOrdenCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Orden = category['Orden'];
        _OrdenCon7.add(categoryModel);
      });
    });
  }

  getAllPonderaciones7(String condicion) async {
    _Ponderaciones7 = [];
    var categories =
        await CategoryService().readPonderacionCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Ponderacion = category['Ponderacion'];
        _Ponderaciones7.add(categoryModel);
      });
    });
  }

  getAllOrdenCondicion8(String condicion) async {
    _OrdenCon8 = [];
    var categories = await CategoryService().readOrdenCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Orden = category['Orden'];
        _OrdenCon8.add(categoryModel);
      });
    });
  }

  getAllPonderaciones8(String condicion) async {
    _Ponderaciones8 = [];
    var categories =
        await CategoryService().readPonderacionCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Ponderacion = category['Ponderacion'];
        _Ponderaciones8.add(categoryModel);
      });
    });
  }

  getAllOrdenCondicion9(String condicion) async {
    _OrdenCon9 = [];
    var categories = await CategoryService().readOrdenCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Orden = category['Orden'];
        _OrdenCon9.add(categoryModel);
      });
    });
  }

  getAllPonderaciones9(String condicion) async {
    _Ponderaciones9 = [];
    var categories =
        await CategoryService().readPonderacionCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Ponderacion = category['Ponderacion'];
        _Ponderaciones9.add(categoryModel);
      });
    });
  }

  getAllOrdenCondicion10(String condicion) async {
    _OrdenCon10 = [];
    var categories = await CategoryService().readOrdenCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Orden = category['Orden'];
        _OrdenCon10.add(categoryModel);
      });
    });
  }

  getAllPonderaciones10(String condicion) async {
    _Ponderaciones10 = [];
    var categories =
        await CategoryService().readPonderacionCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.Ponderacion = category['Ponderacion'];
        _Ponderaciones10.add(categoryModel);
      });
    });
  }

  getAllOrdenClasCondicion1(String condicion) async {
    _OrdenClas1 = [];
    var categories =
        await CategoryService().readOrdenClasCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        _OrdenClas1.add(categoryModel);
      });
    });
  }

  getAllClaveClas1(String condicion) async {
    _ClaveClas1 = [];
    var categories =
        await CategoryService().readClaveClasCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _ClaveClas1.add(categoryModel);
      });
    });
  }

  getAllOrdenClasCondicion2(String condicion) async {
    _OrdenClas2 = [];
    var categories =
        await CategoryService().readOrdenClasCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        _OrdenClas2.add(categoryModel);
      });
    });
  }

  getAllClaveClas2(String condicion) async {
    _ClaveClas2 = [];
    var categories =
        await CategoryService().readClaveClasCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _ClaveClas2.add(categoryModel);
      });
    });
  }

  getAllOrdenClasCondicion3(String condicion) async {
    _OrdenClas3 = [];
    var categories =
        await CategoryService().readOrdenClasCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        _OrdenClas3.add(categoryModel);
      });
    });
  }

  getAllClaveClas3(String condicion) async {
    _ClaveClas3 = [];
    var categories =
        await CategoryService().readClaveClasCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _ClaveClas3.add(categoryModel);
      });
    });
  }

  getAllOrdenClasCondicion4(String condicion) async {
    _OrdenClas4 = [];
    var categories =
        await CategoryService().readOrdenClasCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        _OrdenClas4.add(categoryModel);
      });
    });
  }

  getAllClaveClas4(String condicion) async {
    _ClaveClas4 = [];
    var categories =
        await CategoryService().readClaveClasCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _ClaveClas4.add(categoryModel);
      });
    });
  }

  getAllOrdenClasCondicion5(String condicion) async {
    _OrdenClas5 = [];
    var categories =
        await CategoryService().readOrdenClasCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        _OrdenClas5.add(categoryModel);
      });
    });
  }

  getAllClaveClas5(String condicion) async {
    _ClaveClas6 = [];
    var categories =
        await CategoryService().readClaveClasCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _ClaveClas5.add(categoryModel);
      });
    });
  }

  getAllOrdenClasCondicion6(String condicion) async {
    _OrdenClas6 = [];
    var categories =
        await CategoryService().readOrdenClasCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        _OrdenClas6.add(categoryModel);
      });
    });
  }

  getAllClaveClas6(String condicion) async {
    _ClaveClas6 = [];
    var categories =
        await CategoryService().readClaveClasCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _ClaveClas6.add(categoryModel);
      });
    });
  }

  getAllOrdenClasCondicion7(String condicion) async {
    _OrdenClas7 = [];
    var categories =
        await CategoryService().readOrdenClasCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        _OrdenClas7.add(categoryModel);
      });
    });
  }

  getAllClaveClas7(String condicion) async {
    _ClaveClas7 = [];
    var categories =
        await CategoryService().readClaveClasCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _ClaveClas7.add(categoryModel);
      });
    });
  }

  getAllOrdenClasCondicion8(String condicion) async {
    _OrdenClas8 = [];
    var categories =
        await CategoryService().readOrdenClasCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        _OrdenClas8.add(categoryModel);
      });
    });
  }

  getAllClaveClas8(String condicion) async {
    _ClaveClas8 = [];
    var categories =
        await CategoryService().readClaveClasCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _ClaveClas8.add(categoryModel);
      });
    });
  }

  getAllOrdenClasCondicion9(String condicion) async {
    _OrdenClas9 = [];
    var categories =
        await CategoryService().readOrdenClasCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        _OrdenClas9.add(categoryModel);
      });
    });
  }

  getAllClaveClas9(String condicion) async {
    _ClaveClas9 = [];
    var categories =
        await CategoryService().readClaveClasCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _ClaveClas9.add(categoryModel);
      });
    });
  }

  getAllOrdenClasCondicion10(String condicion) async {
    _OrdenClas10 = [];
    var categories =
        await CategoryService().readOrdenClasCodicionesSlud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        _OrdenClas10.add(categoryModel);
      });
    });
  }

  getAllClaveClas10(String condicion) async {
    _ClaveClas10 = [];
    var categories =
        await CategoryService().readClaveClasCondicionesSalud(condicion);
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _ClaveClas10.add(categoryModel);
      });
    });
  }

  cargarnombres() {
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
  }

  getAllSaludPertenencia1() async {
    _SaludPertenencia1 = [];
    var categories =
        await CategoryService().readSaludPertenencia(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = Salud_PertenenciaIndigenenaTablaModel();
        categoryModel.folio = category['folio'];
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
        categoryModel.fotoAviso = category['fotoAviso'];
        categoryModel.ClaveEtniaIndigena = category['ClaveEtniaIndigena'];
        categoryModel.OrdenEtniaIndigena = category['OrdenEtniaIndigena'];
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        categoryModel.otroAdicciones = category['otroAdicciones'];
        categoryModel.otroCapacidadDiferente =
            category['otroCapacidadDiferente'];
        _SaludPertenencia1.add(categoryModel);
      });
    });

    _discapacidades1.text =
        _SaludPertenencia1.map((e) => e.ClaveCapacidadDiferente).first +
            " " +
            _SaludPertenencia1.map((e) => e.CapacidadDiferente).first;
    _adicciones1.text = _SaludPertenencia1.map((e) => e.ClaveAdiccion).first +
        " " +
        _SaludPertenencia1.map((e) => e.Adiccion).first;

    _condicionSalud1.text =
        _SaludPertenencia1.map((e) => e.CondicionesSalud).first;
    Ordenr1 = _SaludPertenencia1.map((e) => e.OrdenCondicionesSalud).first;

    _peso1.text = _SaludPertenencia1.map((e) => e.peso.toString()).first;
    _talla1.text = _SaludPertenencia1.map((e) => e.talla.toString()).first;
    _puebloIndigena1.text =
        _SaludPertenencia1.map((e) => e.ClaveEtniaIndigena).first +
            " " +
            _SaludPertenencia1.map((e) => e.EtniaIndigena).first;

    _clasificacion1.text =
        _SaludPertenencia1.map((e) => e.ClasCondicionesSalud.toString()).first;
    Pk1 = _SaludPertenencia1.map((e) => e.ClaveClasCondicionesSalud.toString())
        .first;
    OrdenC1 =
        _SaludPertenencia1.map((e) => e.ClaveClasCondicionesSalud.toString())
            .first;

    _ponderacion1.text =
        _SaludPertenencia1.map((e) => e.ponderacion.toString()).first;

    setFoto1(_SaludPertenencia1.map((e) => e.fileFoto1.toString()).first);
    setFoto2(_SaludPertenencia1.map((e) => e.fileFoto2.toString()).first);
    setFoto3(_SaludPertenencia1.map((e) => e.fileFoto3.toString()).first);
    setFoto4(_SaludPertenencia1.map((e) => e.fileFoto4.toString()).first);
    setFoto5(_SaludPertenencia1.map((e) => e.fileFoto5.toString()).first);
    setFotoAviso1(_SaludPertenencia1.map((e) => e.fotoAviso.toString()).first);

    _otroAdicciones1.text =
        _SaludPertenencia1.map((e) => e.otroAdicciones).first;
    _otroCapacidadDiferente1.text =
        _SaludPertenencia1.map((e) => e.otroCapacidadDiferente).first;
  }

  setFoto1(String foto) {
    setState(() {
      if (foto != "") {
        foto1_1 = foto;
      } else {}
    });
  }

  setFoto2(String foto) {
    setState(() {
      if (foto != "") {
        foto1_2 = foto;
      } else {}
    });
  }

  setFoto3(String foto) {
    setState(() {
      if (foto != "") {
        foto1_3 = foto;
      } else {}
    });
  }

  setFoto4(String foto) {
    setState(() {
      if (foto != "") {
        foto1_4 = foto;
      } else {}
    });
  }

  setFoto5(String foto) {
    setState(() {
      if (foto != "") {
        foto1_5 = foto;
      } else {}
    });
  }

  setFotoAviso1(String foto) {
    setState(() {
      if (foto != "") {
        fotoAviso1 = foto;
      } else {}
    });
  }

  setFoto1_2(String foto) {
    setState(() {
      if (foto != "") {
        foto2_1 = foto;
      } else {}
    });
  }

  setFoto2_2(String foto) {
    setState(() {
      if (foto != "") {
        foto2_2 = foto;
      } else {}
    });
  }

  setFoto3_2(String foto) {
    setState(() {
      if (foto != "") {
        foto2_3 = foto;
      } else {}
    });
  }

  setFoto4_2(String foto) {
    setState(() {
      if (foto != "") {
        foto2_4 = foto;
      } else {}
    });
  }

  setFoto5_2(String foto) {
    setState(() {
      if (foto != "") {
        foto2_5 = foto;
      } else {}
    });
  }

  setFotoAviso2(String foto) {
    setState(() {
      if (foto != "") {
        fotoAviso2 = foto;
      } else {}
    });
  }

  getAllSaludPertenencia2() async {
    _SaludPertenencia2 = [];
    var categories =
        await CategoryService().readSaludPertenencia2(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = Salud_PertenenciaIndigenenaTablaModel();
        categoryModel.folio = category['folio'];
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
        categoryModel.fotoAviso = category['fotoAviso'];
        categoryModel.ClaveEtniaIndigena = category['ClaveEtniaIndigena'];
        categoryModel.OrdenEtniaIndigena = category['OrdenEtniaIndigena'];
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        categoryModel.otroAdicciones = category['otroAdicciones'];
        categoryModel.otroCapacidadDiferente =
            category['otroCapacidadDiferente'];

        _SaludPertenencia2.add(categoryModel);
      });
    });

    _discapacidades2.text =
        _SaludPertenencia2.map((e) => e.ClaveCapacidadDiferente).first +
            " " +
            _SaludPertenencia2.map((e) => e.CapacidadDiferente).first;
    _adicciones2.text = _SaludPertenencia2.map((e) => e.ClaveAdiccion).first +
        " " +
        _SaludPertenencia2.map((e) => e.Adiccion).first;

    _condicionSalud2.text =
        _SaludPertenencia2.map((e) => e.CondicionesSalud).first;
    Ordenr2 = _SaludPertenencia2.map((e) => e.OrdenCondicionesSalud).first;

    _peso2.text = _SaludPertenencia2.map((e) => e.peso.toString()).first;
    _talla2.text = _SaludPertenencia2.map((e) => e.talla.toString()).first;
    _puebloIndigena2.text =
        _SaludPertenencia2.map((e) => e.ClaveEtniaIndigena).first +
            " " +
            _SaludPertenencia2.map((e) => e.EtniaIndigena).first;

    _clasificacion2.text =
        _SaludPertenencia2.map((e) => e.ClasCondicionesSalud.toString()).first;
    Pk2 = _SaludPertenencia2.map((e) => e.ClaveClasCondicionesSalud.toString())
        .first;
    OrdenC2 =
        _SaludPertenencia2.map((e) => e.ClaveClasCondicionesSalud.toString())
            .first;

    _ponderacion2.text =
        _SaludPertenencia2.map((e) => e.ponderacion.toString()).first;

    setFoto1_2(_SaludPertenencia2.map((e) => e.fileFoto1.toString()).first);
    setFoto2_2(_SaludPertenencia2.map((e) => e.fileFoto2.toString()).first);
    setFoto3_2(_SaludPertenencia2.map((e) => e.fileFoto3.toString()).first);
    setFoto4_2(_SaludPertenencia2.map((e) => e.fileFoto4.toString()).first);
    setFoto5_2(_SaludPertenencia2.map((e) => e.fileFoto5.toString()).first);
    setFotoAviso2(_SaludPertenencia2.map((e) => e.fotoAviso.toString()).first);

    _otroAdicciones2.text =
        _SaludPertenencia2.map((e) => e.otroAdicciones).first;
    _otroCapacidadDiferente2.text =
        _SaludPertenencia2.map((e) => e.otroCapacidadDiferente).first;
  }

  getAllSaludPertenencia3() async {
    _SaludPertenencia3 = [];
    var categories =
        await CategoryService().readSaludPertenencia3(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = Salud_PertenenciaIndigenenaTablaModel();
        categoryModel.folio = category['folio'];
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
        categoryModel.fotoAviso = category['fotoAviso'];
        categoryModel.ClaveEtniaIndigena = category['ClaveEtniaIndigena'];
        categoryModel.OrdenEtniaIndigena = category['OrdenEtniaIndigena'];
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        categoryModel.otroAdicciones = category['otroAdicciones'];
        categoryModel.otroCapacidadDiferente =
            category['otroCapacidadDiferente'];

        _SaludPertenencia3.add(categoryModel);
      });
    });

    _discapacidades3.text =
        _SaludPertenencia3.map((e) => e.ClaveCapacidadDiferente).first +
            " " +
            _SaludPertenencia3.map((e) => e.CapacidadDiferente).first;
    _adicciones3.text = _SaludPertenencia3.map((e) => e.ClaveAdiccion).first +
        " " +
        _SaludPertenencia3.map((e) => e.Adiccion).first;

    _condicionSalud3.text =
        _SaludPertenencia3.map((e) => e.CondicionesSalud).first;
    Ordenr3 = _SaludPertenencia3.map((e) => e.OrdenCondicionesSalud).first;

    _peso3.text = _SaludPertenencia3.map((e) => e.peso.toString()).first;
    _talla3.text = _SaludPertenencia3.map((e) => e.talla.toString()).first;
    _puebloIndigena3.text =
        _SaludPertenencia3.map((e) => e.ClaveEtniaIndigena).first +
            " " +
            _SaludPertenencia3.map((e) => e.EtniaIndigena).first;

    _clasificacion3.text =
        _SaludPertenencia3.map((e) => e.ClasCondicionesSalud.toString()).first;
    Pk3 = _SaludPertenencia3.map((e) => e.ClaveClasCondicionesSalud.toString())
        .first;
    OrdenC3 =
        _SaludPertenencia3.map((e) => e.ClaveClasCondicionesSalud.toString())
            .first;

    _ponderacion3.text =
        _SaludPertenencia3.map((e) => e.ponderacion.toString()).first;

    setFoto1_3(_SaludPertenencia3.map((e) => e.fileFoto1.toString()).first);
    setFoto2_3(_SaludPertenencia3.map((e) => e.fileFoto2.toString()).first);
    setFoto3_3(_SaludPertenencia3.map((e) => e.fileFoto3.toString()).first);
    setFoto4_3(_SaludPertenencia3.map((e) => e.fileFoto4.toString()).first);
    setFoto5_3(_SaludPertenencia3.map((e) => e.fileFoto5.toString()).first);
    setFotoAviso3(_SaludPertenencia3.map((e) => e.fotoAviso.toString()).first);

    _otroAdicciones3.text =
        _SaludPertenencia3.map((e) => e.otroAdicciones).first;
    _otroCapacidadDiferente3.text =
        _SaludPertenencia3.map((e) => e.otroCapacidadDiferente).first;
  }

  setFoto1_3(String foto) {
    setState(() {
      if (foto != "") {
        foto3_1 = foto;
      } else {}
    });
  }

  setFoto2_3(String foto) {
    setState(() {
      if (foto != "") {
        foto3_2 = foto;
      } else {}
    });
  }

  setFoto3_3(String foto) {
    setState(() {
      if (foto != "") {
        foto3_3 = foto;
      } else {}
    });
  }

  setFoto4_3(String foto) {
    setState(() {
      if (foto != "") {
        foto3_4 = foto;
      } else {}
    });
  }

  setFoto5_3(String foto) {
    setState(() {
      if (foto != "") {
        foto3_5 = foto;
      } else {}
    });
  }

  setFotoAviso3(String foto) {
    setState(() {
      if (foto != "") {
        fotoAviso3 = foto;
      } else {}
    });
  }

  getAllSaludPertenencia4() async {
    _SaludPertenencia4 = [];
    var categories =
        await CategoryService().readSaludPertenencia4(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = Salud_PertenenciaIndigenenaTablaModel();
        categoryModel.folio = category['folio'];
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
        categoryModel.fotoAviso = category['fotoAviso'];
        categoryModel.ClaveEtniaIndigena = category['ClaveEtniaIndigena'];
        categoryModel.OrdenEtniaIndigena = category['OrdenEtniaIndigena'];
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        categoryModel.otroAdicciones = category['otroAdicciones'];
        categoryModel.otroCapacidadDiferente =
            category['otroCapacidadDiferente'];

        _SaludPertenencia4.add(categoryModel);
      });
    });

    _discapacidades4.text =
        _SaludPertenencia4.map((e) => e.ClaveCapacidadDiferente).first +
            " " +
            _SaludPertenencia4.map((e) => e.CapacidadDiferente).first;
    _adicciones4.text = _SaludPertenencia4.map((e) => e.ClaveAdiccion).first +
        " " +
        _SaludPertenencia4.map((e) => e.Adiccion).first;

    _condicionSalud4.text =
        _SaludPertenencia4.map((e) => e.CondicionesSalud).first;
    Ordenr4 = _SaludPertenencia4.map((e) => e.OrdenCondicionesSalud).first;

    _peso4.text = _SaludPertenencia4.map((e) => e.peso.toString()).first;
    _talla4.text = _SaludPertenencia4.map((e) => e.talla.toString()).first;
    _puebloIndigena4.text =
        _SaludPertenencia4.map((e) => e.ClaveEtniaIndigena).first +
            " " +
            _SaludPertenencia4.map((e) => e.EtniaIndigena).first;

    _clasificacion4.text =
        _SaludPertenencia4.map((e) => e.ClasCondicionesSalud.toString()).first;
    Pk4 = _SaludPertenencia4.map((e) => e.ClaveClasCondicionesSalud.toString())
        .first;
    OrdenC4 =
        _SaludPertenencia4.map((e) => e.ClaveClasCondicionesSalud.toString())
            .first;

    _ponderacion4.text =
        _SaludPertenencia4.map((e) => e.ponderacion.toString()).first;

    setFoto1_4(_SaludPertenencia4.map((e) => e.fileFoto1.toString()).first);
    setFoto2_4(_SaludPertenencia4.map((e) => e.fileFoto2.toString()).first);
    setFoto3_4(_SaludPertenencia4.map((e) => e.fileFoto3.toString()).first);
    setFoto4_4(_SaludPertenencia4.map((e) => e.fileFoto4.toString()).first);
    setFoto5_4(_SaludPertenencia4.map((e) => e.fileFoto5.toString()).first);

    setFotoAviso4(_SaludPertenencia4.map((e) => e.fotoAviso.toString()).first);

    _otroAdicciones4.text =
        _SaludPertenencia4.map((e) => e.otroAdicciones).first;
    _otroCapacidadDiferente4.text =
        _SaludPertenencia4.map((e) => e.otroCapacidadDiferente).first;
  }

  setFoto1_4(String foto) {
    setState(() {
      if (foto != "") {
        foto4_1 = foto;
      } else {}
    });
  }

  setFoto2_4(String foto) {
    setState(() {
      if (foto != "") {
        foto4_2 = foto;
      } else {}
    });
  }

  setFoto3_4(String foto) {
    setState(() {
      if (foto != "") {
        foto4_3 = foto;
      } else {}
    });
  }

  setFoto4_4(String foto) {
    setState(() {
      if (foto != "") {
        foto4_4 = foto;
      } else {}
    });
  }

  setFoto5_4(String foto) {
    setState(() {
      if (foto != "") {
        foto4_5 = foto;
      } else {}
    });
  }

  setFotoAviso4(String foto) {
    setState(() {
      if (foto != "") {
        fotoAviso4 = foto;
      } else {}
    });
  }

  getAllSaludPertenencia5() async {
    _SaludPertenencia5 = [];
    var categories =
        await CategoryService().readSaludPertenencia5(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = Salud_PertenenciaIndigenenaTablaModel();
        categoryModel.folio = category['folio'];
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
        categoryModel.fotoAviso = category['fotoAviso'];
        categoryModel.ClaveEtniaIndigena = category['ClaveEtniaIndigena'];
        categoryModel.OrdenEtniaIndigena = category['OrdenEtniaIndigena'];
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        categoryModel.otroAdicciones = category['otroAdicciones'];
        categoryModel.otroCapacidadDiferente =
            category['otroCapacidadDiferente'];

        _SaludPertenencia5.add(categoryModel);
      });
    });

    _discapacidades5.text =
        _SaludPertenencia5.map((e) => e.ClaveCapacidadDiferente).first +
            " " +
            _SaludPertenencia5.map((e) => e.CapacidadDiferente).first;
    _adicciones5.text = _SaludPertenencia5.map((e) => e.ClaveAdiccion).first +
        " " +
        _SaludPertenencia5.map((e) => e.Adiccion).first;

    _condicionSalud5.text =
        _SaludPertenencia5.map((e) => e.CondicionesSalud).first;
    Ordenr5 = _SaludPertenencia5.map((e) => e.OrdenCondicionesSalud).first;

    _peso5.text = _SaludPertenencia5.map((e) => e.peso.toString()).first;
    _talla5.text = _SaludPertenencia5.map((e) => e.talla.toString()).first;
    _puebloIndigena5.text =
        _SaludPertenencia5.map((e) => e.ClaveEtniaIndigena).first +
            " " +
            _SaludPertenencia5.map((e) => e.EtniaIndigena).first;

    _clasificacion5.text =
        _SaludPertenencia5.map((e) => e.ClasCondicionesSalud.toString()).first;
    Pk5 = _SaludPertenencia5.map((e) => e.ClaveClasCondicionesSalud.toString())
        .first;
    OrdenC5 =
        _SaludPertenencia5.map((e) => e.ClaveClasCondicionesSalud.toString())
            .first;

    _ponderacion5.text =
        _SaludPertenencia5.map((e) => e.ponderacion.toString()).first;

    setFoto1_5(_SaludPertenencia5.map((e) => e.fileFoto1.toString()).first);
    setFoto2_5(_SaludPertenencia5.map((e) => e.fileFoto2.toString()).first);
    setFoto3_5(_SaludPertenencia5.map((e) => e.fileFoto3.toString()).first);
    setFoto4_5(_SaludPertenencia5.map((e) => e.fileFoto4.toString()).first);
    setFoto5_5(_SaludPertenencia5.map((e) => e.fileFoto5.toString()).first);

    setFotoAviso5(_SaludPertenencia5.map((e) => e.fotoAviso.toString()).first);

    _otroAdicciones5.text =
        _SaludPertenencia5.map((e) => e.otroAdicciones).first;
    _otroCapacidadDiferente5.text =
        _SaludPertenencia5.map((e) => e.otroCapacidadDiferente).first;
  }

  setFoto1_5(String foto) {
    setState(() {
      if (foto != "") {
        foto5_1 = foto;
      } else {}
    });
  }

  setFoto2_5(String foto) {
    setState(() {
      if (foto != "") {
        foto5_2 = foto;
      } else {}
    });
  }

  setFoto3_5(String foto) {
    setState(() {
      if (foto != "") {
        foto5_3 = foto;
      } else {}
    });
  }

  setFoto4_5(String foto) {
    setState(() {
      if (foto != "") {
        foto5_4 = foto;
      } else {}
    });
  }

  setFoto5_5(String foto) {
    setState(() {
      if (foto != "") {
        foto5_5 = foto;
      } else {}
    });
  }

  setFotoAviso5(String foto) {
    setState(() {
      if (foto != "") {
        fotoAviso5 = foto;
      } else {}
    });
  }

  getAllSaludPertenencia6() async {
    _SaludPertenencia6 = [];
    var categories =
        await CategoryService().readSaludPertenencia6(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = Salud_PertenenciaIndigenenaTablaModel();
        categoryModel.folio = category['folio'];
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
        categoryModel.fotoAviso = category['fotoAviso'];
        categoryModel.ClaveEtniaIndigena = category['ClaveEtniaIndigena'];
        categoryModel.OrdenEtniaIndigena = category['OrdenEtniaIndigena'];
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        categoryModel.otroAdicciones = category['otroAdicciones'];
        categoryModel.otroCapacidadDiferente =
            category['otroCapacidadDiferente'];

        _SaludPertenencia6.add(categoryModel);
      });
    });

    _discapacidades6.text =
        _SaludPertenencia6.map((e) => e.ClaveCapacidadDiferente).first +
            " " +
            _SaludPertenencia6.map((e) => e.CapacidadDiferente).first;
    _adicciones6.text = _SaludPertenencia6.map((e) => e.ClaveAdiccion).first +
        " " +
        _SaludPertenencia6.map((e) => e.Adiccion).first;

    _condicionSalud6.text =
        _SaludPertenencia6.map((e) => e.CondicionesSalud).first;
    Ordenr6 = _SaludPertenencia6.map((e) => e.OrdenCondicionesSalud).first;

    _peso6.text = _SaludPertenencia6.map((e) => e.peso.toString()).first;
    _talla6.text = _SaludPertenencia6.map((e) => e.talla.toString()).first;
    _puebloIndigena6.text =
        _SaludPertenencia6.map((e) => e.ClaveEtniaIndigena).first +
            " " +
            _SaludPertenencia6.map((e) => e.EtniaIndigena).first;

    _clasificacion6.text =
        _SaludPertenencia6.map((e) => e.ClasCondicionesSalud.toString()).first;
    Pk6 = _SaludPertenencia6.map((e) => e.ClaveClasCondicionesSalud.toString())
        .first;
    OrdenC6 =
        _SaludPertenencia6.map((e) => e.ClaveClasCondicionesSalud.toString())
            .first;

    _ponderacion6.text =
        _SaludPertenencia6.map((e) => e.ponderacion.toString()).first;

    setFoto1_6(_SaludPertenencia6.map((e) => e.fileFoto1.toString()).first);
    setFoto2_6(_SaludPertenencia6.map((e) => e.fileFoto2.toString()).first);
    setFoto3_6(_SaludPertenencia6.map((e) => e.fileFoto3.toString()).first);
    setFoto4_6(_SaludPertenencia6.map((e) => e.fileFoto4.toString()).first);
    setFoto5_6(_SaludPertenencia6.map((e) => e.fileFoto5.toString()).first);
    setFotoAviso6(_SaludPertenencia6.map((e) => e.fotoAviso.toString()).first);

    _otroAdicciones6.text =
        _SaludPertenencia6.map((e) => e.otroAdicciones).first;
    _otroCapacidadDiferente6.text =
        _SaludPertenencia6.map((e) => e.otroCapacidadDiferente).first;
  }

  setFoto1_6(String foto) {
    setState(() {
      if (foto != "") {
        foto6_1 = foto;
      } else {}
    });
  }

  setFoto2_6(String foto) {
    setState(() {
      if (foto != "") {
        foto6_2 = foto;
      } else {}
    });
  }

  setFoto3_6(String foto) {
    setState(() {
      if (foto != "") {
        foto6_3 = foto;
      } else {}
    });
  }

  setFoto4_6(String foto) {
    setState(() {
      if (foto != "") {
        foto6_4 = foto;
      } else {}
    });
  }

  setFoto5_6(String foto) {
    setState(() {
      if (foto != "") {
        foto6_5 = foto;
      } else {}
    });
  }

  setFotoAviso6(String foto) {
    setState(() {
      if (foto != "") {
        fotoAviso6 = foto;
      } else {}
    });
  }

  getAllSaludPertenencia7() async {
    _SaludPertenencia7 = [];
    var categories =
        await CategoryService().readSaludPertenencia7(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = Salud_PertenenciaIndigenenaTablaModel();
        categoryModel.folio = category['folio'];
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
        categoryModel.fotoAviso = category['fotoAviso'];
        categoryModel.ClaveEtniaIndigena = category['ClaveEtniaIndigena'];
        categoryModel.OrdenEtniaIndigena = category['OrdenEtniaIndigena'];
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        categoryModel.otroAdicciones = category['otroAdicciones'];
        categoryModel.otroCapacidadDiferente =
            category['otroCapacidadDiferente'];

        _SaludPertenencia7.add(categoryModel);
      });
    });

    _discapacidades7.text =
        _SaludPertenencia7.map((e) => e.ClaveCapacidadDiferente).first +
            " " +
            _SaludPertenencia7.map((e) => e.CapacidadDiferente).first;
    _adicciones7.text = _SaludPertenencia7.map((e) => e.ClaveAdiccion).first +
        " " +
        _SaludPertenencia7.map((e) => e.Adiccion).first;

    _condicionSalud7.text =
        _SaludPertenencia7.map((e) => e.CondicionesSalud).first;
    Ordenr7 = _SaludPertenencia7.map((e) => e.OrdenCondicionesSalud).first;

    _peso7.text = _SaludPertenencia7.map((e) => e.peso.toString()).first;
    _talla7.text = _SaludPertenencia7.map((e) => e.talla.toString()).first;
    _puebloIndigena7.text =
        _SaludPertenencia7.map((e) => e.ClaveEtniaIndigena).first +
            " " +
            _SaludPertenencia7.map((e) => e.EtniaIndigena).first;

    _clasificacion7.text =
        _SaludPertenencia7.map((e) => e.ClasCondicionesSalud.toString()).first;
    Pk7 = _SaludPertenencia7.map((e) => e.ClaveClasCondicionesSalud.toString())
        .first;
    OrdenC7 =
        _SaludPertenencia7.map((e) => e.ClaveClasCondicionesSalud.toString())
            .first;
    _ponderacion7.text =
        _SaludPertenencia7.map((e) => e.ponderacion.toString()).first;

    setFoto1_7(_SaludPertenencia7.map((e) => e.fileFoto1.toString()).first);
    setFoto2_7(_SaludPertenencia7.map((e) => e.fileFoto2.toString()).first);
    setFoto3_7(_SaludPertenencia7.map((e) => e.fileFoto3.toString()).first);
    setFoto4_7(_SaludPertenencia7.map((e) => e.fileFoto4.toString()).first);
    setFoto5_7(_SaludPertenencia7.map((e) => e.fileFoto5.toString()).first);
    setFotoAviso7(_SaludPertenencia7.map((e) => e.fotoAviso.toString()).first);

    _otroAdicciones7.text =
        _SaludPertenencia7.map((e) => e.otroAdicciones).first;
    _otroCapacidadDiferente7.text =
        _SaludPertenencia7.map((e) => e.otroCapacidadDiferente).first;
  }

  setFoto1_7(String foto) {
    setState(() {
      if (foto != "") {
        foto7_1 = foto;
      } else {}
    });
  }

  setFoto2_7(String foto) {
    setState(() {
      if (foto != "") {
        foto7_2 = foto;
      } else {}
    });
  }

  setFoto3_7(String foto) {
    setState(() {
      if (foto != "") {
        foto7_3 = foto;
      } else {}
    });
  }

  setFoto4_7(String foto) {
    setState(() {
      if (foto != "") {
        foto7_4 = foto;
      } else {}
    });
  }

  setFoto5_7(String foto) {
    setState(() {
      if (foto != "") {
        foto7_5 = foto;
      } else {}
    });
  }

  setFotoAviso7(String foto) {
    setState(() {
      if (foto != "") {
        fotoAviso7 = foto;
      } else {}
    });
  }

  getAllSaludPertenencia8() async {
    _SaludPertenencia8 = [];
    var categories =
        await CategoryService().readSaludPertenencia8(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = Salud_PertenenciaIndigenenaTablaModel();
        categoryModel.folio = category['folio'];
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
        categoryModel.fotoAviso = category['fotoAviso'];
        categoryModel.ClaveEtniaIndigena = category['ClaveEtniaIndigena'];
        categoryModel.OrdenEtniaIndigena = category['OrdenEtniaIndigena'];
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        categoryModel.otroAdicciones = category['otroAdicciones'];
        categoryModel.otroCapacidadDiferente =
            category['otroCapacidadDiferente'];

        _SaludPertenencia8.add(categoryModel);
      });
    });

    _discapacidades8.text =
        _SaludPertenencia8.map((e) => e.ClaveCapacidadDiferente).first +
            " " +
            _SaludPertenencia8.map((e) => e.CapacidadDiferente).first;
    _adicciones8.text = _SaludPertenencia8.map((e) => e.ClaveAdiccion).first +
        " " +
        _SaludPertenencia8.map((e) => e.Adiccion).first;

    _condicionSalud8.text =
        _SaludPertenencia8.map((e) => e.CondicionesSalud).first;
    Ordenr8 = _SaludPertenencia8.map((e) => e.OrdenCondicionesSalud).first;

    _peso8.text = _SaludPertenencia8.map((e) => e.peso.toString()).first;
    _talla8.text = _SaludPertenencia8.map((e) => e.talla.toString()).first;
    _puebloIndigena8.text =
        _SaludPertenencia8.map((e) => e.ClaveEtniaIndigena).first +
            " " +
            _SaludPertenencia8.map((e) => e.EtniaIndigena).first;

    _clasificacion8.text =
        _SaludPertenencia8.map((e) => e.ClasCondicionesSalud.toString()).first;
    Pk8 = _SaludPertenencia8.map((e) => e.ClaveClasCondicionesSalud.toString())
        .first;
    OrdenC8 =
        _SaludPertenencia8.map((e) => e.ClaveClasCondicionesSalud.toString())
            .first;

    _ponderacion8.text =
        _SaludPertenencia8.map((e) => e.ponderacion.toString()).first;

    setFoto1_8(_SaludPertenencia8.map((e) => e.fileFoto1.toString()).first);
    setFoto2_8(_SaludPertenencia8.map((e) => e.fileFoto2.toString()).first);
    setFoto3_8(_SaludPertenencia8.map((e) => e.fileFoto3.toString()).first);
    setFoto4_8(_SaludPertenencia8.map((e) => e.fileFoto4.toString()).first);
    setFoto5_8(_SaludPertenencia8.map((e) => e.fileFoto5.toString()).first);
    setFotoAviso8(_SaludPertenencia8.map((e) => e.fotoAviso.toString()).first);

    _otroAdicciones8.text =
        _SaludPertenencia8.map((e) => e.otroAdicciones).first;
    _otroCapacidadDiferente8.text =
        _SaludPertenencia8.map((e) => e.otroCapacidadDiferente).first;
  }

  setFoto1_8(String foto) {
    setState(() {
      if (foto != "") {
        foto8_1 = foto;
      } else {}
    });
  }

  setFoto2_8(String foto) {
    setState(() {
      if (foto != "") {
        foto8_2 = foto;
      } else {}
    });
  }

  setFoto3_8(String foto) {
    setState(() {
      if (foto != "") {
        foto8_3 = foto;
      } else {}
    });
  }

  setFoto4_8(String foto) {
    setState(() {
      if (foto != "") {
        foto8_4 = foto;
      } else {}
    });
  }

  setFoto5_8(String foto) {
    setState(() {
      if (foto != "") {
        foto8_5 = foto;
      } else {}
    });
  }

  setFotoAviso8(String foto) {
    setState(() {
      if (foto != "") {
        fotoAviso8 = foto;
      } else {}
    });
  }

  getAllSaludPertenencia9() async {
    _SaludPertenencia9 = [];
    var categories =
        await CategoryService().readSaludPertenencia9(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = Salud_PertenenciaIndigenenaTablaModel();
        categoryModel.folio = category['folio'];
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
        categoryModel.fotoAviso = category['fotoAviso'];
        categoryModel.ClaveEtniaIndigena = category['ClaveEtniaIndigena'];
        categoryModel.OrdenEtniaIndigena = category['OrdenEtniaIndigena'];
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        categoryModel.otroAdicciones = category['otroAdicciones'];
        categoryModel.otroCapacidadDiferente =
            category['otroCapacidadDiferente'];

        _SaludPertenencia9.add(categoryModel);
      });
    });

    _discapacidades9.text =
        _SaludPertenencia9.map((e) => e.ClaveCapacidadDiferente).first +
            " " +
            _SaludPertenencia9.map((e) => e.CapacidadDiferente).first;
    _adicciones9.text = _SaludPertenencia9.map((e) => e.ClaveAdiccion).first +
        " " +
        _SaludPertenencia9.map((e) => e.Adiccion).first;

    _condicionSalud9.text =
        _SaludPertenencia9.map((e) => e.CondicionesSalud).first;
    Ordenr9 = _SaludPertenencia9.map((e) => e.OrdenCondicionesSalud).first;

    _peso9.text = _SaludPertenencia9.map((e) => e.peso.toString()).first;
    _talla9.text = _SaludPertenencia9.map((e) => e.talla.toString()).first;
    _puebloIndigena9.text =
        _SaludPertenencia9.map((e) => e.ClaveEtniaIndigena).first +
            " " +
            _SaludPertenencia9.map((e) => e.EtniaIndigena).first;

    _clasificacion9.text =
        _SaludPertenencia9.map((e) => e.ClasCondicionesSalud.toString()).first;
    Pk9 = _SaludPertenencia9.map((e) => e.ClaveClasCondicionesSalud.toString())
        .first;
    OrdenC9 =
        _SaludPertenencia9.map((e) => e.ClaveClasCondicionesSalud.toString())
            .first;

    _ponderacion9.text =
        _SaludPertenencia9.map((e) => e.ponderacion.toString()).first;

    setFoto1_9(_SaludPertenencia9.map((e) => e.fileFoto1.toString()).first);
    setFoto2_9(_SaludPertenencia9.map((e) => e.fileFoto2.toString()).first);
    setFoto3_9(_SaludPertenencia9.map((e) => e.fileFoto3.toString()).first);
    setFoto4_9(_SaludPertenencia9.map((e) => e.fileFoto4.toString()).first);
    setFoto5_9(_SaludPertenencia9.map((e) => e.fileFoto5.toString()).first);
    setFotoAviso9(_SaludPertenencia9.map((e) => e.fotoAviso.toString()).first);

    _otroAdicciones9.text =
        _SaludPertenencia9.map((e) => e.otroAdicciones).first;
    _otroCapacidadDiferente9.text =
        _SaludPertenencia9.map((e) => e.otroCapacidadDiferente).first;
  }

  setFoto1_9(String foto) {
    setState(() {
      if (foto != "") {
        foto9_1 = foto;
      } else {}
    });
  }

  setFoto2_9(String foto) {
    setState(() {
      if (foto != "") {
        foto9_2 = foto;
      } else {}
    });
  }

  setFoto3_9(String foto) {
    setState(() {
      if (foto != "") {
        foto9_3 = foto;
      } else {}
    });
  }

  setFoto4_9(String foto) {
    setState(() {
      if (foto != "") {
        foto9_4 = foto;
      } else {}
    });
  }

  setFoto5_9(String foto) {
    setState(() {
      if (foto != "") {
        foto9_5 = foto;
      } else {}
    });
  }

  setFotoAviso9(String foto) {
    setState(() {
      if (foto != "") {
        fotoAviso9 = foto;
      } else {}
    });
  }

  getAllSaludPertenencia10() async {
    _SaludPertenencia10 = [];
    var categories =
        await CategoryService().readSaludPertenencia10(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = Salud_PertenenciaIndigenenaTablaModel();
        categoryModel.folio = category['folio'];
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
        categoryModel.fotoAviso = category['fotoAviso'];
        categoryModel.ClaveEtniaIndigena = category['ClaveEtniaIndigena'];
        categoryModel.OrdenEtniaIndigena = category['OrdenEtniaIndigena'];
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        categoryModel.otroAdicciones = category['otroAdicciones'];
        categoryModel.otroCapacidadDiferente =
            category['otroCapacidadDiferente'];

        _SaludPertenencia10.add(categoryModel);
      });
    });

    _discapacidades10.text =
        _SaludPertenencia10.map((e) => e.ClaveCapacidadDiferente).first +
            " " +
            _SaludPertenencia10.map((e) => e.CapacidadDiferente).first;
    _adicciones10.text = _SaludPertenencia10.map((e) => e.ClaveAdiccion).first +
        " " +
        _SaludPertenencia10.map((e) => e.Adiccion).first;

    _condicionSalud10.text =
        _SaludPertenencia10.map((e) => e.CondicionesSalud).first;
    Ordenr10 = _SaludPertenencia10.map((e) => e.OrdenCondicionesSalud).first;

    _peso10.text = _SaludPertenencia10.map((e) => e.peso.toString()).first;
    _talla10.text = _SaludPertenencia10.map((e) => e.talla.toString()).first;
    _puebloIndigena10.text =
        _SaludPertenencia10.map((e) => e.ClaveEtniaIndigena).first +
            " " +
            _SaludPertenencia10.map((e) => e.EtniaIndigena).first;

    _clasificacion10.text =
        _SaludPertenencia10.map((e) => e.ClasCondicionesSalud.toString()).first;
    Pk10 =
        _SaludPertenencia10.map((e) => e.ClaveClasCondicionesSalud.toString())
            .first;
    OrdenC10 =
        _SaludPertenencia10.map((e) => e.ClaveClasCondicionesSalud.toString())
            .first;

    _ponderacion10.text =
        _SaludPertenencia10.map((e) => e.ponderacion.toString()).first;

    setFoto1_10(_SaludPertenencia10.map((e) => e.fileFoto1.toString()).first);
    setFoto2_10(_SaludPertenencia10.map((e) => e.fileFoto2.toString()).first);
    setFoto3_10(_SaludPertenencia10.map((e) => e.fileFoto3.toString()).first);
    setFoto4_10(_SaludPertenencia10.map((e) => e.fileFoto4.toString()).first);
    setFoto5_10(_SaludPertenencia10.map((e) => e.fileFoto5.toString()).first);
    setFotoAviso10(
        _SaludPertenencia10.map((e) => e.fotoAviso.toString()).first);

    _otroAdicciones10.text =
        _SaludPertenencia10.map((e) => e.otroAdicciones).first;
    _otroCapacidadDiferente10.text =
        _SaludPertenencia10.map((e) => e.otroCapacidadDiferente).first;
  }

  setFoto1_10(String foto) {
    setState(() {
      if (foto != "") {
        foto9_1 = foto;
      } else {}
    });
  }

  setFoto2_10(String foto) {
    setState(() {
      if (foto != "") {
        foto9_2 = foto;
      } else {}
    });
  }

  setFoto3_10(String foto) {
    setState(() {
      if (foto != "") {
        foto9_3 = foto;
      } else {}
    });
  }

  setFoto4_10(String foto) {
    setState(() {
      if (foto != "") {
        foto9_4 = foto;
      } else {}
    });
  }

  setFoto5_10(String foto) {
    setState(() {
      if (foto != "") {
        foto9_5 = foto;
      } else {}
    });
  }

  setFotoAviso10(String foto) {
    setState(() {
      if (foto != "") {
        fotoAviso10 = foto;
      } else {}
    });
  }

  cargarDatos() {
    getAllSaludPertenencia1();
    getAllSaludPertenencia2();
    getAllSaludPertenencia3();
    getAllSaludPertenencia4();
    getAllSaludPertenencia5();
    getAllSaludPertenencia6();
    getAllSaludPertenencia7();
    getAllSaludPertenencia8();
    getAllSaludPertenencia9();
    getAllSaludPertenencia10();
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

  Future getImage1_1() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image1_1 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage1_2() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image1_2 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage1_3() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image1_3 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage1_4() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image1_4 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage1_5() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image1_5 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getFotoAviso1() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _fotoAviso1 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage2_1() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image2_1 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage2_2() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image2_2 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage2_3() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image2_3 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage2_4() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image2_4 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage2_5() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image2_5 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getFotoAviso2() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _fotoAviso2 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage3_1() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image3_1 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage3_2() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image3_2 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage3_3() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image3_3 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage3_4() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image3_4 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage3_5() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image3_5 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getFotoAviso3() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _fotoAviso3 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage4_1() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image4_1 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage4_2() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image4_2 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage4_3() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image4_3 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage4_4() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image4_4 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage4_5() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image4_5 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getFotoAviso4() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _fotoAviso4 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage5_1() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image5_1 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage5_2() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image5_2 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage5_3() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image5_3 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage5_4() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image5_4 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage5_5() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image5_5 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getFotoAviso5() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _fotoAviso5 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage6_1() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image6_1 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage6_2() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image6_2 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage6_3() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image6_3 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage6_4() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image6_4 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage6_5() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image6_5 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getFotoAviso6() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _fotoAviso6 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage7_1() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image7_1 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage7_2() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image7_2 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage7_3() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image7_3 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage7_4() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image7_4 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage7_5() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image7_5 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getFotoAviso7() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _fotoAviso7 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage8_1() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image8_1 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage8_2() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image8_2 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage8_3() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image8_3 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage8_4() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image8_4 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage8_5() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image8_5 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getFotoAviso8() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _fotoAviso8 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage9_1() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image9_1 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage9_2() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image9_2 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage9_3() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image9_3 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage9_4() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image9_4 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage9_5() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image9_5 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getFotoAviso9() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _fotoAviso9 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage10_1() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image10_1 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage10_2() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image10_2 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage10_3() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image10_3 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage10_4() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image10_4 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getImage10_5() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image10_5 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  Future getFotoAviso10() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _fotoAviso10 = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  IMC(String peso, String talla) {
    if (peso == "" && talla == "") {
      peso = "0";
      talla = "0";
    }
    double tallaM = double.parse(talla) / 100;
    double indice = double.parse(peso) / pow(tallaM, 2);
    String imc = indice.toStringAsFixed(2);

    return imc;
  }

  getAllCategoriesDiscapacidades() async {
    _Discapacidades = [];
    var categories = await CategoryService().readCategoriesDiscapacidades();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CapacidadesDiferentes();
        categoryModel.CapacidadDiferente = category['CapacidadDiferente'];
        _Discapacidades.add(categoryModel);
      });
    });
  }

  getAllCategoriesCondicionesSalud1() async {
    var categories = await CategoryService().readCategoriesCondicionesSalud();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.CondicionesSalud = category['CondicionesSalud'];
        categoryModel.ClaveCondicionSalud = category['ClaveCondicionesSalud'];
        categoryModel.Ponderacion = category['Ponderacion'];
        _Condiciones1.add(categoryModel);
      });
    });
  }

  getAllCategoriesCondicionesSalud2() async {
    var categories = await CategoryService().readCategoriesCondicionesSalud();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.CondicionesSalud = category['CondicionesSalud'];
        categoryModel.ClaveCondicionSalud = category['ClaveCondicionesSalud'];
        categoryModel.Ponderacion = category['Ponderacion'];
        _Condiciones2.add(categoryModel);
      });
    });
  }

  getAllCategoriesCondicionesSalud3() async {
    var categories = await CategoryService().readCategoriesCondicionesSalud();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.CondicionesSalud = category['CondicionesSalud'];
        categoryModel.ClaveCondicionSalud = category['ClaveCondicionesSalud'];
        categoryModel.Ponderacion = category['Ponderacion'];
        _Condiciones3.add(categoryModel);
      });
    });
  }

  getAllCategoriesCondicionesSalud4() async {
    var categories = await CategoryService().readCategoriesCondicionesSalud();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.CondicionesSalud = category['CondicionesSalud'];
        categoryModel.ClaveCondicionSalud = category['ClaveCondicionesSalud'];
        categoryModel.Ponderacion = category['Ponderacion'];
        _Condiciones4.add(categoryModel);
      });
    });
  }

  getAllCategoriesCondicionesSalud5() async {
    var categories = await CategoryService().readCategoriesCondicionesSalud();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.CondicionesSalud = category['CondicionesSalud'];
        categoryModel.ClaveCondicionSalud = category['ClaveCondicionesSalud'];
        categoryModel.Ponderacion = category['Ponderacion'];
        _Condiciones5.add(categoryModel);
      });
    });
  }

  getAllCategoriesCondicionesSalud6() async {
    var categories = await CategoryService().readCategoriesCondicionesSalud();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.CondicionesSalud = category['CondicionesSalud'];
        categoryModel.ClaveCondicionSalud = category['ClaveCondicionesSalud'];
        categoryModel.Ponderacion = category['Ponderacion'];
        _Condiciones6.add(categoryModel);
      });
    });
  }

  getAllCategoriesCondicionesSalud7() async {
    var categories = await CategoryService().readCategoriesCondicionesSalud();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.CondicionesSalud = category['CondicionesSalud'];
        categoryModel.ClaveCondicionSalud = category['ClaveCondicionesSalud'];
        categoryModel.Ponderacion = category['Ponderacion'];
        _Condiciones7.add(categoryModel);
      });
    });
  }

  getAllCategoriesCondicionesSalud8() async {
    var categories = await CategoryService().readCategoriesCondicionesSalud();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.CondicionesSalud = category['CondicionesSalud'];
        categoryModel.ClaveCondicionSalud = category['ClaveCondicionesSalud'];
        categoryModel.Ponderacion = category['Ponderacion'];
        _Condiciones8.add(categoryModel);
      });
    });
  }

  getAllCategoriesCondicionesSalud9() async {
    var categories = await CategoryService().readCategoriesCondicionesSalud();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.CondicionesSalud = category['CondicionesSalud'];
        categoryModel.ClaveCondicionSalud = category['ClaveCondicionesSalud'];
        categoryModel.Ponderacion = category['Ponderacion'];
        _Condiciones9.add(categoryModel);
      });
    });
  }

  getAllCategoriesCondicionesSalud10() async {
    var categories = await CategoryService().readCategoriesCondicionesSalud();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CondicioneSaludModel();
        categoryModel.CondicionesSalud = category['CondicionesSalud'];
        categoryModel.ClaveCondicionSalud = category['ClaveCondicionesSalud'];
        categoryModel.Ponderacion = category['Ponderacion'];
        _Condiciones10.add(categoryModel);
      });
    });
  }

  getAllCategoriesAdicciones() async {
    _Adicciones = [];
    var categories = await CategoryService().readCategoriesAdicciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = AdiccionesModel();
        categoryModel.Adiccion = category['Adiccion'];
        _Adicciones.add(categoryModel);
      });
    });
  }

  getAllCategoriesPuebloIndigena() async {
    _PueblosIndigenas = [];
    var categories = await CategoryService().readCategoriesPuebloIndigena();
    categories.forEach((category) {
      setState(() {
        var categoryModel = PuebloIndigenaModel();
        categoryModel.EtniaIndigena = category['EtniaIndigena'];
        _PueblosIndigenas.add(categoryModel);
      });
    });
  }

  getAllCategoriesClasificacionSalud1() async {
    var categories = await CategoryService().readCategoriesClasificaciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClasCondicionesSalud = category['ClasCondicionesSalud'];
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _Clasificaciones1.add(categoryModel);
      });
    });
  }

  getAllCategoriesClasificacionSalud2() async {
    var categories = await CategoryService().readCategoriesClasificaciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClasCondicionesSalud = category['ClasCondicionesSalud'];
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _Clasificaciones2.add(categoryModel);
      });
    });
  }

  getAllCategoriesClasificacionSalud3() async {
    var categories = await CategoryService().readCategoriesClasificaciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClasCondicionesSalud = category['ClasCondicionesSalud'];
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _Clasificaciones3.add(categoryModel);
      });
    });
  }

  getAllCategoriesClasificacionSalud4() async {
    var categories = await CategoryService().readCategoriesClasificaciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClasCondicionesSalud = category['ClasCondicionesSalud'];
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _Clasificaciones4.add(categoryModel);
      });
    });
  }

  getAllCategoriesClasificacionSalud5() async {
    var categories = await CategoryService().readCategoriesClasificaciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClasCondicionesSalud = category['ClasCondicionesSalud'];
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _Clasificaciones5.add(categoryModel);
      });
    });
  }

  getAllCategoriesClasificacionSalud6() async {
    var categories = await CategoryService().readCategoriesClasificaciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClasCondicionesSalud = category['ClasCondicionesSalud'];
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _Clasificaciones6.add(categoryModel);
      });
    });
  }

  getAllCategoriesClasificacionSalud7() async {
    var categories = await CategoryService().readCategoriesClasificaciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClasCondicionesSalud = category['ClasCondicionesSalud'];
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _Clasificaciones7.add(categoryModel);
      });
    });
  }

  getAllCategoriesClasificacionSalud8() async {
    var categories = await CategoryService().readCategoriesClasificaciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClasCondicionesSalud = category['ClasCondicionesSalud'];
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _Clasificaciones8.add(categoryModel);
      });
    });
  }

  getAllCategoriesClasificacionSalud9() async {
    var categories = await CategoryService().readCategoriesClasificaciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClasCondicionesSalud = category['ClasCondicionesSalud'];
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _Clasificaciones9.add(categoryModel);
      });
    });
  }

  getAllCategoriesClasificacionSalud10() async {
    var categories = await CategoryService().readCategoriesClasificaciones();
    categories.forEach((category) {
      setState(() {
        var categoryModel = ClasificacionModel();
        categoryModel.ClasCondicionesSalud = category['ClasCondicionesSalud'];
        categoryModel.OrdenClasCondicionesSalud =
            category['OrdenClasCondicionesSalud'];
        categoryModel.ClaveClasCondicionesSalud =
            category['ClaveClasCondicionesSalud'];
        _Clasificaciones10.add(categoryModel);
      });
    });
  }

  List<ClasificacionModel> _selectItemClas1 = [];
  addChecked1Clas() {
    List<ClasificacionModel> previa1 = [];
    previa1 = _Clasificaciones1;
    _selectItemClas1.clear();
    for (var select in previa1) {
      if (select.value == true) _selectItemClas1.add(select);
    }
    setState(() {
      previa1 = _selectItemClas1;
      print(_selectItemClas1);
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var clasificacion = previa1.toString();
    _clasificacion1.text = rpl.replaceSymbol(clasificacion);
  }

  List<ClasificacionModel> _selectItemClas2 = [];
  addChecked2Clas() {
    List<ClasificacionModel> previa1 = [];
    previa1 = _Clasificaciones2;
    _selectItemClas2.clear();
    for (var select in previa1) {
      if (select.value == true) _selectItemClas2.add(select);
    }
    setState(() {
      previa1 = _selectItemClas2;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var clasificacion = previa1.toString();
    _clasificacion2.text = rpl.replaceSymbol(clasificacion);
  }

  List<ClasificacionModel> _selectItemClas3 = [];
  addChecked3Clas() {
    List<ClasificacionModel> previa1 = [];
    previa1 = _Clasificaciones3;
    _selectItemClas3.clear();
    for (var select in previa1) {
      if (select.value == true) _selectItemClas3.add(select);
    }
    setState(() {
      previa1 = _selectItemClas3;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var clasificacion = previa1.toString();
    _clasificacion3.text = rpl.replaceSymbol(clasificacion);
  }

  List<ClasificacionModel> _selectItemClas4 = [];
  addChecked4Clas() {
    List<ClasificacionModel> previa1 = [];
    previa1 = _Clasificaciones4;
    _selectItemClas4.clear();
    for (var select in previa1) {
      if (select.value == true) _selectItemClas4.add(select);
    }
    setState(() {
      previa1 = _selectItemClas4;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var clasificacion = previa1.toString();
    _clasificacion4.text = rpl.replaceSymbol(clasificacion);
  }

  List<ClasificacionModel> _selectItemClas5 = [];
  addChecked5Clas() {
    List<ClasificacionModel> previa1 = [];
    previa1 = _Clasificaciones5;
    _selectItemClas5.clear();
    for (var select in previa1) {
      if (select.value == true) _selectItemClas5.add(select);
    }
    setState(() {
      previa1 = _selectItemClas5;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var clasificacion = previa1.toString();
    _clasificacion5.text = rpl.replaceSymbol(clasificacion);
  }

  List<ClasificacionModel> _selectItemClas6 = [];
  addChecked6Clas() {
    List<ClasificacionModel> previa1 = [];
    previa1 = _Clasificaciones6;
    _selectItemClas6.clear();
    for (var select in previa1) {
      if (select.value == true) _selectItemClas6.add(select);
    }
    setState(() {
      previa1 = _selectItemClas6;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var clasificacion = previa1.toString();
    _clasificacion6.text = rpl.replaceSymbol(clasificacion);
  }

  List<ClasificacionModel> _selectItemClas7 = [];
  addChecked7Clas() {
    List<ClasificacionModel> previa1 = [];
    previa1 = _Clasificaciones7;
    _selectItemClas7.clear();
    for (var select in previa1) {
      if (select.value == true) _selectItemClas7.add(select);
    }
    setState(() {
      previa1 = _selectItemClas7;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var clasificacion = previa1.toString();
    _clasificacion7.text = rpl.replaceSymbol(clasificacion);
  }

  List<ClasificacionModel> _selectItemClas8 = [];
  addChecked8Clas() {
    List<ClasificacionModel> previa1 = [];
    previa1 = _Clasificaciones8;
    _selectItemClas8.clear();
    for (var select in previa1) {
      if (select.value == true) _selectItemClas8.add(select);
    }
    setState(() {
      previa1 = _selectItemClas8;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var clasificacion = previa1.toString();
    _clasificacion8.text = rpl.replaceSymbol(clasificacion);
  }

  List<ClasificacionModel> _selectItemClas9 = [];
  addChecked9Clas() {
    List<ClasificacionModel> previa1 = [];
    previa1 = _Clasificaciones9;
    _selectItemClas9.clear();
    for (var select in previa1) {
      if (select.value == true) _selectItemClas9.add(select);
    }
    setState(() {
      previa1 = _selectItemClas9;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var clasificacion = previa1.toString();
    _clasificacion9.text = rpl.replaceSymbol(clasificacion);
  }

  List<ClasificacionModel> _selectItemClas10 = [];
  addChecked10Clas() {
    List<ClasificacionModel> previa1 = [];
    previa1 = _Clasificaciones10;
    _selectItemClas10.clear();
    for (var select in previa1) {
      if (select.value == true) _selectItemClas10.add(select);
    }
    setState(() {
      previa1 = _selectItemClas10;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var clasificacion = previa1.toString();
    _clasificacion10.text = rpl.replaceSymbol(clasificacion);
  }

  List<CondicioneSaludModel> _selectItemCond1 = [];
  addChecked1Cond() {
    List<CondicioneSaludModel> previa = [];
    previa = _Condiciones1;
    _selectItemCond1.clear();
    for (var select in previa) {
      if (select.value == true) _selectItemCond1.add(select);
    }
    setState(() {
      previa = _selectItemCond1;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var condicion = previa.toString();
    _condicionSalud1.text = rpl.replaceSymbol(condicion);
  }

  List<CondicioneSaludModel> _selectItemCond2 = [];
  addChecked2Cond() {
    List<CondicioneSaludModel> previa = [];
    previa = _Condiciones2;
    _selectItemCond2.clear();
    for (var select in previa) {
      if (select.value == true) _selectItemCond2.add(select);
    }
    setState(() {
      previa = _selectItemCond2;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var condicion = previa.toString();
    _condicionSalud2.text = rpl.replaceSymbol(condicion);
  }

  List<CondicioneSaludModel> _selectItemCond3 = [];
  addChecked3Cond() {
    List<CondicioneSaludModel> previa = [];
    previa = _Condiciones3;
    _selectItemCond3.clear();
    for (var select in previa) {
      if (select.value == true) _selectItemCond3.add(select);
    }
    setState(() {
      previa = _selectItemCond3;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var condicion = previa.toString();
    _condicionSalud3.text = rpl.replaceSymbol(condicion);
  }

  List<CondicioneSaludModel> _selectItemCond4 = [];
  addChecked4Cond() {
    List<CondicioneSaludModel> previa = [];
    previa = _Condiciones4;
    _selectItemCond4.clear();
    for (var select in previa) {
      if (select.value == true) _selectItemCond4.add(select);
    }
    setState(() {
      previa = _selectItemCond4;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var condicion = previa.toString();
    _condicionSalud4.text = rpl.replaceSymbol(condicion);
  }

  List<CondicioneSaludModel> _selectItemCond5 = [];
  addChecked5Cond() {
    List<CondicioneSaludModel> previa = [];
    previa = _Condiciones5;
    _selectItemCond5.clear();
    for (var select in previa) {
      if (select.value == true) _selectItemCond5.add(select);
    }
    setState(() {
      previa = _selectItemCond5;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var condicion = previa.toString();
    _condicionSalud5.text = rpl.replaceSymbol(condicion);
  }

  List<CondicioneSaludModel> _selectItemCond6 = [];
  addChecked6Cond() {
    List<CondicioneSaludModel> previa = [];
    previa = _Condiciones6;
    _selectItemCond6.clear();
    for (var select in previa) {
      if (select.value == true) _selectItemCond6.add(select);
    }
    setState(() {
      previa = _selectItemCond6;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var condicion = previa.toString();
    _condicionSalud6.text = rpl.replaceSymbol(condicion);
  }

  List<CondicioneSaludModel> _selectItemCond7 = [];
  addChecked7Cond() {
    List<CondicioneSaludModel> previa = [];
    previa = _Condiciones7;
    _selectItemCond7.clear();
    for (var select in previa) {
      if (select.value == true) _selectItemCond7.add(select);
    }
    setState(() {
      previa = _selectItemCond7;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var condicion = previa.toString();
    _condicionSalud7.text = rpl.replaceSymbol(condicion);
  }

  List<CondicioneSaludModel> _selectItemCond8 = [];
  addChecked8Cond() {
    List<CondicioneSaludModel> previa = [];
    previa = _Condiciones8;
    _selectItemCond8.clear();
    for (var select in previa) {
      if (select.value == true) _selectItemCond8.add(select);
    }
    setState(() {
      previa = _selectItemCond8;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var condicion = previa.toString();
    _condicionSalud8.text = rpl.replaceSymbol(condicion);
  }

  List<CondicioneSaludModel> _selectItemCond9 = [];
  addChecked9Cond() {
    List<CondicioneSaludModel> previa = [];
    previa = _Condiciones9;
    _selectItemCond9.clear();
    for (var select in previa) {
      if (select.value == true) _selectItemCond9.add(select);
    }
    setState(() {
      previa = _selectItemCond9;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var condicion = previa.toString();
    _condicionSalud9.text = rpl.replaceSymbol(condicion);
  }

  List<CondicioneSaludModel> _selectItemCond10 = [];
  addChecked10Cond() {
    List<CondicioneSaludModel> previa = [];
    previa = _Condiciones10;
    _selectItemCond10.clear();
    for (var select in previa) {
      if (select.value == true) _selectItemCond10.add(select);
    }
    setState(() {
      previa = _selectItemCond10;
    });

    replaceAllLetter rpl = new replaceAllLetter();
    var condicion = previa.toString();
    _condicionSalud10.text = rpl.replaceSymbol(condicion);
  }

  var inco = 'COMPLETO';
  renglon1() async {
    if (_nombre1.text != '') {
      replaceAllNum rpn = new replaceAllNum();

      if (_incompleto1 == Check.INCOMPLETO) {
        inco = 'INCOMPLETO';
      }

      var foto1;
      var foto2;
      var foto3;
      var foto4;
      var foto5;
      var fotoAviso;

      if (_image1_1.isNull) {
        foto1 = "";
      } else {
        foto1 = Utility.base64String(_image1_1.readAsBytesSync());
      }

      if (_fotoAviso1.isNull) {
        fotoAviso = "";
      } else {
        fotoAviso = Utility.base64String(_fotoAviso1.readAsBytesSync());
      }

      if (_image1_2.isNull) {
        foto2 = "";
      } else {
        foto2 = Utility.base64String(_image1_2.readAsBytesSync());
      }

      if (_image1_3.isNull) {
        foto3 = "";
      } else {
        foto3 = Utility.base64String(_image1_3.readAsBytesSync());
      }

      if (_image1_4.isNull) {
        foto4 = "";
      } else {
        foto4 = Utility.base64String(_image1_4.readAsBytesSync());
      }

      if (_image1_5.isNull) {
        foto5 = "";
      } else {
        foto5 = Utility.base64String(_image1_5.readAsBytesSync());
      }

      var value1 = _discapacidades1.text;
      final CapacidadesD = rpn.replaceNum(value1);

      var value2 = _adicciones1.text;
      final ADICCIONES = rpn.replaceNum(value2);

      var value3 = _puebloIndigena1.text;
      final Pueblo = rpn.replaceNum(value3);

      var value4 = _condicionSalud1.text;
      final Condiciones = rpn.replaceNum(value4);

      var value5 = _clasificacion1.text;
      final Clasificacion = rpn.replaceNum(value5);

      _OrdenCapacidades = [];
      var categories1 = await CategoryService()
          .readOrdenCapacidadesDif(_discapacidades1.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel2 = CapacidadesDiferentes();
          categoryModel2.Orden = category['Orden'];
          _OrdenCapacidades.add(categoryModel2);
        });
      });

      _OrdenAdicciones = [];
      var categories2 =
          await CategoryService().readOrdenAdicciones(_adicciones1.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel3 = AdiccionesModel();
          categoryModel3.Orden = category['Orden'];
          _OrdenAdicciones.add(categoryModel3);
        });
      });

      _OrdenPuebloIndigena = [];
      print(_puebloIndigena1.text);
      var categories3 = await CategoryService()
          .readOrdenPuebloIndigena(_puebloIndigena1.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel4 = PuebloIndigenaModel();
          categoryModel4.Orden = category['Orden'];
          _OrdenPuebloIndigena.add(categoryModel4);
        });
      });
      print(_OrdenPuebloIndigena);
      Salud_PertenenciaIndigenenaTablaModel sp =
          Salud_PertenenciaIndigenenaTablaModel(
              folio: int.parse(widget.folio),
              ClaveCapacidadDiferente: _discapacidades1.text.substring(0, 1),
              OrdenCapacidadDiferente:
                  _OrdenCapacidades.map((e) => e.Orden).first,
              CapacidadDiferente: CapacidadesD.trimLeft(),
              ClaveAdiccion: _adicciones1.text.substring(0, 1),
              OrdenAdiccion: _OrdenAdicciones.map((e) => e.Orden).first,
              Adiccion: ADICCIONES.trimLeft(),
              peso: double.parse(_peso1.text),
              talla: double.parse(_talla1.text),
              imc: double.parse(_imc1.text),
              ClaveCondicionesSalud: Ordenr1,
              OrdenCondicionesSalud: Ordenr1,
              CondicionesSalud: _condicionSalud1.text.trimLeft().trimRight(),
              ClaveClasCondicionesSalud: Pk1,
              OrdenClasCondicionesSalud: OrdenC1,
              ClasCondicionesSalud: _clasificacion1.text,
              ponderacion: int.parse(_ponderacion1.text),
              fileFoto1: foto1,
              fileFoto2: foto2,
              fileFoto3: foto3,
              fileFoto4: foto4,
              fileFoto5: foto5,
              fotoAviso: fotoAviso,
              ClaveEtniaIndigena:
                  _puebloIndigena1.text.substring(0, 2).trimRight(),
              OrdenEtniaIndigena:
                  _OrdenPuebloIndigena.map((e) => e.Orden).first,
              EtniaIndigena: Pueblo.trimLeft(),
              incompleto: _incompleto1.name.toString(),
              otroCapacidadDiferente: _otroCapacidadDiferente1.text,
              otroAdicciones: _otroAdicciones1.text,
              dispositivo: widget.dispositivo,
              folioDisp: widget.folioDisp,
              usuario: widget.usuario,
              orden: '0');

      for (var i = 0; i < _selectItemCond1.length; i++) {
        DbHelper().guardarCondicionSalud(
            '0',
            _selectItemCond1[i].ClaveCondicionSalud,
            _selectItemCond1[i].Ponderacion,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      for (var i = 0; i < _selectItemClas1.length; i++) {
        print(_selectItemClas1[i].ClaveClasCondicionesSalud);
        DbHelper().guardarClasificacionSalud(
            '0',
            _selectItemClas1[i].ClaveClasCondicionesSalud,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      await DbHelper().updateIncompleto(inco, int.parse(widget.folio));
      print(inco);
      _SaludGuardar.add(sp);
    } else {
      alertDialog(context, 'El renglon 1 uno puede estar vacio');
    }
  }

  renglon2() async {
    if (_nombre2.text != '') {
      replaceAllNum rpn = new replaceAllNum();
      if (_incompleto2 == Check.INCOMPLETO) {
        inco = 'INCOMPLETO';
      }
      var foto1;
      var foto2;
      var foto3;
      var foto4;
      var foto5;
      var fotoAviso;

      if (_fotoAviso2.isNull) {
        fotoAviso = "";
      } else {
        fotoAviso = Utility.base64String(_fotoAviso2.readAsBytesSync());
      }

      if (_image2_1.isNull) {
        foto1 = "";
      } else {
        foto1 = Utility.base64String(_image2_1.readAsBytesSync());
      }

      if (_image2_2.isNull) {
        foto2 = "";
      } else {
        foto2 = Utility.base64String(_image2_2.readAsBytesSync());
      }

      if (_image2_3.isNull) {
        foto3 = "";
      } else {
        foto3 = Utility.base64String(_image2_3.readAsBytesSync());
      }

      if (_image2_4.isNull) {
        foto4 = "";
      } else {
        foto4 = Utility.base64String(_image2_4.readAsBytesSync());
      }

      if (_image2_5.isNull) {
        foto5 = "";
      } else {
        foto5 = Utility.base64String(_image2_5.readAsBytesSync());
      }

      var value1 = _discapacidades2.text;
      final CapacidadesD = rpn.replaceNum(value1);

      var value2 = _adicciones2.text;
      final ADICCIONES = rpn.replaceNum(value2);

      var value3 = _puebloIndigena2.text;
      final Pueblo = rpn.replaceNum(value3);

      var value4 = _condicionSalud2.text;
      final Condiciones = rpn.replaceNum(value4);

      var value5 = _clasificacion2.text;
      final Clasificacion = rpn.replaceNum(value5);

      _OrdenCapacidades = [];
      var categories1 = await CategoryService()
          .readOrdenCapacidadesDif(_discapacidades2.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel2 = CapacidadesDiferentes();
          categoryModel2.Orden = category['Orden'];
          _OrdenCapacidades.add(categoryModel2);
        });
      });

      _OrdenAdicciones = [];
      var categories2 =
          await CategoryService().readOrdenAdicciones(_adicciones2.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel3 = AdiccionesModel();
          categoryModel3.Orden = category['Orden'];
          _OrdenAdicciones.add(categoryModel3);
        });
      });

      _OrdenPuebloIndigena = [];
      var categories3 = await CategoryService()
          .readOrdenPuebloIndigena(_puebloIndigena2.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel4 = PuebloIndigenaModel();
          categoryModel4.Orden = category['Orden'];
          _OrdenPuebloIndigena.add(categoryModel4);
        });
      });

      Salud_PertenenciaIndigenenaTablaModel sp =
          Salud_PertenenciaIndigenenaTablaModel(
              folio: int.parse(widget.folio),
              ClaveCapacidadDiferente: _discapacidades2.text.substring(0, 1),
              OrdenCapacidadDiferente:
                  _OrdenCapacidades.map((e) => e.Orden).first,
              CapacidadDiferente: CapacidadesD.trimLeft(),
              ClaveAdiccion: _adicciones2.text.substring(0, 1),
              OrdenAdiccion: _OrdenAdicciones.map((e) => e.Orden).first,
              Adiccion: ADICCIONES.trimLeft(),
              peso: double.parse(_peso2.text),
              talla: double.parse(_talla2.text),
              imc: double.parse(_imc2.text),
              ClaveCondicionesSalud: Ordenr2,
              OrdenCondicionesSalud: Ordenr2,
              CondicionesSalud: _condicionSalud2.text.trimLeft().trimRight(),
              ClaveClasCondicionesSalud: Pk2,
              OrdenClasCondicionesSalud: OrdenC2,
              ClasCondicionesSalud: _clasificacion2.text,
              ponderacion: int.parse(_ponderacion2.text),
              fileFoto1: foto1,
              fileFoto2: foto2,
              fileFoto3: foto3,
              fileFoto4: foto4,
              fileFoto5: foto5,
              fotoAviso: fotoAviso,
              ClaveEtniaIndigena:
                  _puebloIndigena2.text.substring(0, 2).trimRight(),
              OrdenEtniaIndigena:
                  _OrdenPuebloIndigena.map((e) => e.Orden).first,
              EtniaIndigena: Pueblo.trimLeft(),
              incompleto: _incompleto2.name.toString(),
              otroCapacidadDiferente: _otroCapacidadDiferente2.text,
              otroAdicciones: _otroAdicciones2.text,
              dispositivo: widget.dispositivo,
              folioDisp: widget.folioDisp,
              usuario: widget.usuario,
              orden: '1');

      for (var i = 0; i < _selectItemCond2.length; i++) {
        DbHelper().guardarCondicionSalud(
            '1',
            _selectItemCond2[i].ClaveCondicionSalud,
            _selectItemCond2[i].Ponderacion,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      for (var i = 0; i < _selectItemClas2.length; i++) {
        DbHelper().guardarClasificacionSalud(
            '1',
            _selectItemClas2[i].ClaveClasCondicionesSalud,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      await DbHelper().updateIncompleto(inco, int.parse(widget.folio));
      print(inco + '2');
      _SaludGuardar.add(sp);
    } else {}
  }

  renglon3() async {
    if (_nombre3.text != '') {
      replaceAllNum rpn = new replaceAllNum();
      if (_incompleto3 == Check.INCOMPLETO) {
        inco = 'INCOMPLETO';
      }
      var foto1;
      var foto2;
      var foto3;
      var foto4;
      var foto5;

      var fotoAviso;

      if (_fotoAviso3.isNull) {
        fotoAviso = "";
      } else {
        fotoAviso = Utility.base64String(_fotoAviso3.readAsBytesSync());
      }

      if (_image3_1.isNull) {
        foto1 = "";
      } else {
        foto1 = Utility.base64String(_image3_1.readAsBytesSync());
      }

      if (_image3_2.isNull) {
        foto2 = "";
      } else {
        foto2 = Utility.base64String(_image3_2.readAsBytesSync());
      }

      if (_image3_3.isNull) {
        foto3 = "";
      } else {
        foto3 = Utility.base64String(_image3_3.readAsBytesSync());
      }

      if (_image3_4.isNull) {
        foto4 = "";
      } else {
        foto4 = Utility.base64String(_image3_4.readAsBytesSync());
      }

      if (_image3_5.isNull) {
        foto5 = "";
      } else {
        foto5 = Utility.base64String(_image3_5.readAsBytesSync());
      }

      var value1 = _discapacidades3.text;
      final CapacidadesD = rpn.replaceNum(value1);

      var value2 = _adicciones3.text;
      final ADICCIONES = rpn.replaceNum(value2);

      var value3 = _puebloIndigena3.text;
      final Pueblo = rpn.replaceNum(value3);

      var value4 = _condicionSalud3.text;
      final Condiciones = rpn.replaceNum(value4);

      var value5 = _clasificacion3.text;
      final Clasificacion = rpn.replaceNum(value5);

      _OrdenCapacidades = [];
      var categories1 = await CategoryService()
          .readOrdenCapacidadesDif(_discapacidades3.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel2 = CapacidadesDiferentes();
          categoryModel2.Orden = category['Orden'];
          _OrdenCapacidades.add(categoryModel2);
        });
      });

      _OrdenAdicciones = [];
      var categories2 =
          await CategoryService().readOrdenAdicciones(_adicciones3.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel3 = AdiccionesModel();
          categoryModel3.Orden = category['Orden'];
          _OrdenAdicciones.add(categoryModel3);
        });
      });

      _OrdenPuebloIndigena = [];
      var categories3 = await CategoryService()
          .readOrdenPuebloIndigena(_puebloIndigena3.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel4 = PuebloIndigenaModel();
          categoryModel4.Orden = category['Orden'];
          _OrdenPuebloIndigena.add(categoryModel4);
        });
      });

      Salud_PertenenciaIndigenenaTablaModel sp =
          Salud_PertenenciaIndigenenaTablaModel(
              folio: int.parse(widget.folio),
              ClaveCapacidadDiferente: _discapacidades3.text.substring(0, 1),
              OrdenCapacidadDiferente:
                  _OrdenCapacidades.map((e) => e.Orden).first,
              CapacidadDiferente: CapacidadesD.trimLeft(),
              ClaveAdiccion: _adicciones3.text.substring(0, 1),
              OrdenAdiccion: _OrdenAdicciones.map((e) => e.Orden).first,
              Adiccion: ADICCIONES.trimLeft(),
              peso: double.parse(_peso3.text),
              talla: double.parse(_talla3.text),
              imc: double.parse(_imc3.text),
              ClaveCondicionesSalud: Ordenr3,
              OrdenCondicionesSalud: Ordenr3,
              CondicionesSalud: _condicionSalud3.text.trimLeft().trimRight(),
              ClaveClasCondicionesSalud: Pk3,
              OrdenClasCondicionesSalud: OrdenC3,
              ClasCondicionesSalud: _clasificacion3.text,
              ponderacion: int.parse(_ponderacion3.text),
              fileFoto1: foto1,
              fileFoto2: foto2,
              fileFoto3: foto3,
              fileFoto4: foto4,
              fileFoto5: foto5,
              fotoAviso: fotoAviso,
              ClaveEtniaIndigena:
                  _puebloIndigena3.text.substring(0, 2).trimRight(),
              OrdenEtniaIndigena:
                  _OrdenPuebloIndigena.map((e) => e.Orden).first,
              EtniaIndigena: Pueblo.trimLeft(),
              incompleto: _incompleto3.name.toString(),
              otroCapacidadDiferente: _otroCapacidadDiferente3.text,
              otroAdicciones: _otroAdicciones3.text,
              dispositivo: widget.dispositivo,
              folioDisp: widget.folioDisp,
              usuario: widget.usuario,
              orden: '2');

      for (var i = 0; i < _selectItemCond3.length; i++) {
        DbHelper().guardarCondicionSalud(
            '2',
            _selectItemCond3[i].ClaveCondicionSalud,
            _selectItemCond3[i].Ponderacion,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      for (var i = 0; i < _selectItemClas3.length; i++) {
        DbHelper().guardarClasificacionSalud(
            '2',
            _selectItemClas3[i].ClaveClasCondicionesSalud,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      await DbHelper().updateIncompleto(inco, int.parse(widget.folio));
      print(inco + '3');
      _SaludGuardar.add(sp);
    } else {}
  }

  renglon4() async {
    if (_nombre4.text != '') {
      replaceAllNum rpn = new replaceAllNum();
      if (_incompleto4 == Check.INCOMPLETO) {
        inco = 'INCOMPLETO';
      }
      var foto1;
      var foto2;
      var foto3;
      var foto4;
      var foto5;

      var fotoAviso;

      if (_fotoAviso4.isNull) {
        fotoAviso = "";
      } else {
        fotoAviso = Utility.base64String(_fotoAviso4.readAsBytesSync());
      }

      if (_image4_1.isNull) {
        foto1 = "";
      } else {
        foto1 = Utility.base64String(_image4_1.readAsBytesSync());
      }

      if (_image4_2.isNull) {
        foto2 = "";
      } else {
        foto2 = Utility.base64String(_image4_2.readAsBytesSync());
      }

      if (_image4_3.isNull) {
        foto3 = "";
      } else {
        foto3 = Utility.base64String(_image4_3.readAsBytesSync());
      }

      if (_image4_4.isNull) {
        foto4 = "";
      } else {
        foto4 = Utility.base64String(_image4_4.readAsBytesSync());
      }

      if (_image4_5.isNull) {
        foto5 = "";
      } else {
        foto5 = Utility.base64String(_image4_5.readAsBytesSync());
      }

      var value1 = _discapacidades4.text;
      final CapacidadesD = rpn.replaceNum(value1);

      var value2 = _adicciones4.text;
      final ADICCIONES = rpn.replaceNum(value2);
      var value3 = _puebloIndigena4.text;
      final Pueblo = rpn.replaceNum(value3);

      var value4 = _condicionSalud4.text;
      final Condiciones = rpn.replaceNum(value4);

      var value5 = _clasificacion4.text;
      final Clasificacion = rpn.replaceNum(value5);

      _OrdenCapacidades = [];
      var categories1 = await CategoryService()
          .readOrdenCapacidadesDif(_discapacidades4.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel2 = CapacidadesDiferentes();
          categoryModel2.Orden = category['Orden'];
          _OrdenCapacidades.add(categoryModel2);
        });
      });

      _OrdenAdicciones = [];
      var categories2 =
          await CategoryService().readOrdenAdicciones(_adicciones4.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel3 = AdiccionesModel();
          categoryModel3.Orden = category['Orden'];
          _OrdenAdicciones.add(categoryModel3);
        });
      });

      _OrdenPuebloIndigena = [];
      var categories3 = await CategoryService()
          .readOrdenPuebloIndigena(_puebloIndigena4.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel4 = PuebloIndigenaModel();
          categoryModel4.Orden = category['Orden'];
          _OrdenPuebloIndigena.add(categoryModel4);
        });
      });

      Salud_PertenenciaIndigenenaTablaModel sp =
          Salud_PertenenciaIndigenenaTablaModel(
              folio: int.parse(widget.folio),
              ClaveCapacidadDiferente: _discapacidades4.text.substring(0, 1),
              OrdenCapacidadDiferente:
                  _OrdenCapacidades.map((e) => e.Orden).first,
              CapacidadDiferente: CapacidadesD.trimLeft(),
              ClaveAdiccion: _adicciones4.text.substring(0, 1),
              OrdenAdiccion: _OrdenAdicciones.map((e) => e.Orden).first,
              Adiccion: ADICCIONES.trimLeft(),
              peso: double.parse(_peso4.text),
              talla: double.parse(_talla4.text),
              imc: double.parse(_imc4.text),
              ClaveCondicionesSalud: Ordenr4,
              OrdenCondicionesSalud: Ordenr4,
              CondicionesSalud: _condicionSalud4.text.trimLeft().trimRight(),
              ClaveClasCondicionesSalud: Pk4,
              OrdenClasCondicionesSalud: OrdenC4,
              ClasCondicionesSalud: _clasificacion4.text,
              ponderacion: int.parse(_ponderacion4.text),
              fileFoto1: foto1,
              fileFoto2: foto2,
              fileFoto3: foto3,
              fileFoto4: foto4,
              fileFoto5: foto5,
              fotoAviso: fotoAviso,
              ClaveEtniaIndigena:
                  _puebloIndigena4.text.substring(0, 2).trimRight(),
              OrdenEtniaIndigena:
                  _OrdenPuebloIndigena.map((e) => e.Orden).first,
              EtniaIndigena: Pueblo.trimLeft(),
              incompleto: _incompleto4.name.toString(),
              otroCapacidadDiferente: _otroCapacidadDiferente4.text,
              otroAdicciones: _otroAdicciones4.text,
              dispositivo: widget.dispositivo,
              folioDisp: widget.folioDisp,
              usuario: widget.usuario,
              orden: '3');

      for (var i = 0; i < _selectItemCond4.length; i++) {
        DbHelper().guardarCondicionSalud(
            '3',
            _selectItemCond4[i].ClaveCondicionSalud,
            _selectItemCond4[i].Ponderacion,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      for (var i = 0; i < _selectItemClas4.length; i++) {
        DbHelper().guardarClasificacionSalud(
            '3',
            _selectItemClas4[i].ClaveClasCondicionesSalud,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      await DbHelper().updateIncompleto(inco, int.parse(widget.folio));
      print(inco + '4');
      _SaludGuardar.add(sp);
    } else {}
  }

  renglon5() async {
    if (_nombre5.text != '') {
      replaceAllNum rpn = new replaceAllNum();
      if (_incompleto5 == Check.INCOMPLETO) {
        inco = 'INCOMPLETO';
      }
      var foto1;
      var foto2;
      var foto3;
      var foto4;
      var foto5;

      var fotoAviso;

      if (_fotoAviso5.isNull) {
        fotoAviso = "";
      } else {
        fotoAviso = Utility.base64String(_fotoAviso5.readAsBytesSync());
      }

      if (_image5_1.isNull) {
        foto1 = "";
      } else {
        foto1 = Utility.base64String(_image5_1.readAsBytesSync());
      }

      if (_image5_2.isNull) {
        foto2 = "";
      } else {
        foto2 = Utility.base64String(_image5_2.readAsBytesSync());
      }

      if (_image5_3.isNull) {
        foto3 = "";
      } else {
        foto3 = Utility.base64String(_image5_3.readAsBytesSync());
      }

      if (_image5_4.isNull) {
        foto4 = "";
      } else {
        foto4 = Utility.base64String(_image5_4.readAsBytesSync());
      }

      if (_image5_5.isNull) {
        foto5 = "";
      } else {
        foto5 = Utility.base64String(_image5_5.readAsBytesSync());
      }

      var value1 = _discapacidades5.text;
      final CapacidadesD = rpn.replaceNum(value1);

      var value2 = _adicciones5.text;
      final ADICCIONES = rpn.replaceNum(value2);

      var value3 = _puebloIndigena5.text;
      final Pueblo = rpn.replaceNum(value3);

      var value4 = _condicionSalud5.text;
      final Condiciones = rpn.replaceNum(value4);

      var value5 = _clasificacion5.text;
      final Clasificacion = rpn.replaceNum(value5);

      _OrdenCapacidades = [];
      var categories1 = await CategoryService()
          .readOrdenCapacidadesDif(_discapacidades5.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel2 = CapacidadesDiferentes();
          categoryModel2.Orden = category['Orden'];
          _OrdenCapacidades.add(categoryModel2);
        });
      });

      _OrdenAdicciones = [];
      var categories2 =
          await CategoryService().readOrdenAdicciones(_adicciones5.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel3 = AdiccionesModel();
          categoryModel3.Orden = category['Orden'];
          _OrdenAdicciones.add(categoryModel3);
        });
      });

      _OrdenPuebloIndigena = [];
      var categories3 = await CategoryService()
          .readOrdenPuebloIndigena(_puebloIndigena5.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel4 = PuebloIndigenaModel();
          categoryModel4.Orden = category['Orden'];
          _OrdenPuebloIndigena.add(categoryModel4);
        });
      });

      Salud_PertenenciaIndigenenaTablaModel sp =
          Salud_PertenenciaIndigenenaTablaModel(
              folio: int.parse(widget.folio),
              ClaveCapacidadDiferente: _discapacidades5.text.substring(0, 1),
              OrdenCapacidadDiferente:
                  _OrdenCapacidades.map((e) => e.Orden).first,
              CapacidadDiferente: CapacidadesD.trimLeft(),
              ClaveAdiccion: _adicciones5.text.substring(0, 1),
              OrdenAdiccion: _OrdenAdicciones.map((e) => e.Orden).first,
              Adiccion: ADICCIONES.trimLeft(),
              peso: double.parse(_peso5.text),
              talla: double.parse(_talla5.text),
              imc: double.parse(_imc5.text),
              ClaveCondicionesSalud: Ordenr5,
              OrdenCondicionesSalud: Ordenr5,
              CondicionesSalud: _condicionSalud5.text.trimLeft().trimRight(),
              ClaveClasCondicionesSalud: Pk5,
              OrdenClasCondicionesSalud: OrdenC5,
              ClasCondicionesSalud: _clasificacion5.text,
              ponderacion: int.parse(_ponderacion5.text),
              fileFoto1: foto1,
              fileFoto2: foto2,
              fileFoto3: foto3,
              fileFoto4: foto4,
              fileFoto5: foto5,
              fotoAviso: fotoAviso,
              ClaveEtniaIndigena:
                  _puebloIndigena5.text.substring(0, 2).trimRight(),
              OrdenEtniaIndigena:
                  _OrdenPuebloIndigena.map((e) => e.Orden).first,
              EtniaIndigena: Pueblo.trimLeft(),
              incompleto: _incompleto5.name.toString(),
              otroCapacidadDiferente: _otroCapacidadDiferente5.text,
              otroAdicciones: _otroAdicciones5.text,
              dispositivo: widget.dispositivo,
              folioDisp: widget.folioDisp,
              usuario: widget.usuario,
              orden: '4');

      for (var i = 0; i < _selectItemCond5.length; i++) {
        DbHelper().guardarCondicionSalud(
            '4',
            _selectItemCond5[i].ClaveCondicionSalud,
            _selectItemCond5[i].Ponderacion,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      for (var i = 0; i < _selectItemClas5.length; i++) {
        DbHelper().guardarClasificacionSalud(
            '4',
            _selectItemClas5[i].ClaveClasCondicionesSalud,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      await DbHelper().updateIncompleto(inco, int.parse(widget.folio));
      print(inco + '5');
      _SaludGuardar.add(sp);
    } else {}
  }

  renglon6() async {
    if (_nombre6.text != '') {
      replaceAllNum rpn = new replaceAllNum();
      if (_incompleto6 == Check.INCOMPLETO) {
        inco = 'INCOMPLETO';
      }
      var foto1;
      var foto2;
      var foto3;
      var foto4;
      var foto5;

      var fotoAviso;

      if (_fotoAviso6.isNull) {
        fotoAviso = "";
      } else {
        fotoAviso = Utility.base64String(_fotoAviso6.readAsBytesSync());
      }

      if (_image6_1.isNull) {
        foto1 = "";
      } else {
        foto1 = Utility.base64String(_image6_1.readAsBytesSync());
      }

      if (_image6_2.isNull) {
        foto2 = "";
      } else {
        foto2 = Utility.base64String(_image6_2.readAsBytesSync());
      }

      if (_image6_3.isNull) {
        foto3 = "";
      } else {
        foto3 = Utility.base64String(_image6_3.readAsBytesSync());
      }

      if (_image6_4.isNull) {
        foto4 = "";
      } else {
        foto4 = Utility.base64String(_image6_4.readAsBytesSync());
      }

      if (_image6_5.isNull) {
        foto5 = "";
      } else {
        foto5 = Utility.base64String(_image6_5.readAsBytesSync());
      }

      var value1 = _discapacidades6.text;
      final CapacidadesD = rpn.replaceNum(value1);

      var value2 = _adicciones6.text;
      final ADICCIONES = rpn.replaceNum(value2);

      var value3 = _puebloIndigena6.text;
      final Pueblo = rpn.replaceNum(value3);

      var value4 = _condicionSalud6.text;
      final Condiciones = rpn.replaceNum(value4);

      var value5 = _clasificacion6.text;
      final Clasificacion = rpn.replaceNum(value5);

      _OrdenCapacidades = [];
      var categories1 = await CategoryService()
          .readOrdenCapacidadesDif(_discapacidades6.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel2 = CapacidadesDiferentes();
          categoryModel2.Orden = category['Orden'];
          _OrdenCapacidades.add(categoryModel2);
        });
      });

      _OrdenAdicciones = [];
      var categories2 =
          await CategoryService().readOrdenAdicciones(_adicciones6.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel3 = AdiccionesModel();
          categoryModel3.Orden = category['Orden'];
          _OrdenAdicciones.add(categoryModel3);
        });
      });

      _OrdenPuebloIndigena = [];
      var categories3 = await CategoryService()
          .readOrdenPuebloIndigena(_puebloIndigena6.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel4 = PuebloIndigenaModel();
          categoryModel4.Orden = category['Orden'];
          _OrdenPuebloIndigena.add(categoryModel4);
        });
      });

      Salud_PertenenciaIndigenenaTablaModel sp =
          Salud_PertenenciaIndigenenaTablaModel(
              folio: int.parse(widget.folio),
              ClaveCapacidadDiferente: _discapacidades6.text.substring(0, 1),
              OrdenCapacidadDiferente:
                  _OrdenCapacidades.map((e) => e.Orden).first,
              CapacidadDiferente: CapacidadesD.trimLeft(),
              ClaveAdiccion: _adicciones6.text.substring(0, 1),
              OrdenAdiccion: _OrdenAdicciones.map((e) => e.Orden).first,
              Adiccion: ADICCIONES.trimLeft(),
              peso: double.parse(_peso6.text),
              talla: double.parse(_talla6.text),
              imc: double.parse(_imc6.text),
              ClaveCondicionesSalud: Ordenr6,
              OrdenCondicionesSalud: Ordenr6,
              CondicionesSalud: _condicionSalud6.text.trimLeft().trimRight(),
              ClaveClasCondicionesSalud: Pk6,
              OrdenClasCondicionesSalud: OrdenC6,
              ClasCondicionesSalud: _clasificacion6.text,
              ponderacion: int.parse(_ponderacion6.text),
              fileFoto1: foto1,
              fileFoto2: foto2,
              fileFoto3: foto3,
              fileFoto4: foto4,
              fileFoto5: foto5,
              fotoAviso: fotoAviso,
              ClaveEtniaIndigena:
                  _puebloIndigena6.text.substring(0, 2).trimRight(),
              OrdenEtniaIndigena:
                  _OrdenPuebloIndigena.map((e) => e.Orden).first,
              EtniaIndigena: Pueblo.trimLeft(),
              incompleto: _incompleto6.name.toString(),
              otroCapacidadDiferente: _otroCapacidadDiferente6.text,
              otroAdicciones: _otroAdicciones6.text,
              dispositivo: widget.dispositivo,
              folioDisp: widget.folioDisp,
              usuario: widget.usuario,
              orden: '5');

      for (var i = 0; i < _selectItemCond6.length; i++) {
        DbHelper().guardarCondicionSalud(
            '5',
            _selectItemCond6[i].ClaveCondicionSalud,
            _selectItemCond6[i].Ponderacion,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      for (var i = 0; i < _selectItemClas6.length; i++) {
        DbHelper().guardarClasificacionSalud(
            '5',
            _selectItemClas6[i].ClaveClasCondicionesSalud,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      await DbHelper().updateIncompleto(inco, int.parse(widget.folio));
      print(inco + '6');
      _SaludGuardar.add(sp);
    } else {}
  }

  renglon7() async {
    if (_nombre7.text != '') {
      replaceAllNum rpn = new replaceAllNum();
      if (_incompleto7 == Check.INCOMPLETO) {
        inco = 'INCOMPLETO';
      }
      var foto1;
      var foto2;
      var foto3;
      var foto4;
      var foto5;

      var fotoAviso;

      if (_fotoAviso7.isNull) {
        fotoAviso = "";
      } else {
        fotoAviso = Utility.base64String(_fotoAviso7.readAsBytesSync());
      }

      if (_image7_1.isNull) {
        foto1 = "";
      } else {
        foto1 = Utility.base64String(_image7_1.readAsBytesSync());
      }

      if (_image7_2.isNull) {
        foto2 = "";
      } else {
        foto2 = Utility.base64String(_image7_2.readAsBytesSync());
      }

      if (_image7_3.isNull) {
        foto3 = "";
      } else {
        foto3 = Utility.base64String(_image7_3.readAsBytesSync());
      }

      if (_image7_4.isNull) {
        foto4 = "";
      } else {
        foto4 = Utility.base64String(_image7_4.readAsBytesSync());
      }

      if (_image7_5.isNull) {
        foto5 = "";
      } else {
        foto5 = Utility.base64String(_image7_5.readAsBytesSync());
      }

      var value1 = _discapacidades7.text;
      final CapacidadesD = rpn.replaceNum(value1);

      var value2 = _adicciones7.text;
      final ADICCIONES = rpn.replaceNum(value2);

      var value3 = _puebloIndigena7.text;
      final Pueblo = rpn.replaceNum(value3);

      var value4 = _condicionSalud7.text;
      final Condiciones = rpn.replaceNum(value4);

      var value5 = _clasificacion7.text;
      final Clasificacion = rpn.replaceNum(value5);

      _OrdenCapacidades = [];
      var categories1 = await CategoryService()
          .readOrdenCapacidadesDif(_discapacidades7.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel2 = CapacidadesDiferentes();
          categoryModel2.Orden = category['Orden'];
          _OrdenCapacidades.add(categoryModel2);
        });
      });

      _OrdenAdicciones = [];
      var categories2 =
          await CategoryService().readOrdenAdicciones(_adicciones7.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel3 = AdiccionesModel();
          categoryModel3.Orden = category['Orden'];
          _OrdenAdicciones.add(categoryModel3);
        });
      });

      _OrdenPuebloIndigena = [];
      var categories3 = await CategoryService()
          .readOrdenPuebloIndigena(_puebloIndigena7.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel4 = PuebloIndigenaModel();
          categoryModel4.Orden = category['Orden'];
          _OrdenPuebloIndigena.add(categoryModel4);
        });
      });

      Salud_PertenenciaIndigenenaTablaModel sp =
          Salud_PertenenciaIndigenenaTablaModel(
              folio: int.parse(widget.folio),
              ClaveCapacidadDiferente: _discapacidades7.text.substring(0, 1),
              OrdenCapacidadDiferente:
                  _OrdenCapacidades.map((e) => e.Orden).first,
              CapacidadDiferente: CapacidadesD.trimLeft(),
              ClaveAdiccion: _adicciones7.text.substring(0, 1),
              OrdenAdiccion: _OrdenAdicciones.map((e) => e.Orden).first,
              Adiccion: ADICCIONES.trimLeft(),
              peso: double.parse(_peso7.text),
              talla: double.parse(_talla7.text),
              imc: double.parse(_imc7.text),
              ClaveCondicionesSalud: Ordenr7,
              OrdenCondicionesSalud: Ordenr7,
              CondicionesSalud: _condicionSalud7.text.trimLeft().trimRight(),
              ClaveClasCondicionesSalud: Pk7,
              OrdenClasCondicionesSalud: OrdenC7,
              ClasCondicionesSalud: _clasificacion7.text,
              ponderacion: int.parse(_ponderacion7.text),
              fileFoto1: foto1,
              fileFoto2: foto2,
              fileFoto3: foto3,
              fileFoto4: foto4,
              fileFoto5: foto5,
              fotoAviso: fotoAviso,
              ClaveEtniaIndigena:
                  _puebloIndigena7.text.substring(0, 2).trimRight(),
              OrdenEtniaIndigena:
                  _OrdenPuebloIndigena.map((e) => e.Orden).first,
              EtniaIndigena: Pueblo.trimLeft(),
              incompleto: _incompleto7.name.toString(),
              otroCapacidadDiferente: _otroCapacidadDiferente7.text,
              otroAdicciones: _otroAdicciones7.text,
              dispositivo: widget.dispositivo,
              folioDisp: widget.folioDisp,
              usuario: widget.usuario,
              orden: '6');

      for (var i = 0; i < _selectItemCond7.length; i++) {
        DbHelper().guardarCondicionSalud(
            '6',
            _selectItemCond7[i].ClaveCondicionSalud,
            _selectItemCond7[i].Ponderacion,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      for (var i = 0; i < _selectItemClas7.length; i++) {
        DbHelper().guardarClasificacionSalud(
            '6',
            _selectItemClas7[i].ClaveClasCondicionesSalud,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      await DbHelper().updateIncompleto(inco, int.parse(widget.folio));
      print(inco + '7');
      _SaludGuardar.add(sp);
    } else {}
  }

  renglon8() async {
    if (_nombre8.text != '') {
      replaceAllNum rpn = new replaceAllNum();
      if (_incompleto8 == Check.INCOMPLETO) {
        inco = 'INCOMPLETO';
      }
      var foto1;
      var foto2;
      var foto3;
      var foto4;
      var foto5;

      var fotoAviso;

      if (_fotoAviso8.isNull) {
        fotoAviso = "";
      } else {
        fotoAviso = Utility.base64String(_fotoAviso8.readAsBytesSync());
      }

      if (_image8_1.isNull) {
        foto1 = "";
      } else {
        foto1 = Utility.base64String(_image8_1.readAsBytesSync());
      }

      if (_image8_2.isNull) {
        foto2 = "";
      } else {
        foto2 = Utility.base64String(_image8_2.readAsBytesSync());
      }

      if (_image8_3.isNull) {
        foto3 = "";
      } else {
        foto3 = Utility.base64String(_image8_3.readAsBytesSync());
      }

      if (_image8_4.isNull) {
        foto4 = "";
      } else {
        foto4 = Utility.base64String(_image8_4.readAsBytesSync());
      }

      if (_image8_5.isNull) {
        foto5 = "";
      } else {
        foto5 = Utility.base64String(_image8_5.readAsBytesSync());
      }

      var value1 = _discapacidades8.text;
      final CapacidadesD = rpn.replaceNum(value1);

      var value2 = _adicciones8.text;
      final ADICCIONES = rpn.replaceNum(value2);

      var value3 = _puebloIndigena8.text;
      final Pueblo = rpn.replaceNum(value3);

      var value4 = _condicionSalud8.text;
      final Condiciones = rpn.replaceNum(value4);

      var value5 = _clasificacion8.text;
      final Clasificacion = rpn.replaceNum(value5);

      _OrdenCapacidades = [];
      var categories1 = await CategoryService()
          .readOrdenCapacidadesDif(_discapacidades8.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel2 = CapacidadesDiferentes();
          categoryModel2.Orden = category['Orden'];
          _OrdenCapacidades.add(categoryModel2);
        });
      });

      _OrdenAdicciones = [];
      var categories2 =
          await CategoryService().readOrdenAdicciones(_adicciones8.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel3 = AdiccionesModel();
          categoryModel3.Orden = category['Orden'];
          _OrdenAdicciones.add(categoryModel3);
        });
      });

      _OrdenPuebloIndigena = [];
      var categories3 = await CategoryService()
          .readOrdenPuebloIndigena(_puebloIndigena8.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel4 = PuebloIndigenaModel();
          categoryModel4.Orden = category['Orden'];
          _OrdenPuebloIndigena.add(categoryModel4);
        });
      });

      Salud_PertenenciaIndigenenaTablaModel sp =
          Salud_PertenenciaIndigenenaTablaModel(
              folio: int.parse(widget.folio),
              ClaveCapacidadDiferente: _discapacidades8.text.substring(0, 1),
              OrdenCapacidadDiferente:
                  _OrdenCapacidades.map((e) => e.Orden).first,
              CapacidadDiferente: CapacidadesD.trimLeft(),
              ClaveAdiccion: _adicciones8.text.substring(0, 1),
              OrdenAdiccion: _OrdenAdicciones.map((e) => e.Orden).first,
              Adiccion: ADICCIONES.trimLeft(),
              peso: double.parse(_peso8.text),
              talla: double.parse(_talla8.text),
              imc: double.parse(_imc8.text),
              ClaveCondicionesSalud: Ordenr8,
              OrdenCondicionesSalud: Ordenr8,
              CondicionesSalud: _condicionSalud8.text.trimLeft().trimRight(),
              ClaveClasCondicionesSalud: Pk8,
              OrdenClasCondicionesSalud: OrdenC8,
              ClasCondicionesSalud: _clasificacion8.text,
              ponderacion: int.parse(_ponderacion8.text),
              fileFoto1: foto1,
              fileFoto2: foto2,
              fileFoto3: foto3,
              fileFoto4: foto4,
              fileFoto5: foto5,
              fotoAviso: fotoAviso,
              ClaveEtniaIndigena:
                  _puebloIndigena8.text.substring(0, 2).trimRight(),
              OrdenEtniaIndigena:
                  _OrdenPuebloIndigena.map((e) => e.Orden).first,
              EtniaIndigena: Pueblo.trimLeft(),
              incompleto: _incompleto8.name.toString(),
              otroCapacidadDiferente: _otroCapacidadDiferente8.text,
              otroAdicciones: _otroAdicciones8.text,
              dispositivo: widget.dispositivo,
              folioDisp: widget.folioDisp,
              usuario: widget.usuario,
              orden: '7');

      for (var i = 0; i < _selectItemCond8.length; i++) {
        DbHelper().guardarCondicionSalud(
            '7',
            _selectItemCond8[i].ClaveCondicionSalud,
            _selectItemCond8[i].Ponderacion,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      for (var i = 0; i < _selectItemClas8.length; i++) {
        DbHelper().guardarClasificacionSalud(
            '7',
            _selectItemClas8[i].ClaveClasCondicionesSalud,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      await DbHelper().updateIncompleto(inco, int.parse(widget.folio));
      print(inco + '8');
      _SaludGuardar.add(sp);
    } else {}
  }

  renglon9() async {
    if (_nombre9.text != '') {
      replaceAllNum rpn = new replaceAllNum();
      if (_incompleto9 == Check.INCOMPLETO) {
        inco = 'INCOMPLETO';
      }
      var foto1;
      var foto2;
      var foto3;
      var foto4;
      var foto5;

      var fotoAviso;

      if (_fotoAviso9.isNull) {
        fotoAviso = "";
      } else {
        fotoAviso = Utility.base64String(_fotoAviso9.readAsBytesSync());
      }

      if (_image9_1.isNull) {
        foto1 = "";
      } else {
        foto1 = Utility.base64String(_image9_1.readAsBytesSync());
      }

      if (_image9_2.isNull) {
        foto2 = "";
      } else {
        foto2 = Utility.base64String(_image9_2.readAsBytesSync());
      }

      if (_image9_3.isNull) {
        foto3 = "";
      } else {
        foto3 = Utility.base64String(_image9_3.readAsBytesSync());
      }

      if (_image9_4.isNull) {
        foto4 = "";
      } else {
        foto4 = Utility.base64String(_image9_4.readAsBytesSync());
      }

      if (_image9_5.isNull) {
        foto5 = "";
      } else {
        foto5 = Utility.base64String(_image9_5.readAsBytesSync());
      }

      var value1 = _discapacidades9.text;
      final CapacidadesD = rpn.replaceNum(value1);

      var value2 = _adicciones9.text;
      final ADICCIONES = rpn.replaceNum(value2);

      var value3 = _puebloIndigena9.text;
      final Pueblo = rpn.replaceNum(value3);

      var value4 = _condicionSalud9.text;
      final Condiciones = rpn.replaceNum(value4);

      var value5 = _clasificacion9.text;
      final Clasificacion = rpn.replaceNum(value5);

      _OrdenCapacidades = [];
      var categories1 = await CategoryService()
          .readOrdenCapacidadesDif(_discapacidades9.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel2 = CapacidadesDiferentes();
          categoryModel2.Orden = category['Orden'];
          _OrdenCapacidades.add(categoryModel2);
        });
      });

      _OrdenAdicciones = [];
      var categories2 =
          await CategoryService().readOrdenAdicciones(_adicciones9.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel3 = AdiccionesModel();
          categoryModel3.Orden = category['Orden'];
          _OrdenAdicciones.add(categoryModel3);
        });
      });

      _OrdenPuebloIndigena = [];
      var categories3 = await CategoryService()
          .readOrdenPuebloIndigena(_puebloIndigena9.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel4 = PuebloIndigenaModel();
          categoryModel4.Orden = category['Orden'];
          _OrdenPuebloIndigena.add(categoryModel4);
        });
      });

      Salud_PertenenciaIndigenenaTablaModel sp =
          Salud_PertenenciaIndigenenaTablaModel(
              folio: int.parse(widget.folio),
              ClaveCapacidadDiferente: _discapacidades9.text.substring(0, 1),
              OrdenCapacidadDiferente:
                  _OrdenCapacidades.map((e) => e.Orden).first,
              CapacidadDiferente: CapacidadesD.trimLeft(),
              ClaveAdiccion: _adicciones9.text.substring(0, 1),
              OrdenAdiccion: _OrdenAdicciones.map((e) => e.Orden).first,
              Adiccion: ADICCIONES.trimLeft(),
              peso: double.parse(_peso9.text),
              talla: double.parse(_talla9.text),
              imc: double.parse(_imc9.text),
              ClaveCondicionesSalud: Ordenr9,
              OrdenCondicionesSalud: Ordenr9,
              CondicionesSalud: _condicionSalud9.text.trimLeft().trimRight(),
              ClaveClasCondicionesSalud: Pk9,
              OrdenClasCondicionesSalud: OrdenC9,
              ClasCondicionesSalud: _clasificacion9.text,
              ponderacion: int.parse(_ponderacion9.text),
              fileFoto1: foto1,
              fileFoto2: foto2,
              fileFoto3: foto3,
              fileFoto4: foto4,
              fileFoto5: foto5,
              fotoAviso: fotoAviso,
              ClaveEtniaIndigena:
                  _puebloIndigena9.text.substring(0, 2).trimRight(),
              OrdenEtniaIndigena:
                  _OrdenPuebloIndigena.map((e) => e.Orden).first,
              EtniaIndigena: Pueblo.trimLeft(),
              incompleto: _incompleto9.name.toString(),
              otroCapacidadDiferente: _otroCapacidadDiferente9.text,
              otroAdicciones: _otroAdicciones9.text,
              dispositivo: widget.dispositivo,
              folioDisp: widget.folioDisp,
              usuario: widget.usuario,
              orden: '8');

      for (var i = 0; i < _selectItemCond9.length; i++) {
        DbHelper().guardarCondicionSalud(
            '8',
            _selectItemCond9[i].ClaveCondicionSalud,
            _selectItemCond9[i].Ponderacion,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      for (var i = 0; i < _selectItemClas9.length; i++) {
        DbHelper().guardarClasificacionSalud(
            '8',
            _selectItemClas9[i].ClaveClasCondicionesSalud,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      await DbHelper().updateIncompleto(inco, int.parse(widget.folio));
      print(inco + '9');
      _SaludGuardar.add(sp);
    } else {}
  }

  renglon10() async {
    if (_nombre10.text != '') {
      replaceAllNum rpn = new replaceAllNum();
      if (_incompleto10 == Check.INCOMPLETO) {
        inco = 'INCOMPLETO';
      }
      var foto1;
      var foto2;
      var foto3;
      var foto4;
      var foto5;

      var fotoAviso;

      if (_fotoAviso10.isNull) {
        fotoAviso = "";
      } else {
        fotoAviso = Utility.base64String(_fotoAviso10.readAsBytesSync());
      }

      if (_image10_1.isNull) {
        foto1 = "";
      } else {
        foto1 = Utility.base64String(_image10_1.readAsBytesSync());
      }

      if (_image10_2.isNull) {
        foto2 = "";
      } else {
        foto2 = Utility.base64String(_image10_2.readAsBytesSync());
      }

      if (_image10_3.isNull) {
        foto3 = "";
      } else {
        foto3 = Utility.base64String(_image10_3.readAsBytesSync());
      }

      if (_image10_4.isNull) {
        foto4 = "";
      } else {
        foto4 = Utility.base64String(_image10_4.readAsBytesSync());
      }

      if (_image10_5.isNull) {
        foto5 = "";
      } else {
        foto5 = Utility.base64String(_image10_5.readAsBytesSync());
      }

      var value1 = _discapacidades10.text;
      final CapacidadesD = rpn.replaceNum(value1);

      var value2 = _adicciones10.text;
      final ADICCIONES = rpn.replaceNum(value2);
      var value3 = _puebloIndigena10.text;
      final Pueblo = rpn.replaceNum(value3);

      var value4 = _condicionSalud10.text;
      final Condiciones = rpn.replaceNum(value4);

      var value5 = _clasificacion10.text;
      final Clasificacion = rpn.replaceNum(value5);
      _OrdenCapacidades = [];
      var categories1 = await CategoryService()
          .readOrdenCapacidadesDif(_discapacidades10.text);
      categories1.forEach((category) {
        setState(() {
          var categoryModel2 = CapacidadesDiferentes();
          categoryModel2.Orden = category['Orden'];
          _OrdenCapacidades.add(categoryModel2);
        });
      });

      _OrdenAdicciones = [];
      var categories2 =
          await CategoryService().readOrdenAdicciones(_adicciones10.text);
      categories2.forEach((category) {
        setState(() {
          var categoryModel3 = AdiccionesModel();
          categoryModel3.Orden = category['Orden'];
          _OrdenAdicciones.add(categoryModel3);
        });
      });

      _OrdenPuebloIndigena = [];
      var categories3 = await CategoryService()
          .readOrdenPuebloIndigena(_puebloIndigena10.text);
      categories3.forEach((category) {
        setState(() {
          var categoryModel4 = PuebloIndigenaModel();
          categoryModel4.Orden = category['Orden'];
          _OrdenPuebloIndigena.add(categoryModel4);
        });
      });

      Salud_PertenenciaIndigenenaTablaModel sp =
          Salud_PertenenciaIndigenenaTablaModel(
              folio: int.parse(widget.folio),
              ClaveCapacidadDiferente: _discapacidades10.text.substring(0, 1),
              OrdenCapacidadDiferente:
                  _OrdenCapacidades.map((e) => e.Orden).first,
              CapacidadDiferente: CapacidadesD.trimLeft(),
              ClaveAdiccion: _adicciones10.text.substring(0, 1),
              OrdenAdiccion: _OrdenAdicciones.map((e) => e.Orden).first,
              Adiccion: ADICCIONES.trimLeft(),
              peso: double.parse(_peso10.text),
              talla: double.parse(_talla10.text),
              imc: double.parse(_imc10.text),
              ClaveCondicionesSalud: Ordenr10,
              OrdenCondicionesSalud: Ordenr10,
              CondicionesSalud: _condicionSalud10.text.trimLeft().trimRight(),
              ClaveClasCondicionesSalud: Pk10,
              OrdenClasCondicionesSalud: OrdenC10,
              ClasCondicionesSalud: _clasificacion10.text,
              ponderacion: int.parse(_ponderacion10.text),
              fileFoto1: foto1,
              fileFoto2: foto2,
              fileFoto3: foto3,
              fileFoto4: foto4,
              fileFoto5: foto5,
              fotoAviso: fotoAviso,
              ClaveEtniaIndigena:
                  _puebloIndigena10.text.substring(0, 2).trimRight(),
              OrdenEtniaIndigena:
                  _OrdenPuebloIndigena.map((e) => e.Orden).first,
              EtniaIndigena: Pueblo.trimLeft(),
              incompleto: _incompleto10.name.toString(),
              otroCapacidadDiferente: _otroCapacidadDiferente10.text,
              otroAdicciones: _otroAdicciones10.text,
              dispositivo: widget.dispositivo,
              folioDisp: widget.folioDisp,
              usuario: widget.usuario,
              orden: '9');

      for (var i = 0; i < _selectItemCond10.length; i++) {
        DbHelper().guardarCondicionSalud(
            '9',
            _selectItemCond10[i].ClaveCondicionSalud,
            _selectItemCond1[i].Ponderacion,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      for (var i = 0; i < _selectItemClas10.length; i++) {
        DbHelper().guardarClasificacionSalud(
            '9',
            _selectItemClas10[i].ClaveClasCondicionesSalud,
            widget.folio,
            widget.folioDisp,
            widget.usuario,
            widget.dispositivo);
      }

      await DbHelper().updateIncompleto(inco, int.parse(widget.folio));
      print(inco + '10');
      _SaludGuardar.add(sp);
    } else {}
  }

  bool cargando = false;
  insertarDatos() async {
    await DbHelper().eliminarSalud(widget.folio, widget.dispositivo);
    setState(() {
      cargando = true;
    });
    _SaludGuardar.clear();
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
      print(_SaludGuardar.toString());
      for (var i = 0; i < _SaludGuardar.length; i++) {
        await DbHelper().saveSalud(_SaludGuardar[i]);
      }
      setState(() {
        cargando = false;
      });
      alertDialog(context, 'Datos guardados con Exito');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => Infraestructura_Vivienda(
                folio: widget.folio,
                dispositivo: widget.dispositivo,
                folioDisp: widget.folioDisp,
                usuario: widget.usuario)),
        (Route<dynamic> route) => false,
      );
    } catch (error) {
      print(error);
      alertDialog(context, 'Ocurrio un error al guardar los datos');
    }
  }

  actualizar() {
    try {
      insertarDatos();
      alertDialog(context, 'Datos Actualizados');
    } catch (e) {
      alertDialog(context, 'Error: Ocurrio un error al guardar');
      print(e);
    }
  }

  g() {
    for (var i = 0; i < _selectItemCond1.length; i++) {
      print(_selectItemCond1[i].ClaveCondicionSalud);
      DbHelper().guardarCondicionSalud(
          '0',
          _selectItemCond1[i].ClaveCondicionSalud,
          _selectItemCond1[i].Ponderacion,
          widget.folio,
          widget.folioDisp,
          widget.usuario,
          widget.dispositivo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SALUD / PERTENENCIA INDIGENA'),
        /* leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => Escolaridad_SeguridadSocialTabla(
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
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                getTextQuestion(question: 'FOLIO'),
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
                      'CARGAR DATOS',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
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
                              DataColumn(label: Text('1')),
                              DataColumn(label: Text('NOMBRES')),
                              DataColumn(label: Text('CAPACIDADES DIFERENTES')),
                              DataColumn(
                                  label: Text('OTRA CAPACIDAD DIFERENTE')),
                              DataColumn(label: Text('ADICCIONES')),
                              DataColumn(label: Text('OTRA ADICCIÓN')),
                              DataColumn(label: Text('PESO (KG)')),
                              DataColumn(label: Text('TALLA (CM)')),
                              DataColumn(label: Text('IMC')),
                              DataColumn(label: Text('CONDICIONES DE SALUD')),
                              DataColumn(label: Text('CLASIFICACIÓN')),
                              DataColumn(
                                  label: Text(
                                      'PONDERACIÓN \n 1 AL 4( 1,2 ES LEVE Y 3,  4 ES GRAVE)')),
                              DataColumn(
                                  label: Text(
                                      'DOCUMENTO \n OBLIGATORIO CUANDO LA PONDERACIÓN SEA 3 O 4')),
                              DataColumn(label: Text('AVISO DE PRIVACIDAD')),
                              DataColumn(label: Text('PUEBLO INDIGENA')),
                              DataColumn(label: Text('INCOMPLETO')),
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
                                        hintText: 'CAPACIDADES DIFERENTES',
                                        labelText: 'CAPACIDADES DIFERENTES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Discapacidades.map(
                                          (discapacidad) => SearchFieldListItem(
                                              discapacidad.CapacidadDiferente,
                                              item: discapacidad)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _discapacidades1,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_discapacidades1.text ==
                                              "5 OTRA") {
                                            valCD1 = true;
                                          } else {
                                            valCD1 = false;
                                            _otroCapacidadDiferente1.clear();
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
                                      controller: _otroCapacidadDiferente1,
                                      enabled: valCD1,
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
                                        hintText: 'OTRA CAPACIDAD DIFERENTE',
                                        labelText: 'OTRA CAPACIDAD DIFERENTE',
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
                                        hintText: 'ADICCIONES',
                                        labelText: 'ADICCIONES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Adicciones.map((adiccion) =>
                                          SearchFieldListItem(adiccion.Adiccion,
                                              item: adiccion)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _adicciones1,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_adicciones1.text == "4 OTRA") {
                                            valA1 = true;
                                          } else {
                                            valA1 = false;
                                            _otroAdicciones1.clear();
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
                                      controller: _otroAdicciones1,
                                      enabled: valA1,
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
                                        hintText: 'OTRA ADICCIÓN',
                                        labelText: 'OTRA ADICCIÓN',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                    controller: _peso1,
                                    hintName: 'PESO (KG)',
                                    inputType: TextInputType.number)),
                                DataCell(getTextDataTable(
                                    controller: _talla1,
                                    hintName: 'TALLA (CM)',
                                    inputType: TextInputType.number)),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(bottom: 45),
                                    width: 300,
                                    child: TextField(
                                      controller: _imc1,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.blue,
                                                style: BorderStyle.solid),
                                          ),
                                          fillColor: Colors.grey[120],
                                          filled: true,
                                          labelText:
                                              'PRESIONAR PARA CALCULAR IMC'),
                                      onTap: () async {
                                        setState(() {
                                          _imc1 =
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: IMC(_peso1.text,
                                                          _talla1.text)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _condicionSalud1,
                                                hintName:
                                                    'CONDICIONES DE SALUD',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Condiciones1
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Condiciones1[
                                                                            index]
                                                                        .value = !_Condiciones1[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Condiciones1[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Condiciones1[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Condiciones1[
                                                                          index]
                                                                      .CondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked1Cond,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _clasificacion1,
                                                hintName: 'CLASIFICACIÓN',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Clasificaciones1
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Clasificaciones1[
                                                                            index]
                                                                        .value = !_Clasificaciones1[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Clasificaciones1[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Clasificaciones1[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Clasificaciones1[
                                                                          index]
                                                                      .ClasCondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked1Clas,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                  controller: _ponderacion1,
                                  hintName: 'PONDERACIÓN',
                                )),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.0),
                                            Container(
                                                child: foto1_1 != null ||
                                                        _image1_1 != null
                                                    ? Text(
                                                        'IMAGEN 1 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 1 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage1_1),
                                            Container(
                                                child: foto1_2 != null ||
                                                        _image1_2 != null
                                                    ? Text(
                                                        'IMAGEN 2 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 2 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage1_2),
                                            Container(
                                                child: foto1_3 != null ||
                                                        _image1_3 != null
                                                    ? Text(
                                                        'IMAGEN 3 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 3 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage1_3),
                                            Container(
                                                child: foto1_4 != null ||
                                                        _image1_4 != null
                                                    ? Text(
                                                        'IMAGEN 4 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 4 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage1_4),
                                            Container(
                                                child: foto1_5 != null ||
                                                        _image1_5 != null
                                                    ? Text(
                                                        'IMAGEN 5 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 5 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage1_5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Column(children: [
                                    Container(
                                        child: fotoAviso1 != null ||
                                                _fotoAviso1 != null
                                            ? Text(
                                                'AVISO DE PRIVACIDAD SELECCIONADO')
                                            : Text(
                                                'AVISO DE PRIVACIDAD NO SELECCIONADO')),
                                    botonFoto(funcion: getFotoAviso1),
                                  ]),
                                ),
                                DataCell(getSearchField(
                                  controller: _puebloIndigena1,
                                  suggestions: _PueblosIndigenas.map((pueblo) =>
                                      SearchFieldListItem(pueblo.EtniaIndigena,
                                          item: pueblo)).toList(),
                                  hintName: 'PUEBLO INDIGENA',
                                )),
                                DataCell(
                                  ListTile(
                                    title: Text('INCOMPLETO'),
                                    leading: Radio<Check>(
                                      value: Check.INCOMPLETO,
                                      toggleable: true,
                                      groupValue: _incompleto1,
                                      onChanged: (Check value) {
                                        setState(() {
                                          _incompleto1 = value;
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
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
                                        hintText: 'CAPACIDADES DIFERENTES',
                                        labelText: 'CAPACIDADES DIFERENTES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Discapacidades.map(
                                          (discapacidad) => SearchFieldListItem(
                                              discapacidad.CapacidadDiferente,
                                              item: discapacidad)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _discapacidades2,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_discapacidades2.text ==
                                              "5 OTRA") {
                                            valCD2 = true;
                                          } else {
                                            valCD2 = false;
                                            _otroCapacidadDiferente2.clear();
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
                                      controller: _otroCapacidadDiferente2,
                                      enabled: valCD2,
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
                                        hintText: 'OTRA CAPACIDAD DIFERENTE',
                                        labelText: 'OTRA CAPACIDAD DIFERENTE',
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
                                        hintText: 'ADICCIONES',
                                        labelText: 'ADICCIONES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Adicciones.map((adiccion) =>
                                          SearchFieldListItem(adiccion.Adiccion,
                                              item: adiccion)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _adicciones2,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_adicciones2.text == "4 OTRA") {
                                            valA2 = true;
                                          } else {
                                            valA2 = false;
                                            _otroAdicciones2.clear();
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
                                      controller: _otroAdicciones2,
                                      enabled: valA2,
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
                                        hintText: 'OTRA ADICCIÓN',
                                        labelText: 'OTRA ADICCIÓN',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                    controller: _peso2,
                                    hintName: 'PESO (KG)',
                                    inputType: TextInputType.number)),
                                DataCell(getTextDataTable(
                                    controller: _talla2,
                                    hintName: 'TALLA (CM)',
                                    inputType: TextInputType.number)),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(bottom: 45),
                                    width: 300,
                                    child: TextField(
                                      controller: _imc2,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.blue,
                                                style: BorderStyle.solid),
                                          ),
                                          fillColor: Colors.grey[120],
                                          filled: true,
                                          labelText:
                                              'PRESIONAR PARA CALCULAR IMC'),
                                      onTap: () async {
                                        setState(() {
                                          _imc2 =
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: IMC(_peso2.text,
                                                          _talla2.text)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _condicionSalud2,
                                                hintName:
                                                    'CONDICIONES DE SALUD',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Condiciones2
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Condiciones2[
                                                                            index]
                                                                        .value = !_Condiciones2[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Condiciones2[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Condiciones2[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Condiciones2[
                                                                          index]
                                                                      .CondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked2Cond,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _clasificacion2,
                                                hintName: 'CLASIFICACIÓN',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Clasificaciones2
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Clasificaciones2[
                                                                            index]
                                                                        .value = !_Clasificaciones2[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Clasificaciones2[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Clasificaciones2[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Clasificaciones2[
                                                                          index]
                                                                      .ClasCondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked2Clas,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                  controller: _ponderacion2,
                                  hintName: 'PONDERACIÓN',
                                )),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.0),
                                            Container(
                                                child: foto2_1 != null ||
                                                        _image2_1 != null
                                                    ? Text(
                                                        'IMAGEN 1 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 1 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage2_1),
                                            Container(
                                                child: foto2_2 != null ||
                                                        _image2_2 != null
                                                    ? Text(
                                                        'IMAGEN 2 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 2 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage2_2),
                                            Container(
                                                child: foto2_3 != null ||
                                                        _image2_3 != null
                                                    ? Text(
                                                        'IMAGEN 3 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 3 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage2_3),
                                            Container(
                                                child: foto2_4 != null ||
                                                        _image2_4 != null
                                                    ? Text(
                                                        'IMAGEN 4 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 4 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage2_4),
                                            Container(
                                                child: foto2_5 != null ||
                                                        _image2_5 != null
                                                    ? Text(
                                                        'IMAGEN 5 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 5 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage2_5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Column(children: [
                                    Container(
                                        child: fotoAviso2 != null ||
                                                _fotoAviso2 != null
                                            ? Text(
                                                'AVISO DE PRIVACIDAD SELECCIONADO')
                                            : Text(
                                                'AVISO DE PRIVACIDAD NO SELECCIONADO')),
                                    botonFoto(funcion: getFotoAviso2),
                                  ]),
                                ),
                                DataCell(getSearchField(
                                  controller: _puebloIndigena2,
                                  suggestions: _PueblosIndigenas.map((pueblo) =>
                                      SearchFieldListItem(pueblo.EtniaIndigena,
                                          item: pueblo)).toList(),
                                  hintName: 'PUEBLO INDIGENA',
                                )),
                                DataCell(
                                  ListTile(
                                    title: Text('INCOMPLETO'),
                                    leading: Radio<Check>(
                                      value: Check.INCOMPLETO,
                                      groupValue: _incompleto2,
                                      toggleable: true,
                                      onChanged: (Check value) {
                                        setState(() {
                                          _incompleto2 = value;
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
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
                                        hintText: 'CAPACIDADES DIFERENTES',
                                        labelText: 'CAPACIDADES DIFERENTES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Discapacidades.map(
                                          (discapacidad) => SearchFieldListItem(
                                              discapacidad.CapacidadDiferente,
                                              item: discapacidad)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _discapacidades3,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_discapacidades3.text ==
                                              "5 OTRA") {
                                            valCD3 = true;
                                          } else {
                                            valCD3 = false;
                                            _otroCapacidadDiferente3.clear();
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
                                      controller: _otroCapacidadDiferente3,
                                      enabled: valCD3,
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
                                        hintText: 'OTRA CAPACIDAD DIFERENTE',
                                        labelText: 'OTRA CAPACIDAD DIFERENTE',
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
                                        hintText: 'ADICCIONES',
                                        labelText: 'ADICCIONES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Adicciones.map((adiccion) =>
                                          SearchFieldListItem(adiccion.Adiccion,
                                              item: adiccion)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _adicciones3,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_adicciones3.text == "4 OTRA") {
                                            valA3 = true;
                                          } else {
                                            valA3 = false;
                                            _otroAdicciones3.clear();
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
                                      controller: _otroAdicciones3,
                                      enabled: valA3,
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
                                        hintText: 'OTRA ADICCIÓN',
                                        labelText: 'OTRA ADICCIÓN',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                    controller: _peso3,
                                    hintName: 'PESO (KG)',
                                    inputType: TextInputType.number)),
                                DataCell(getTextDataTable(
                                    controller: _talla3,
                                    hintName: 'TALLA (CM)',
                                    inputType: TextInputType.number)),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(bottom: 45),
                                    width: 300,
                                    child: TextField(
                                      controller: _imc3,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.blue,
                                                style: BorderStyle.solid),
                                          ),
                                          fillColor: Colors.grey[120],
                                          filled: true,
                                          labelText:
                                              'PRESIONAR PARA CALCULAR IMC'),
                                      onTap: () async {
                                        setState(() {
                                          _imc3 =
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: IMC(_peso3.text,
                                                          _talla3.text)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _condicionSalud3,
                                                hintName:
                                                    'CONDICIONES DE SALUD',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Condiciones3
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Condiciones3[
                                                                            index]
                                                                        .value = !_Condiciones3[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Condiciones3[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Condiciones3[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Condiciones3[
                                                                          index]
                                                                      .CondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked3Cond,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _clasificacion3,
                                                hintName: 'CLASIFICACIÓN',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Clasificaciones3
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Clasificaciones3[
                                                                            index]
                                                                        .value = !_Clasificaciones3[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Clasificaciones3[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Clasificaciones3[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Clasificaciones3[
                                                                          index]
                                                                      .ClasCondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked3Clas,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                  controller: _ponderacion3,
                                  hintName: 'PONDERACIÓN',
                                )),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.0),
                                            Container(
                                                child: foto3_1 != null ||
                                                        _image3_1 != null
                                                    ? Text(
                                                        'IMAGEN 1 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 1 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage3_1),
                                            Container(
                                                child: foto3_2 != null ||
                                                        _image3_2 != null
                                                    ? Text(
                                                        'IMAGEN 2 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 2 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage3_2),
                                            Container(
                                                child: foto3_3 != null ||
                                                        _image3_3 != null
                                                    ? Text(
                                                        'IMAGEN 3 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 3 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage3_3),
                                            Container(
                                                child: foto3_4 != null ||
                                                        _image3_4 != null
                                                    ? Text(
                                                        'IMAGEN 4 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 4 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage3_4),
                                            Container(
                                                child: foto3_5 != null ||
                                                        _image3_5 != null
                                                    ? Text(
                                                        'IMAGEN 5 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 5 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage3_5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Column(children: [
                                    Container(
                                        child: fotoAviso3 != null ||
                                                _fotoAviso3 != null
                                            ? Text(
                                                'AVISO DE PRIVACIDAD SELECCIONADO')
                                            : Text(
                                                'AVISO DE PRIVACIDAD NO SELECCIONADO')),
                                    botonFoto(funcion: getFotoAviso3),
                                  ]),
                                ),
                                DataCell(getSearchField(
                                  controller: _puebloIndigena3,
                                  suggestions: _PueblosIndigenas.map((pueblo) =>
                                      SearchFieldListItem(pueblo.EtniaIndigena,
                                          item: pueblo)).toList(),
                                  hintName: 'PUEBLO INDIGENA',
                                )),
                                DataCell(
                                  ListTile(
                                    title: Text('INCOMPLETO'),
                                    leading: Radio<Check>(
                                      value: Check.INCOMPLETO,
                                      groupValue: _incompleto3,
                                      toggleable: true,
                                      onChanged: (Check value) {
                                        setState(() {
                                          _incompleto3 = value;
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
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
                                        hintText: 'CAPACIDADES DIFERENTES',
                                        labelText: 'CAPACIDADES DIFERENTES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Discapacidades.map(
                                          (discapacidad) => SearchFieldListItem(
                                              discapacidad.CapacidadDiferente,
                                              item: discapacidad)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _discapacidades4,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_discapacidades4.text ==
                                              "5 OTRA") {
                                            valCD4 = true;
                                          } else {
                                            valCD4 = false;
                                            _otroCapacidadDiferente4.clear();
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
                                      controller: _otroCapacidadDiferente4,
                                      enabled: valCD4,
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
                                        hintText: 'OTRA CAPACIDAD DIFERENTE',
                                        labelText: 'OTRA CAPACIDAD DIFERENTE',
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
                                        hintText: 'ADICCIONES',
                                        labelText: 'ADICCIONES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Adicciones.map((adiccion) =>
                                          SearchFieldListItem(adiccion.Adiccion,
                                              item: adiccion)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _adicciones4,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_adicciones4.text == "4 OTRA") {
                                            valA4 = true;
                                          } else {
                                            valA4 = false;
                                            _otroAdicciones4.clear();
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
                                      controller: _otroAdicciones4,
                                      enabled: valA4,
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
                                        hintText: 'OTRA ADICCIÓN',
                                        labelText: 'OTRA ADICCIÓN',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                    controller: _peso4,
                                    hintName: 'PESO (KG)',
                                    inputType: TextInputType.number)),
                                DataCell(getTextDataTable(
                                    controller: _talla4,
                                    hintName: 'TALLA (CM)',
                                    inputType: TextInputType.number)),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(bottom: 45),
                                    width: 300,
                                    child: TextField(
                                      controller: _imc4,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.blue,
                                                style: BorderStyle.solid),
                                          ),
                                          fillColor: Colors.grey[120],
                                          filled: true,
                                          labelText:
                                              'PRESIONAR PARA CALCULAR IMC'),
                                      onTap: () async {
                                        setState(() {
                                          _imc4 =
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: IMC(_peso4.text,
                                                          _talla4.text)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _condicionSalud4,
                                                hintName:
                                                    'CONDICIONES DE SALUD',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Condiciones4
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Condiciones4[
                                                                            index]
                                                                        .value = !_Condiciones4[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Condiciones4[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Condiciones4[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Condiciones4[
                                                                          index]
                                                                      .CondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked4Cond,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _clasificacion4,
                                                hintName: 'CLASIFICACIÓN',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Clasificaciones4
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Clasificaciones4[
                                                                            index]
                                                                        .value = !_Clasificaciones4[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Clasificaciones4[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Clasificaciones4[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Clasificaciones4[
                                                                          index]
                                                                      .ClasCondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked4Clas,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                  controller: _ponderacion4,
                                  hintName: 'PONDERACIÓN',
                                )),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.0),
                                            Container(
                                                child: foto4_1 != null ||
                                                        _image4_1 != null
                                                    ? Text(
                                                        'IMAGEN 1 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 1 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage4_1),
                                            Container(
                                                child: foto4_2 != null ||
                                                        _image4_2 != null
                                                    ? Text(
                                                        'IMAGEN 2 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 2 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage4_2),
                                            Container(
                                                child: foto4_3 != null ||
                                                        _image4_3 != null
                                                    ? Text(
                                                        'IMAGEN 3 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 3 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage4_3),
                                            Container(
                                                child: foto4_4 != null ||
                                                        _image4_4 != null
                                                    ? Text(
                                                        'IMAGEN 4 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 4 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage4_4),
                                            Container(
                                                child: foto4_5 != null ||
                                                        _image4_5 != null
                                                    ? Text(
                                                        'IMAGEN 5 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 5 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage4_5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Column(children: [
                                    Container(
                                        child: fotoAviso4 != null ||
                                                _fotoAviso4 != null
                                            ? Text(
                                                'AVISO DE PRIVACIDAD SELECCIONADO')
                                            : Text(
                                                'AVISO DE PRIVACIDAD NO SELECCIONADO')),
                                    botonFoto(funcion: getFotoAviso4),
                                  ]),
                                ),
                                DataCell(getSearchField(
                                  controller: _puebloIndigena4,
                                  suggestions: _PueblosIndigenas.map((pueblo) =>
                                      SearchFieldListItem(pueblo.EtniaIndigena,
                                          item: pueblo)).toList(),
                                  hintName: 'PUEBLO INDIGENA',
                                )),
                                DataCell(
                                  ListTile(
                                    title: Text('INCOMPLETO'),
                                    leading: Radio<Check>(
                                      value: Check.INCOMPLETO,
                                      groupValue: _incompleto4,
                                      toggleable: true,
                                      onChanged: (Check value) {
                                        setState(() {
                                          _incompleto4 = value;
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
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
                                        hintText: 'CAPACIDADES DIFERENTES',
                                        labelText: 'CAPACIDADES DIFERENTES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Discapacidades.map(
                                          (discapacidad) => SearchFieldListItem(
                                              discapacidad.CapacidadDiferente,
                                              item: discapacidad)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _discapacidades5,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_discapacidades5.text ==
                                              "5 OTRA") {
                                            valCD5 = true;
                                          } else {
                                            valCD5 = false;
                                            _otroCapacidadDiferente5.clear();
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
                                      controller: _otroCapacidadDiferente5,
                                      enabled: valCD5,
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
                                        hintText: 'OTRA CAPACIDAD DIFERENTE',
                                        labelText: 'OTRA CAPACIDAD DIFERENTE',
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
                                        hintText: 'ADICCIONES',
                                        labelText: 'ADICCIONES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Adicciones.map((adiccion) =>
                                          SearchFieldListItem(adiccion.Adiccion,
                                              item: adiccion)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _adicciones5,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_adicciones5.text == "4 OTRA") {
                                            valA5 = true;
                                          } else {
                                            valA5 = false;
                                            _otroAdicciones5.clear();
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
                                      controller: _otroAdicciones5,
                                      enabled: valA5,
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
                                        hintText: 'OTRA ADICCIÓN',
                                        labelText: 'OTRA ADICCIÓN',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                    controller: _peso5,
                                    hintName: 'PESO (KG)',
                                    inputType: TextInputType.number)),
                                DataCell(getTextDataTable(
                                    controller: _talla5,
                                    hintName: 'TALLA (CM)',
                                    inputType: TextInputType.number)),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(bottom: 45),
                                    width: 300,
                                    child: TextField(
                                      controller: _imc5,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.blue,
                                                style: BorderStyle.solid),
                                          ),
                                          fillColor: Colors.grey[120],
                                          filled: true,
                                          labelText:
                                              'PRESIONAR PARA CALCULAR IMC'),
                                      onTap: () async {
                                        setState(() {
                                          _imc5 =
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: IMC(_peso5.text,
                                                          _talla5.text)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _condicionSalud5,
                                                hintName:
                                                    'CONDICIONES DE SALUD',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Condiciones5
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Condiciones5[
                                                                            index]
                                                                        .value = !_Condiciones5[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Condiciones5[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Condiciones5[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Condiciones5[
                                                                          index]
                                                                      .CondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked5Cond,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _clasificacion5,
                                                hintName: 'CLASIFICACIÓN',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Clasificaciones5
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Clasificaciones5[
                                                                            index]
                                                                        .value = !_Clasificaciones5[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Clasificaciones5[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Clasificaciones5[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Clasificaciones5[
                                                                          index]
                                                                      .ClasCondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked5Clas,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                  controller: _ponderacion5,
                                  hintName: 'PONDERACIÓN',
                                )),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.0),
                                            Container(
                                                child: foto5_1 != null ||
                                                        _image5_1 != null
                                                    ? Text(
                                                        'IMAGEN 1 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 1 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage5_1),
                                            Container(
                                                child: foto5_2 != null ||
                                                        _image5_2 != null
                                                    ? Text(
                                                        'IMAGEN 2 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 2 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage5_2),
                                            Container(
                                                child: foto5_3 != null ||
                                                        _image5_3 != null
                                                    ? Text(
                                                        'IMAGEN 3 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 3 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage5_3),
                                            Container(
                                                child: foto5_4 != null ||
                                                        _image5_4 != null
                                                    ? Text(
                                                        'IMAGEN 4 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 4 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage5_4),
                                            Container(
                                                child: foto5_5 != null ||
                                                        _image5_5 != null
                                                    ? Text(
                                                        'IMAGEN 5 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 5 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage5_5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Column(children: [
                                    Container(
                                        child: fotoAviso5 != null ||
                                                _fotoAviso5 != null
                                            ? Text(
                                                'AVISO DE PRIVACIDAD SELECCIONADO')
                                            : Text(
                                                'AVISO DE PRIVACIDAD NO SELECCIONADO')),
                                    botonFoto(funcion: getFotoAviso5),
                                  ]),
                                ),
                                DataCell(getSearchField(
                                  controller: _puebloIndigena5,
                                  suggestions: _PueblosIndigenas.map((pueblo) =>
                                      SearchFieldListItem(pueblo.EtniaIndigena,
                                          item: pueblo)).toList(),
                                  hintName: 'PUEBLO INDIGENA',
                                )),
                                DataCell(
                                  ListTile(
                                    title: Text('INCOMPLETO'),
                                    leading: Radio<Check>(
                                      value: Check.INCOMPLETO,
                                      groupValue: _incompleto5,
                                      toggleable: true,
                                      onChanged: (Check value) {
                                        setState(() {
                                          _incompleto5 = value;
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
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
                                        hintText: 'CAPACIDADES DIFERENTES',
                                        labelText: 'CAPACIDADES DIFERENTES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Discapacidades.map(
                                          (discapacidad) => SearchFieldListItem(
                                              discapacidad.CapacidadDiferente,
                                              item: discapacidad)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _discapacidades6,
                                      maxSuggestionsInViewPort: 6,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_discapacidades6.text ==
                                              "5 OTRA") {
                                            valCD6 = true;
                                          } else {
                                            valCD6 = false;
                                            _otroCapacidadDiferente6.clear();
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
                                      controller: _otroCapacidadDiferente6,
                                      enabled: valCD6,
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
                                        hintText: 'OTRA CAPACIDAD DIFERENTE',
                                        labelText: 'OTRA CAPACIDAD DIFERENTE',
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
                                        hintText: 'ADICCIONES',
                                        labelText: 'ADICCIONES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Adicciones.map((adiccion) =>
                                          SearchFieldListItem(adiccion.Adiccion,
                                              item: adiccion)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _adicciones6,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_adicciones6.text == "4 OTRA") {
                                            valA6 = true;
                                          } else {
                                            valA6 = false;
                                            _otroAdicciones6.clear();
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
                                      controller: _otroAdicciones6,
                                      enabled: valA6,
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
                                        hintText: 'OTRA ADICCIÓN',
                                        labelText: 'OTRA ADICCIÓN',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                    controller: _peso6,
                                    hintName: 'PESO (KG)',
                                    inputType: TextInputType.number)),
                                DataCell(getTextDataTable(
                                    controller: _talla6,
                                    hintName: 'TALLA (CM)',
                                    inputType: TextInputType.number)),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(bottom: 45),
                                    width: 300,
                                    child: TextField(
                                      controller: _imc6,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.blue,
                                                style: BorderStyle.solid),
                                          ),
                                          fillColor: Colors.grey[120],
                                          filled: true,
                                          labelText:
                                              'PRESIONAR PARA CALCULAR IMC'),
                                      onTap: () async {
                                        setState(() {
                                          _imc6 =
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: IMC(_peso6.text,
                                                          _talla6.text)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _condicionSalud6,
                                                hintName:
                                                    'CONDICIONES DE SALUD',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Condiciones6
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Condiciones6[
                                                                            index]
                                                                        .value = !_Condiciones6[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Condiciones6[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Condiciones6[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Condiciones6[
                                                                          index]
                                                                      .CondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked6Cond,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _clasificacion6,
                                                hintName: 'CLASIFICACIÓN',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Clasificaciones6
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Clasificaciones6[
                                                                            index]
                                                                        .value = !_Clasificaciones6[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Clasificaciones6[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Clasificaciones6[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Clasificaciones6[
                                                                          index]
                                                                      .ClasCondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked6Clas,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                  controller: _ponderacion6,
                                  hintName: 'PONDERACIÓN',
                                )),
                                DataCell(
                                  Container(
                                    child: Container(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.0),
                                            Container(
                                                child: foto6_1 != null ||
                                                        _image6_1 != null
                                                    ? Text(
                                                        'IMAGEN 1 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 1 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage6_1),
                                            Container(
                                                child: foto6_2 != null ||
                                                        _image6_2 != null
                                                    ? Text(
                                                        'IMAGEN 2 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 2 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage6_2),
                                            Container(
                                                child: foto6_3 != null ||
                                                        _image6_3 != null
                                                    ? Text(
                                                        'IMAGEN 3 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 3 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage6_3),
                                            Container(
                                                child: foto6_4 != null ||
                                                        _image6_4 != null
                                                    ? Text(
                                                        'IMAGEN 4 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 4 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage6_4),
                                            Container(
                                                child: foto6_5 != null ||
                                                        _image6_5 != null
                                                    ? Text(
                                                        'IMAGEN 5 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 5 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage6_5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Column(children: [
                                    Container(
                                        child: fotoAviso6 != null ||
                                                _fotoAviso6 != null
                                            ? Text(
                                                'AVISO DE PRIVACIDAD SELECCIONADO')
                                            : Text(
                                                'AVISO DE PRIVACIDAD NO SELECCIONADO')),
                                    botonFoto(funcion: getFotoAviso6),
                                  ]),
                                ),
                                DataCell(getSearchField(
                                  controller: _puebloIndigena6,
                                  suggestions: _PueblosIndigenas.map((pueblo) =>
                                      SearchFieldListItem(pueblo.EtniaIndigena,
                                          item: pueblo)).toList(),
                                  hintName: 'PUEBLO INDIGENA',
                                )),
                                DataCell(
                                  ListTile(
                                    title: Text('INCOMPLETO'),
                                    leading: Radio<Check>(
                                      value: Check.INCOMPLETO,
                                      groupValue: _incompleto6,
                                      toggleable: true,
                                      onChanged: (Check value) {
                                        setState(() {
                                          _incompleto6 = value;
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
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
                                        hintText: 'CAPACIDADES DIFERENTES',
                                        labelText: 'CAPACIDADES DIFERENTES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Discapacidades.map(
                                          (discapacidad) => SearchFieldListItem(
                                              discapacidad.CapacidadDiferente,
                                              item: discapacidad)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _discapacidades7,
                                      maxSuggestionsInViewPort: 7,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_discapacidades7.text ==
                                              "5 OTRA") {
                                            valCD7 = true;
                                          } else {
                                            valCD7 = false;
                                            _otroCapacidadDiferente7.clear();
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
                                      controller: _otroCapacidadDiferente7,
                                      enabled: valCD7,
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
                                        hintText: 'OTRA CAPACIDAD DIFERENTE',
                                        labelText: 'OTRA CAPACIDAD DIFERENTE',
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
                                        hintText: 'ADICCIONES',
                                        labelText: 'ADICCIONES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Adicciones.map((adiccion) =>
                                          SearchFieldListItem(adiccion.Adiccion,
                                              item: adiccion)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _adicciones7,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_adicciones7.text == "4 OTRA") {
                                            valA7 = true;
                                          } else {
                                            valA7 = false;
                                            _otroAdicciones7.clear();
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
                                      controller: _otroAdicciones7,
                                      enabled: valA7,
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
                                        hintText: 'OTRA ADICCIÓN',
                                        labelText: 'OTRA ADICCIÓN',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                    controller: _peso7,
                                    hintName: 'PESO (KG)',
                                    inputType: TextInputType.number)),
                                DataCell(getTextDataTable(
                                    controller: _talla7,
                                    hintName: 'TALLA (CM)',
                                    inputType: TextInputType.number)),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(bottom: 45),
                                    width: 300,
                                    child: TextField(
                                      controller: _imc7,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.blue,
                                                style: BorderStyle.solid),
                                          ),
                                          fillColor: Colors.grey[120],
                                          filled: true,
                                          labelText:
                                              'PRESIONAR PARA CALCULAR IMC'),
                                      onTap: () async {
                                        setState(() {
                                          _imc7 =
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: IMC(_peso7.text,
                                                          _talla7.text)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _condicionSalud7,
                                                hintName:
                                                    'CONDICIONES DE SALUD',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Condiciones7
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Condiciones7[
                                                                            index]
                                                                        .value = !_Condiciones7[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Condiciones7[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Condiciones7[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Condiciones7[
                                                                          index]
                                                                      .CondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked7Cond,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _clasificacion7,
                                                hintName: 'CLASIFICACIÓN',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Clasificaciones7
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Clasificaciones7[
                                                                            index]
                                                                        .value = !_Clasificaciones7[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Clasificaciones7[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Clasificaciones7[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Clasificaciones7[
                                                                          index]
                                                                      .ClasCondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked7Clas,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                  controller: _ponderacion7,
                                  hintName: 'PONDERACIÓN',
                                )),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.0),
                                            Container(
                                                child: foto7_1 != null ||
                                                        _image7_1 != null
                                                    ? Text(
                                                        'IMAGEN 1 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 1 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage7_1),
                                            Container(
                                                child: foto7_2 != null ||
                                                        _image7_2 != null
                                                    ? Text(
                                                        'IMAGEN 2 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 2 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage7_2),
                                            Container(
                                                child: foto7_3 != null ||
                                                        _image7_3 != null
                                                    ? Text(
                                                        'IMAGEN 3 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 3 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage7_3),
                                            Container(
                                                child: foto7_4 != null ||
                                                        _image7_4 != null
                                                    ? Text(
                                                        'IMAGEN 4 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 4 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage7_4),
                                            Container(
                                                child: foto7_5 != null ||
                                                        _image7_5 != null
                                                    ? Text(
                                                        'IMAGEN 5 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 5 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage7_5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Column(children: [
                                    Container(
                                        child: fotoAviso7 != null ||
                                                _fotoAviso7 != null
                                            ? Text(
                                                'AVISO DE PRIVACIDAD SELECCIONADO')
                                            : Text(
                                                'AVISO DE PRIVACIDAD NO SELECCIONADO')),
                                    botonFoto(funcion: getFotoAviso7),
                                  ]),
                                ),
                                DataCell(getSearchField(
                                  controller: _puebloIndigena7,
                                  suggestions: _PueblosIndigenas.map((pueblo) =>
                                      SearchFieldListItem(pueblo.EtniaIndigena,
                                          item: pueblo)).toList(),
                                  hintName: 'PUEBLO INDIGENA',
                                )),
                                DataCell(
                                  ListTile(
                                    title: Text('INCOMPLETO'),
                                    leading: Radio<Check>(
                                      value: Check.INCOMPLETO,
                                      groupValue: _incompleto7,
                                      toggleable: true,
                                      onChanged: (Check value) {
                                        setState(() {
                                          _incompleto7 = value;
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
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
                                        hintText: 'CAPACIDADES DIFERENTES',
                                        labelText: 'CAPACIDADES DIFERENTES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Discapacidades.map(
                                          (discapacidad) => SearchFieldListItem(
                                              discapacidad.CapacidadDiferente,
                                              item: discapacidad)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _discapacidades8,
                                      maxSuggestionsInViewPort: 8,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_discapacidades8.text ==
                                              "5 OTRA") {
                                            valCD8 = true;
                                          } else {
                                            valCD8 = false;
                                            _otroCapacidadDiferente8.clear();
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
                                      controller: _otroCapacidadDiferente8,
                                      enabled: valCD8,
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
                                        hintText: 'OTRA CAPACIDAD DIFERENTE',
                                        labelText: 'OTRA CAPACIDAD DIFERENTE',
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
                                        hintText: 'ADICCIONES',
                                        labelText: 'ADICCIONES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Adicciones.map((adiccion) =>
                                          SearchFieldListItem(adiccion.Adiccion,
                                              item: adiccion)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _adicciones8,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_adicciones8.text == "4 OTRA") {
                                            valA8 = true;
                                          } else {
                                            valA8 = false;
                                            _otroAdicciones8.clear();
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
                                      controller: _otroAdicciones8,
                                      enabled: valA8,
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
                                        hintText: 'OTRA ADICCIÓN',
                                        labelText: 'OTRA ADICCIÓN',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                  controller: _peso8,
                                  hintName: 'PESO (KG)',
                                  inputType: TextInputType.number,
                                )),
                                DataCell(getTextDataTable(
                                  controller: _talla8,
                                  hintName: 'TALLA (CM)',
                                  inputType: TextInputType.number,
                                )),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(bottom: 45),
                                    width: 300,
                                    child: TextField(
                                      controller: _imc8,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.blue,
                                                style: BorderStyle.solid),
                                          ),
                                          fillColor: Colors.grey[120],
                                          filled: true,
                                          labelText:
                                              'PRESIONAR PARA CALCULAR IMC'),
                                      onTap: () async {
                                        setState(() {
                                          _imc8 =
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: IMC(_peso8.text,
                                                          _talla8.text)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _condicionSalud8,
                                                hintName:
                                                    'CONDICIONES DE SALUD',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Condiciones8
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Condiciones8[
                                                                            index]
                                                                        .value = !_Condiciones8[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Condiciones8[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Condiciones8[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Condiciones8[
                                                                          index]
                                                                      .CondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked8Cond,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _clasificacion8,
                                                hintName: 'CLASIFICACIÓN',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Clasificaciones8
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Clasificaciones8[
                                                                            index]
                                                                        .value = !_Clasificaciones8[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Clasificaciones8[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Clasificaciones8[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Clasificaciones8[
                                                                          index]
                                                                      .ClasCondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked8Clas,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                  controller: _ponderacion8,
                                  hintName: 'PONDERACIÓN',
                                )),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.0),
                                            Container(
                                                child: foto8_1 != null ||
                                                        _image8_1 != null
                                                    ? Text(
                                                        'IMAGEN 1 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 1 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage8_1),
                                            Container(
                                                child: foto8_2 != null ||
                                                        _image8_2 != null
                                                    ? Text(
                                                        'IMAGEN 2 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 2 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage8_2),
                                            Container(
                                                child: foto8_3 != null ||
                                                        _image8_3 != null
                                                    ? Text(
                                                        'IMAGEN 3 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 3 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage8_3),
                                            Container(
                                                child: foto8_4 != null ||
                                                        _image8_4 != null
                                                    ? Text(
                                                        'IMAGEN 4 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 4 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage8_4),
                                            Container(
                                                child: foto8_5 != null ||
                                                        _image8_5 != null
                                                    ? Text(
                                                        'IMAGEN 5 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 5 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage8_5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Column(children: [
                                    Container(
                                        child: fotoAviso8 != null ||
                                                _fotoAviso8 != null
                                            ? Text(
                                                'AVISO DE PRIVACIDAD SELECCIONADO')
                                            : Text(
                                                'AVISO DE PRIVACIDAD NO SELECCIONADO')),
                                    botonFoto(funcion: getFotoAviso8),
                                  ]),
                                ),
                                DataCell(getSearchField(
                                  controller: _puebloIndigena8,
                                  suggestions: _PueblosIndigenas.map((pueblo) =>
                                      SearchFieldListItem(pueblo.EtniaIndigena,
                                          item: pueblo)).toList(),
                                  hintName: 'PUEBLO INDIGENA',
                                )),
                                DataCell(
                                  ListTile(
                                    title: Text('INCOMPLETO'),
                                    leading: Radio<Check>(
                                      value: Check.INCOMPLETO,
                                      groupValue: _incompleto8,
                                      toggleable: true,
                                      onChanged: (Check value) {
                                        setState(() {
                                          _incompleto8 = value;
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
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
                                        hintText: 'CAPACIDADES DIFERENTES',
                                        labelText: 'CAPACIDADES DIFERENTES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Discapacidades.map(
                                          (discapacidad) => SearchFieldListItem(
                                              discapacidad.CapacidadDiferente,
                                              item: discapacidad)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _discapacidades9,
                                      maxSuggestionsInViewPort: 9,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_discapacidades9.text ==
                                              "5 OTRA") {
                                            valCD9 = true;
                                          } else {
                                            valCD9 = false;
                                            _otroCapacidadDiferente9.clear();
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
                                      controller: _otroCapacidadDiferente9,
                                      enabled: valCD9,
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
                                        hintText: 'OTRA CAPACIDAD DIFERENTE',
                                        labelText: 'OTRA CAPACIDAD DIFERENTE',
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
                                        hintText: 'ADICCIONES',
                                        labelText: 'ADICCIONES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Adicciones.map((adiccion) =>
                                          SearchFieldListItem(adiccion.Adiccion,
                                              item: adiccion)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _adicciones9,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_adicciones9.text == "4 OTRA") {
                                            valA9 = true;
                                          } else {
                                            valA9 = false;
                                            _otroAdicciones9.clear();
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
                                      controller: _otroAdicciones9,
                                      enabled: valA9,
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
                                        hintText: 'OTRA ADICCIÓN',
                                        labelText: 'OTRA ADICCIÓN',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                    controller: _peso9,
                                    hintName: 'PESO (KG)',
                                    inputType: TextInputType.number)),
                                DataCell(getTextDataTable(
                                    controller: _talla9,
                                    hintName: 'TALLA (CM)',
                                    inputType: TextInputType.number)),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(bottom: 45),
                                    width: 300,
                                    child: TextField(
                                      controller: _imc9,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.blue,
                                                style: BorderStyle.solid),
                                          ),
                                          fillColor: Colors.grey[120],
                                          filled: true,
                                          labelText:
                                              'PRESIONAR PARA CALCULAR IMC'),
                                      onTap: () async {
                                        setState(() {
                                          _imc9 =
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: IMC(_peso9.text,
                                                          _talla9.text)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _condicionSalud9,
                                                hintName:
                                                    'CONDICIONES DE SALUD',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Condiciones9
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Condiciones9[
                                                                            index]
                                                                        .value = !_Condiciones9[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Condiciones9[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Condiciones9[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Condiciones9[
                                                                          index]
                                                                      .CondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked9Cond,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _clasificacion9,
                                                hintName: 'CLASIFICACIÓN',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Clasificaciones9
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Clasificaciones9[
                                                                            index]
                                                                        .value = !_Clasificaciones9[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Clasificaciones9[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Clasificaciones9[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Clasificaciones9[
                                                                          index]
                                                                      .ClasCondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked9Clas,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                  controller: _ponderacion9,
                                  hintName: 'PONDERACIÓN',
                                )),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                                child: foto9_1 != null ||
                                                        _image9_1 != null
                                                    ? Text(
                                                        'IMAGEN 1 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 1 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage9_1),
                                            Container(
                                                child: foto9_2 != null ||
                                                        _image9_2 != null
                                                    ? Text(
                                                        'IMAGEN 2 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 2 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage9_2),
                                            Container(
                                                child: foto9_3 != null ||
                                                        _image9_3 != null
                                                    ? Text(
                                                        'IMAGEN 3 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 3 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage9_3),
                                            Container(
                                                child: foto9_4 != null ||
                                                        _image9_4 != null
                                                    ? Text(
                                                        'IMAGEN 4 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 4 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage9_4),
                                            Container(
                                                child: foto9_5 != null ||
                                                        _image9_5 != null
                                                    ? Text(
                                                        'IMAGEN 5 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 5 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage9_5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Column(children: [
                                    Container(
                                        child: fotoAviso9 != null ||
                                                _fotoAviso9 != null
                                            ? Text(
                                                'AVISO DE PRIVACIDAD SELECCIONADO')
                                            : Text(
                                                'AVISO DE PRIVACIDAD NO SELECCIONADO')),
                                    botonFoto(funcion: getFotoAviso9),
                                  ]),
                                ),
                                DataCell(getSearchField(
                                  controller: _puebloIndigena9,
                                  suggestions: _PueblosIndigenas.map((pueblo) =>
                                      SearchFieldListItem(pueblo.EtniaIndigena,
                                          item: pueblo)).toList(),
                                  hintName: 'PUEBLO INDIGENA',
                                )),
                                DataCell(
                                  ListTile(
                                    title: Text('INCOMPLETO'),
                                    leading: Radio<Check>(
                                      value: Check.INCOMPLETO,
                                      groupValue: _incompleto9,
                                      toggleable: true,
                                      onChanged: (Check value) {
                                        setState(() {
                                          _incompleto9 = value;
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                )
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
                                        hintText: 'CAPACIDADES DIFERENTES',
                                        labelText: 'CAPACIDADES DIFERENTES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Discapacidades.map(
                                          (discapacidad) => SearchFieldListItem(
                                              discapacidad.CapacidadDiferente,
                                              item: discapacidad)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _discapacidades10,
                                      maxSuggestionsInViewPort: 10,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_discapacidades10.text ==
                                              "5 OTRA") {
                                            valCD10 = true;
                                          } else {
                                            valCD10 = false;
                                            _otroCapacidadDiferente10.clear();
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
                                      controller: _otroCapacidadDiferente10,
                                      enabled: valCD10,
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
                                        hintText: 'OTRA CAPACIDAD DIFERENTE',
                                        labelText: 'OTRA CAPACIDAD DIFERENTE',
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
                                        hintText: 'ADICCIONES',
                                        labelText: 'ADICCIONES',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Adicciones.map((adiccion) =>
                                          SearchFieldListItem(adiccion.Adiccion,
                                              item: adiccion)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _adicciones10,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_adicciones10.text == "4 OTRA") {
                                            valA10 = true;
                                          } else {
                                            valA10 = false;
                                            _otroAdicciones10.clear();
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
                                      controller: _otroAdicciones10,
                                      enabled: valA10,
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
                                        hintText: 'OTRA ADICCIÓN',
                                        labelText: 'OTRA ADICCIÓN',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                    controller: _peso10,
                                    hintName: 'PESO (KG)',
                                    inputType: TextInputType.number)),
                                DataCell(getTextDataTable(
                                    controller: _talla10,
                                    hintName: 'TALLA (CM)',
                                    inputType: TextInputType.number)),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(bottom: 45),
                                    width: 300,
                                    child: TextField(
                                      controller: _imc10,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.blue,
                                                style: BorderStyle.solid),
                                          ),
                                          fillColor: Colors.grey[120],
                                          filled: true,
                                          labelText:
                                              'PRESIONAR PARA CALCULAR IMC'),
                                      onTap: () async {
                                        setState(() {
                                          _imc10 =
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: IMC(_peso10.text,
                                                          _talla10.text)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _condicionSalud10,
                                                hintName:
                                                    'CONDICIONES DE SALUD',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Condiciones10
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Condiciones10[
                                                                            index]
                                                                        .value = !_Condiciones10[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Condiciones10[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Condiciones10[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Condiciones10[
                                                                          index]
                                                                      .CondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked10Cond,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            genTextExpand(
                                                controller: _clasificacion10,
                                                hintName: 'CLASIFICACIÓN',
                                                inputType:
                                                    TextInputType.multiline),
                                            ElevatedButton(
                                              child: Text('ABRIR OPCIONES'),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              30.0),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstate) {
                                                          return SizedBox(
                                                            height: 500,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  _Clasificaciones10
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      InkWell(
                                                                onTap: () {
                                                                  setstate(() {
                                                                    _Clasificaciones10[
                                                                            index]
                                                                        .value = !_Clasificaciones10[
                                                                            index]
                                                                        .value;
                                                                  });
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      Checkbox(
                                                                          value: _Clasificaciones10[index]
                                                                              .value,
                                                                          onChanged:
                                                                              (checked) {
                                                                            setstate(() {
                                                                              _Clasificaciones10[index].value = checked;
                                                                            });
                                                                          }),
                                                                  title: Text(_Clasificaciones10[
                                                                          index]
                                                                      .ClasCondicionesSalud
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                      }),
                                            ),
                                            ElevatedButton(
                                                onPressed: addChecked10Clas,
                                                child: Text('AGREGAR')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(getTextDataTable(
                                  controller: _ponderacion10,
                                  hintName: 'PONDERACIÓN',
                                )),
                                DataCell(
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.0),
                                            Container(
                                                child: foto10_1 != null ||
                                                        _image10_1 != null
                                                    ? Text(
                                                        'IMAGEN 1 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 1 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage10_1),
                                            Container(
                                                child: foto10_2 != null ||
                                                        _image10_2 != null
                                                    ? Text(
                                                        'IMAGEN 2 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 2 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage10_2),
                                            Container(
                                                child: foto10_3 != null ||
                                                        _image10_3 != null
                                                    ? Text(
                                                        'IMAGEN 3 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 3 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage10_3),
                                            Container(
                                                child: foto10_4 != null ||
                                                        _image10_4 != null
                                                    ? Text(
                                                        'IMAGEN 4 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 4 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage10_4),
                                            Container(
                                                child: foto10_5 != null ||
                                                        _image10_5 != null
                                                    ? Text(
                                                        'IMAGEN 5 SELECCIONADA')
                                                    : Text(
                                                        'IMAGEN 5 NO SELECCIONADA')),
                                            botonFoto(funcion: getImage10_5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Column(children: [
                                    Container(
                                        child: fotoAviso10 != null ||
                                                _fotoAviso10 != null
                                            ? Text(
                                                'AVISO DE PRIVACIDAD SELECCIONADO')
                                            : Text(
                                                'AVISO DE PRIVACIDAD NO SELECCIONADO')),
                                    botonFoto(funcion: getFotoAviso10),
                                  ]),
                                ),
                                DataCell(getSearchField(
                                  controller: _puebloIndigena10,
                                  suggestions: _PueblosIndigenas.map((pueblo) =>
                                      SearchFieldListItem(pueblo.EtniaIndigena,
                                          item: pueblo)).toList(),
                                  hintName: 'PUEBLO INDIGENA',
                                )),
                                DataCell(
                                  ListTile(
                                    title: Text('INCOMPLETO'),
                                    leading: Radio<Check>(
                                      value: Check.INCOMPLETO,
                                      toggleable: true,
                                      groupValue: _incompleto10,
                                      onChanged: (Check value) {
                                        setState(() {
                                          _incompleto10 = value;
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                    label: cargando
                        ? SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                              strokeWidth: 3.0,
                            ),
                          )
                        : Text(
                            'CONTINUAR',
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
                      'ACTUALIZAR',
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
