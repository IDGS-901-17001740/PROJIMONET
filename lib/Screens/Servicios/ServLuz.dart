import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/ServiciosModel/ServLuzModel.dart';
import 'package:esn/Screens/Servicios/ServAgua.dart';
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
        alertDialog(context, 'Datos Guardados Con Exito');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => ServAgua(
                  folio: widget.folio,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp,
                  usuario: widget.usuario)),
          (Route<dynamic> route) => false,
        );
      } catch (e) {
        print(e);
        alertDialog(context, 'Error Al Guardar Servicio'.toUpperCase());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SERVICIO LUZ')),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 10),
              getTextQuestion(question: 'SERVICIOS'),
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
                  textCapitalization: TextCapitalization.words,
                  controller: _otroLuz,
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
                    'CONTINUAR',
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
