import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/ServiciosModel/ServSanitarioModel.dart';
import 'package:esn/Screens/Servicios/ServGas.dart';
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
    super.initState();
  }

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
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => ServGas(
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
      appBar: AppBar(title: Text('SERVICIO SANITARIO')),
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
                    height: 600.0,
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
