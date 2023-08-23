import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextField.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/ServiciosModel.dart';
import 'package:esn/Model/ServiciosModel/ServLuzModel.dart';
import 'package:esn/Screens/Servicios/ServAgua.dart';
import 'package:esn/ScreensActualizar/ActualizarEstudio.dart';
import 'package:flutter/material.dart';

class ServLuz extends StatefulWidget {
  String folio;
  String folioDisp;
  String usuario;
  String dispositivo;

  ServLuz({this.folio, this.folioDisp, this.dispositivo, this.usuario});

  @override
  State<ServLuz> createState() => _ServLuzState();
}

class _ServLuzState extends State<ServLuz> {
  var _otroLuz = TextEditingController();
  bool val = false;

  List<ServLuzModel> _ServLuz = [];

  @override
  void initState() {
    getServiciosLuz();
    getSelectServicio();
    super.initState();
  }

  getServiciosLuz() async {
    var data = await DbHelper().readServicioLuz();
    data.forEach((category) {
      setState(() {
        var dataLuz = ServLuzModel();
        dataLuz.ClaveServLuz = category['ClaveServLuz'];
        dataLuz.OrdenServLuz = category['OrdenServLuz'];
        dataLuz.ServLuz = category['ServLuz'];

        _ServLuz.add(dataLuz);
      });
    });
  }

  List<ServiciosModel> _servicio = [];
  var servicio = TextEditingController();
  getSelectServicio() async {
    var data = await DbHelper().readServiciosA(widget.folio);
    data.forEach((dato) {
      setState(() {
        var datos = ServiciosModel();
        datos.servLuz = dato['servLuz'];
        datos.otroLuz = dato['otroLuz'];

        _servicio.add(datos);
      });

      servicio.text = _servicio.map((e) => e.servLuz).first;

      if (_servicio.map((e) => e.otroLuz).first == null ||
          _servicio.map((e) => e.otroLuz).first.isEmpty) {
        _otroLuz.clear();
      } else {
        _otroLuz.text = _servicio.map((e) => e.otroLuz).first;
      }
    });
  }

  var serv;
  int id;
  int orden;

  guardar() {
    if (serv.isEmpty || id == '' || orden == '') {
      alertDialog(context, 'Por favor seleccionar una opción'.toUpperCase());
    } else {
      String servLuz = serv;
      int clave = id;
      String folio = widget.folio;
      String otro = _otroLuz.text;
      String otroLuz;

      if (otro == '') {
        otroLuz = "N/A";
      } else {
        otroLuz = otro;
      }

      try {
        DbHelper().guardarServLuz(folio, clave, orden, servLuz, otroLuz);
        alertDialog(context, 'Datos Actualizados Con Exito'.toUpperCase());
        Navigator.of(context)
            .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          return new ActualizarEstudio(
              folio: widget.folio, dispositivo: widget.dispositivo);
        }));
      } catch (e) {
        print(e);
        alertDialog(context, 'Error Al Actualizar Servicio'.toUpperCase());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 10),
              getTextQuestion(question: 'Servicio Luz Guardado'.toUpperCase()),
              getTextField(controller: servicio, readOnly: true),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 400.0,
                    child: ListView.builder(
                      itemCount: _ServLuz.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            _ServLuz[index].value = !_ServLuz[index].value;
                          });
                        },
                        child: ListTile(
                          leading: Radio<String>(
                            groupValue: serv,
                            value: _ServLuz[index].ServLuz,
                            onChanged: (checked) {
                              setState(() {
                                _ServLuz[index].ServLuz = checked;
                                id = _ServLuz[index].ClaveServLuz;
                                orden = _ServLuz[index].OrdenServLuz;
                                serv = checked;

                                if (serv == 'OTRO') {
                                  val = true;
                                } else {
                                  val = false;
                                  _otroLuz.clear();
                                }
                              });
                            },
                          ),
                          title: Text(_ServLuz[index].ServLuz.toString()),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(height: 5.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  controller: _otroLuz,
                  onTap: () => _otroLuz.clear(),
                  enabled: val,
                  autofocus: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText: 'OTRO LUZ',
                    labelText: 'OTRO LUZ',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: guardar,
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
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
    );
  }
}
