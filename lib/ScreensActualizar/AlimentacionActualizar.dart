import 'package:esn/Comm/genTextEquipamiento.dart';
import 'package:esn/Comm/genTextFolio.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/Model/AlimentacionModel.dart';
import 'package:esn/Screens/Documentos.dart';
import 'package:esn/Screens/Remesas.dart';
import 'package:esn/ScreensActualizar/ActualizarEstudio.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';

import '../Comm/comHelper.dart';
import '../DatabaseHandler/DbHelper.dart';

enum uno { SI, NO }

enum dos { SI, NO }

enum tres { SI, NO }

enum cuatro { SI, NO }

enum cinco { SI, NO }

enum seis { SI, NO }

enum siete { SI, NO }

enum ocho { SI, NO }

enum nueve { SI, NO }

enum diez { SI, NO }

enum once { SI, NO }

enum doce { SI, NO }

enum menor { SI, NO }

class Alimentacion extends StatefulWidget {
  String folio;
  String folioDisp;
  String usuario;
  String dispositivo;

  Alimentacion({this.folio, this.folioDisp, this.usuario, this.dispositivo});

  @override
  State<Alimentacion> createState() => _AlimentacionState();
}

class _AlimentacionState extends State<Alimentacion> {
  uno _uno;
  dos _dos;
  tres _tres;
  cuatro _cuatro;
  cinco _cinco;
  seis _seis;

  siete _siete;
  ocho _ocho;
  nueve _nueve;
  diez _diez;
  once _once;
  doce _doce;

  List<AlimentacionModel> _Alimentacion = [];
  getAllAlimentacion() async {
    _Alimentacion = [];
    var categories =
        await CategoryService().readAlimentacion(int.parse(widget.folio));
    categories.forEach((category) {
      setState(() {
        var categoryModel = AlimentacionModel();
        categoryModel.folio = category['folio'];
        categoryModel.pregunta1 = category['pregunta1'];
        categoryModel.pregunta2 = category['pregunta2'];
        categoryModel.pregunta3 = category['pregunta3'];
        categoryModel.pregunta4 = category['pregunta4'];
        categoryModel.pregunta5 = category['pregunta5'];
        categoryModel.pregunta6 = category['pregunta6'];
        categoryModel.pregunta7 = category['pregunta7'];
        categoryModel.pregunta8 = category['pregunta8'];
        categoryModel.pregunta9 = category['pregunta9'];
        categoryModel.pregunta10 = category['pregunta10'];
        categoryModel.pregunta11 = category['pregunta11'];
        categoryModel.pregunta12 = category['pregunta12'];
        categoryModel.usuario = category['usuario'];
        categoryModel.dispositivo = category['dispositivo'];
        categoryModel.folioDisp = category['folioDisp'];

        _Alimentacion.add(categoryModel);
      });
    });

    if (_Alimentacion.map((e) => e.pregunta1.toString()).first == "SI") {
      _uno = uno.SI;
    } else if (_Alimentacion.map((e) => e.pregunta1.toString()).first == "NO") {
      _uno = uno.NO;
    }

    if (_Alimentacion.map((e) => e.pregunta2.toString()).first == "SI") {
      _dos = dos.SI;
    } else if (_Alimentacion.map((e) => e.pregunta2.toString()).first == "NO") {
      _dos = dos.NO;
    }

    if (_Alimentacion.map((e) => e.pregunta3.toString()).first == "SI") {
      _tres = tres.SI;
    } else if (_Alimentacion.map((e) => e.pregunta3.toString()).first == "NO") {
      _tres = tres.NO;
    }

    if (_Alimentacion.map((e) => e.pregunta4.toString()).first == "SI") {
      _cuatro = cuatro.SI;
    } else if (_Alimentacion.map((e) => e.pregunta4.toString()).first == "NO") {
      _cuatro = cuatro.NO;
    }

    if (_Alimentacion.map((e) => e.pregunta5.toString()).first == "SI") {
      _cinco = cinco.SI;
    } else if (_Alimentacion.map((e) => e.pregunta5.toString()).first == "NO") {
      _cinco = cinco.NO;
    }

    if (_Alimentacion.map((e) => e.pregunta6.toString()).first == "SI") {
      _seis = seis.SI;
    } else if (_Alimentacion.map((e) => e.pregunta6.toString()).first == "NO") {
      _seis = seis.NO;
    }

    if (_Alimentacion.map((e) => e.pregunta7.toString()).first == "SI") {
      _siete = siete.SI;
    } else if (_Alimentacion.map((e) => e.pregunta7.toString()).first == "NO") {
      _siete = siete.NO;
    }

    if (_Alimentacion.map((e) => e.pregunta8.toString()).first == "SI") {
      _ocho = ocho.SI;
    } else if (_Alimentacion.map((e) => e.pregunta8.toString()).first == "NO") {
      _ocho = ocho.NO;
    }

    if (_Alimentacion.map((e) => e.pregunta9.toString()).first == "SI") {
      _nueve = nueve.SI;
    } else if (_Alimentacion.map((e) => e.pregunta9.toString()).first == "NO") {
      _nueve = nueve.NO;
    }

    if (_Alimentacion.map((e) => e.pregunta10.toString()).first == "SI") {
      _diez = diez.SI;
    } else if (_Alimentacion.map((e) => e.pregunta10.toString()).first ==
        "NO") {
      _diez = diez.NO;
    }

    if (_Alimentacion.map((e) => e.pregunta11.toString()).first == "SI") {
      _once = once.SI;
    } else if (_Alimentacion.map((e) => e.pregunta11.toString()).first ==
        "NO") {
      _once = once.NO;
    }

    if (_Alimentacion.map((e) => e.pregunta12.toString()).first == "SI") {
      _doce = doce.SI;
    } else if (_Alimentacion.map((e) => e.pregunta12.toString()).first ==
        "NO") {
      _doce = doce.NO;
    }
  }

