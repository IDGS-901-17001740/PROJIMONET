import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/ServiciosModel/ServAguaModel.dart';
import 'package:esn/Screens/Servicios/ServSanitario.dart';
import 'package:flutter/material.dart';

class ServAgua extends StatefulWidget {
  String folio;
  String folioDisp;
  String usuario;
  String dispositivo;

  ServAgua({this.folio, this.folioDisp, this.dispositivo, this.usuario});

  @override
  State<ServAgua> createState() => _ServAguaState();
}

class _ServAguaState extends State<ServAgua> {
  var _otroAgua = TextEditingController();
  bool val = false;

  List<ServAguaModel> _ServAgua = [];

  @override
  void initState() {
    getServiciosAgua();
    super.initState();
  }

  getServiciosAgua() async {
    var data = await DbHelper().readServicioAgua();
    data.forEach((category) {
      setState(() {
        var dataAgua = ServAguaModel();
        dataAgua.ClaveServAgua = category['ClaveServAgua'];
        dataAgua.OrdenServAgua = category['OrdenServAgua'];
        dataAgua.ServAgua = category['ServAgua'];

        _ServAgua.add(dataAgua);
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
      String servAgua = serv;
      int clave = id;
      String folio = widget.folio;
      String otro = _otroAgua.text;
      String otroAgua;

      if (otro == '') {
        otroAgua = "N/A";
      } else {
        otroAgua = otro;
      }

      try {
        DbHelper().guardarServAgua(folio, clave, orden, servAgua, otroAgua);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => ServSanitario(
                  folio: widget.folio,
                  dispositivo: widget.dispositivo,
                  folioDisp: widget.folioDisp,
                  usuario: widget.usuario)),
          (Route<dynamic> route) => false,
        );
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
      appBar: AppBar(title: Text('SERVICIO AGUA')),
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
                    height: 500.0,
                    child: ListView.builder(
                      itemCount: _ServAgua.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            _ServAgua[index].value = !_ServAgua[index].value;
                          });
                        },
                        child: ListTile(
                          leading: Radio<String>(
                            groupValue: serv,
                            value: _ServAgua[index].ServAgua,
                            onChanged: (checked) {
                              setState(() {
                                _ServAgua[index].ServAgua = checked;
                                id = _ServAgua[index].ClaveServAgua;
                                orden = _ServAgua[index].OrdenServAgua;
                                serv = checked;

                                if (serv == 'OTRA FUENTE' || serv == 'OTRO') {
                                  val = true;
                                } else {
                                  val = false;
                                  _otroAgua.clear();
                                }
                              });
                            },
                          ),
                          title: Text(_ServAgua[index].ServAgua.toString()),
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
                  controller: _otroAgua,
                  enabled: val,
                  autofocus: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText: 'OTRO AGUA',
                    labelText: 'OTRO AGUA',
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
