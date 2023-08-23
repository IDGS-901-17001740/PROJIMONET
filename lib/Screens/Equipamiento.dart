import 'package:esn/Comm/genTextEquipamiento.dart';
import 'package:esn/Comm/genTextFolio.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/Comm/getEquipamientoLabel.dart';
import 'package:esn/Model/EquipamientoModel.dart';
import 'package:esn/Screens/AportacionesEconomicas.dart';
import 'package:esn/Screens/Caracteristicas_Casa.dart';
import 'package:esn/Screens/Equipamiento.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import '../Comm/comHelper.dart';
import '../DatabaseHandler/DbHelper.dart';

enum Refrigerador { SI, NO }

enum RefrigeradorSirve { SI, NO }

enum Estufa { SI, NO }

enum EstufaSirve { SI, NO }

enum Video { SI, NO }

enum VideoSirve { SI, NO }

enum Lavadora { SI, NO }

enum LavadoraSirve { SI, NO }

enum Licuadora { SI, NO }

enum LicuadoraSirve { SI, NO }

enum Television { SI, NO }

enum TelevisionSirve { SI, NO }

enum RadioE { SI, NO }

enum RadioSirve { SI, NO }

enum Sala { SI, NO }

enum SalaSirve { SI, NO }

enum Comedor { SI, NO }

enum ComedorSirve { SI, NO }

enum Automovil { SI, NO }

enum AutomovilSirve { SI, NO }

enum Cama { SI, NO }

enum CamaSirve { SI, NO }

enum Celular { SI, NO }

enum CelularSirve { SI, NO }

enum Motocicleta { SI, NO }

enum MotocicletaSirve { SI, NO }

enum Computadora { SI, NO }

enum ComputadoraSirve { SI, NO }

enum Horno { SI, NO }

enum HornoSirve { SI, NO }

enum Telefono { SI, NO }

enum TelefonoSirve { SI, NO }

class Equipamiento extends StatefulWidget {
  String folio;

  String folioDisp;
  String usuario;
  String dispositivo;
  Equipamiento({this.folio, this.folioDisp, this.dispositivo, this.usuario});

  @override
  State<Equipamiento> createState() => _EquipamientoState();
}

class _EquipamientoState extends State<Equipamiento> {
  Refrigerador _refrigerador = Refrigerador.NO;
  RefrigeradorSirve _refrigeradorSirve = RefrigeradorSirve.NO;
  Estufa _estufa = Estufa.NO;
  EstufaSirve _estufaSirve = EstufaSirve.NO;
  Video _video = Video.NO;
  VideoSirve _videoSirve = VideoSirve.NO;
  Lavadora _lavadora = Lavadora.NO;
  LavadoraSirve _lavadoraSirve = LavadoraSirve.NO;
  Licuadora _licuadora = Licuadora.NO;
  LicuadoraSirve _licuadoraSirve = LicuadoraSirve.NO;
  Television _television = Television.NO;
  TelevisionSirve _televisonSirve = TelevisionSirve.NO;
  RadioE _radio = RadioE.NO;
  RadioSirve _radioSirve = RadioSirve.NO;
  Sala _sala = Sala.NO;
  SalaSirve _salaSirve = SalaSirve.NO;
  Comedor _comedor = Comedor.NO;
  ComedorSirve _comedorSirve = ComedorSirve.NO;
  Automovil _automovil = Automovil.NO;
  AutomovilSirve _automovilSirve = AutomovilSirve.NO;
  Cama _cama = Cama.NO;
  CamaSirve _camaSirve = CamaSirve.NO;
  Celular _celular = Celular.NO;
  CelularSirve _celularSirve = CelularSirve.NO;
  Motocicleta _motocicleta = Motocicleta.NO;
  MotocicletaSirve _motocicletaSirve = MotocicletaSirve.NO;
  Computadora _computadora = Computadora.NO;
  ComputadoraSirve _computadoraSirve = ComputadoraSirve.NO;
  Horno _horno = Horno.NO;
  HornoSirve _hornoSirve = HornoSirve.NO;
  Telefono _telefono = Telefono.NO;
  TelefonoSirve _telefonoSirve = TelefonoSirve.NO;
  final _condiciones = TextEditingController();
  var dbHelper;
  List<EquipamientoMovil> _Equipamiento = [];

