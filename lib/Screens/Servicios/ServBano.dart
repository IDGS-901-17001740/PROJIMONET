import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genTextQuestion.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/ServiciosModel/ServBanoModel.dart';
import 'package:esn/Screens/Servicios/ServLuz.dart';
import 'package:flutter/material.dart';

class ServBano extends StatefulWidget {
  String folio;
  String folioDisp;
  String usuario;
  String dispositivo;

  ServBano({this.folio, this.folioDisp, this.dispositivo, this.usuario});
  @override
  State<ServBano> createState() => _ServBanoState();
}

class _ServBanoState extends State<ServBano> {
  var _otroBano = TextEditingController();
  bool val = false;
  @override
  void initState() {
    getServiciosBano();
    super.initState();
  }

  List<ServBanoModel> _ServBano = [];

  getServiciosBano() async {
    var data = await DbHelper().readServicioBano();
    data.forEach((category) {
      setState(() {
        var dataBano = ServBanoModel();
        dataBano.txt_desc_bano = category['txt_desc_bano'];
        dataBano.pk_bano = category['pk_bano'];
        dataBano.int_orden_bano = category['int_orden_bano'];

        _ServBano.add(dataBano);
      });
    });
  }

  var serv = '';
  int id;
  int clave;

  guardar() {
    if (serv.isEmpty || id == '' || clave == '') {
      alertDialog(context, 'Por favor seleccionar una opción'.toUpperCase());
    } else {
      int pk_bano = id;
      int orden_bano = clave;
      String serv_bano = serv;
      String otro = _otroBano.text;
      String folio = widget.folio;
      String usuario = widget.usuario;
      String dispositivo = widget.dispositivo;
      String folioDisp = widget.folioDisp;
      String otroBano;

      if (otro == '') {
        otroBano = "N/A";
      } else {
        otroBano = otro;
      }

      try {
        DbHelper()
            .updateServBano(folio, pk_bano, orden_bano, serv_bano, otroBano);
        Navigator.of(context)
            .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          return new ServLuz(
              folio: folio,
              dispositivo: dispositivo,
              folioDisp: folioDisp,
              usuario: widget.usuario);
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
      appBar: AppBar(title: Text('SERVICIO BAÑO')),
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
                      itemCount: _ServBano.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            _ServBano[index].value = !_ServBano[index].value;
                          });
                        },
                        child: ListTile(
                          leading: Radio<String>(
                            groupValue: serv,
                            value: _ServBano[index].txt_desc_bano,
                            onChanged: (checked) {
                              setState(() {
                                _ServBano[index].txt_desc_bano = checked;
                                id = _ServBano[index].pk_bano;
                                clave = _ServBano[index].int_orden_bano;
                                serv = checked;

                                if (serv == 'OTRO') {
                                  val = true;
                                } else {
                                  val = false;
                                  _otroBano.clear();
                                }
                              });
                            },
                          ),
                          title:
                              Text(_ServBano[index].txt_desc_bano.toString()),
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
                  controller: _otroBano,
                  enabled: val,
                  autofocus: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText: 'OTRO BAÑO',
                    labelText: 'OTRO BAÑO',
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