  actualizar() async {
    AlimentacionModel BModel = AlimentacionModel(
        folio: int.parse(widget.folio),
        pregunta1: _uno.name,
        pregunta2: _dos.name,
        pregunta3: _tres.name,
        pregunta4: _cuatro.name,
        pregunta5: _cinco.name,
        pregunta6: _seis.name,
        pregunta7: _siete.name,
        pregunta8: _ocho.name,
        pregunta9: _nueve.name,
        pregunta10: _diez.name,
        pregunta11: _once.name,
        pregunta12: _doce.name,
        dispositivo: widget.dispositivo,
        usuario: widget.usuario,
        folioDisp: widget.folioDisp);

    await DbHelper().upDateAlimentacion(BModel).then((alimentacionModel) {
      alertDialog(context, "Se actualizo correctamente".toUpperCase());
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new ActualizarEstudio(
            folio: widget.folio, dispositivo: widget.dispositivo);
      }));
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: NO se guardaron los datos".toUpperCase());
    });
  }

  guardar() async {
    AlimentacionModel BModel = AlimentacionModel(
        folio: int.parse(widget.folio),
        pregunta1: _uno.name,
        pregunta2: _dos.name,
        pregunta3: _tres.name,
        pregunta4: _cuatro.name,
        pregunta5: _cinco.name,
        pregunta6: _seis.name,
        pregunta7: _siete.name,
        pregunta8: _ocho.name,
        pregunta9: _nueve.name,
        pregunta10: _diez.name,
        pregunta11: _once.name,
        pregunta12: _doce.name,
        dispositivo: widget.dispositivo,
        usuario: widget.usuario,
        folioDisp: widget.folioDisp);

    await DbHelper().saveAlimentacion(BModel).then((alimentacionModel) {
      alertDialog(context, "Se guardo correctamente".toUpperCase());
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new ActualizarEstudio(
            folio: widget.folio, dispositivo: widget.dispositivo);
      }));
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: NO se guardaron los datos".toUpperCase());
    });
  }

  save() async {
    if (_Alimentacion.isEmpty) {
      guardar();
    } else {
      actualizar();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    var encabezado1 =
        'EN LOS ULTIMOS 3 MESES, POR FALTA DE DINERO U \n OTROS RECURSOS...'
            .toUpperCase();
    var pregunta1 =
        '1. ¿Alguna vez usted  o algún adulto en su hogar tuvo una alimentación \n basada en poca variedad de alimentos?'
            .toUpperCase();
    var pregunta2 =
        '2. ¿Alguna vez usted  o algún adulto en su hogar dejó de desayunar,\n  comer o cenar?'
            .toUpperCase();
    var pregunta3 =
        '3. ¿Alguna vez usted  o algún adulto en su hogar comió menos de lo que \n piensa debia comer?'
            .toUpperCase();
    var pregunta5 =
        '5. ¿Alguna vez ustede o algún adulto de su hogar sintió hambre, \n pero NO comió?'
            .toUpperCase();
    var pregunta6 =
        '6. ¿Alguna vez ustede o algún adulto de su hogar sólo comió una vez \n al día o dejo de come durante el día?'
            .toUpperCase();
    var encabezado2 =
        'SI EN EL HOGAR NO HAY PERSONAS MENORES DE 18 AÑOS \n PASE A LA SECCIÓN 8. RESULTADOS';
    var pregunta7 =
        '7. ¿Alguna vez algún menor de 18 años en su hogar tuvo una alimentación \n basada en poca variedad de alimentos?'
            .toUpperCase();
    var pregunta9 =
        '9. ¿Alguna vez en su hogar tuvieron tuvieron que disminuir la cantidad \n servida en la comida a algún menor de 18 años?'
            .toUpperCase();
    var pregunta8 =
        '8. ¿Alguna vez algún menor de 18 años en su hogar comió menos \n de lo que debia?'
            .toUpperCase();
    var pregunta10 =
        '10. ¿Alguna vez algún menor de 18 años en su hogar sintió hambre, \n pero NO comió?'
            .toUpperCase();
    var pregunta12 =
        '12. ¿Alguna vez algún menor de 18 años comió una vez al día o dejó \n de comer urante todo un día?'
            .toUpperCase();
    if (orientation == Orientation.landscape) {
      encabezado1 =
          'EN LOS ULTIMOS 3 MESES, POR FALTA DE DINERO U OTROS RECURSOS...';
      pregunta1 =
          '1. ¿Alguna vez usted  o algún adulto en su hogar tuvo una alimentación basada en poca variedad de alimentos?'
              .toUpperCase();
      pregunta2 =
          '2. ¿Alguna vez usted  o algún adulto en su hogar dejó de desayunar, comer o cenar?'
              .toUpperCase();
      pregunta3 =
          '3. ¿Alguna vez usted  o algún adulto en su hogar comió menos de lo que piensa debia comer?'
              .toUpperCase();
      pregunta5 =
          '5. ¿Alguna vez ustede o algún adulto de su hogar sintió hambre, pero NO comió?'
              .toUpperCase();
      pregunta6 =
          '6. ¿Alguna vez ustede o algún adulto de su hogar sólo comió una vez al día o dejo de come durante el día?'
              .toUpperCase();
      encabezado2 =
          'SI EN EL HOGAR NO HAY PERSONAS MENORES DE 18 AÑOS PASE A LA SECCIÓN 8. RESULTADOS';
      pregunta7 =
          '7. ¿Alguna vez algún menor de 18 años en su hogar tuvo una alimentación basada en poca variedad de alimentos?'
              .toUpperCase();
      pregunta8 =
          '8. ¿Alguna vez algún menor de 18 años en su hogar comió menos de lo que debia?'
              .toUpperCase();
      pregunta9 =
          '9. ¿Alguna vez en su hogar tuvieron tuvieron que disminuir la cantidad servida en la comida a algún menor de 18 años?'
              .toUpperCase();
      pregunta10 =
          '10. ¿Alguna vez algún menor de 18 años en su hogar sintió hambre, pero NO comió?'
              .toUpperCase();
      pregunta12 =
          '12. ¿Alguna vez algún menor de 18 años comió una vez al día o dejó de comer durante todo un día?'
              .toUpperCase();
    }
    return Scaffold(
      body: Form(
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
                    onPressed: getAllAlimentacion,
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
                getTextEquipamiento(encabezado: encabezado1),
                SizedBox(height: 10.0),
                getTextQuestion(question: pregunta1),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text('SI'),
                        leading: Radio<uno>(
                          value: uno.SI,
                          groupValue: _uno,
                          onChanged: (uno value) {
                            setState(() {
                              _uno = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('NO'),
                        leading: Radio<uno>(
                          value: uno.NO,
                          groupValue: _uno,
                          onChanged: (uno value) {
                            setState(() {
                              _uno = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: pregunta2),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text('SI'),
                        leading: Radio<dos>(
                          value: dos.SI,
                          groupValue: _dos,
                          onChanged: (dos value) {
                            setState(() {
                              _dos = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('NO'),
                        leading: Radio<dos>(
                          value: dos.NO,
                          groupValue: _dos,
                          onChanged: (dos value) {
                            setState(() {
                              _dos = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: pregunta3),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text('SI'),
                        leading: Radio<tres>(
                          value: tres.SI,
                          groupValue: _tres,
                          onChanged: (tres value) {
                            setState(() {
                              _tres = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('NO'),
                        leading: Radio<tres>(
                          value: tres.NO,
                          groupValue: _tres,
                          onChanged: (tres value) {
                            setState(() {
                              _tres = value;
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
                        '4. ¿Alguna vez se quedaron sin comida?'.toUpperCase()),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('SI'),
                        leading: Radio<cuatro>(
                          value: cuatro.SI,
                          groupValue: _cuatro,
                          onChanged: (cuatro value) {
                            setState(() {
                              _cuatro = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('NO'),
                        leading: Radio<cuatro>(
                          value: cuatro.NO,
                          groupValue: _cuatro,
                          onChanged: (cuatro value) {
                            setState(() {
                              _cuatro = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: pregunta5),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('SI'),
                        leading: Radio<cinco>(
                          value: cinco.SI,
                          groupValue: _cinco,
                          onChanged: (cinco value) {
                            setState(() {
                              _cinco = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('NO'),
                        leading: Radio<cinco>(
                          value: cinco.NO,
                          groupValue: _cinco,
                          onChanged: (cinco value) {
                            setState(() {
                              _cinco = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: pregunta6),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('SI'),
                        leading: Radio<seis>(
                          value: seis.SI,
                          groupValue: _seis,
                          onChanged: (seis value) {
                            setState(() {
                              _seis = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('NO'),
                        leading: Radio<seis>(
                          value: seis.NO,
                          groupValue: _seis,
                          onChanged: (seis value) {
                            setState(() {
                              _seis = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                SizedBox(height: 10.0),
                getTextEquipamiento(encabezado: encabezado2),
                SizedBox(height: 10.0),
                getTextQuestion(question: pregunta7),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('SI'),
                        leading: Radio<siete>(
                          value: siete.SI,
                          groupValue: _siete,
                          onChanged: (siete value) {
                            setState(() {
                              _siete = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('NO'),
                        leading: Radio<siete>(
                          value: siete.NO,
                          groupValue: _siete,
                          onChanged: (siete value) {
                            setState(() {
                              _siete = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: pregunta8),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('SI'),
                        leading: Radio<ocho>(
                          value: ocho.SI,
                          groupValue: _ocho,
                          onChanged: (ocho value) {
                            setState(() {
                              _ocho = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('NO'),
                        leading: Radio<ocho>(
                          value: ocho.NO,
                          groupValue: _ocho,
                          onChanged: (ocho value) {
                            setState(() {
                              _ocho = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: pregunta9),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('SI'),
                        leading: Radio<nueve>(
                          value: nueve.SI,
                          groupValue: _nueve,
                          onChanged: (nueve value) {
                            setState(() {
                              _nueve = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('NO'),
                        leading: Radio<nueve>(
                          value: nueve.NO,
                          groupValue: _nueve,
                          onChanged: (nueve value) {
                            setState(() {
                              _nueve = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: pregunta10),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('SI'),
                        leading: Radio<diez>(
                          value: diez.SI,
                          groupValue: _diez,
                          onChanged: (diez value) {
                            setState(() {
                              _diez = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('NO'),
                        leading: Radio<diez>(
                          value: diez.NO,
                          groupValue: _diez,
                          onChanged: (diez value) {
                            setState(() {
                              _diez = value;
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
                        '11. ¿Alguna vez algún menor de 18 años se durmio con hambre?'
                            .toUpperCase()),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('SI'),
                        leading: Radio<once>(
                          value: once.SI,
                          groupValue: _once,
                          onChanged: (once value) {
                            setState(() {
                              _once = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('NO'),
                        leading: Radio<once>(
                          value: once.NO,
                          groupValue: _once,
                          onChanged: (once value) {
                            setState(() {
                              _once = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                getTextQuestion(question: pregunta12),
                Row(
                  children: <Widget>[
                    //INE
                    Expanded(
                      child: ListTile(
                        title: Text('SI'),
                        leading: Radio<doce>(
                          value: doce.SI,
                          groupValue: _doce,
                          onChanged: (doce value) {
                            setState(() {
                              _doce = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('NO'),
                        leading: Radio<doce>(
                          value: doce.NO,
                          groupValue: _doce,
                          onChanged: (doce value) {
                            setState(() {
                              _doce = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
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