  List<String> _Condiciones = [
    'BUENA'.toUpperCase(),
    'REGULAR'.toUpperCase(),
    'MALA'
  ];
  String selectedItem = 'Seleccionar';

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  getAllEquipamiento() async {
    _Equipamiento = [];
    var categories =
        await CategoryService().readEquipamiento(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EquipamientoMovil();
        categoryModel.folio = category['folio'];
        categoryModel.tieneRefri = category['tieneRefri'];
        categoryModel.tieneEstufa = category['tieneEstufa'];
        categoryModel.tieneVideoDVDBlueRay = category['tieneVideoDVDBlueRay'];
        categoryModel.tieneLavadora = category['tieneLavadora'];
        categoryModel.tieneLicuadora = category['tieneLicuadora'];
        categoryModel.tieneTelevision = category['tieneTelevision'];
        categoryModel.tieneRadio = category['tieneRadio'];
        categoryModel.tieneSala = category['tieneSala'];
        categoryModel.tieneComedor = category['tieneComedor'];
        categoryModel.tieneAutoMovil = category['tieneAutoMovil'];
        categoryModel.tieneCama = category['tieneCama'];
        categoryModel.tieneCelular = category['tieneCelular'];
        categoryModel.tieneMotocicleta = category['tieneMotocicleta'];
        categoryModel.tieneComputadora = category['tieneComputadora'];
        categoryModel.tieneHorno = category['tieneHorno'];
        categoryModel.tieneTelefono = category['tieneTelefono'];

        categoryModel.sirveRefri = category['sirveRefri'];
        categoryModel.sirveEstufa = category['sirveEstufa'];
        categoryModel.sirveVideoDVDBlueRay = category['sirveVideoDVDBlueRay'];
        categoryModel.sirveLavadora = category['sirveLavadora'];
        categoryModel.sirveLicuadora = category['sirveLicuadora'];
        categoryModel.sirveTelevision = category['sirveTelevision'];
        categoryModel.sirveRadio = category['sirveRadio'];
        categoryModel.sirveSala = category['sirveSala'];
        categoryModel.sirveComedor = category['sirveComedor'];
        categoryModel.sirveAutoMovil = category['sirveAutoMovil'];
        categoryModel.sirveCama = category['sirveCama'];
        categoryModel.sirveCelular = category['sirveCelular'];
        categoryModel.sirveMotocicleta = category['sirveMotocicleta'];
        categoryModel.sirveComputadora = category['sirveComputadora'];
        categoryModel.sirveHorno = category['sirveHorno'];
        categoryModel.sirveTelefono = category['sirveTelefono'];

        categoryModel.CondicionesGenerales = category['CondicionesGenerales'];

        _Equipamiento.add(categoryModel);
      });
    });

    _condiciones.text = _Equipamiento.map((e) => e.CondicionesGenerales).first;

    if (_Equipamiento.map((e) => e.tieneRefri).first == "SI") {
      _refrigerador = Refrigerador.SI;
    } else if (_Equipamiento.map((e) => e.tieneRefri).first == "NO") {
      _refrigerador = Refrigerador.NO;
    }

    if (_Equipamiento.map((e) => e.sirveRefri).first == "SI") {
      _refrigeradorSirve = RefrigeradorSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveRefri).first == "NO") {
      _refrigeradorSirve = RefrigeradorSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneEstufa).first == "SI") {
      _estufa = Estufa.SI;
    } else if (_Equipamiento.map((e) => e.tieneEstufa).first == "NO") {
      _estufa = Estufa.NO;
    }

    if (_Equipamiento.map((e) => e.sirveEstufa).first == "SI") {
      _estufaSirve = EstufaSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveEstufa).first == "NO") {
      _estufaSirve = EstufaSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneVideoDVDBlueRay).first == "SI") {
      _video = Video.SI;
    } else if (_Equipamiento.map((e) => e.tieneVideoDVDBlueRay).first == "NO") {
      _video = Video.NO;
    }

    if (_Equipamiento.map((e) => e.sirveVideoDVDBlueRay).first == "SI") {
      _videoSirve = VideoSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveVideoDVDBlueRay).first == "NO") {
      _videoSirve = VideoSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneLavadora).first == "SI") {
      _lavadora = Lavadora.SI;
    } else if (_Equipamiento.map((e) => e.tieneLavadora).first == "NO") {
      _lavadora = Lavadora.NO;
    }

    if (_Equipamiento.map((e) => e.sirveLavadora).first == "SI") {
      _lavadoraSirve = LavadoraSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveLavadora).first == "NO") {
      _lavadoraSirve = LavadoraSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneLicuadora).first == "SI") {
      _licuadora = Licuadora.SI;
    } else if (_Equipamiento.map((e) => e.tieneLicuadora).first == "NO") {
      _licuadora = Licuadora.NO;
    }

    if (_Equipamiento.map((e) => e.sirveLicuadora).first == "SI") {
      _licuadoraSirve = LicuadoraSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveLicuadora).first == "NO") {
      _licuadoraSirve = LicuadoraSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneTelevision).first == "SI") {
      _television = Television.SI;
    } else if (_Equipamiento.map((e) => e.tieneTelevision).first == "NO") {
      _television = Television.NO;
    }

    if (_Equipamiento.map((e) => e.sirveTelevision).first == "SI") {
      _televisonSirve = TelevisionSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveTelevision).first == "NO") {
      _televisonSirve = TelevisionSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneRadio).first == "SI") {
      _radio = RadioE.SI;
    } else if (_Equipamiento.map((e) => e.tieneRadio).first == "NO") {
      _radio = RadioE.NO;
    }

    if (_Equipamiento.map((e) => e.sirveRadio).first == "SI") {
      _radioSirve = RadioSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveRadio).first == "NO") {
      _radioSirve = RadioSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneSala).first == "SI") {
      _sala = Sala.SI;
    } else if (_Equipamiento.map((e) => e.tieneSala).first == "NO") {
      _sala = Sala.NO;
    }

    if (_Equipamiento.map((e) => e.sirveSala).first == "SI") {
      _salaSirve = SalaSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveSala).first == "NO") {
      _salaSirve = SalaSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneComedor).first == "SI") {
      _comedor = Comedor.SI;
    } else if (_Equipamiento.map((e) => e.tieneComedor).first == "NO") {
      _comedor = Comedor.NO;
    }

    if (_Equipamiento.map((e) => e.sirveComedor).first == "SI") {
      _comedorSirve = ComedorSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveComedor).first == "NO") {
      _comedorSirve = ComedorSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneAutoMovil).first == "SI") {
      _automovil = Automovil.SI;
    } else if (_Equipamiento.map((e) => e.tieneAutoMovil).first == "NO") {
      _automovil = Automovil.NO;
    }

    if (_Equipamiento.map((e) => e.sirveAutoMovil).first == "SI") {
      _automovilSirve = AutomovilSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveAutoMovil).first == "NO") {
      _automovilSirve = AutomovilSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneCama).first == "SI") {
      _cama = Cama.SI;
    } else if (_Equipamiento.map((e) => e.tieneCama).first == "NO") {
      _cama = Cama.NO;
    }

    if (_Equipamiento.map((e) => e.sirveCama).first == "SI") {
      _camaSirve = CamaSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveCama).first == "NO") {
      _camaSirve = CamaSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneCelular).first == "SI") {
      _celular = Celular.SI;
    } else if (_Equipamiento.map((e) => e.tieneCelular).first == "NO") {
      _celular = Celular.NO;
    }

    if (_Equipamiento.map((e) => e.sirveCelular).first == "SI") {
      _celularSirve = CelularSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveCelular).first == "NO") {
      _celularSirve = CelularSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneMotocicleta).first == "SI") {
      _motocicleta = Motocicleta.SI;
    } else if (_Equipamiento.map((e) => e.tieneMotocicleta).first == "NO") {
      _motocicleta = Motocicleta.NO;
    }

    if (_Equipamiento.map((e) => e.sirveMotocicleta).first == "SI") {
      _motocicletaSirve = MotocicletaSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveMotocicleta).first == "NO") {
      _motocicletaSirve = MotocicletaSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneComputadora).first == "SI") {
      _computadora = Computadora.SI;
    } else if (_Equipamiento.map((e) => e.tieneComputadora).first == "NO") {
      _computadora = Computadora.NO;
    }

    if (_Equipamiento.map((e) => e.sirveComputadora).first == "SI") {
      _computadoraSirve = ComputadoraSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveComputadora).first == "NO") {
      _computadoraSirve = ComputadoraSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneHorno).first == "SI") {
      _horno = Horno.SI;
    } else if (_Equipamiento.map((e) => e.tieneHorno).first == "NO") {
      _horno = Horno.NO;
    }

    if (_Equipamiento.map((e) => e.sirveHorno).first == "SI") {
      _hornoSirve = HornoSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveHorno).first == "NO") {
      _hornoSirve = HornoSirve.NO;
    }

    if (_Equipamiento.map((e) => e.tieneTelefono).first == "SI") {
      _telefono = Telefono.SI;
    } else if (_Equipamiento.map((e) => e.tieneTelefono).first == "NO") {
      _telefono = Telefono.NO;
    }

    if (_Equipamiento.map((e) => e.sirveTelefono).first == "SI") {
      _telefonoSirve = TelefonoSirve.SI;
    } else if (_Equipamiento.map((e) => e.sirveTelefono).first == "NO") {
      _telefonoSirve = TelefonoSirve.NO;
    }
  }

  cargarDatos() {
    getAllEquipamiento();
  }

  insertDatos() async {
    if (_condiciones.text == '') {
      alertDialog(
          context,
          'Por favor selecciona las condiciones generales del equipamiento'
              .toUpperCase());
    } else {
      EquipamientoMovil DModel = EquipamientoMovil(
          folio: int.parse(widget.folio),
          pk_equipamientosRefri: "1".toUpperCase(),
          txt_desc_equipamientosRefri: "Refrigerador".toUpperCase(),
          tieneRefri: _refrigerador.name,
          sirveRefri: _refrigeradorSirve.name,
          pk_equipamientosEstufa: "2".toUpperCase(),
          txt_desc_equipamientosEstufa: "Estufa".toUpperCase(),
          tieneEstufa: _estufa.name,
          sirveEstufa: _estufaSirve.name,
          pk_equipamientosVideoDVDBlueRay: "3".toUpperCase(),
          txt_desc_equipamientosVideoDVDBlueRay:
              "VideoDVDBlueRay".toUpperCase(),
          tieneVideoDVDBlueRay: _video.name,
          sirveVideoDVDBlueRay: _videoSirve.name,
          pk_equipamientosLavadora: "4".toUpperCase(),
          txt_desc_equipamientosLavadora: "Lavadora".toUpperCase(),
          tieneLavadora: _lavadora.name,
          sirveLavadora: _lavadoraSirve.name,
          pk_equipamientosLicuadora: "5".toUpperCase(),
          txt_desc_equipamientosLicuadora: "Licuadora".toUpperCase(),
          tieneLicuadora: _licuadora.name,
          sirveLicuadora: _licuadoraSirve.name,
          pk_equipamientosTelevision: "6".toUpperCase(),
          txt_desc_equipamientosTelevision: "Television".toUpperCase(),
          tieneTelevision: _television.name,
          sirveTelevision: _televisonSirve.name,
          pk_equipamientosRadio: "7".toUpperCase(),
          txt_desc_equipamientosRadio: "Radio".toUpperCase(),
          tieneRadio: _radio.name,
          sirveRadio: _radioSirve.name,
          pk_equipamientosSala: "8".toUpperCase(),
          txt_desc_equipamientosSala: "Sala".toUpperCase(),
          tieneSala: _sala.name,
          sirveSala: _salaSirve.name,
          pk_equipamientosComedor: "9".toUpperCase(),
          txt_desc_equipamientosComedor: "Comedor".toUpperCase(),
          tieneComedor: _comedor.name,
          sirveComedor: _comedorSirve.name,
          pk_equipamientosAutoMovil: "10".toUpperCase(),
          txt_desc_equipamientosAutoMovil: "Automovil".toUpperCase(),
          tieneAutoMovil: _automovil.name,
          sirveAutoMovil: _automovilSirve.name,
          pk_equipamientosCama: "11".toUpperCase(),
          txt_desc_equipamientosCama: "Cama".toUpperCase(),
          tieneCama: _cama.name,
          sirveCama: _camaSirve.name,
          pk_equipamientosCelular: "12".toUpperCase(),
          txt_desc_equipamientosCelular: "Celular".toUpperCase(),
          tieneCelular: _celular.name,
          sirveCelular: _celularSirve.name,
          pk_equipamientosMotocicleta: "13".toUpperCase(),
          txt_desc_equipamientosMotocicleta: "Motocicleta".toUpperCase(),
          tieneMotocicleta: _motocicleta.name,
          sirveMotocicleta: _motocicletaSirve.name,
          pk_equipamientosComputadora: "14".toUpperCase(),
          txt_desc_equipamientosComputadora: "Computadora".toUpperCase(),
          tieneComputadora: _computadora.name,
          sirveComputadora: _computadoraSirve.name,
          pk_equipamientosHorno: "15".toUpperCase(),
          txt_desc_equipamientosHorno: "Horno".toUpperCase(),
          tieneHorno: _horno.name,
          sirveHorno: _hornoSirve.name,
          pk_equipamientosTelefono: "16".toUpperCase(),
          txt_desc_equipamientosTelefono: "Telefono".toUpperCase(),
          tieneTelefono: _telefono.name,
          sirveTelefono: _telefonoSirve.name,
          CondicionesGenerales: _condiciones.text.toString(),
          dispositivo: widget.dispositivo,
          folioDisp: widget.folioDisp,
          usuario: widget.usuario);

      await dbHelper.saveEquipamiento(DModel).then((equipamientoMovil) {
        alertDialog(context, "Se registro correctamente");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => AportacionesEconomicas(
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

  actualizar() async {
    EquipamientoMovil DModel = EquipamientoMovil(
        folio: int.parse(widget.folio),
        pk_equipamientosRefri: "1".toUpperCase(),
        txt_desc_equipamientosRefri: "Refrigerador".toUpperCase(),
        tieneRefri: _refrigerador.name,
        sirveRefri: _refrigeradorSirve.name,
        pk_equipamientosEstufa: "2".toUpperCase(),
        txt_desc_equipamientosEstufa: "Estufa".toUpperCase(),
        tieneEstufa: _estufa.name,
        sirveEstufa: _estufaSirve.name,
        pk_equipamientosVideoDVDBlueRay: "3".toUpperCase(),
        txt_desc_equipamientosVideoDVDBlueRay: "VideoDVDBlueRay".toUpperCase(),
        tieneVideoDVDBlueRay: _video.name,
        sirveVideoDVDBlueRay: _videoSirve.name,
        pk_equipamientosLavadora: "4".toUpperCase(),
        txt_desc_equipamientosLavadora: "Lavadora".toUpperCase(),
        tieneLavadora: _lavadora.name,
        sirveLavadora: _lavadoraSirve.name,
        pk_equipamientosLicuadora: "5".toUpperCase(),
        txt_desc_equipamientosLicuadora: "Licuadora".toUpperCase(),
        tieneLicuadora: _licuadora.name,
        sirveLicuadora: _licuadoraSirve.name,
        pk_equipamientosTelevision: "6".toUpperCase(),
        txt_desc_equipamientosTelevision: "Television".toUpperCase(),
        tieneTelevision: _television.name,
        sirveTelevision: _televisonSirve.name,
        pk_equipamientosRadio: "7".toUpperCase(),
        txt_desc_equipamientosRadio: "Radio".toUpperCase(),
        tieneRadio: _radio.name,
        sirveRadio: _radioSirve.name,
        pk_equipamientosSala: "8".toUpperCase(),
        txt_desc_equipamientosSala: "Sala".toUpperCase(),
        tieneSala: _sala.name,
        sirveSala: _salaSirve.name,
        pk_equipamientosComedor: "9".toUpperCase(),
        txt_desc_equipamientosComedor: "Comedor".toUpperCase(),
        tieneComedor: _comedor.name,
        sirveComedor: _comedorSirve.name,
        pk_equipamientosAutoMovil: "10".toUpperCase(),
        txt_desc_equipamientosAutoMovil: "Automovil".toUpperCase(),
        tieneAutoMovil: _automovil.name,
        sirveAutoMovil: _automovilSirve.name,
        pk_equipamientosCama: "11".toUpperCase(),
        txt_desc_equipamientosCama: "Cama".toUpperCase(),
        tieneCama: _cama.name,
        sirveCama: _camaSirve.name,
        pk_equipamientosCelular: "12".toUpperCase(),
        txt_desc_equipamientosCelular: "Celular".toUpperCase(),
        tieneCelular: _celular.name,
        sirveCelular: _celularSirve.name,
        pk_equipamientosMotocicleta: "13".toUpperCase(),
        txt_desc_equipamientosMotocicleta: "Motocicleta".toUpperCase(),
        tieneMotocicleta: _motocicleta.name,
        sirveMotocicleta: _motocicletaSirve.name,
        pk_equipamientosComputadora: "14".toUpperCase(),
        txt_desc_equipamientosComputadora: "Computadora".toUpperCase(),
        tieneComputadora: _computadora.name,
        sirveComputadora: _computadoraSirve.name,
        pk_equipamientosHorno: "15".toUpperCase(),
        txt_desc_equipamientosHorno: "Horno".toUpperCase(),
        tieneHorno: _horno.name,
        sirveHorno: _hornoSirve.name,
        pk_equipamientosTelefono: "16".toUpperCase(),
        txt_desc_equipamientosTelefono: "Telefono".toUpperCase(),
        tieneTelefono: _telefono.name,
        sirveTelefono: _telefonoSirve.name,
        CondicionesGenerales: _condiciones.text.toString());

    await dbHelper.upDateEquipamiento(DModel).then((equipamientoMovil) {
      alertDialog(context, "Se registro correctamente");
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new AportacionesEconomicas(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipamiento'.toUpperCase()),
        /* leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => Caracteristicas_Casa(
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
                    onPressed: getAllEquipamiento,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: DataTable(
                        decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))),
                        columns: [
                          DataColumn(label: Text('Equipamiento'.toUpperCase())),
                          DataColumn(label: Text('Tiene'.toUpperCase())),
                          DataColumn(label: Text('Sirve'.toUpperCase())),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(
                                getEquipamientoLabel(
                                    question: 'Refrigerador'.toUpperCase()),
                              ),
                              DataCell(Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('Si'.toUpperCase()),
                                      leading: Radio<Refrigerador>(
                                        value: Refrigerador.SI,
                                        groupValue: _refrigerador,
                                        onChanged: (Refrigerador value) {
                                          setState(() {
                                            _refrigerador = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('No'.toUpperCase()),
                                      leading: Radio<Refrigerador>(
                                        value: Refrigerador.NO,
                                        groupValue: _refrigerador,
                                        onChanged: (Refrigerador value) {
                                          setState(() {
                                            _refrigerador = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                              DataCell(Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('Si'.toUpperCase()),
                                      leading: Radio<RefrigeradorSirve>(
                                        value: RefrigeradorSirve.SI,
                                        groupValue: _refrigeradorSirve,
                                        onChanged: (RefrigeradorSirve value) {
                                          setState(() {
                                            _refrigeradorSirve = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('No'.toUpperCase()),
                                      leading: Radio<RefrigeradorSirve>(
                                        value: RefrigeradorSirve.NO,
                                        groupValue: _refrigeradorSirve,
                                        onChanged: (RefrigeradorSirve value) {
                                          setState(() {
                                            _refrigeradorSirve = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Estufa'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Estufa>(
                                      value: Estufa.SI,
                                      groupValue: _estufa,
                                      onChanged: (Estufa value) {
                                        setState(() {
                                          _estufa = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Estufa>(
                                      value: Estufa.NO,
                                      groupValue: _estufa,
                                      onChanged: (Estufa value) {
                                        setState(() {
                                          _estufa = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<EstufaSirve>(
                                      value: EstufaSirve.SI,
                                      groupValue: _estufaSirve,
                                      onChanged: (EstufaSirve value) {
                                        setState(() {
                                          _estufaSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<EstufaSirve>(
                                      value: EstufaSirve.NO,
                                      groupValue: _estufaSirve,
                                      onChanged: (EstufaSirve value) {
                                        setState(() {
                                          _estufaSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question:
                                    'Video, DVD, \nBlu-ray'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Video>(
                                      value: Video.SI,
                                      groupValue: _video,
                                      onChanged: (Video value) {
                                        setState(() {
                                          _video = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Video>(
                                      value: Video.NO,
                                      groupValue: _video,
                                      onChanged: (Video value) {
                                        setState(() {
                                          _video = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<VideoSirve>(
                                      value: VideoSirve.SI,
                                      groupValue: _videoSirve,
                                      onChanged: (VideoSirve value) {
                                        setState(() {
                                          _videoSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<VideoSirve>(
                                      value: VideoSirve.NO,
                                      groupValue: _videoSirve,
                                      onChanged: (VideoSirve value) {
                                        setState(() {
                                          _videoSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Lavadora'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Lavadora>(
                                      value: Lavadora.SI,
                                      groupValue: _lavadora,
                                      onChanged: (Lavadora value) {
                                        setState(() {
                                          _lavadora = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Lavadora>(
                                      value: Lavadora.NO,
                                      groupValue: _lavadora,
                                      onChanged: (Lavadora value) {
                                        setState(() {
                                          _lavadora = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<LavadoraSirve>(
                                      value: LavadoraSirve.SI,
                                      groupValue: _lavadoraSirve,
                                      onChanged: (LavadoraSirve value) {
                                        setState(() {
                                          _lavadoraSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<LavadoraSirve>(
                                      value: LavadoraSirve.NO,
                                      groupValue: _lavadoraSirve,
                                      onChanged: (LavadoraSirve value) {
                                        setState(() {
                                          _lavadoraSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Licuadora'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Licuadora>(
                                      value: Licuadora.SI,
                                      groupValue: _licuadora,
                                      onChanged: (Licuadora value) {
                                        setState(() {
                                          _licuadora = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Licuadora>(
                                      value: Licuadora.NO,
                                      groupValue: _licuadora,
                                      onChanged: (Licuadora value) {
                                        setState(() {
                                          _licuadora = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<LicuadoraSirve>(
                                      value: LicuadoraSirve.SI,
                                      groupValue: _licuadoraSirve,
                                      onChanged: (LicuadoraSirve value) {
                                        setState(() {
                                          _licuadoraSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<LicuadoraSirve>(
                                      value: LicuadoraSirve.NO,
                                      groupValue: _licuadoraSirve,
                                      onChanged: (LicuadoraSirve value) {
                                        setState(() {
                                          _licuadoraSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Televisión'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Television>(
                                      value: Television.SI,
                                      groupValue: _television,
                                      onChanged: (Television value) {
                                        setState(() {
                                          _television = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Television>(
                                      value: Television.NO,
                                      groupValue: _television,
                                      onChanged: (Television value) {
                                        setState(() {
                                          _television = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<TelevisionSirve>(
                                      value: TelevisionSirve.SI,
                                      groupValue: _televisonSirve,
                                      onChanged: (TelevisionSirve value) {
                                        setState(() {
                                          _televisonSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<TelevisionSirve>(
                                      value: TelevisionSirve.NO,
                                      groupValue: _televisonSirve,
                                      onChanged: (TelevisionSirve value) {
                                        setState(() {
                                          _televisonSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ))
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Radio'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<RadioE>(
                                      value: RadioE.SI,
                                      groupValue: _radio,
                                      onChanged: (RadioE value) {
                                        setState(() {
                                          _radio = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<RadioE>(
                                      value: RadioE.NO,
                                      groupValue: _radio,
                                      onChanged: (RadioE value) {
                                        setState(() {
                                          _radio = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<RadioSirve>(
                                      value: RadioSirve.SI,
                                      groupValue: _radioSirve,
                                      onChanged: (RadioSirve value) {
                                        setState(() {
                                          _radioSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<RadioSirve>(
                                      value: RadioSirve.NO,
                                      groupValue: _radioSirve,
                                      onChanged: (RadioSirve value) {
                                        setState(() {
                                          _radioSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Sala'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Sala>(
                                      value: Sala.SI,
                                      groupValue: _sala,
                                      onChanged: (Sala value) {
                                        setState(() {
                                          _sala = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Sala>(
                                      value: Sala.NO,
                                      groupValue: _sala,
                                      onChanged: (Sala value) {
                                        setState(() {
                                          _sala = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<SalaSirve>(
                                      value: SalaSirve.SI,
                                      groupValue: _salaSirve,
                                      onChanged: (SalaSirve value) {
                                        setState(() {
                                          _salaSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<SalaSirve>(
                                      value: SalaSirve.NO,
                                      groupValue: _salaSirve,
                                      onChanged: (SalaSirve value) {
                                        setState(() {
                                          _salaSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Comedor'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Comedor>(
                                      value: Comedor.SI,
                                      groupValue: _comedor,
                                      onChanged: (Comedor value) {
                                        setState(() {
                                          _comedor = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Comedor>(
                                      value: Comedor.NO,
                                      groupValue: _comedor,
                                      onChanged: (Comedor value) {
                                        setState(() {
                                          _comedor = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<ComedorSirve>(
                                      value: ComedorSirve.SI,
                                      groupValue: _comedorSirve,
                                      onChanged: (ComedorSirve value) {
                                        setState(() {
                                          _comedorSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<ComedorSirve>(
                                      value: ComedorSirve.NO,
                                      groupValue: _comedorSirve,
                                      onChanged: (ComedorSirve value) {
                                        setState(() {
                                          _comedorSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Automóvil'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Automovil>(
                                      value: Automovil.SI,
                                      groupValue: _automovil,
                                      onChanged: (Automovil value) {
                                        setState(() {
                                          _automovil = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Automovil>(
                                      value: Automovil.NO,
                                      groupValue: _automovil,
                                      onChanged: (Automovil value) {
                                        setState(() {
                                          _automovil = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<AutomovilSirve>(
                                      value: AutomovilSirve.SI,
                                      groupValue: _automovilSirve,
                                      onChanged: (AutomovilSirve value) {
                                        setState(() {
                                          _automovilSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<AutomovilSirve>(
                                      value: AutomovilSirve.NO,
                                      groupValue: _automovilSirve,
                                      onChanged: (AutomovilSirve value) {
                                        setState(() {
                                          _automovilSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Cama'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Cama>(
                                      value: Cama.SI,
                                      groupValue: _cama,
                                      onChanged: (Cama value) {
                                        setState(() {
                                          _cama = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Cama>(
                                      value: Cama.NO,
                                      groupValue: _cama,
                                      onChanged: (Cama value) {
                                        setState(() {
                                          _cama = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<CamaSirve>(
                                      value: CamaSirve.SI,
                                      groupValue: _camaSirve,
                                      onChanged: (CamaSirve value) {
                                        setState(() {
                                          _camaSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<CamaSirve>(
                                      value: CamaSirve.NO,
                                      groupValue: _camaSirve,
                                      onChanged: (CamaSirve value) {
                                        setState(() {
                                          _camaSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Celular'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Celular>(
                                      value: Celular.SI,
                                      groupValue: _celular,
                                      onChanged: (Celular value) {
                                        setState(() {
                                          _celular = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Celular>(
                                      value: Celular.NO,
                                      groupValue: _celular,
                                      onChanged: (Celular value) {
                                        setState(() {
                                          _celular = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<CelularSirve>(
                                      value: CelularSirve.SI,
                                      groupValue: _celularSirve,
                                      onChanged: (CelularSirve value) {
                                        setState(() {
                                          _celularSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<CelularSirve>(
                                      value: CelularSirve.NO,
                                      groupValue: _celularSirve,
                                      onChanged: (CelularSirve value) {
                                        setState(() {
                                          _celularSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ))
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Motocicleta'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Motocicleta>(
                                      value: Motocicleta.SI,
                                      groupValue: _motocicleta,
                                      onChanged: (Motocicleta value) {
                                        setState(() {
                                          _motocicleta = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Motocicleta>(
                                      value: Motocicleta.NO,
                                      groupValue: _motocicleta,
                                      onChanged: (Motocicleta value) {
                                        setState(() {
                                          _motocicleta = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<MotocicletaSirve>(
                                      value: MotocicletaSirve.SI,
                                      groupValue: _motocicletaSirve,
                                      onChanged: (MotocicletaSirve value) {
                                        setState(() {
                                          _motocicletaSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<MotocicletaSirve>(
                                      value: MotocicletaSirve.NO,
                                      groupValue: _motocicletaSirve,
                                      onChanged: (MotocicletaSirve value) {
                                        setState(() {
                                          _motocicletaSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Computadora'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Computadora>(
                                      value: Computadora.SI,
                                      groupValue: _computadora,
                                      onChanged: (Computadora value) {
                                        setState(() {
                                          _computadora = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Computadora>(
                                      value: Computadora.NO,
                                      groupValue: _computadora,
                                      onChanged: (Computadora value) {
                                        setState(() {
                                          _computadora = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<ComputadoraSirve>(
                                      value: ComputadoraSirve.SI,
                                      groupValue: _computadoraSirve,
                                      onChanged: (ComputadoraSirve value) {
                                        setState(() {
                                          _computadoraSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<ComputadoraSirve>(
                                      value: ComputadoraSirve.NO,
                                      groupValue: _computadoraSirve,
                                      onChanged: (ComputadoraSirve value) {
                                        setState(() {
                                          _computadoraSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Horno'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Horno>(
                                      value: Horno.SI,
                                      groupValue: _horno,
                                      onChanged: (Horno value) {
                                        setState(() {
                                          _horno = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Horno>(
                                      value: Horno.NO,
                                      groupValue: _horno,
                                      onChanged: (Horno value) {
                                        setState(() {
                                          _horno = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<HornoSirve>(
                                      value: HornoSirve.SI,
                                      groupValue: _hornoSirve,
                                      onChanged: (HornoSirve value) {
                                        setState(() {
                                          _hornoSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<HornoSirve>(
                                      value: HornoSirve.NO,
                                      groupValue: _hornoSirve,
                                      onChanged: (HornoSirve value) {
                                        setState(() {
                                          _hornoSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ))
                          ]),
                          DataRow(cells: [
                            DataCell(getEquipamientoLabel(
                                question: 'Teléfono'.toUpperCase())),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<Telefono>(
                                      value: Telefono.SI,
                                      groupValue: _telefono,
                                      onChanged: (Telefono value) {
                                        setState(() {
                                          _telefono = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<Telefono>(
                                      value: Telefono.NO,
                                      groupValue: _telefono,
                                      onChanged: (Telefono value) {
                                        setState(() {
                                          _telefono = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Si'.toUpperCase()),
                                    leading: Radio<TelefonoSirve>(
                                      value: TelefonoSirve.SI,
                                      groupValue: _telefonoSirve,
                                      onChanged: (TelefonoSirve value) {
                                        setState(() {
                                          _telefonoSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('No'.toUpperCase()),
                                    leading: Radio<TelefonoSirve>(
                                      value: TelefonoSirve.NO,
                                      groupValue: _telefonoSirve,
                                      onChanged: (TelefonoSirve value) {
                                        setState(() {
                                          _telefonoSirve = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                        ],
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                getTextQuestion(
                    question:
                        'Condiciones Generales Del Equipamiento'.toUpperCase()),
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
                    suggestions: _Condiciones.map((condiciones) =>
                        SearchFieldListItem(condiciones.toString(),
                            item: condiciones)).toList(),
                    textInputAction: TextInputAction.next,
                    hasOverlay: false,
                    controller: _condiciones,
                    maxSuggestionsInViewPort: 5,
                    itemHeight: 45,
                    onSuggestionTap: (x) {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: insertDatos,
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
