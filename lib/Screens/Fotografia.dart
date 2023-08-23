import 'dart:io';

import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextFolio.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/AlimentacionModel.dart';
import 'package:esn/Model/AportacionSemanal.dart';
import 'package:esn/Model/CaracteristicasCasa.dart';
import 'package:esn/Model/DatosGeneralesModel.dart';
import 'package:esn/Model/EscolaridadSeguridadSocial.dart';
import 'package:esn/Model/EstadoCasaConstruccionModel.dart';
import 'package:esn/Model/EstructuraFamiliarModel.dart';
import 'package:esn/Model/FotoModel.dart';
import 'package:esn/Model/Salud_PertenenciaIndigenaTablaModel.dart';
import 'package:esn/Model/ServiciosModel.dart';
import 'package:esn/Model/ServiciosModel/ServAguaModel.dart';
import 'package:esn/Model/ServiciosModel/ServBanoModel.dart';
import 'package:esn/Model/ServiciosModel/ServGasModel.dart';
import 'package:esn/Model/ServiciosModel/ServLuzModel.dart';
import 'package:esn/Model/ServiciosModel/ServSanitarioModel.dart';
import 'package:esn/Model/TipoZona.dart';
import 'package:esn/Screens/Resolucion.dart';
import 'package:esn/Screens/TablaFolios.dart';
import 'package:esn/services/Utility.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Fotografia extends StatefulWidget {
  String folio;

  String folioDisp;
  String usuario;
  String dispositivo;

  Fotografia({this.folio, this.folioDisp, this.dispositivo, this.usuario});

  @override
  State<Fotografia> createState() => _FotografiaState();
}

class _FotografiaState extends State<Fotografia> {
  File _image;
  final picker = ImagePicker();
  final _ponderacion1 = TextEditingController();

  var ingreso = "";
  var rezagoEducativo = "";
  var salud = "";
  var seguridadSocial = "";
  var alimentacion = "";
  var calidad = "";
  var servicio = "";
  List<DatosGeneralesModel> _datosGenerales = [];
  List<AportacionSemanal> _ingreso = [];

  var fecha = DateFormat('dd-MM-yyyy').format(DateTime(
      DateTime.now().year - 20, DateTime.now().month, DateTime.now().day));

  var tipoZona;
  var ingresoMensual;

  getTipoZona() async {
    var datos = await DbHelper().readDatosGenerales(widget.folio);
    datos.forEach((data) {
      setState(() {
        var datosG = DatosGeneralesModel();
        datosG.tipoZona = data['TipoZona'];

        _datosGenerales.add(datosG);
      });

      tipoZona = _datosGenerales.map((e) => e.tipoZona).first;
    });
  }

  getIngreso() async {
    var datos = await DbHelper().readIngresoMensual(widget.folio);
    datos.forEach((data) {
      setState(() {
        var datosI = AportacionSemanal();
        datosI.totalMensual = data['totalMensual'];

        _ingreso.add(datosI);
      });

      ingresoMensual = _ingreso.map((e) => e.totalMensual).first;
    });
  }

  var anioL;
  var mes;
  var canastaAlimentaria_rural;
  var canastaAlimentaria_urbano;
  var canastaNoAlimentaria_rural;
  var canastaNoAlimentaria_urbano;

  getLPISQLITE() async {
    var data = await DbHelper().readLPI();
    data.forEach((data) {
      anioL = data['anio'];
      mes = data['mes'];
      canastaAlimentaria_rural = data['canastaAlimentaria_rural'];
      canastaAlimentaria_urbano = data['canastaAlimentaria_urbano'];
      canastaNoAlimentaria_rural = data['canastaNoAlimentaria_rural'];
      canastaNoAlimentaria_urbano = data['canastaNoAlimentaria_urbano'];
    });
  }

  getPobreza() async {
    await getLPISQLITE();
    await getTipoZona();
    await getIngreso();

    if (tipoZona == 'URBANO') {
      if (ingresoMensual < canastaAlimentaria_urbano &&
          ingresoMensual < canastaNoAlimentaria_urbano) {
        ingreso =
            "Pobre, Ingresos laborales menores al costo de la canasta basica alimentaria y no alimentaria"
                .toUpperCase();
      } else {
        ingreso =
            "No pobre, Ingresos laborales iguales o mayores al costo de la canasta basica alimentaria y no alimentaria"
                .toUpperCase();
      }
    } else {
      if (ingresoMensual < canastaAlimentaria_rural &&
          ingresoMensual < canastaNoAlimentaria_rural) {
        ingreso =
            "Pobre, Ingresos laborales menores al costo de la canasta basica alimentaria y no alimentaria"
                .toUpperCase();
      } else {
        ingreso =
            "No pobre, Ingresos laborales iguales o mayores al costo de la canasta basica alimentaria y no alimentaria"
                .toUpperCase();
      }
    }

    return ingreso;
  }

