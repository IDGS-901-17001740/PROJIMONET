import 'package:esn/Comm/Metodos/CURP.dart';
import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextName.dart';
import 'package:esn/Comm/genTextDate.dart';
import 'package:esn/Comm/genTextFolio.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/EstadosCiviles.dart';
import 'package:esn/Model/EstadosModel.dart';
import 'package:esn/Model/EstructuraFamiliarModel.dart';
import 'package:esn/Model/Parentesco.dart';
import 'package:esn/Screens/DatosGenerales.dart';
import 'package:esn/Screens/Escolaridad_SeguridadSocialTabla.dart';
import 'package:esn/Screens/Servicios/ServGas.dart';
import 'package:esn/ScreensActualizar/ActualizarEstudio.dart';
import 'package:esn/replaceAll/replaceAllLetter.dart';
import 'package:esn/replaceAll/replaceAllNum.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:diacritic/diacritic.dart';

enum Sexo { HOMBRE, MUJER, OTRO }

class EstructuraFamiliarTabla extends StatefulWidget {
  String folio;

  String folioDisp;
  String usuario;
  String dispositivo;

  EstructuraFamiliarTabla(
      {this.folio, this.folioDisp, this.dispositivo, this.usuario});

  @override
  State<EstructuraFamiliarTabla> createState() =>
      _EstructuraFamiliarTablaState();
}

class _EstructuraFamiliarTablaState extends State<EstructuraFamiliarTabla> {
  final _formKey = GlobalKey<FormState>();

  final _nombre1 = TextEditingController();
  final _primerApellido1 = TextEditingController();
  final _segundoApellido1 = TextEditingController();
  Sexo _sexo1;
  final _fechaNacimiento1 = TextEditingController();
  final _entidadNacimiento1 = TextEditingController();
  final _estadoCivil1 = TextEditingController();
  final _otroEstadoCivil1 = TextEditingController();
  final _parentesco1 = TextEditingController();
  var _curp1 = TextEditingController();
  bool val1 = false;
  bool valPar1 = false;

  final _nombre2 = TextEditingController();
  final _primerApellido2 = TextEditingController();
  final _segundoApellido2 = TextEditingController();
  Sexo _sexo2;
  final _fechaNacimiento2 = TextEditingController();
  final _entidadNacimiento2 = TextEditingController();
  final _estadoCivil2 = TextEditingController();
  final _otroEstadoCivil2 = TextEditingController();
  final _parentesco2 = TextEditingController();
  final _otroParentesco2 = TextEditingController();
  var _curp2 = TextEditingController();
  bool val2 = false;
  bool valPar2 = false;

  final _nombre3 = TextEditingController();
  final _primerApellido3 = TextEditingController();
  final _segundoApellido3 = TextEditingController();
  Sexo _sexo3;
  final _fechaNacimiento3 = TextEditingController();
  final _entidadNacimiento3 = TextEditingController();
  final _estadoCivil3 = TextEditingController();
  final _otroEstadoCivil3 = TextEditingController();
  final _otroParentesco3 = TextEditingController();
  final _parentesco3 = TextEditingController();
  var _curp3 = TextEditingController();
  bool val3 = false;
  bool valPar3 = false;

  final _nombre4 = TextEditingController();
  final _primerApellido4 = TextEditingController();
  final _segundoApellido4 = TextEditingController();
  Sexo _sexo4;
  final _fechaNacimiento4 = TextEditingController();
  final _entidadNacimiento4 = TextEditingController();
  final _estadoCivil4 = TextEditingController();
  final _otroEstadoCivil4 = TextEditingController();
  final _parentesco4 = TextEditingController();
  final _otroParentesco4 = TextEditingController();
  var _curp4 = TextEditingController();
  bool val4 = false;
  bool valPar4 = false;

  final _nombre5 = TextEditingController();
  final _primerApellido5 = TextEditingController();
  final _segundoApellido5 = TextEditingController();
  Sexo _sexo5;
  final _fechaNacimiento5 = TextEditingController();
  final _entidadNacimiento5 = TextEditingController();
  final _estadoCivil5 = TextEditingController();
  final _otroEstadoCivil5 = TextEditingController();
  final _parentesco5 = TextEditingController();
  final _otroParentesco5 = TextEditingController();
  var _curp5 = TextEditingController();
  bool val5 = false;
  bool valPar5 = false;

  final _nombre6 = TextEditingController();
  final _primerApellido6 = TextEditingController();
  final _segundoApellido6 = TextEditingController();
  Sexo _sexo6;
  final _fechaNacimiento6 = TextEditingController();
  final _entidadNacimiento6 = TextEditingController();
  final _estadoCivil6 = TextEditingController();
  final _otroEstadoCivil6 = TextEditingController();
  final _parentesco6 = TextEditingController();
  final _otroParentesco6 = TextEditingController();
  var _curp6 = TextEditingController();
  bool val6 = false;
  bool valPar6 = false;

  final _nombre7 = TextEditingController();
  final _primerApellido7 = TextEditingController();
  final _segundoApellido7 = TextEditingController();
  Sexo _sexo7;
  final _fechaNacimiento7 = TextEditingController();
  final _entidadNacimiento7 = TextEditingController();
  final _estadoCivil7 = TextEditingController();
  final _otroEstadoCivil7 = TextEditingController();
  final _parentesco7 = TextEditingController();
  final _otroParentesco7 = TextEditingController();
  var _curp7 = TextEditingController();
  bool val7 = false;
  bool valPar7 = false;

  final _nombre8 = TextEditingController();
  final _primerApellido8 = TextEditingController();
  final _segundoApellido8 = TextEditingController();
  Sexo _sexo8;
  final _fechaNacimiento8 = TextEditingController();
  final _entidadNacimiento8 = TextEditingController();
  final _estadoCivil8 = TextEditingController();
  final _otroEstadoCivil8 = TextEditingController();
  final _parentesco8 = TextEditingController();
  final _otroParentesco8 = TextEditingController();
  var _curp8 = TextEditingController();
  bool val8 = false;
  bool valPar8 = false;

  final _nombre9 = TextEditingController();
  final _primerApellido9 = TextEditingController();
  final _segundoApellido9 = TextEditingController();
  Sexo _sexo9;
  final _fechaNacimiento9 = TextEditingController();
  final _entidadNacimiento9 = TextEditingController();
  final _estadoCivil9 = TextEditingController();
  final _otroEstadoCivil9 = TextEditingController();
  final _parentesco9 = TextEditingController();
  final _otroParentesco9 = TextEditingController();
  var _curp9 = TextEditingController();
  bool val9 = false;
  bool valPar9 = false;

  final _nombre10 = TextEditingController();
  final _primerApellido10 = TextEditingController();
  final _segundoApellido10 = TextEditingController();
  Sexo _sexo10;
  final _fechaNacimiento10 = TextEditingController();
  final _entidadNacimiento10 = TextEditingController();
  final _estadoCivil10 = TextEditingController();
  final _otroEstadoCivil10 = TextEditingController();
  final _parentesco10 = TextEditingController();
  final _otroParentesco10 = TextEditingController();
  var _curp10 = TextEditingController();
  bool val10 = false;
  bool valPar10 = false;

  List<EstadosCiviles> _EstadosCiviles = [];
  List<Parentescos> _Parentesco = [];
  List<EstadosModel> _Estado = [];

  List<EstadosModel> _Estado2 = [];
  List<Parentescos> _Parentesco2 = [];
  List<EstadosCiviles> _EstadosCiviles2 = [];

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

  List<EstructuraFamilarModel> _EstructuraGuardar = [];

