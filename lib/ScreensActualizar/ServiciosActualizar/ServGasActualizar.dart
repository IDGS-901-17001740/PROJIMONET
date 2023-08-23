import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextField.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/ServiciosModel.dart';
import 'package:esn/Model/ServiciosModel/ServGasModel.dart';
import 'package:esn/Screens/EstructuraFamiliarTabla.dart';
import 'package:esn/ScreensActualizar/ActualizarEstudio.dart';
import 'package:flutter/material.dart';

class ServGas extends StatefulWidget {
  String folio;
  String folioDisp;
  String usuario;
  String dispositivo;

  ServGas({this.folio, this.folioDisp, this.dispositivo, this.usuario});

  @override
  State<ServGas> createState() => _ServGasState();
}

class _ServGasState extends State<ServGas> {
  var _otroGas = TextEditingController();
  bool val = false;

  List<ServGasModel> _ServGas = [];

  @override
  void initState() {
    getServiciosGas();
    getSelectServicio();
    super.initState();
  }

  getSelectServicio() async {
    var data = await DbHelper().readServiciosA(widget.folio);
    data.forEach((dato) {
      setState(() {
        var datos = ServiciosModel();
        datos.servGas = dato['servGas'];
        datos.otroGas = dato['otroGas'];

        _servicio.add(datos);
      });

      servicio.text = _servicio.map((e) => e.servGas).first;

      if (_servicio.map((e) => e.otroGas).first == null ||
          _servicio.map((e) => e.otroGas).first.isEmpty) {
        _otroGas.clear();
      } else {
        _otroGas.text = _servicio.map((e) => e.otroGas).first;
      }
    });
  }

  List<ServiciosModel> _servicio = [];
  var servicio = TextEditingController();

  getServiciosGas() async {
    var data = await DbHelper().readServicioGas();
    data.forEach((category) {
      setState(() {
        var dataGas = ServGasModel();
        dataGas.ClaveServGas = category['ClaveServGas'];
        dataGas.OrdenServGas = category['OrdenServGas'];
        dataGas.ServGas = category['ServGas'];

        _ServGas.add(dataGas);
      });
    });
  }

  var serv = '';
  int id;
  int orden;

  guardar() {
    if (serv == '') {
      alertDialog(context, 'Por favor seleccionar una opción'.toUpperCase());
    } else {
      String servGas = serv;
      int clave = id;
      String folio = widget.folio;
      String otro = _otroGas.text;
      String otroGas;

      if (otro == '') {
        otroGas = "N/A";
      } else {
        otroGas = otro;
      }

      try {
        DbHelper().guardarServGas(folio, clave, orden, servGas, otroGas);
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
              getTextQuestion(question: 'Servicio GAS Guardado'.toUpperCase()),
              getTextField(controller: servicio, readOnly: true),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 400.0,
                    child: ListView.builder(
                      itemCount: _ServGas.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            _ServGas[index].value = !_ServGas[index].value;
                          });
                        },
                        child: ListTile(
                          leading: Radio<String>(
                            groupValue: serv,
                            value: _ServGas[index].ServGas,
                            onChanged: (checked) {
                              setState(() {
                                _ServGas[index].ServGas = checked;
                                id = _ServGas[index].ClaveServGas;
                                orden = _ServGas[index].OrdenServGas;
                                serv = checked;

                                if (serv == 'OTRO COMBUSTIBLE') {
                                  val = true;
                                } else {
                                  val = false;
                                  _otroGas.clear();
                                }
                              });
                            },
                          ),
                          title: Text(_ServGas[index].ServGas.toString()),
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
                  controller: _otroGas,
                  onTap: () => _otroGas.clear(),
                  enabled: val,
                  autofocus: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText: 'OTRO GAS',
                    labelText: 'OTRO GAS',
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
