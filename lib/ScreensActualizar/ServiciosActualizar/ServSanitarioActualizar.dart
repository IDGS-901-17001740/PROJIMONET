import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextField.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/ServiciosModel.dart';
import 'package:esn/Model/ServiciosModel/ServSanitarioModel.dart';
import 'package:esn/Screens/Servicios/ServGas.dart';
import 'package:esn/ScreensActualizar/ActualizarEstudio.dart';
import 'package:flutter/material.dart';

class ServSanitario extends StatefulWidget {
  String folio;
  String folioDisp;
  String usuario;
  String dispositivo;

  ServSanitario({this.folio, this.folioDisp, this.dispositivo, this.usuario});

  @override
  State<ServSanitario> createState() => _ServSanitarioState();
}

class _ServSanitarioState extends State<ServSanitario> {
  var _otroSanitario = TextEditingController();
  bool val = false;

  List<ServSanitarioModel> _ServSanitario = [];

  @override
  void initState() {
    getServiciosSanitario();
    getSelectServicio();
    super.initState();
  }

  getSelectServicio() async {
    var data = await DbHelper().readServiciosA(widget.folio);
    data.forEach((dato) {
      setState(() {
        var datos = ServiciosModel();
        datos.servSanitario = dato['servSanitario'];
        datos.otroSanitario = dato['otroSanitario'];

        _servicio.add(datos);
      });

      servicio.text = _servicio.map((e) => e.servSanitario).first;
      if (_servicio.map((e) => e.otroSanitario).first == null ||
          _servicio.map((e) => e.otroSanitario).first.isEmpty) {
        _otroSanitario.clear();
      } else {
        _otroSanitario.text = _servicio.map((e) => e.otroSanitario).first;
      }
    });
  }

  List<ServiciosModel> _servicio = [];
  var servicio = TextEditingController();

  getServiciosSanitario() async {
    var data = await DbHelper().readServicioSanitario();
    data.forEach((category) {
      setState(() {
        var dataSanitario = ServSanitarioModel();
        dataSanitario.ClaveServSanitario = category['ClaveServSanitario'];
        dataSanitario.OrdenServSanitario = category['OrdenServSanitario'];
        dataSanitario.ServSanitario = category['ServSanitario'];

        _ServSanitario.add(dataSanitario);
      });
    });
  }

  var serv = '';
  int id;
  int orden;

  guardar() {
    if (serv.isEmpty) {
      alertDialog(context, 'Por favor seleccionar una opción'.toUpperCase());
    } else {
      String servSanitario = serv;
      int clave = id;
      String folio = widget.folio;
      String otro = _otroSanitario.text;
      String otroSanitario;

      if (otro == '') {
        otroSanitario = "N/A";
      } else {
        otroSanitario = otro;
      }

      try {
        DbHelper().guardarServSanitario(
            folio, clave, orden, servSanitario, otroSanitario);
        Navigator.of(context)
            .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          return new ActualizarEstudio(
              folio: widget.folio, dispositivo: widget.dispositivo);
        }));
        alertDialog(context, 'Datos Guardados Con Exito'.toUpperCase());
      } catch (e) {
        print(e);
        alertDialog(context, 'Error Al Guardar Servicio'.toUpperCase());
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
              getTextQuestion(
                  question: 'Servicio Drenaje Guardado'.toUpperCase()),
              getTextField(controller: servicio, readOnly: true),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 500.0,
                    child: ListView.builder(
                      itemCount: _ServSanitario.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            _ServSanitario[index].value =
                                !_ServSanitario[index].value;
                          });
                        },
                        child: ListTile(
                          leading: Radio<String>(
                            groupValue: serv,
                            value: _ServSanitario[index].ServSanitario,
                            onChanged: (checked) {
                              setState(() {
                                _ServSanitario[index].ServSanitario = checked;
                                id = _ServSanitario[index].ClaveServSanitario;
                                orden =
                                    _ServSanitario[index].OrdenServSanitario;
                                serv = checked;

                                if (serv == 'OTRO') {
                                  val = true;
                                } else {
                                  val = false;
                                  _otroSanitario.clear();
                                }
                              });
                            },
                          ),
                          title: Text(
                              _ServSanitario[index].ServSanitario.toString()),
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
                  controller: _otroSanitario,
                  onTap: () => _otroSanitario.clear(),
                  enabled: val,
                  autofocus: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText: 'OTRO SANITARIO',
                    labelText: 'OTRO SANITARIO',
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