  String returnMonth(DateTime date) {
    return new DateFormat.MMMM().format(date);
  }

  String obtenerMes() {
    final meses = [
      'Ene'.toUpperCase(),
      'Feb'.toUpperCase(),
      'Mar'.toUpperCase(),
      'Abr'.toUpperCase(),
      'May'.toUpperCase(),
      'Jun'.toUpperCase(),
      'Jul'.toUpperCase(),
      'Ago'.toUpperCase(),
      'Sep'.toUpperCase(),
      'Oct'.toUpperCase(),
      'Nov'.toUpperCase(),
      'Dic'.toUpperCase()
    ];

    final fechaActual = DateTime.now();
    final mesActual = fechaActual.month;

    return meses[mesActual - 1];
  }

  // ------ Rezago educativo
  List<int> _edades = [];
  List anio = [];
  List<String> _miembros = [];
  getEdades() async {
    _edades = [];
    anio = [];
    _miembros = [];
    List datos = await DbHelper().readEstructuraFamiliar(widget.folio);
    for (var i = 0; i < datos.length; i++) {
      _miembros.add(datos[i]['fechaNacimiento']);
      //_miembros.add(datos[i]['orden']);
    }

    anio =
        _miembros.toString().replaceAll("[", "").replaceAll("]", "").split("-");
    anio = anio
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(" ", "")
        .split(",");

    anio.removeWhere((item) => item.length < 4);
    print(anio);
    var a = DateTime.now();
    for (var i = 0; i < anio.length; i++) {
      _edades.add(a.year - int.parse(anio[i]));
    }
    return _edades;
  }

  getEscolaridad() async {
    List<int> escolaridades = [];
    List escolaridad = await DbHelper().readEscolaridadP(widget.folio);
    List<String> Asiste = [];

    for (var i = 0; i < escolaridad.length; i++) {
      escolaridades.add(int.parse(escolaridad[i]['ClaveEscolaridad']));
      Asiste.add(escolaridad[i]['AsisteEscuela']);

      if (_edades[i] >= 3 &&
          _edades[i] <= 15 &&
          Asiste[i] == 'no' &&
          escolaridades[i] < 5) {
        rezagoEducativo =
            "Carencia por rezajo edicativo de '$i' integrantes".toUpperCase();
      }

      if (_edades[i] >= 16 && _edades[i] <= 20 && escolaridades[i] < 5) {
        rezagoEducativo =
            "Carencia por rezajo edicativo de '$i' integrantes".toUpperCase();
      }

      if (int.parse(anio[i]) == 1998 &&
          _miembros[i] == fecha &&
          escolaridades[i] < 6) {
        rezagoEducativo =
            "Carencia por rezajo edicativo de '$i' integrantes".toUpperCase();
      }

      if (int.parse(anio[i]) < 1998 && escolaridades[i] < 5) {
        rezagoEducativo =
            "Carencia por rezajo edicativo de '$i' integrantes".toUpperCase();
      }

      if (int.parse(anio[i]) < 1982 && escolaridades[i] < 4) {
        rezagoEducativo =
            "Carencia por rezajo edicativo de '$i' integrantes".toUpperCase();
      }

      rezagoEducativo = "No carencia por rezago educativo".toUpperCase();
    }

    return rezagoEducativo;
  }

  List _derechoHabiencias = [];
  List<int> derecho = [];
  getSalud() async {
    var contador = 0;
    _derechoHabiencias = await DbHelper().readEscolaridadP(widget.folio);

    for (var i = 0; i < _derechoHabiencias.length; i++) {
      derecho.add(int.parse(_derechoHabiencias[i]['ClaveDerechohabiencia']));
    }

    for (int numero in derecho) {
      if (numero == 0 || numero == 7) {
        contador++;
        salud =
            "Carencia por acceso a los servicios de salud de '$contador' integrante(s)"
                .toUpperCase();
      } else {
        salud = "No carencia por acceso a los servicios de salud".toUpperCase();
      }
    }

    return salud;
  }