  getAllCategoriesEstadosCiviles() async {
    _EstadosCiviles = [];
    var categories = await CategoryService().readCategoriesEstadosCiviles();
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstadosCiviles();
        categoryModel.EstadoCivil = category['EstadoCivil'];
        _EstadosCiviles.add(categoryModel);
      });
    });
  }

  getAllCategoriesParentesco() async {
    _Parentesco = [];
    var categories = await CategoryService().readCategoriesParentesco();
    categories.forEach((category) {
      setState(() {
        var categoryModel = Parentescos();
        categoryModel.Parentesco = category['Parentesco'];
        _Parentesco.add(categoryModel);
      });
    });
  }

  getAllCategoriesEstados() async {
    _Estado = [];
    var categories = await CategoryService().readCategoriesEstados();
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstadosModel();
        categoryModel.Estado = category['Estado'];
        _Estado.add(categoryModel);
      });
    });
  }

  getOrdenEstado(String Estado) async {
    _Estado2 = [];
    var categories = await CategoryService().readOrdenEstado(Estado);
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstadosModel();
        categoryModel.Orden = category['Orden'];
        _Estado2.add(categoryModel);
      });
    });
  }

  getOrdenEstadoCivil(String Civil) async {
    _EstadosCiviles2 = [];
    var categories = await CategoryService().readOrdenEstadoCivil(Civil);
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstadosCiviles();
        categoryModel.Orden = category['Orden'];
        _EstadosCiviles2.add(categoryModel);
      });
    });
  }

  getOrdenParentesco(String Parentesco) async {
    _Parentesco2 = [];
    var categories = await CategoryService().readOrdenParentesco(Parentesco);
    categories.forEach((category) {
      setState(() {
        var categoryModel = Parentescos();
        categoryModel.Orden = category['Orden'];
        _Parentesco2.add(categoryModel);
      });
    });
  }

  metodos(String estado, String civil, String parentesco) async {
    await getOrdenEstado(estado);
    await getOrdenEstadoCivil(civil);
    await getOrdenParentesco(parentesco);
  }

  getTitular() {
    String titular = '0 TITULAR';
    _parentesco1.text = titular;
  }

  //Metodos para guardar
  renglon1() async {
    print(_parentesco1.text.replaceAll("  ", " ").replaceAll("  ", " "));
    if (_nombre1.text.replaceAll("  ", " ") != '') {
      replaceAllNum rpn = new replaceAllNum();
      replaceAllLetter rpl = new replaceAllLetter();

      String sexo = _sexo1.name.toString();

      if (sexo == 'HOMBRE') {
        sexo = '1 1 HOMBRE';
      } else if (sexo == 'MUJER') {
        sexo = '2 2 MUJER';
      } else if (sexo == 'OTRO') {
        sexo = '3 3 OTRO';
      }

      await metodos(
          _entidadNacimiento1.text.replaceAll("  ", " "),
          _estadoCivil1.text.replaceAll("  ", " "),
          _parentesco1.text.replaceAll("  ", " "));

      var EstadoCivil = _estadoCivil1.text.replaceAll("  ", " ").toString();
      final estadoCivil = rpn.replaceNum(EstadoCivil);
      var Parentesco = _parentesco1.text.replaceAll("  ", " ").toString();
      final parentesco = rpn.replaceNum(Parentesco);
      var EntidadN = _entidadNacimiento1.text.replaceAll("  ", " ").toString();
      final entidadNacimiento = rpn.replaceNum(EntidadN);

      EstructuraFamilarModel ef = EstructuraFamilarModel(
          folio: int.parse(widget.folio),
          nombre: _nombre1.text.replaceAll("  ", " ").toString(),
          primerApellido:
              _primerApellido1.text.replaceAll("  ", " ").toString(),
          segundoApellido:
              _segundoApellido1.text.replaceAll("  ", " ").toString(),
          claveSexo: sexo.substring(0, 1),
          ordenSexo: sexo.substring(0, 1),
          sexo: _sexo1.name.toString(),
          fechaNacimiento: _fechaNacimiento1.text,
          claveEntidad: _entidadNacimiento1.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          entidadNacimiento: entidadNacimiento.toString().trimLeft(),
          curp: _curp1.text.replaceAll("  ", " ").toString(),
          claveEstadoCivil: _estadoCivil1.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          ordenEstadoCivil: _EstadosCiviles2.map((e) => e.Orden).first,
          estadoCivil: estadoCivil.toString().trimLeft(),
          claveParentesco:
              _parentesco1.text.replaceAll("  ", " ").substring(0, 2),
          ordenParentesco: _Parentesco2.map((e) => e.Orden).first,
          parentesco: parentesco.toString().trimLeft(),
          otroEstadoCivil:
              _otroEstadoCivil1.text.replaceAll("  ", " ").toString(),
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '0');
      print(ef);
      _EstructuraGuardar.add(ef);
      print(_EstructuraGuardar.toString());
    } else {
      alertDialog(context, 'El renglon 1 no puede estar vacio');
    }
  }

  renglon2() async {
    if (_nombre2.text.replaceAll("  ", " ") != '') {
      replaceAllNum rpn = new replaceAllNum();
      String sexo = _sexo2.name.toString();

      if (sexo == 'HOMBRE') {
        sexo = '1 1 HOMBRE';
      } else if (sexo == 'MUJER') {
        sexo = '2 2 MUJER';
      } else if (sexo == 'OTRO') {
        sexo = '3 3 OTRO';
      }

      await metodos(
          _entidadNacimiento2.text.replaceAll("  ", " "),
          _estadoCivil2.text.replaceAll("  ", " "),
          _parentesco2.text.replaceAll("  ", " "));

      var EstadoCivil = _estadoCivil2.text.replaceAll("  ", " ").toString();
      final estadoCivil = rpn.replaceNum(EstadoCivil);
      var Parentesco = _parentesco2.text.replaceAll("  ", " ").toString();
      final parentesco = rpn.replaceNum(Parentesco);
      var EntidadN = _entidadNacimiento2.text.replaceAll("  ", " ").toString();
      final entidadNacimiento = rpn.replaceNum(EntidadN);

      EstructuraFamilarModel ef = EstructuraFamilarModel(
          folio: int.parse(widget.folio),
          nombre: _nombre2.text.replaceAll("  ", " ").toString(),
          primerApellido:
              _primerApellido2.text.replaceAll("  ", " ").toString(),
          segundoApellido:
              _segundoApellido2.text.replaceAll("  ", " ").toString(),
          claveSexo: sexo.substring(0, 1),
          ordenSexo: sexo.substring(0, 1),
          sexo: _sexo2.name.toString(),
          fechaNacimiento: _fechaNacimiento2.text,
          claveEntidad: _entidadNacimiento2.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          entidadNacimiento: entidadNacimiento.toString().trimLeft(),
          curp: _curp2.text.replaceAll("  ", " ").toString(),
          claveEstadoCivil: _estadoCivil2.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          ordenEstadoCivil: _EstadosCiviles2.map((e) => e.Orden).first,
          estadoCivil: estadoCivil.toString().trimLeft(),
          claveParentesco:
              _parentesco2.text.replaceAll("  ", " ").substring(0, 2),
          ordenParentesco: _Parentesco2.map((e) => e.Orden).first,
          parentesco: parentesco.toString().trimLeft(),
          otroEstadoCivil:
              _otroEstadoCivil2.text.replaceAll("  ", " ").toString(),
          otroParentesco:
              _otroParentesco2.text.replaceAll("  ", " ").toString(),
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '1');
      _EstructuraGuardar.add(ef);
    } else {}
  }

  renglon3() async {
    if (_nombre3.text.replaceAll("  ", " ") != '') {
      replaceAllNum rpn = new replaceAllNum();
      String sexo = _sexo3.name.toString();

      if (sexo == 'HOMBRE') {
        sexo = '1 1 HOMBRE';
      } else if (sexo == 'MUJER') {
        sexo = '2 2 MUJER';
      } else if (sexo == 'OTRO') {
        sexo = '3 3 OTRO';
      }

      await metodos(
          _entidadNacimiento3.text.replaceAll("  ", " "),
          _estadoCivil3.text.replaceAll("  ", " "),
          _parentesco3.text.replaceAll("  ", " "));

      var EstadoCivil = _estadoCivil3.text.replaceAll("  ", " ").toString();
      final estadoCivil = rpn.replaceNum(EstadoCivil);
      var Parentesco = _parentesco3.text.replaceAll("  ", " ").toString();
      final parentesco = rpn.replaceNum(Parentesco);
      var EntidadN = _entidadNacimiento3.text.replaceAll("  ", " ").toString();
      final entidadNacimiento = rpn.replaceNum(EntidadN);

      EstructuraFamilarModel ef = EstructuraFamilarModel(
          folio: int.parse(widget.folio),
          nombre: _nombre3.text.replaceAll("  ", " ").toString(),
          primerApellido:
              _primerApellido3.text.replaceAll("  ", " ").toString(),
          segundoApellido:
              _segundoApellido3.text.replaceAll("  ", " ").toString(),
          claveSexo: sexo.substring(0, 1),
          ordenSexo: sexo.substring(0, 1),
          sexo: _sexo3.name.toString(),
          fechaNacimiento: _fechaNacimiento3.text,
          claveEntidad: _entidadNacimiento3.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          entidadNacimiento: entidadNacimiento.toString().trimLeft(),
          curp: _curp3.text.replaceAll("  ", " ").toString(),
          claveEstadoCivil: _estadoCivil3.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          ordenEstadoCivil: _EstadosCiviles2.map((e) => e.Orden).first,
          estadoCivil: estadoCivil.toString().trimLeft(),
          claveParentesco:
              _parentesco3.text.replaceAll("  ", " ").substring(0, 2),
          ordenParentesco: _Parentesco2.map((e) => e.Orden).first,
          parentesco: parentesco.toString().trimLeft(),
          otroEstadoCivil:
              _otroEstadoCivil3.text.replaceAll("  ", " ").toString(),
          otroParentesco:
              _otroParentesco3.text.replaceAll("  ", " ").toString(),
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '2');
      _EstructuraGuardar.add(ef);
    } else {}
  }

  renglon4() async {
    if (_nombre4.text.replaceAll("  ", " ") != '') {
      replaceAllNum rpn = new replaceAllNum();
      String sexo = _sexo4.name.toString();

      if (sexo == 'HOMBRE') {
        sexo = '1 1 HOMBRE';
      } else if (sexo == 'MUJER') {
        sexo = '2 2 MUJER';
      } else if (sexo == 'OTRO') {
        sexo = '3 3 OTRO';
      }

      await metodos(
          _entidadNacimiento4.text.replaceAll("  ", " "),
          _estadoCivil4.text.replaceAll("  ", " "),
          _parentesco4.text.replaceAll("  ", " "));

      var EstadoCivil = _estadoCivil4.text.replaceAll("  ", " ").toString();
      final estadoCivil = rpn.replaceNum(EstadoCivil);
      var Parentesco = _parentesco4.text.replaceAll("  ", " ").toString();
      final parentesco = rpn.replaceNum(Parentesco);
      var EntidadN = _entidadNacimiento4.text.replaceAll("  ", " ").toString();
      final entidadNacimiento = rpn.replaceNum(EntidadN);

      EstructuraFamilarModel ef = EstructuraFamilarModel(
          folio: int.parse(widget.folio),
          nombre: _nombre4.text.replaceAll("  ", " ").toString(),
          primerApellido:
              _primerApellido4.text.replaceAll("  ", " ").toString(),
          segundoApellido:
              _segundoApellido4.text.replaceAll("  ", " ").toString(),
          claveSexo: sexo.substring(0, 1),
          ordenSexo: sexo.substring(0, 1),
          sexo: _sexo4.name.toString(),
          fechaNacimiento: _fechaNacimiento4.text,
          claveEntidad: _entidadNacimiento4.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          entidadNacimiento: entidadNacimiento.toString().trimLeft(),
          curp: _curp4.text.replaceAll("  ", " ").toString(),
          claveEstadoCivil: _estadoCivil4.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          ordenEstadoCivil: _EstadosCiviles2.map((e) => e.Orden).first,
          estadoCivil: estadoCivil.toString().trimLeft(),
          claveParentesco:
              _parentesco4.text.replaceAll("  ", " ").substring(0, 2),
          ordenParentesco: _Parentesco2.map((e) => e.Orden).first,
          parentesco: parentesco.toString().trimLeft(),
          otroEstadoCivil:
              _otroEstadoCivil4.text.replaceAll("  ", " ").toString(),
          otroParentesco:
              _otroParentesco4.text.replaceAll("  ", " ").toString(),
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '3');
      _EstructuraGuardar.add(ef);
      print(_EstructuraGuardar.toString());
    } else {}
  }

  renglon5() async {
    if (_nombre5.text.replaceAll("  ", " ") != '') {
      replaceAllNum rpn = new replaceAllNum();
      String sexo = _sexo5.name.toString();

      if (sexo == 'HOMBRE') {
        sexo = '1 1 HOMBRE';
      } else if (sexo == 'MUJER') {
        sexo = '2 2 MUJER';
      } else if (sexo == 'OTRO') {
        sexo = '3 3 OTRO';
      }

      await metodos(
          _entidadNacimiento5.text.replaceAll("  ", " "),
          _estadoCivil5.text.replaceAll("  ", " "),
          _parentesco5.text.replaceAll("  ", " "));

      var EstadoCivil = _estadoCivil5.text.replaceAll("  ", " ").toString();
      final estadoCivil = rpn.replaceNum(EstadoCivil);
      var Parentesco = _parentesco5.text.replaceAll("  ", " ").toString();
      final parentesco = rpn.replaceNum(Parentesco);
      var EntidadN = _entidadNacimiento5.text.replaceAll("  ", " ").toString();
      final entidadNacimiento = rpn.replaceNum(EntidadN);

      EstructuraFamilarModel ef = EstructuraFamilarModel(
          folio: int.parse(widget.folio),
          nombre: _nombre5.text.replaceAll("  ", " ").toString(),
          primerApellido:
              _primerApellido5.text.replaceAll("  ", " ").toString(),
          segundoApellido:
              _segundoApellido5.text.replaceAll("  ", " ").toString(),
          claveSexo: sexo.substring(0, 1),
          ordenSexo: sexo.substring(0, 1),
          sexo: _sexo5.name.toString(),
          fechaNacimiento: _fechaNacimiento5.text,
          claveEntidad: _entidadNacimiento5.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          entidadNacimiento: entidadNacimiento.toString().trimLeft(),
          curp: _curp5.text.replaceAll("  ", " ").toString(),
          claveEstadoCivil: _estadoCivil5.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          ordenEstadoCivil: _EstadosCiviles2.map((e) => e.Orden).first,
          estadoCivil: estadoCivil.toString().trimLeft(),
          claveParentesco:
              _parentesco5.text.replaceAll("  ", " ").substring(0, 2),
          ordenParentesco: _Parentesco2.map((e) => e.Orden).first,
          parentesco: parentesco.toString().trimLeft(),
          otroEstadoCivil:
              _otroEstadoCivil5.text.replaceAll("  ", " ").toString(),
          otroParentesco:
              _otroParentesco5.text.replaceAll("  ", " ").toString(),
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '4');
      _EstructuraGuardar.add(ef);
    } else {}
  }

  renglon6() async {
    if (_nombre6.text.replaceAll("  ", " ") != '') {
      replaceAllNum rpn = new replaceAllNum();
      String sexo = _sexo6.name.toString();

      if (sexo == 'HOMBRE') {
        sexo = '1 1 HOMBRE';
      } else if (sexo == 'MUJER') {
        sexo = '2 2 MUJER';
      } else if (sexo == 'OTRO') {
        sexo = '3 3 OTRO';
      }

      await metodos(
          _entidadNacimiento6.text.replaceAll("  ", " "),
          _estadoCivil6.text.replaceAll("  ", " "),
          _parentesco6.text.replaceAll("  ", " "));

      var EstadoCivil = _estadoCivil6.text.replaceAll("  ", " ").toString();
      final estadoCivil = rpn.replaceNum(EstadoCivil);
      var Parentesco = _parentesco6.text.replaceAll("  ", " ").toString();
      final parentesco = rpn.replaceNum(Parentesco);
      var EntidadN = _entidadNacimiento6.text.replaceAll("  ", " ").toString();
      final entidadNacimiento = rpn.replaceNum(EntidadN);

      EstructuraFamilarModel ef = EstructuraFamilarModel(
          folio: int.parse(widget.folio),
          nombre: _nombre6.text.replaceAll("  ", " ").toString(),
          primerApellido:
              _primerApellido6.text.replaceAll("  ", " ").toString(),
          segundoApellido:
              _segundoApellido6.text.replaceAll("  ", " ").toString(),
          claveSexo: sexo.substring(0, 1),
          ordenSexo: sexo.substring(0, 1),
          sexo: _sexo6.name.toString(),
          fechaNacimiento: _fechaNacimiento6.text,
          claveEntidad: _entidadNacimiento6.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          entidadNacimiento: entidadNacimiento.toString().trimLeft(),
          curp: _curp6.text.replaceAll("  ", " ").toString(),
          claveEstadoCivil: _estadoCivil6.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          ordenEstadoCivil: _EstadosCiviles2.map((e) => e.Orden).first,
          estadoCivil: estadoCivil.toString().trimLeft(),
          claveParentesco:
              _parentesco6.text.replaceAll("  ", " ").substring(0, 2),
          ordenParentesco: _Parentesco2.map((e) => e.Orden).first,
          parentesco: parentesco.toString().trimLeft(),
          otroEstadoCivil:
              _otroEstadoCivil6.text.replaceAll("  ", " ").toString(),
          otroParentesco:
              _otroParentesco6.text.replaceAll("  ", " ").toString(),
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '5');
      _EstructuraGuardar.add(ef);
    } else {}
  }

  renglon7() async {
    if (_nombre7.text.replaceAll("  ", " ") != '') {
      replaceAllNum rpn = new replaceAllNum();
      String sexo = _sexo7.name.toString();

      if (sexo == 'HOMBRE') {
        sexo = '1 1 HOMBRE';
      } else if (sexo == 'MUJER') {
        sexo = '2 2 MUJER';
      } else if (sexo == 'OTRO') {
        sexo = '3 3 OTRO';
      }

      await metodos(
          _entidadNacimiento7.text.replaceAll("  ", " "),
          _estadoCivil7.text.replaceAll("  ", " "),
          _parentesco7.text.replaceAll("  ", " "));

      var EstadoCivil = _estadoCivil7.text.replaceAll("  ", " ").toString();
      final estadoCivil = rpn.replaceNum(EstadoCivil);
      var Parentesco = _parentesco7.text.replaceAll("  ", " ").toString();
      final parentesco = rpn.replaceNum(Parentesco);
      var EntidadN = _entidadNacimiento7.text.replaceAll("  ", " ").toString();
      final entidadNacimiento = rpn.replaceNum(EntidadN);

      EstructuraFamilarModel ef = EstructuraFamilarModel(
          folio: int.parse(widget.folio),
          nombre: _nombre7.text.replaceAll("  ", " ").toString(),
          primerApellido:
              _primerApellido7.text.replaceAll("  ", " ").toString(),
          segundoApellido:
              _segundoApellido7.text.replaceAll("  ", " ").toString(),
          claveSexo: sexo.substring(0, 1),
          ordenSexo: sexo.substring(0, 1),
          sexo: _sexo7.name.toString(),
          fechaNacimiento: _fechaNacimiento7.text,
          claveEntidad: _entidadNacimiento7.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          entidadNacimiento: entidadNacimiento.toString().trimLeft(),
          curp: _curp7.text.replaceAll("  ", " ").toString(),
          claveEstadoCivil: _estadoCivil7.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          ordenEstadoCivil: _EstadosCiviles2.map((e) => e.Orden).first,
          estadoCivil: estadoCivil.toString().trimLeft(),
          claveParentesco:
              _parentesco7.text.replaceAll("  ", " ").substring(0, 2),
          ordenParentesco: _Parentesco2.map((e) => e.Orden).first,
          parentesco: parentesco.toString().trimLeft(),
          otroEstadoCivil:
              _otroEstadoCivil7.text.replaceAll("  ", " ").toString(),
          otroParentesco:
              _otroParentesco7.text.replaceAll("  ", " ").toString(),
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '6');
      _EstructuraGuardar.add(ef);
    } else {}
  }

  renglon8() async {
    if (_nombre8.text.replaceAll("  ", " ") != '') {
      replaceAllNum rpn = new replaceAllNum();
      String sexo = _sexo8.name.toString();

      if (sexo == 'HOMBRE') {
        sexo = '1 1 HOMBRE';
      } else if (sexo == 'MUJER') {
        sexo = '2 2 MUJER';
      } else if (sexo == 'OTRO') {
        sexo = '3 3 OTRO';
      }

      await metodos(
          _entidadNacimiento8.text.replaceAll("  ", " "),
          _estadoCivil8.text.replaceAll("  ", " "),
          _parentesco8.text.replaceAll("  ", " "));

      var EstadoCivil = _estadoCivil8.text.replaceAll("  ", " ").toString();
      final estadoCivil = rpn.replaceNum(EstadoCivil);
      var Parentesco = _parentesco8.text.replaceAll("  ", " ").toString();
      final parentesco = rpn.replaceNum(Parentesco);
      var EntidadN = _entidadNacimiento8.text.replaceAll("  ", " ").toString();
      final entidadNacimiento = rpn.replaceNum(EntidadN);

      EstructuraFamilarModel ef = EstructuraFamilarModel(
          folio: int.parse(widget.folio),
          nombre: _nombre8.text.replaceAll("  ", " ").toString(),
          primerApellido:
              _primerApellido8.text.replaceAll("  ", " ").toString(),
          segundoApellido:
              _segundoApellido8.text.replaceAll("  ", " ").toString(),
          claveSexo: sexo.substring(0, 1),
          ordenSexo: sexo.substring(0, 1),
          sexo: _sexo8.name.toString(),
          fechaNacimiento: _fechaNacimiento8.text,
          claveEntidad: _entidadNacimiento8.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          entidadNacimiento: entidadNacimiento.toString().trimLeft(),
          curp: _curp8.text.replaceAll("  ", " ").toString(),
          claveEstadoCivil: _estadoCivil8.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          ordenEstadoCivil: _EstadosCiviles2.map((e) => e.Orden).first,
          estadoCivil: estadoCivil.toString().trimLeft(),
          claveParentesco:
              _parentesco8.text.replaceAll("  ", " ").substring(0, 2),
          ordenParentesco: _Parentesco2.map((e) => e.Orden).first,
          parentesco: parentesco.toString().trimLeft(),
          otroEstadoCivil:
              _otroEstadoCivil8.text.replaceAll("  ", " ").toString(),
          otroParentesco:
              _otroParentesco8.text.replaceAll("  ", " ").toString(),
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '7');
      _EstructuraGuardar.add(ef);
    } else {}
  }

  renglon9() async {
    if (_nombre9.text.replaceAll("  ", " ") != '') {
      replaceAllNum rpn = new replaceAllNum();
      String sexo = _sexo9.name.toString();

      if (sexo == 'HOMBRE') {
        sexo = '1 1 HOMBRE';
      } else if (sexo == 'MUJER') {
        sexo = '2 2 MUJER';
      } else if (sexo == 'OTRO') {
        sexo = '3 3 OTRO';
      }

      await metodos(
          _entidadNacimiento9.text.replaceAll("  ", " "),
          _estadoCivil9.text.replaceAll("  ", " "),
          _parentesco9.text.replaceAll("  ", " "));

      var EstadoCivil = _estadoCivil9.text.replaceAll("  ", " ").toString();
      final estadoCivil = rpn.replaceNum(EstadoCivil);
      var Parentesco = _parentesco9.text.replaceAll("  ", " ").toString();
      final parentesco = rpn.replaceNum(Parentesco);
      var EntidadN = _entidadNacimiento9.text.replaceAll("  ", " ").toString();
      final entidadNacimiento = rpn.replaceNum(EntidadN);

      EstructuraFamilarModel ef = EstructuraFamilarModel(
          folio: int.parse(widget.folio),
          nombre: _nombre9.text.replaceAll("  ", " ").toString(),
          primerApellido:
              _primerApellido9.text.replaceAll("  ", " ").toString(),
          segundoApellido:
              _segundoApellido9.text.replaceAll("  ", " ").toString(),
          claveSexo: sexo.substring(0, 1),
          ordenSexo: sexo.substring(0, 1),
          sexo: _sexo9.name.toString(),
          fechaNacimiento: _fechaNacimiento9.text,
          claveEntidad: _entidadNacimiento9.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          entidadNacimiento: entidadNacimiento.toString().trimLeft(),
          curp: _curp9.text.replaceAll("  ", " ").toString(),
          claveEstadoCivil: _estadoCivil9.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          ordenEstadoCivil: _EstadosCiviles2.map((e) => e.Orden).first,
          estadoCivil: estadoCivil.toString().trimLeft(),
          claveParentesco:
              _parentesco9.text.replaceAll("  ", " ").substring(0, 2),
          ordenParentesco: _Parentesco2.map((e) => e.Orden).first,
          parentesco: parentesco.toString().trimLeft(),
          otroEstadoCivil:
              _otroEstadoCivil9.text.replaceAll("  ", " ").toString(),
          otroParentesco:
              _otroParentesco9.text.replaceAll("  ", " ").toString(),
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '8');
      _EstructuraGuardar.add(ef);
    } else {}
  }

  renglon10() async {
    if (_nombre10.text.replaceAll("  ", " ") != '') {
      replaceAllNum rpn = new replaceAllNum();
      String sexo = _sexo10.name.toString();

      if (sexo == 'HOMBRE') {
        sexo = '1 1 HOMBRE';
      } else if (sexo == 'MUJER') {
        sexo = '2 2 MUJER';
      } else if (sexo == 'OTRO') {
        sexo = '3 3 OTRO';
      }

      await metodos(
          _entidadNacimiento10.text.replaceAll("  ", " "),
          _estadoCivil10.text.replaceAll("  ", " "),
          _parentesco10.text.replaceAll("  ", " "));

      var EstadoCivil = _estadoCivil10.text.replaceAll("  ", " ").toString();
      final estadoCivil = rpn.replaceNum(EstadoCivil);
      var Parentesco = _parentesco10.text.replaceAll("  ", " ").toString();
      final parentesco = rpn.replaceNum(Parentesco);
      var EntidadN = _entidadNacimiento10.text.replaceAll("  ", " ").toString();
      final entidadNacimiento = rpn.replaceNum(EntidadN);

      EstructuraFamilarModel ef = EstructuraFamilarModel(
          folio: int.parse(widget.folio),
          nombre: _nombre10.text.replaceAll("  ", " ").toString(),
          primerApellido:
              _primerApellido10.text.replaceAll("  ", " ").toString(),
          segundoApellido:
              _segundoApellido10.text.replaceAll("  ", " ").toString(),
          claveSexo: sexo.substring(0, 1),
          ordenSexo: sexo.substring(0, 1),
          sexo: _sexo10.name.toString(),
          fechaNacimiento: _fechaNacimiento10.text,
          claveEntidad: _entidadNacimiento10.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          entidadNacimiento: entidadNacimiento.toString().trimLeft(),
          curp: _curp10.text.replaceAll("  ", " ").toString(),
          claveEstadoCivil: _estadoCivil10.text
              .replaceAll("  ", " ")
              .substring(0, 2)
              .trimRight(),
          ordenEstadoCivil: _EstadosCiviles2.map((e) => e.Orden).first,
          estadoCivil: estadoCivil.toString().trimLeft(),
          claveParentesco:
              _parentesco10.text.replaceAll("  ", " ").substring(0, 2),
          ordenParentesco: _Parentesco2.map((e) => e.Orden).first,
          parentesco: parentesco.toString().trimLeft(),
          otroEstadoCivil:
              _otroEstadoCivil10.text.replaceAll("  ", " ").toString(),
          otroParentesco:
              _otroParentesco10.text.replaceAll("  ", " ").toString(),
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario,
          orden: '9');
      _EstructuraGuardar.add(ef);
    } else {}
  }

  cargarDatos() {
    print(widget.dispositivo);
    print(widget.usuario);
    print(widget.folioDisp);
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
    print(widget.dispositivo);
    print(widget.usuario);
    print(widget.folioDisp);
  }

  var usuario;
  var folioDisp;

  getAllEstructura1() async {
    _EstructuraFamiliar1 = [];
    var categories =
        await CategoryService().readEstructura1(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.folio = category['folio'];
        categoryModel.nombre = category['nombre'];
        categoryModel.primerApellido = category['primerApellido'];
        categoryModel.segundoApellido = category['segundoApellido'];
        categoryModel.sexo = category['sexo'];
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
        categoryModel.folioDisp = category['folioDisp'];

        _EstructuraFamiliar1.add(categoryModel);
      });
    });
    if (_EstructuraFamiliar1.map((e) => e.sexo).first == "HOMBRE") {
      _sexo1 = Sexo.HOMBRE;
    } else if (_EstructuraFamiliar1.map((e) => e.sexo).first == "MUJER") {
      _sexo1 = Sexo.MUJER;
    } else if (_EstructuraFamiliar1.map((e) => e.sexo).first == "OTRO") {
      _sexo1 = Sexo.OTRO;
    }
    _nombre1.text = _EstructuraFamiliar1.map((e) => e.nombre).first;
    _primerApellido1.text =
        _EstructuraFamiliar1.map((e) => e.primerApellido).first;
    _segundoApellido1.text =
        _EstructuraFamiliar1.map((e) => e.segundoApellido).first;
    _fechaNacimiento1.text =
        _EstructuraFamiliar1.map((e) => e.fechaNacimiento).first;
    _entidadNacimiento1.text =
        _EstructuraFamiliar1.map((e) => e.claveEntidad).first +
            " " +
            _EstructuraFamiliar1.map((e) => e.entidadNacimiento).first;
    _curp1.text = _EstructuraFamiliar1.map((e) => e.curp).first;
    _estadoCivil1.text =
        _EstructuraFamiliar1.map((e) => e.claveEstadoCivil).first +
            " " +
            _EstructuraFamiliar1.map((e) => e.estadoCivil).first;
    _parentesco1.text =
        _EstructuraFamiliar1.map((e) => e.claveParentesco).first +
            " " +
            _EstructuraFamiliar1.map((e) => e.parentesco).first;
    _otroEstadoCivil1.text =
        _EstructuraFamiliar1.map((e) => e.otroEstadoCivil).first;

    folioDisp = _EstructuraFamiliar1.map((e) => e.folioDisp).first;
  }

  getAllEstructura2() async {
    _EstructuraFamiliar2 = [];
    var categories =
        await CategoryService().readEstructura2(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.folio = category['folio'];
        categoryModel.nombre = category['nombre'];
        categoryModel.primerApellido = category['primerApellido'];
        categoryModel.segundoApellido = category['segundoApellido'];
        categoryModel.sexo = category['sexo'];
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

        _EstructuraFamiliar2.add(categoryModel);
      });
    });
    if (_EstructuraFamiliar2.map((e) => e.sexo).first == "HOMBRE") {
      _sexo2 = Sexo.HOMBRE;
    } else if (_EstructuraFamiliar2.map((e) => e.sexo).first == "MUJER") {
      _sexo2 = Sexo.MUJER;
    } else if (_EstructuraFamiliar2.map((e) => e.sexo).first == "OTRO") {
      _sexo2 = Sexo.OTRO;
    }
    _nombre2.text = _EstructuraFamiliar2.map((e) => e.nombre).first;
    _primerApellido2.text =
        _EstructuraFamiliar2.map((e) => e.primerApellido).first;
    _segundoApellido2.text =
        _EstructuraFamiliar2.map((e) => e.segundoApellido).first;
    _fechaNacimiento2.text =
        _EstructuraFamiliar2.map((e) => e.fechaNacimiento).first;
    _entidadNacimiento2.text =
        _EstructuraFamiliar2.map((e) => e.claveEntidad).first +
            " " +
            _EstructuraFamiliar2.map((e) => e.entidadNacimiento).first;
    _curp2.text = _EstructuraFamiliar2.map((e) => e.curp).first;
    _estadoCivil2.text =
        _EstructuraFamiliar2.map((e) => e.claveEstadoCivil).first +
            " " +
            _EstructuraFamiliar2.map((e) => e.estadoCivil).first;
    _parentesco2.text =
        _EstructuraFamiliar2.map((e) => e.claveParentesco).first +
            " " +
            _EstructuraFamiliar2.map((e) => e.parentesco).first;
    _otroEstadoCivil2.text =
        _EstructuraFamiliar2.map((e) => e.otroEstadoCivil).first;
    _otroParentesco2.text =
        _EstructuraFamiliar2.map((e) => e.otroParentesco).first;
  }

  getAllEstructura3() async {
    _EstructuraFamiliar3 = [];
    var categories =
        await CategoryService().readEstructura3(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.folio = category['folio'];
        categoryModel.nombre = category['nombre'];
        categoryModel.primerApellido = category['primerApellido'];
        categoryModel.segundoApellido = category['segundoApellido'];
        categoryModel.sexo = category['sexo'];
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

        _EstructuraFamiliar3.add(categoryModel);
      });
    });
    if (_EstructuraFamiliar3.map((e) => e.sexo).first == "HOMBRE") {
      _sexo3 = Sexo.HOMBRE;
    } else if (_EstructuraFamiliar3.map((e) => e.sexo).first == "MUJER") {
      _sexo3 = Sexo.MUJER;
    } else if (_EstructuraFamiliar3.map((e) => e.sexo).first == "OTRO") {
      _sexo3 = Sexo.OTRO;
    }
    _nombre3.text = _EstructuraFamiliar3.map((e) => e.nombre).first;
    _primerApellido3.text =
        _EstructuraFamiliar3.map((e) => e.primerApellido).first;
    _segundoApellido3.text =
        _EstructuraFamiliar3.map((e) => e.segundoApellido).first;
    _fechaNacimiento3.text =
        _EstructuraFamiliar3.map((e) => e.fechaNacimiento).first;
    _entidadNacimiento3.text =
        _EstructuraFamiliar3.map((e) => e.claveEntidad).first +
            " " +
            _EstructuraFamiliar3.map((e) => e.entidadNacimiento).first;
    _curp3.text = _EstructuraFamiliar3.map((e) => e.curp).first;
    _estadoCivil3.text =
        _EstructuraFamiliar3.map((e) => e.claveEstadoCivil).first +
            " " +
            _EstructuraFamiliar3.map((e) => e.estadoCivil).first;
    _parentesco3.text =
        _EstructuraFamiliar3.map((e) => e.claveParentesco).first +
            " " +
            _EstructuraFamiliar3.map((e) => e.parentesco).first;
    _otroEstadoCivil3.text =
        _EstructuraFamiliar3.map((e) => e.otroEstadoCivil).first;
    _otroParentesco3.text =
        _EstructuraFamiliar3.map((e) => e.otroParentesco).first;
  }

  getAllEstructura4() async {
    _EstructuraFamiliar4 = [];
    var categories =
        await CategoryService().readEstructura4(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.folio = category['folio'];
        categoryModel.nombre = category['nombre'];
        categoryModel.primerApellido = category['primerApellido'];
        categoryModel.segundoApellido = category['segundoApellido'];
        categoryModel.sexo = category['sexo'];
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

        _EstructuraFamiliar4.add(categoryModel);
      });
    });
    if (_EstructuraFamiliar4.map((e) => e.sexo).first == "HOMBRE") {
      _sexo4 = Sexo.HOMBRE;
    } else if (_EstructuraFamiliar4.map((e) => e.sexo).first == "MUJER") {
      _sexo4 = Sexo.MUJER;
    } else if (_EstructuraFamiliar4.map((e) => e.sexo).first == "OTRO") {
      _sexo4 = Sexo.OTRO;
    }

    _nombre4.text = _EstructuraFamiliar4.map((e) => e.nombre).first;
    _primerApellido4.text =
        _EstructuraFamiliar4.map((e) => e.primerApellido).first;
    _segundoApellido4.text =
        _EstructuraFamiliar4.map((e) => e.segundoApellido).first;
    _fechaNacimiento4.text =
        _EstructuraFamiliar4.map((e) => e.fechaNacimiento).first;
    _entidadNacimiento4.text =
        _EstructuraFamiliar4.map((e) => e.claveEntidad).first +
            " " +
            _EstructuraFamiliar4.map((e) => e.entidadNacimiento).first;
    _curp4.text = _EstructuraFamiliar4.map((e) => e.curp).first;
    _estadoCivil4.text =
        _EstructuraFamiliar4.map((e) => e.claveEstadoCivil).first +
            " " +
            _EstructuraFamiliar4.map((e) => e.estadoCivil).first;
    _parentesco4.text =
        _EstructuraFamiliar4.map((e) => e.claveParentesco).first +
            " " +
            _EstructuraFamiliar4.map((e) => e.parentesco).first;
    _otroEstadoCivil4.text =
        _EstructuraFamiliar4.map((e) => e.otroEstadoCivil).first;
    _otroParentesco4.text =
        _EstructuraFamiliar4.map((e) => e.otroParentesco).first;
  }

  getAllEstructura5() async {
    _EstructuraFamiliar5 = [];
    var categories =
        await CategoryService().readEstructura5(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.folio = category['folio'];
        categoryModel.nombre = category['nombre'];
        categoryModel.primerApellido = category['primerApellido'];
        categoryModel.segundoApellido = category['segundoApellido'];
        categoryModel.sexo = category['sexo'];
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

        _EstructuraFamiliar5.add(categoryModel);
      });
    });
    if (_EstructuraFamiliar5.map((e) => e.sexo).first == "HOMBRE") {
      _sexo5 = Sexo.HOMBRE;
    } else if (_EstructuraFamiliar5.map((e) => e.sexo).first == "MUJER") {
      _sexo5 = Sexo.MUJER;
    } else if (_EstructuraFamiliar5.map((e) => e.sexo).first == "OTRO") {
      _sexo5 = Sexo.OTRO;
    }

    _nombre5.text = _EstructuraFamiliar5.map((e) => e.nombre).first;
    _primerApellido5.text =
        _EstructuraFamiliar5.map((e) => e.primerApellido).first;
    _segundoApellido5.text =
        _EstructuraFamiliar5.map((e) => e.segundoApellido).first;
    _fechaNacimiento5.text =
        _EstructuraFamiliar5.map((e) => e.fechaNacimiento).first;
    _entidadNacimiento5.text =
        _EstructuraFamiliar5.map((e) => e.claveEntidad).first +
            " " +
            _EstructuraFamiliar5.map((e) => e.entidadNacimiento).first;
    _curp5.text = _EstructuraFamiliar5.map((e) => e.curp).first;
    _estadoCivil5.text =
        _EstructuraFamiliar5.map((e) => e.claveEstadoCivil).first +
            " " +
            _EstructuraFamiliar5.map((e) => e.estadoCivil).first;
    _parentesco5.text =
        _EstructuraFamiliar5.map((e) => e.claveParentesco).first +
            " " +
            _EstructuraFamiliar5.map((e) => e.parentesco).first;
    _otroEstadoCivil5.text =
        _EstructuraFamiliar5.map((e) => e.otroEstadoCivil).first;
    _otroParentesco5.text =
        _EstructuraFamiliar5.map((e) => e.otroParentesco).first;
  }

  getAllEstructura6() async {
    _EstructuraFamiliar6 = [];
    var categories =
        await CategoryService().readEstructura6(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.folio = category['folio'];
        categoryModel.nombre = category['nombre'];
        categoryModel.primerApellido = category['primerApellido'];
        categoryModel.segundoApellido = category['segundoApellido'];
        categoryModel.sexo = category['sexo'];
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

        _EstructuraFamiliar6.add(categoryModel);
      });
    });
    if (_EstructuraFamiliar6.map((e) => e.sexo).first == "HOMBRE") {
      _sexo6 = Sexo.HOMBRE;
    } else if (_EstructuraFamiliar6.map((e) => e.sexo).first == "MUJER") {
      _sexo6 = Sexo.MUJER;
    } else if (_EstructuraFamiliar6.map((e) => e.sexo).first == "OTRO") {
      _sexo6 = Sexo.OTRO;
    }

    _nombre6.text = _EstructuraFamiliar6.map((e) => e.nombre).first;
    _primerApellido6.text =
        _EstructuraFamiliar6.map((e) => e.primerApellido).first;
    _segundoApellido6.text =
        _EstructuraFamiliar6.map((e) => e.segundoApellido).first;
    _fechaNacimiento6.text =
        _EstructuraFamiliar6.map((e) => e.fechaNacimiento).first;
    _entidadNacimiento6.text =
        _EstructuraFamiliar6.map((e) => e.claveEntidad).first +
            " " +
            _EstructuraFamiliar6.map((e) => e.entidadNacimiento).first;
    _curp6.text = _EstructuraFamiliar6.map((e) => e.curp).first;
    _estadoCivil6.text =
        _EstructuraFamiliar6.map((e) => e.claveEstadoCivil).first +
            " " +
            _EstructuraFamiliar6.map((e) => e.estadoCivil).first;
    _parentesco6.text =
        _EstructuraFamiliar6.map((e) => e.claveParentesco).first +
            " " +
            _EstructuraFamiliar6.map((e) => e.parentesco).first;
    _otroEstadoCivil6.text =
        _EstructuraFamiliar6.map((e) => e.otroEstadoCivil).first;
    _otroParentesco6.text =
        _EstructuraFamiliar6.map((e) => e.otroParentesco).first;
  }

  getAllEstructura7() async {
    _EstructuraFamiliar7 = [];
    var categories =
        await CategoryService().readEstructura7(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.folio = category['folio'];
        categoryModel.nombre = category['nombre'];
        categoryModel.primerApellido = category['primerApellido'];
        categoryModel.segundoApellido = category['segundoApellido'];
        categoryModel.sexo = category['sexo'];
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

        _EstructuraFamiliar7.add(categoryModel);
      });
    });
    if (_EstructuraFamiliar7.map((e) => e.sexo).first == "HOMBRE") {
      _sexo7 = Sexo.HOMBRE;
    } else if (_EstructuraFamiliar7.map((e) => e.sexo).first == "MUJER") {
      _sexo7 = Sexo.MUJER;
    } else if (_EstructuraFamiliar7.map((e) => e.sexo).first == "OTRO") {
      _sexo7 = Sexo.OTRO;
    }
    _nombre7.text = _EstructuraFamiliar7.map((e) => e.nombre).first;
    _primerApellido7.text =
        _EstructuraFamiliar7.map((e) => e.primerApellido).first;
    _segundoApellido7.text =
        _EstructuraFamiliar7.map((e) => e.segundoApellido).first;
    _fechaNacimiento7.text =
        _EstructuraFamiliar7.map((e) => e.fechaNacimiento).first;
    _entidadNacimiento7.text =
        _EstructuraFamiliar7.map((e) => e.claveEntidad).first +
            " " +
            _EstructuraFamiliar7.map((e) => e.entidadNacimiento).first;
    _curp7.text = _EstructuraFamiliar7.map((e) => e.curp).first;
    _estadoCivil7.text =
        _EstructuraFamiliar7.map((e) => e.claveEstadoCivil).first +
            " " +
            _EstructuraFamiliar7.map((e) => e.estadoCivil).first;
    _parentesco7.text =
        _EstructuraFamiliar7.map((e) => e.claveParentesco).first +
            " " +
            _EstructuraFamiliar7.map((e) => e.parentesco).first;
    _otroEstadoCivil7.text =
        _EstructuraFamiliar7.map((e) => e.otroEstadoCivil).first;
    _otroParentesco7.text =
        _EstructuraFamiliar7.map((e) => e.otroParentesco).first;
  }

  getAllEstructura8() async {
    _EstructuraFamiliar8 = [];
    var categories =
        await CategoryService().readEstructura8(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.folio = category['folio'];
        categoryModel.nombre = category['nombre'];
        categoryModel.primerApellido = category['primerApellido'];
        categoryModel.segundoApellido = category['segundoApellido'];
        categoryModel.sexo = category['sexo'];
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

        _EstructuraFamiliar8.add(categoryModel);
      });
    });
    if (_EstructuraFamiliar8.map((e) => e.sexo).first == "HOMBRE") {
      _sexo8 = Sexo.HOMBRE;
    } else if (_EstructuraFamiliar8.map((e) => e.sexo).first == "MUJER") {
      _sexo8 = Sexo.MUJER;
    } else if (_EstructuraFamiliar8.map((e) => e.sexo).first == "OTRO") {
      _sexo8 = Sexo.OTRO;
    }

    _nombre8.text = _EstructuraFamiliar8.map((e) => e.nombre).first;
    _primerApellido8.text =
        _EstructuraFamiliar8.map((e) => e.primerApellido).first;
    _segundoApellido8.text =
        _EstructuraFamiliar8.map((e) => e.segundoApellido).first;
    _fechaNacimiento8.text =
        _EstructuraFamiliar8.map((e) => e.fechaNacimiento).first;
    _entidadNacimiento8.text =
        _EstructuraFamiliar8.map((e) => e.claveEntidad).first +
            " " +
            _EstructuraFamiliar8.map((e) => e.entidadNacimiento).first;
    _curp8.text = _EstructuraFamiliar8.map((e) => e.curp).first;
    _estadoCivil8.text =
        _EstructuraFamiliar8.map((e) => e.claveEstadoCivil).first +
            " " +
            _EstructuraFamiliar8.map((e) => e.estadoCivil).first;
    _parentesco8.text =
        _EstructuraFamiliar8.map((e) => e.claveParentesco).first +
            " " +
            _EstructuraFamiliar8.map((e) => e.parentesco).first;
    _otroEstadoCivil8.text =
        _EstructuraFamiliar8.map((e) => e.otroEstadoCivil).first;
    _otroParentesco8.text =
        _EstructuraFamiliar8.map((e) => e.otroParentesco).first;
  }

  getAllEstructura9() async {
    _EstructuraFamiliar9 = [];
    var categories =
        await CategoryService().readEstructura9(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.folio = category['folio'];
        categoryModel.nombre = category['nombre'];
        categoryModel.primerApellido = category['primerApellido'];
        categoryModel.segundoApellido = category['segundoApellido'];
        categoryModel.sexo = category['sexo'];
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

        _EstructuraFamiliar9.add(categoryModel);
      });
    });
    if (_EstructuraFamiliar9.map((e) => e.sexo).first == "HOMBRE") {
      _sexo9 = Sexo.HOMBRE;
    } else if (_EstructuraFamiliar9.map((e) => e.sexo).first == "MUJER") {
      _sexo9 = Sexo.MUJER;
    } else if (_EstructuraFamiliar9.map((e) => e.sexo).first == "OTRO") {
      _sexo9 = Sexo.OTRO;
    }

    _nombre9.text = _EstructuraFamiliar9.map((e) => e.nombre).first;
    _primerApellido9.text =
        _EstructuraFamiliar9.map((e) => e.primerApellido).first;
    _segundoApellido9.text =
        _EstructuraFamiliar9.map((e) => e.segundoApellido).first;
    _fechaNacimiento9.text =
        _EstructuraFamiliar9.map((e) => e.fechaNacimiento).first;
    _entidadNacimiento9.text =
        _EstructuraFamiliar9.map((e) => e.claveEntidad).first +
            " " +
            _EstructuraFamiliar9.map((e) => e.entidadNacimiento).first;
    _curp9.text = _EstructuraFamiliar9.map((e) => e.curp).first;
    _estadoCivil9.text =
        _EstructuraFamiliar9.map((e) => e.claveEstadoCivil).first +
            " " +
            _EstructuraFamiliar9.map((e) => e.estadoCivil).first;
    _parentesco9.text =
        _EstructuraFamiliar9.map((e) => e.claveParentesco).first +
            " " +
            _EstructuraFamiliar9.map((e) => e.parentesco).first;
    _otroEstadoCivil9.text =
        _EstructuraFamiliar9.map((e) => e.otroEstadoCivil).first;
    _otroParentesco9.text =
        _EstructuraFamiliar9.map((e) => e.otroParentesco).first;
  }

  getAllEstructura10() async {
    _EstructuraFamiliar10 = [];
    var categories =
        await CategoryService().readEstructura10(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EstructuraFamilarModel();
        categoryModel.folio = category['folio'];
        categoryModel.nombre = category['nombre'];
        categoryModel.primerApellido = category['primerApellido'];
        categoryModel.segundoApellido = category['segundoApellido'];
        categoryModel.sexo = category['sexo'];
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

        _EstructuraFamiliar10.add(categoryModel);
      });
    });
    if (_EstructuraFamiliar10.map((e) => e.sexo).first == "HOMBRE") {
      _sexo10 = Sexo.HOMBRE;
    } else if (_EstructuraFamiliar10.map((e) => e.sexo).first == "MUJER") {
      _sexo10 = Sexo.MUJER;
    } else if (_EstructuraFamiliar10.map((e) => e.sexo).first == "OTRO") {
      _sexo10 = Sexo.OTRO;
    }

    _nombre10.text = _EstructuraFamiliar10.map((e) => e.nombre).first;
    _primerApellido10.text =
        _EstructuraFamiliar10.map((e) => e.primerApellido).first;
    _segundoApellido10.text =
        _EstructuraFamiliar10.map((e) => e.segundoApellido).first;
    _fechaNacimiento10.text =
        _EstructuraFamiliar10.map((e) => e.fechaNacimiento).first;
    _entidadNacimiento10.text =
        _EstructuraFamiliar10.map((e) => e.claveEntidad).first +
            " " +
            _EstructuraFamiliar10.map((e) => e.entidadNacimiento).first;
    _curp10.text = _EstructuraFamiliar10.map((e) => e.curp).first;
    _estadoCivil10.text =
        _EstructuraFamiliar10.map((e) => e.claveEstadoCivil).first +
            " " +
            _EstructuraFamiliar10.map((e) => e.estadoCivil).first;
    _parentesco10.text =
        _EstructuraFamiliar10.map((e) => e.claveParentesco).first +
            " " +
            _EstructuraFamiliar10.map((e) => e.parentesco).first;
    _otroEstadoCivil10.text =
        _EstructuraFamiliar10.map((e) => e.otroEstadoCivil).first;
    _otroParentesco10.text =
        _EstructuraFamiliar10.map((e) => e.otroParentesco).first;
  }

  bool cargando = false;
  guardar() async {
    await DbHelper().eliminarEstructura(widget.folio, widget.dispositivo);
    _EstructuraGuardar.clear();
    setState(() {
      cargando = true;
    });
    try {
      if (_nombre1.text.replaceAll("  ", " ") != '') {
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
        print(_EstructuraGuardar.toString());
        for (var i = 0; i < _EstructuraGuardar.length; i++) {
          await DbHelper().saveEstructuraFamiliar(_EstructuraGuardar[i]);
        }
        Navigator.of(context)
            .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          return ActualizarEstudio(
              folio: widget.folio, dispositivo: widget.dispositivo);
        }));
        setState(() {
          cargando = false;
        });
        alertDialog(context, 'Datos Actualizados Con Exito');
      } else {
        alertDialog(context, 'El renglon 1 no puede estar vacio');
      }
    } catch (error) {
      print(error);
      alertDialog(context, 'Ocurrio un error al actualizar los datos');
    }
  }

  @override
  void initState() {
    getTitular();
    getAllCategoriesEstados();
    getAllCategoriesEstadosCiviles();
    getAllCategoriesParentesco();
    super.initState();
  }

  CURP curp = new CURP();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                            dataRowHeight: 100,
                            columns: [
                              DataColumn(label: Text('NO.')),
                              DataColumn(label: Text('NOMBRES')),
                              DataColumn(label: Text('APELLIDO PATERNO')),
                              DataColumn(label: Text('APELLIDO MATERNO')),
                              DataColumn(label: Text('SEXO')),
                              DataColumn(label: Text('FECHA DE NACIMIENTO')),
                              DataColumn(label: Text('ENTIDAD DE NACIMIENTO')),
                              DataColumn(label: Text('CURP')),
                              DataColumn(label: Text('ESTADO CIVIL')),
                              DataColumn(label: Text('OTRO ESTADO CIVIL')),
                              DataColumn(label: Text('PARENTESCO')),
                              DataColumn(label: Text('OTRO PARENTESCO')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('1')),
                                DataCell(genTextName(
                                    controller: _nombre1, hintName: 'NOMBRES')),
                                DataCell(genTextName(
                                    controller: _primerApellido1,
                                    hintName: 'APELLIDO PATERNO')),
                                DataCell(genTextName(
                                    controller: _segundoApellido1,
                                    hintName: 'APELLIDO MATERNO')),
                                DataCell(
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListTile(
                                          title: Text('HOMBRE'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.HOMBRE,
                                            groupValue: _sexo1,
                                            toggleable: true,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo1 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('MUJER'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.MUJER,
                                            toggleable: true,
                                            groupValue: _sexo1,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo1 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('OTRO'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.OTRO,
                                            toggleable: true,
                                            groupValue: _sexo1,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo1 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(getTextDate(
                                  controller: _fechaNacimiento1,
                                  hintName: 'DD-MM-AAAA',
                                  inputType: TextInputType.number,
                                )),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ENTIDAD DE NACIMIENTO',
                                        labelText: 'ENTIDAD DE NACIMIENTO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Estado.map((estado) =>
                                          SearchFieldListItem(estado.Estado,
                                              item: estado)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _entidadNacimiento1,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {},
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 18),
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == '' || value.isEmpty) {
                                          return 'Revisa los datos para generar el curp';
                                        } else if (value.length != 18) {
                                          return 'El curp debe ser de 18 caracteres';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: _curp1,
                                      textCapitalization:
                                          TextCapitalization.characters,
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
                                              'PRESIONA PARA GENERAR CURP '),
                                      onTap: () async {
                                        setState(() {
                                          //curp funcion
                                          _curp1 = TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: curp.generarCurp(
                                                      _nombre1.text,
                                                      _primerApellido1.text,
                                                      _segundoApellido1.text,
                                                      _sexo1.name.toString(),
                                                      _fechaNacimiento1.text,
                                                      _entidadNacimiento1.text,
                                                      context)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ESTADO CIVIL',
                                        labelText: 'ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _EstadosCiviles.map(
                                          (estadosCiviles) =>
                                              SearchFieldListItem(
                                                  estadosCiviles.EstadoCivil,
                                                  item:
                                                      estadosCiviles)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _estadoCivil1,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_estadoCivil1.text == '99 OTRA') {
                                            val1 = true;
                                          } else {
                                            val1 = false;
                                            _otroEstadoCivil1.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroEstadoCivil1,
                                      enabled: val1,
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
                                        hintText: 'OTRO ESTADO CIVIL',
                                        labelText: 'OTRO ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: 300,
                                  child: TextFormField(
                                    controller: _parentesco1,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      hintText: 'PARENTESCO',
                                      labelText: 'PARENTESCO',
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                  ),
                                )),
                                DataCell(
                                  Text(
                                      'NO ES POSIBLE INGRESAR OTRO PARENTESCO\n EN ESTE CAMPO'),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('2')),
                                DataCell(genTextName(
                                    controller: _nombre2, hintName: 'NOMBRES')),
                                DataCell(genTextName(
                                    controller: _primerApellido2,
                                    hintName: 'APELLIDO PATERNO')),
                                DataCell(genTextName(
                                    controller: _segundoApellido2,
                                    hintName: 'APELLIDO MATERNO')),
                                DataCell(
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListTile(
                                          title: Text('HOMBRE'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.HOMBRE,
                                            toggleable: true,
                                            groupValue: _sexo2,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo2 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('MUJER'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.MUJER,
                                            toggleable: true,
                                            groupValue: _sexo2,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo2 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('OTRO'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.OTRO,
                                            groupValue: _sexo2,
                                            toggleable: true,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo2 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(getTextDate(
                                  controller: _fechaNacimiento2,
                                  hintName: 'DD-MM-AAAA',
                                  inputType: TextInputType.number,
                                )),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ENTIDAD DE NACIMIENTO',
                                        labelText: 'ENTIDAD DE NACIMIENTO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Estado.map((estado) =>
                                          SearchFieldListItem(estado.Estado,
                                              item: estado)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _entidadNacimiento2,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {},
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 18),
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        if ((_nombre2.text.length != 0) &&
                                            (value.isEmpty || value == '')) {
                                          return 'Revisa los datos para generar el curp';
                                        } else if ((_nombre2.text.length !=
                                                0) &&
                                            value.length != 18) {
                                          return 'El curp debe ser de 18 caracteres';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: _curp2,
                                      textCapitalization:
                                          TextCapitalization.characters,
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
                                              'PRESIONA PARA GENERAR CURP '),
                                      onTap: () async {
                                        setState(() {
                                          _curp2 = TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: curp.generarCurp(
                                                      _nombre2.text,
                                                      _primerApellido2.text,
                                                      _segundoApellido2.text,
                                                      _sexo2.name.toString(),
                                                      _fechaNacimiento2.text,
                                                      _entidadNacimiento2.text,
                                                      context)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ESTADO CIVIL',
                                        labelText: 'ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _EstadosCiviles.map(
                                          (estadosCiviles) =>
                                              SearchFieldListItem(
                                                  estadosCiviles.EstadoCivil,
                                                  item:
                                                      estadosCiviles)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _estadoCivil2,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_estadoCivil2.text == '99 OTRA') {
                                            val2 = true;
                                          } else {
                                            val2 = false;
                                            _otroEstadoCivil2.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroEstadoCivil2,
                                      enabled: val2,
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
                                        hintText: 'OTRO ESTADO CIVIL',
                                        labelText: 'OTRO ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'PARENTESCO',
                                        labelText: 'PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Parentesco.map(
                                          (parentesco) => SearchFieldListItem(
                                              parentesco.Parentesco,
                                              item: parentesco)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _parentesco2,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_parentesco2.text == "15 OTRO") {
                                            valPar2 = true;
                                          } else {
                                            valPar2 = false;
                                            _otroParentesco2.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroParentesco2,
                                      enabled: valPar2,
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
                                        hintText: 'OTRO PARENTESCO',
                                        labelText: 'OTRO PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('3')),
                                DataCell(genTextName(
                                    controller: _nombre3, hintName: 'NOMBRES')),
                                DataCell(genTextName(
                                    controller: _primerApellido3,
                                    hintName: 'APELLIDO PATERNO')),
                                DataCell(genTextName(
                                    controller: _segundoApellido3,
                                    hintName: 'APELLIDO MATERNO')),
                                DataCell(
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListTile(
                                          title: Text('HOMBRE'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.HOMBRE,
                                            groupValue: _sexo3,
                                            toggleable: true,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo3 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('MUJER'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.MUJER,
                                            toggleable: true,
                                            groupValue: _sexo3,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo3 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('OTRO'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.OTRO,
                                            groupValue: _sexo3,
                                            toggleable: true,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo3 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(getTextDate(
                                  controller: _fechaNacimiento3,
                                  hintName: 'DD-MM-AAAA',
                                  inputType: TextInputType.number,
                                )),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ENTIDAD DE NACIMIENTO',
                                        labelText: 'ENTIDAD DE NACIMIENTO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Estado.map((estado) =>
                                          SearchFieldListItem(estado.Estado,
                                              item: estado)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _entidadNacimiento3,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {},
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 18),
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        if ((_nombre3.text.length != 0) &&
                                            (value.isEmpty || value == '')) {
                                          return 'Revisa los datos para generar el curp';
                                        } else if ((_nombre3.text.length !=
                                                0) &&
                                            value.length != 18) {
                                          return 'El curp debe ser de 18 caracteres';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: _curp3,
                                      textCapitalization:
                                          TextCapitalization.characters,
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
                                              'PRESIONA PARA GENERAR CURP '),
                                      onTap: () async {
                                        setState(() {
                                          _curp3 = TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: curp.generarCurp(
                                                      _nombre3.text,
                                                      _primerApellido3.text,
                                                      _segundoApellido3.text,
                                                      _sexo3.name.toString(),
                                                      _fechaNacimiento3.text,
                                                      _entidadNacimiento3.text,
                                                      context)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ESTADO CIVIL',
                                        labelText: 'ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _EstadosCiviles.map(
                                          (estadosCiviles) =>
                                              SearchFieldListItem(
                                                  estadosCiviles.EstadoCivil,
                                                  item:
                                                      estadosCiviles)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _estadoCivil3,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_estadoCivil3.text == '99 OTRA') {
                                            val3 = true;
                                          } else {
                                            val3 = false;
                                            _otroEstadoCivil3.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroEstadoCivil3,
                                      enabled: val3,
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
                                        hintText: 'OTRO ESTADO CIVIL',
                                        labelText: 'OTRO ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'PARENTESCO',
                                        labelText: 'PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Parentesco.map(
                                          (parentesco) => SearchFieldListItem(
                                              parentesco.Parentesco,
                                              item: parentesco)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _parentesco3,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_parentesco3.text == "15 OTRO") {
                                            valPar3 = true;
                                          } else {
                                            valPar3 = false;
                                            _otroParentesco3.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroParentesco3,
                                      enabled: valPar3,
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
                                        hintText: 'OTRO PARENTESCO',
                                        labelText: 'OTRO PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('4')),
                                DataCell(genTextName(
                                    controller: _nombre4, hintName: 'NOMBRES')),
                                DataCell(genTextName(
                                    controller: _primerApellido4,
                                    hintName: 'APELLIDO PATERNO')),
                                DataCell(genTextName(
                                    controller: _segundoApellido4,
                                    hintName: 'APELLIDO MATERNO')),
                                DataCell(
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListTile(
                                          title: Text('HOMBRE'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.HOMBRE,
                                            toggleable: true,
                                            groupValue: _sexo4,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo4 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('MUJER'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.MUJER,
                                            toggleable: true,
                                            groupValue: _sexo4,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo4 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('OTRO'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.OTRO,
                                            toggleable: true,
                                            groupValue: _sexo4,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo4 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(getTextDate(
                                  controller: _fechaNacimiento4,
                                  hintName: 'DD-MM-AAAA',
                                  inputType: TextInputType.number,
                                )),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ENTIDAD DE NACIMIENTO',
                                        labelText: 'ENTIDAD DE NACIMIENTO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Estado.map((estado) =>
                                          SearchFieldListItem(estado.Estado,
                                              item: estado)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _entidadNacimiento4,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {},
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 18),
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        if ((_nombre4.text.length != 0) &&
                                            (value.isEmpty || value == '')) {
                                          return 'Revisa los datos para generar el curp';
                                        } else if ((_nombre4.text.length !=
                                                0) &&
                                            value.length != 18) {
                                          return 'El curp debe ser de 18 caracteres';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: _curp4,
                                      textCapitalization:
                                          TextCapitalization.characters,
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
                                              'PRESIONA PARA GENERAR CURP '),
                                      onTap: () async {
                                        setState(() {
                                          _curp4 = TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: curp.generarCurp(
                                                      _nombre4.text,
                                                      _primerApellido4.text,
                                                      _segundoApellido4.text,
                                                      _sexo4.name.toString(),
                                                      _fechaNacimiento4.text,
                                                      _entidadNacimiento4.text,
                                                      context)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ESTADO CIVIL',
                                        labelText: 'ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _EstadosCiviles.map(
                                          (estadosCiviles) =>
                                              SearchFieldListItem(
                                                  estadosCiviles.EstadoCivil,
                                                  item:
                                                      estadosCiviles)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _estadoCivil4,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_estadoCivil4.text == '99 OTRA') {
                                            val4 = true;
                                          } else {
                                            val4 = false;
                                            _otroEstadoCivil4.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroEstadoCivil4,
                                      enabled: val4,
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
                                        hintText: 'OTRO ESTADO CIVIL',
                                        labelText: 'OTRO ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'PARENTESCO',
                                        labelText: 'PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Parentesco.map(
                                          (parentesco) => SearchFieldListItem(
                                              parentesco.Parentesco,
                                              item: parentesco)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _parentesco4,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_parentesco4.text == "15 OTRO") {
                                            valPar4 = true;
                                          } else {
                                            valPar4 = false;
                                            _otroParentesco4.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroParentesco4,
                                      enabled: valPar4,
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
                                        hintText: 'OTRO PARENTESCO',
                                        labelText: 'OTRO PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('5')),
                                DataCell(genTextName(
                                    controller: _nombre5, hintName: 'NOMBRES')),
                                DataCell(genTextName(
                                    controller: _primerApellido5,
                                    hintName: 'APELLIDO PATERNO')),
                                DataCell(genTextName(
                                    controller: _segundoApellido5,
                                    hintName: 'APELLIDO MATERNO')),
                                DataCell(
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListTile(
                                          title: Text('HOMBRE'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.HOMBRE,
                                            groupValue: _sexo5,
                                            toggleable: true,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo5 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('MUJER'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.MUJER,
                                            groupValue: _sexo5,
                                            toggleable: true,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo5 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('OTRO'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.OTRO,
                                            groupValue: _sexo5,
                                            toggleable: true,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo5 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(getTextDate(
                                  controller: _fechaNacimiento5,
                                  hintName: 'DD-MM-AAAA',
                                  inputType: TextInputType.number,
                                )),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'Estidad De Nacimiento',
                                        labelText: 'ENTIDAD DE NACIMIENTO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Estado.map((estado) =>
                                          SearchFieldListItem(estado.Estado,
                                              item: estado)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _entidadNacimiento5,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {},
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 18),
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        if ((_nombre5.text.length != 0) &&
                                            (value.isEmpty || value == '')) {
                                          return 'Revisa los datos para generar el curp';
                                        } else if ((_nombre5.text.length !=
                                                0) &&
                                            value.length != 18) {
                                          return 'El curp debe ser de 18 caracteres';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: _curp5,
                                      textCapitalization:
                                          TextCapitalization.characters,
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
                                              'PRESIONA PARA GENERAR CURP '),
                                      onTap: () async {
                                        setState(() {
                                          _curp5 = TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: curp.generarCurp(
                                                      _nombre5.text,
                                                      _primerApellido5.text,
                                                      _segundoApellido5.text,
                                                      _sexo5.name.toString(),
                                                      _fechaNacimiento5.text,
                                                      _entidadNacimiento5.text,
                                                      context)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ESTADO CIVIL',
                                        labelText: 'ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _EstadosCiviles.map(
                                          (estadosCiviles) =>
                                              SearchFieldListItem(
                                                  estadosCiviles.EstadoCivil,
                                                  item:
                                                      estadosCiviles)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _estadoCivil5,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_estadoCivil5.text == '99 OTRA') {
                                            val5 = true;
                                          } else {
                                            val5 = false;
                                            _otroEstadoCivil5.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroEstadoCivil5,
                                      enabled: val5,
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
                                        hintText: 'OTRO ESTADO CIVIL',
                                        labelText: 'OTRO ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'PARENTESCO',
                                        labelText: 'PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Parentesco.map(
                                          (parentesco) => SearchFieldListItem(
                                              parentesco.Parentesco,
                                              item: parentesco)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _parentesco5,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_parentesco5.text == "15 OTRO") {
                                            valPar5 = true;
                                          } else {
                                            valPar5 = false;
                                            _otroParentesco5.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroParentesco5,
                                      enabled: valPar5,
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
                                        hintText: 'OTRO PARENTESCO',
                                        labelText: 'OTRO PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('6')),
                                DataCell(genTextName(
                                    controller: _nombre6, hintName: 'NOMBRES')),
                                DataCell(genTextName(
                                    controller: _primerApellido6,
                                    hintName: 'APELLIDO PATERNO')),
                                DataCell(genTextName(
                                    controller: _segundoApellido6,
                                    hintName: 'APELLIDO MATERNO')),
                                DataCell(
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListTile(
                                          title: Text('HOMBRE'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.HOMBRE,
                                            groupValue: _sexo6,
                                            toggleable: true,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo6 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('MUJER'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.MUJER,
                                            groupValue: _sexo6,
                                            toggleable: true,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo6 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('OTRO'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.OTRO,
                                            toggleable: true,
                                            groupValue: _sexo6,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo6 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(getTextDate(
                                  controller: _fechaNacimiento6,
                                  hintName: 'DD-MM-AAAA',
                                  inputType: TextInputType.number,
                                )),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ENTIDAD DE NACIMIENTO',
                                        labelText: 'ENTIDAD DE NACIMIENTO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Estado.map((estado) =>
                                          SearchFieldListItem(estado.Estado,
                                              item: estado)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _entidadNacimiento6,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {},
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 18),
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        if ((_nombre6.text.length != 0) &&
                                            (value.isEmpty || value == '')) {
                                          return 'Revisa los datos para generar el curp';
                                        } else if ((_nombre6.text.length !=
                                                0) &&
                                            value.length != 18) {
                                          return 'El curp debe ser de 18 caracteres';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: _curp6,
                                      textCapitalization:
                                          TextCapitalization.characters,
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
                                              'PRESIONA PARA GENERAR CURP '),
                                      onTap: () async {
                                        setState(() {
                                          _curp6 = TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: curp.generarCurp(
                                                      _nombre6.text,
                                                      _primerApellido6.text,
                                                      _segundoApellido6.text,
                                                      _sexo6.name.toString(),
                                                      _fechaNacimiento6.text,
                                                      _entidadNacimiento6.text,
                                                      context)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ESTADO CIVIL',
                                        labelText: 'ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _EstadosCiviles.map(
                                          (estadosCiviles) =>
                                              SearchFieldListItem(
                                                  estadosCiviles.EstadoCivil,
                                                  item:
                                                      estadosCiviles)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _estadoCivil6,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_estadoCivil6.text == '99 OTRA') {
                                            val6 = true;
                                          } else {
                                            val6 = false;
                                            _otroEstadoCivil6.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroEstadoCivil6,
                                      enabled: val6,
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
                                        hintText: 'OTRO ESTADO CIVIL',
                                        labelText: 'OTRO ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'PARENTESCO',
                                        labelText: 'PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Parentesco.map(
                                          (parentesco) => SearchFieldListItem(
                                              parentesco.Parentesco,
                                              item: parentesco)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _parentesco6,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_parentesco6.text == "15 OTRO") {
                                            valPar6 = true;
                                          } else {
                                            valPar6 = false;
                                            _otroParentesco6.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroParentesco6,
                                      enabled: valPar6,
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
                                        hintText: 'OTRO PARENTESCO',
                                        labelText: 'OTRO PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('7')),
                                DataCell(genTextName(
                                    controller: _nombre7, hintName: 'NOMBRES')),
                                DataCell(genTextName(
                                    controller: _primerApellido7,
                                    hintName: 'APELLIDO PATERNO')),
                                DataCell(genTextName(
                                    controller: _segundoApellido7,
                                    hintName: 'APELLIDO MATERNO')),
                                DataCell(
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListTile(
                                          title: Text('HOMBRE'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.HOMBRE,
                                            toggleable: true,
                                            groupValue: _sexo7,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo7 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('MUJER'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.MUJER,
                                            toggleable: true,
                                            groupValue: _sexo7,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo7 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('OTRO'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.OTRO,
                                            toggleable: true,
                                            groupValue: _sexo7,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo7 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(getTextDate(
                                  controller: _fechaNacimiento7,
                                  hintName: 'DD-MM-AAAA',
                                  inputType: TextInputType.number,
                                )),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ENTIDAD DE NACIMIENTO',
                                        labelText: 'ENTIDAD DE NACIMIENTO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Estado.map((estado) =>
                                          SearchFieldListItem(estado.Estado,
                                              item: estado)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _entidadNacimiento7,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {},
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 18),
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        if ((_nombre7.text.length != 0) &&
                                            (value.isEmpty || value == '')) {
                                          return 'Revisa los datos para generar el curp';
                                        } else if ((_nombre7.text.length !=
                                                0) &&
                                            value.length != 18) {
                                          return 'El curp debe ser de 18 caracteres';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: _curp7,
                                      textCapitalization:
                                          TextCapitalization.characters,
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
                                              'PRESIONA PARA GENERAR CURP '),
                                      onTap: () async {
                                        setState(() {
                                          _curp7 = TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: curp.generarCurp(
                                                      _nombre7.text,
                                                      _primerApellido7.text,
                                                      _segundoApellido7.text,
                                                      _sexo7.name.toString(),
                                                      _fechaNacimiento7.text,
                                                      _entidadNacimiento7.text,
                                                      context)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ESTADO CIVIL',
                                        labelText: 'ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _EstadosCiviles.map(
                                          (estadosCiviles) =>
                                              SearchFieldListItem(
                                                  estadosCiviles.EstadoCivil,
                                                  item:
                                                      estadosCiviles)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _estadoCivil7,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_estadoCivil7.text == '99 OTRA') {
                                            val7 = true;
                                          } else {
                                            val7 = false;
                                            _otroEstadoCivil7.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroEstadoCivil7,
                                      enabled: val7,
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
                                        hintText: 'OTRO ESTADO CIVIL',
                                        labelText: 'OTRO ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'PARENTESCO',
                                        labelText: 'PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Parentesco.map(
                                          (parentesco) => SearchFieldListItem(
                                              parentesco.Parentesco,
                                              item: parentesco)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _parentesco7,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_parentesco7.text == "15 OTRO") {
                                            valPar7 = true;
                                          } else {
                                            valPar7 = false;
                                            _otroParentesco7.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroParentesco7,
                                      enabled: valPar7,
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
                                        hintText: 'OTRO PARENTESCO',
                                        labelText: 'OTRO PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('8')),
                                DataCell(genTextName(
                                    controller: _nombre8, hintName: 'NOMBRES')),
                                DataCell(genTextName(
                                    controller: _primerApellido8,
                                    hintName: 'APELLIDO PATERNO')),
                                DataCell(genTextName(
                                    controller: _segundoApellido8,
                                    hintName: 'APELLIDO MATERNO')),
                                DataCell(
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListTile(
                                          title: Text('HOMBRE'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.HOMBRE,
                                            toggleable: true,
                                            groupValue: _sexo8,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo8 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('MUJER'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.MUJER,
                                            toggleable: true,
                                            groupValue: _sexo8,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo8 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('OTRO'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.OTRO,
                                            groupValue: _sexo8,
                                            toggleable: true,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo8 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(getTextDate(
                                  controller: _fechaNacimiento8,
                                  hintName: 'DD-MM-AAAA',
                                  inputType: TextInputType.number,
                                )),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ENTIDAD DE NACIMIENTO',
                                        labelText: 'ENTIDAD DE NACIMIENTO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Estado.map((estado) =>
                                          SearchFieldListItem(estado.Estado,
                                              item: estado)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _entidadNacimiento8,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {},
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 18),
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        if ((_nombre8.text.length != 0) &&
                                            (value.isEmpty || value == '')) {
                                          return 'Revisa los datos para generar el curp';
                                        } else if ((_nombre8.text.length !=
                                                0) &&
                                            value.length != 18) {
                                          return 'El curp debe ser de 18 caracteres';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: _curp8,
                                      textCapitalization:
                                          TextCapitalization.characters,
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
                                              'PRESIONA PARA GENERAR CURP '),
                                      onTap: () async {
                                        setState(() {
                                          _curp8 = TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: curp.generarCurp(
                                                      _nombre8.text,
                                                      _primerApellido8.text,
                                                      _segundoApellido8.text,
                                                      _sexo8.name.toString(),
                                                      _fechaNacimiento8.text,
                                                      _entidadNacimiento8.text,
                                                      context)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ESTADO CIVIL',
                                        labelText: 'ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _EstadosCiviles.map(
                                          (estadosCiviles) =>
                                              SearchFieldListItem(
                                                  estadosCiviles.EstadoCivil,
                                                  item:
                                                      estadosCiviles)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _estadoCivil8,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_estadoCivil8.text == '99 OTRA') {
                                            val8 = true;
                                          } else {
                                            val8 = false;
                                            _otroEstadoCivil8.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroEstadoCivil8,
                                      enabled: val8,
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
                                        hintText: 'OTRO ESTADO CIVIL',
                                        labelText: 'OTRO ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'PARENTESCO',
                                        labelText: 'PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Parentesco.map(
                                          (parentesco) => SearchFieldListItem(
                                              parentesco.Parentesco,
                                              item: parentesco)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _parentesco8,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_parentesco8.text == "15 OTRO") {
                                            valPar8 = true;
                                          } else {
                                            valPar8 = false;
                                            _otroParentesco8.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroParentesco8,
                                      enabled: valPar8,
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
                                        hintText: 'OTRO PARENTESCO',
                                        labelText: 'OTRO PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('9')),
                                DataCell(genTextName(
                                    controller: _nombre9, hintName: 'NOMBRES')),
                                DataCell(genTextName(
                                    controller: _primerApellido9,
                                    hintName: 'APELLIDO PATERNO')),
                                DataCell(genTextName(
                                    controller: _segundoApellido9,
                                    hintName: 'APELLIDO MATERNO')),
                                DataCell(
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListTile(
                                          title: Text('HOMBRE'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.HOMBRE,
                                            toggleable: true,
                                            groupValue: _sexo9,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo9 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('MUJER'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.MUJER,
                                            toggleable: true,
                                            groupValue: _sexo9,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo9 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('OTRO'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.OTRO,
                                            toggleable: true,
                                            groupValue: _sexo9,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo9 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(getTextDate(
                                  controller: _fechaNacimiento9,
                                  hintName: 'DD-MM-AAAA',
                                  inputType: TextInputType.number,
                                )),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ENTIDAD DE NACIMIENTO',
                                        labelText: 'ENTIDAD DE NACIMIENTO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Estado.map((estado) =>
                                          SearchFieldListItem(estado.Estado,
                                              item: estado)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _entidadNacimiento9,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {},
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 18),
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        if ((_nombre9.text.length != 0) &&
                                            (value.isEmpty || value == '')) {
                                          return 'Revisa los datos para generar el curp';
                                        } else if ((_nombre9.text.length !=
                                                0) &&
                                            value.length != 18) {
                                          return 'El curp debe ser de 18 caracteres';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: _curp9,
                                      textCapitalization:
                                          TextCapitalization.characters,
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
                                              'PRESIONA PARA GENERAR CURP '),
                                      onTap: () async {
                                        setState(() {
                                          _curp9 = TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: curp.generarCurp(
                                                      _nombre9.text,
                                                      _primerApellido9.text,
                                                      _segundoApellido9.text,
                                                      _sexo9.name.toString(),
                                                      _fechaNacimiento9.text,
                                                      _entidadNacimiento9.text,
                                                      context)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ESTADO CIVIL',
                                        labelText: 'ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _EstadosCiviles.map(
                                          (estadosCiviles) =>
                                              SearchFieldListItem(
                                                  estadosCiviles.EstadoCivil,
                                                  item:
                                                      estadosCiviles)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _estadoCivil9,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_estadoCivil9.text == '99 OTRA') {
                                            val9 = true;
                                          } else {
                                            val9 = false;
                                            _otroEstadoCivil9.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroEstadoCivil9,
                                      enabled: val9,
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
                                        hintText: 'OTRO ESTADO CIVIL',
                                        labelText: 'OTRO ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'PARENTESCO',
                                        labelText: 'PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Parentesco.map(
                                          (parentesco) => SearchFieldListItem(
                                              parentesco.Parentesco,
                                              item: parentesco)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _parentesco9,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_parentesco9.text == "15 OTRO") {
                                            valPar9 = true;
                                          } else {
                                            valPar9 = false;
                                            _otroParentesco9.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroParentesco9,
                                      enabled: valPar9,
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
                                        hintText: 'OTRO PARENTESCO',
                                        labelText: 'OTRO PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('10')),
                                DataCell(genTextName(
                                    controller: _nombre10,
                                    hintName: 'NOMBRES')),
                                DataCell(genTextName(
                                    controller: _primerApellido10,
                                    hintName: 'APELLIDO PATERNO')),
                                DataCell(genTextName(
                                    controller: _segundoApellido10,
                                    hintName: 'APELLIDO MATERNO')),
                                DataCell(
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListTile(
                                          title: Text('HOMBRE'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.HOMBRE,
                                            toggleable: true,
                                            groupValue: _sexo10,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo10 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('MUJER'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.MUJER,
                                            toggleable: true,
                                            groupValue: _sexo10,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo10 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text('OTRO'),
                                          leading: Radio<Sexo>(
                                            value: Sexo.OTRO,
                                            toggleable: true,
                                            groupValue: _sexo10,
                                            onChanged: (Sexo value) {
                                              setState(() {
                                                _sexo10 = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(getTextDate(
                                  controller: _fechaNacimiento10,
                                  hintName: 'DD-MM-AAAA',
                                  inputType: TextInputType.number,
                                )),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ENTIDAD DE NACIMIENTO',
                                        labelText: 'ENTIDAD DE NACIMIENTO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Estado.map((estado) =>
                                          SearchFieldListItem(estado.Estado,
                                              item: estado)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _entidadNacimiento10,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {},
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 18),
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        if ((_nombre10.text.length != 0) &&
                                            (value.isEmpty || value == '')) {
                                          return 'Revisa los datos para generar el curp';
                                        } else if ((_nombre10.text.length !=
                                                0) &&
                                            value.length != 18) {
                                          return 'El curp debe ser de 18 caracteres';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: _curp10,
                                      textCapitalization:
                                          TextCapitalization.characters,
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
                                              'PRESIONA PARA GENERAR CURP '),
                                      onTap: () async {
                                        setState(() {
                                          _curp10 = TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: curp.generarCurp(
                                                      _nombre10.text,
                                                      _primerApellido10.text,
                                                      _segundoApellido10.text,
                                                      _sexo10.name.toString(),
                                                      _fechaNacimiento10.text,
                                                      _entidadNacimiento10.text,
                                                      context)));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'ESTADO CIVIL',
                                        labelText: 'ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _EstadosCiviles.map(
                                          (estadosCiviles) =>
                                              SearchFieldListItem(
                                                  estadosCiviles.EstadoCivil,
                                                  item:
                                                      estadosCiviles)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _estadoCivil10,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_estadoCivil10.text ==
                                              '99 OTRA') {
                                            val10 = true;
                                          } else {
                                            val10 = false;
                                            _otroEstadoCivil10.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroEstadoCivil10,
                                      enabled: val10,
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
                                        hintText: 'OTRO ESTADO CIVIL',
                                        labelText: 'OTRO ESTADO CIVIL',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
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
                                        hintText: 'PARENTESCO',
                                        labelText: 'PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      suggestions: _Parentesco.map(
                                          (parentesco) => SearchFieldListItem(
                                              parentesco.Parentesco,
                                              item: parentesco)).toList(),
                                      textInputAction: TextInputAction.next,
                                      hasOverlay: true,
                                      controller: _parentesco10,
                                      maxSuggestionsInViewPort: 5,
                                      itemHeight: 45,
                                      onSuggestionTap: (x) {
                                        setState(() {
                                          if (_parentesco10.text == "15 OTRO") {
                                            valPar10 = true;
                                          } else {
                                            valPar10 = false;
                                            _otroParentesco10.clear();
                                          }
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width: 300,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: _otroParentesco10,
                                      enabled: valPar10,
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
                                        hintText: 'OTRO PARENTESCO',
                                        labelText: 'OTRO PARENTESCO',
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
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
                SizedBox(height: 10.0),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: () {
                      _showAlertAct(context);
                      DbHelper()
                          .eliminarEstructura(widget.folio, widget.dispositivo);
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
                  'ANTES DE CONTINUAR REVISAR LOS CURP GENERADOS, DE SER ERRONEOS FAVOR DE CAMBIARLO MANUALMENTE'),
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

  void _showAlertAct(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text(
                  'Antes de continuar revisar los CURP generados, de ser erroneos favor de cambiarlo manualmente'
                      .toUpperCase()),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    child: Text('Revisar'.toUpperCase())),
                TextButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        guardar();
                      }
                    },
                    child: Text('Actualizar'.toUpperCase()))
              ],
            ));
  }
}
