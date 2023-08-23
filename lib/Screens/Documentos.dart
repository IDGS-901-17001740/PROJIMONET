import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextFolio.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/DocumentosModel.dart';
import 'package:esn/Screens/Alimentacion.dart';
import 'package:esn/Screens/Resolucion.dart';
import 'package:esn/Screens/Documentos.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';

enum Curp { SI, NO, INCOMPLETO }

enum ActaNacimiento { SI, NO }

enum ComprobanteDomicilio { SI, NO }

enum INE { SI, NO }

class Documentos extends StatefulWidget {
  String folio;
  String folioDisp;
  String usuario;
  String dispositivo;
  Documentos({this.folio, this.folioDisp, this.dispositivo, this.usuario});

  @override
  State<Documentos> createState() => _DocumentosState();
}

class _DocumentosState extends State<Documentos> {
  Curp _curp;
  ActaNacimiento _actaNacimiento;
  ComprobanteDomicilio _comprobanteDomicilio;
  INE _ine;
  List<DocumentosModel> _Documentos = [];
  var dbHelper;

  getAllDocumentos() async {
    _Documentos = [];
    var categories =
        await CategoryService().readDocmentos(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = DocumentosModel();
        categoryModel.folio = category['folio'];
        categoryModel.curp = category['curp'];
        categoryModel.actaNacimiento = category['actaNacimiento'];
        categoryModel.comprobanteDomicilio = category['comprobanteDomicilio'];
        categoryModel.ine = category['ine'];
        _Documentos.add(categoryModel);
      });
    });

    if (_Documentos.map((e) => e.curp.toString()).first == "SI") {
      _curp = Curp.SI;
    } else if (_Documentos.map((e) => e.curp.toString()).first == "NO") {
      _curp = Curp.NO;
    } else if (_Documentos.map((e) => e.curp.toString()).first ==
        "INCOMPLETO") {
      _curp = Curp.INCOMPLETO;
    }

    if (_Documentos.map((e) => e.actaNacimiento.toString()).first == "SI") {
      _actaNacimiento = ActaNacimiento.SI;
    } else if (_Documentos.map((e) => e.actaNacimiento.toString()).first ==
        "NO") {
      _actaNacimiento = ActaNacimiento.NO;
    }

    if (_Documentos.map((e) => e.comprobanteDomicilio.toString()).first ==
        "SI") {
      _comprobanteDomicilio = ComprobanteDomicilio.SI;
    } else if (_Documentos.map((e) => e.comprobanteDomicilio.toString())
            .first ==
        "NO") {
      _comprobanteDomicilio = ComprobanteDomicilio.NO;
    }

    if (_Documentos.map((e) => e.ine.toString()).first == "SI") {
      _ine = INE.SI;
    } else if (_Documentos.map((e) => e.ine.toString()).first == "NO") {
      _ine = INE.NO;
    }
  }

  actualizar() async {
    DocumentosModel BModel = DocumentosModel(
        folio: int.parse(widget.folio),
        curp: _curp.name,
        actaNacimiento: _actaNacimiento.name,
        comprobanteDomicilio: _comprobanteDomicilio.name,
        ine: _ine.name,
        folioDisp: widget.folioDisp,
        dispositivo: widget.dispositivo,
        usuario: widget.usuario);

    await DbHelper().upDateDocumentos(BModel).then((documentosModel) {
      alertDialog(context, "Se registro correctamente");
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new Resolucion(
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

  enviar() async {
    DocumentosModel BModel = DocumentosModel(
        folio: int.parse(widget.folio),
        curp: _curp.name,
        actaNacimiento: _actaNacimiento.name,
        comprobanteDomicilio: _comprobanteDomicilio.name,
        ine: _ine.name,
        folioDisp: widget.folioDisp,
        dispositivo: widget.dispositivo,
        usuario: widget.usuario);

    await DbHelper().saveDocumentos(BModel).then((documentosModel) {
      alertDialog(context, "Se registro correctamente");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => Resolucion(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documentos'.toUpperCase()),
        /* leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => Alimentacion(
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
                    onPressed: getAllDocumentos,
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
                getTextQuestion(question: 'CURP'.toUpperCase()),
                Row(
                  children: <Widget>[
                    //CURP
                    Expanded(
                      child: ListTile(
                        title: Text('Si'.toUpperCase()),
                        leading: Radio<Curp>(
                          value: Curp.SI,
                          toggleable: true,
                          groupValue: _curp,
                          onChanged: (Curp value) {
                            setState(() {
                              _curp = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'.toUpperCase()),
                        leading: Radio<Curp>(
                          value: Curp.NO,
                          groupValue: _curp,
                          toggleable: true,
                          onChanged: (Curp value) {
                            setState(() {
                              _curp = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('Incompleto'.toUpperCase()),
                        leading: Radio<Curp>(
                          value: Curp.INCOMPLETO,
                          toggleable: true,
                          groupValue: _curp,
                          onChanged: (Curp value) {
                            setState(() {
                              _curp = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(
                    question:
                        'Acta Nacimiento(titular menor de edad)'.toUpperCase()),
                Row(
                  children: <Widget>[
                    //Acta Nacimiento
                    Expanded(
                      child: ListTile(
                        title: Text('Si'.toUpperCase()),
                        leading: Radio<ActaNacimiento>(
                          value: ActaNacimiento.SI,
                          groupValue: _actaNacimiento,
                          toggleable: true,
                          onChanged: (ActaNacimiento value) {
                            setState(() {
                              _actaNacimiento = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'.toUpperCase()),
                        leading: Radio<ActaNacimiento>(
                          value: ActaNacimiento.NO,
                          groupValue: _actaNacimiento,
                          toggleable: true,
                          onChanged: (ActaNacimiento value) {
                            setState(() {
                              _actaNacimiento = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(
                    question: 'Comprobante de Domicilio'.toUpperCase()),
                Row(
                  children: <Widget>[
                    //Comprobante Domicilio
                    Expanded(
                      child: ListTile(
                        title: Text('Si'.toUpperCase()),
                        leading: Radio<ComprobanteDomicilio>(
                          value: ComprobanteDomicilio.SI,
                          groupValue: _comprobanteDomicilio,
                          toggleable: true,
                          onChanged: (ComprobanteDomicilio value) {
                            setState(() {
                              _comprobanteDomicilio = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'.toUpperCase()),
                        leading: Radio<ComprobanteDomicilio>(
                          value: ComprobanteDomicilio.NO,
                          groupValue: _comprobanteDomicilio,
                          toggleable: true,
                          onChanged: (ComprobanteDomicilio value) {
                            setState(() {
                              _comprobanteDomicilio = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: 'INE'.toUpperCase()),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('Si'.toUpperCase()),
                        leading: Radio<INE>(
                          value: INE.SI,
                          groupValue: _ine,
                          toggleable: true,
                          onChanged: (INE value) {
                            setState(() {
                              _ine = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('No'.toUpperCase()),
                        leading: Radio<INE>(
                          value: INE.NO,
                          groupValue: _ine,
                          toggleable: true,
                          onChanged: (INE value) {
                            setState(() {
                              _ine = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: enviar,
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