  List seguridad = [];
  getSeguridaSocial() async {
    seguridad = [];
    seguridad = await DbHelper().readEscolaridadP(widget.folio);
    Map salario = {};
    List jubilado = [];
    List prestaciones = await DbHelper().readPrestacionesLab(widget.folio);
    Map pres = {};

    for (var i = 0; i < prestaciones.length; i++) {
      pres[i] = prestaciones[i]['Orden_PrestacionesLaborales'];
    }

    for (var i = 0; i < seguridad.length; i++) {
      salario[i] = seguridad[i]['ClaveTipoEmpleo'];
      jubilado.add(seguridad[i]['ClaveJubilacion']);

      if (salario[i] == '2') {
        if (derecho[i] != 0) {
          if (pres[i] == 'A' &&
              pres[i] == 'B' &&
              pres[i] == 'C' &&
              pres[i] == 'E' &&
              pres[i] == 'F' &&
              pres[i] != 'G') {
            seguridadSocial =
                "Carencia por acceso a la seguridad social por '$i' integrantes"
                    .toUpperCase();
          }
        }
      }
      if (seguridadSocial ==
          "Carencia por acceso a la seguridad social por '$i' integrantes") {
        if (derecho[i] != 0) {
          if (pres[i] == 'B') {
            if (jubilado[i] == '1') {
              if (salario[i] == '3' || salario[i] == '4') {
                seguridadSocial =
                    "Carencia por acceso a la seguridad social por '$i' integrantes"
                        .toUpperCase();
              }
            }
          }
        }

        if (_edades[i] >= 65) {
          if (jubilado[i] == '1') {
            if (derecho[i] == 7) {
              seguridadSocial =
                  "Carencia por acceso a la seguridad social por '$i' integrantes"
                      .toUpperCase();
            }
          }
        }

        if (salario[i] == '1') {
          if (derecho[i] != 0) {
            seguridadSocial =
                "Carencia por acceso a la seguridad social por '$i' integrantes"
                    .toUpperCase();
          }
        }
      }
      seguridadSocial =
          "No carencia por acceso a la seguridad social".toUpperCase();
    }

    return seguridadSocial;
  }

  var contador = 0;
  getAlimentacion() async {
    contador = 0;
    List pregunta = await DbHelper().readAlimentacionP(widget.folio);
    List<dynamic> preguntas = pregunta
        .map((row) => [
              row['pregunta1'],
              row['pregunta2'],
              row['pregunta3'],
              row['pregunta4'],
              row['pregunta5'],
              row['pregunta6'],
              row['pregunta7'],
              row['pregunta8'],
              row['pregunta9'],
              row['pregunta10'],
              row['pregunta11'],
              row['pregunta12']
            ])
        .expand((element) => element)
        .toList();

    for (var i = 0; i < preguntas.length; i++) {
      if (preguntas[6] == 'NO') {
        if (preguntas[i] == 'SI') {
          contador++;
        }
        if (i == 5) {
          break;
        }
      } else {
        if (preguntas[i] == 'SI') {
          contador++;
        }
      }
    }
    print(contador);
    if (contador >= 5 || contador >= 8) {
      alimentacion = 'Severa';
    } else {
      if (contador == 3 || contador == 4 || contador == 7) {
        alimentacion = 'Moderada';
      } else {
        alimentacion = 'Leve';
      }
      return alimentacion;
    }
  }

  List<EstadoCasaConstruccionModel> vivienda = [];
  var cvivienda;
  var piso;
  var tenencia;
  var techo;
  var muro;
  var numCuartos;
  int personas;
  List<CaracteristicasCasa> casa = [];
  getVivienda() async {
    vivienda = [];
    var data = await DbHelper().readVivienda(widget.folio);
    data.forEach((category) {
      setState(() {
        var datos = EstadoCasaConstruccionModel();
        datos.ClaveTipoVivienda = category['ClaveTipoVivienda'];
        datos.ClaveTipoPiso = category['ClaveTipoPiso'];
        datos.ClaveTenencia = category['ClaveTenencia'];
        datos.ClaveTecho = category['ClaveTecho'];
        datos.ClaveTipoMuro = category['ClaveTipoMuro'];

        vivienda.add(datos);
      });
    });

    casa = [];
    var datos = await DbHelper().readCaracteristicaCasa(widget.folio);

    datos.forEach((caracteristica) {
      setState(() {
        var data = CaracteristicasCasa();
        data.cuartosDormir = caracteristica['cuartosDormir'];
        casa.add(data);
      });
    });
    cvivienda = vivienda.map((e) => e.ClaveTipoVivienda).first;
    techo = vivienda.map((e) => e.ClaveTecho).first;
    tenencia = vivienda.map((e) => e.ClaveTenencia).first;
    piso = vivienda.map((e) => e.ClaveTipoPiso).first;
    muro = vivienda.map((e) => e.ClaveTipoMuro).first;
    numCuartos = casa.map((e) => e.cuartosDormir).first;

    bool c = false;

    if (int.parse(techo) == 2 ||
        int.parse(piso) == 4 ||
        int.parse(muro) == 4 ||
        int.parse(muro) == 5 ||
        int.parse(muro) == 6) {
      calidad =
          "Población en situación de carencia por calidad y espacios de la vivienda"
              .toUpperCase();
      c = true;
    } else {
      calidad =
          "Población en situación de NO carencia por calidad y espacios de la vivienda"
              .toUpperCase();
    }

    personas = _edades.length;
    double hacinamiento = (personas / int.parse(numCuartos));

    if (c = false) {
      calidad =
          "Población en situación de NO carencia por calidad y espacios de la vivienda"
              .toUpperCase();
    } else {
      if (hacinamiento > 2.5) {
        calidad =
            "Población en situación de carencia por calidad y espacios de la vivienda"
                .toUpperCase();
      }
    }

    return calidad;
  }

  List<ServiciosModel> servicios = [];
  var bano;
  var agua;
  var drenaje;
  var gas;
  var luz;
  getServicios() async {
    var datos = await DbHelper().readServiciosA(widget.folio);

    datos.forEach((serv) {
      setState(() {
        var data = ServiciosModel();
        data.claveServAgua = serv['claveServAgua'];
        data.claveServGas = serv['claveServGas'];
        data.claveServLuz = serv['claveServLuz'];
        data.claveServSanitario = serv['claveServSanitario'];
        data.pk_bano = serv['pk_bano'];
        servicios.add(data);
      });
    });

    agua = servicios.map((e) => e.claveServAgua).first;
    gas = servicios.map((e) => e.claveServGas).first;
    luz = servicios.map((e) => e.claveServLuz).first;
    bano = servicios.map((e) => e.pk_bano).first;
    drenaje = servicios.map((e) => e.claveServSanitario).first;

    if (int.parse(luz) == 6 ||
        int.parse(drenaje) == 2 ||
        int.parse(drenaje) == 5 ||
        int.parse(bano) != 1 ||
        int.parse(gas) == 4 ||
        int.parse(gas) == 5 ||
        int.parse(gas) == 7 ||
        int.parse(agua) != 1) {
      servicio = "Carencia por servicios básicos en la vivienda".toUpperCase();
    } else {
      servicio =
          "No carente por servicios básicos en la vivienda".toUpperCase();
    }

    return servicio;
  }

  ponderacion() async {
    await getPobreza();
    await getEdades();
    await getSalud();
    await getSeguridaSocial();
    await getAlimentacion();
    await getVivienda();
    await getServicios();
    await getEscolaridad();
    print(rezagoEducativo);
    print(seguridadSocial);
    print(salud);
    print(servicio);
    print(calidad);
    print(alimentacion);
    print(ingreso);
    if (alimentacion == 'Leve') {
      alimentacion = "Seguridad alimentaria".toUpperCase();
    } else {
      alimentacion = "Carencia alimentaria".toUpperCase();
    }

    print(alimentacion);

    setState(() {
      _ponderacion1.text = ingreso +
          "\n" +
          rezagoEducativo +
          "\n" +
          salud +
          "\n" +
          seguridadSocial +
          "\n" +
          alimentacion +
          "\n" +
          calidad +
          "\n" +
          servicio;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 648,
        imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        alertDialog(context, 'Imagen no Seleccionada');
      }
    });
  }

  guardarFoto() {
    String foto64 = Utility.base64String(_image.readAsBytesSync());
    FotoModel BModel = FotoModel(
        folio: int.parse(widget.folio),
        fileFoto: foto64,
        dispositivo: widget.dispositivo,
        folioDisp: widget.folioDisp,
        usuario: widget.usuario);
    DbHelper().saveFoto(BModel).then((fotoModel) {
      alertDialog(context, "Se registro correctamente");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => TablaFolios(usuario: widget.usuario)),
        (Route<dynamic> route) => false,
      );
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos");
    });
  }

  actualizar() async {
    String foto64 = Utility.base64String(_image.readAsBytesSync());
    FotoModel BModel = FotoModel(
        folio: int.parse(widget.folio),
        fileFoto: foto64,
        dispositivo: widget.dispositivo,
        folioDisp: widget.folioDisp,
        usuario: widget.usuario);
    DbHelper().upDateFoto(BModel).then((fotoModel) {
      alertDialog(context, "Se registro correctamente");
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new TablaFolios(usuario: widget.usuario);
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
        title: Text('Fotografia'.toUpperCase()),
        /* leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => Resolucion(
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
                SizedBox(height: 10.0),
                getTextQuestion(question: 'Tomar fotografia'.toUpperCase()),
                Container(
                  child: _image == null
                      ? Text('Imagen No Seleccionda'.toUpperCase())
                      : Image.file(_image),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: getImage,
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    label: Text('Tomar Fotografia'.toUpperCase(),
                        style: TextStyle(color: Colors.white)),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    onTap: ponderacion,
                    controller: _ponderacion1,
                    maxLines: 15,
                    decoration: InputDecoration(
                      labelText: "Ponderación".toUpperCase(),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: guardarFoto,
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    label: Text('Continuar'.toUpperCase(),
                        style: TextStyle(color: Colors.white)),
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
