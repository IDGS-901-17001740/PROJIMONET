import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/EscolaridadSeguridadSocial.dart';
import 'package:esn/Model/PrestacionesLaboralesModel.dart';
import 'package:esn/Model/integrante_prestacionLaboral.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';

class Prueba extends StatefulWidget {
  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  List<PrestacionesLaboralesModel> _selectedItem1 = [];
  List<PrestacionesLaboralesModel> _PrestacionesList1 = [];
  final _prestacion1 = TextEditingController();

  getAllPrestacionesLaborales1() async {
    var categories = await CategoryService().readPrestacionesLaborales();
    categories.forEach((category) {
      setState(() {
        var categoryModel = PrestacionesLaboralesModel();
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'];
        categoryModel.Orden_PrestacionesLaborales =
            category['Orden_PrestacionesLaborales'];
        categoryModel.Pk_PrestacionesLaborales =
            category['Pk_PrestacionesLaborales'];
        _PrestacionesList1.add(categoryModel);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAllPrestacionesLaborales1();
  }

  addChecked1() {
    String selectedDescriptions =
        _selectedItem1.map((e) => e.txt_desc_prestacioneslab).join(', ');
    String selectedClaves =
        _selectedItem1.map((e) => e.Orden_PrestacionesLaborales).join(', ');
    String selectedOrden =
        _selectedItem1.map((e) => e.Pk_PrestacionesLaborales).join(', ');
    _prestacion1.text = selectedDescriptions;
    print('Descripciones seleccionadas: $selectedDescriptions');
    print('Claves seleccionadas: $selectedClaves');
    print('Orden seleccionado: $selectedOrden');
    print('');
    print('');
    print('');
    print(_selectedItem1);
  }

  List<String> _selectedItems1 = [];
  getAllEscolaridad1() async {
    _selectedItems1 = [];
    var categories = await CategoryService().readEscolaridad1(int.parse('7'));
    categories.forEach((category) {
      setState(() {
        var categoryModel = EscolaridadSeguridadSocial();

        categoryModel.pk_prestacioneslab = category['pk_prestacioneslab'];
        categoryModel.int_OrdenPrestacionesLab =
            category['int_OrdenPrestacionesLab'];
        categoryModel.txt_desc_prestacioneslab =
            category['txt_desc_prestacioneslab'];
      });
    });

    print(_selectedItems1);
  }

  @override
  Widget build(BuildContext context) {
    //_markSelectedItems(); // Marcar elementos seleccionados
    return Scaffold(
        appBar: AppBar(title: Text('Prueba')),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            width: 600,
            child: Container(
              child: Column(
                children: [
                  TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    controller: _prestacion1,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        hintText: 'PRESTACIONES LABORALES',
                        labelText: 'PRESTACIONES LABORALES',
                        fillColor: Colors.grey[200],
                        filled: true),
                    onTap: () => showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Container(
                              height: 500,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: _PrestacionesList1.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return CheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          title: Text(_PrestacionesList1[index]
                                              .txt_desc_prestacioneslab),
                                          value: _selectedItem1.contains(
                                              _PrestacionesList1[index]),
                                          onChanged: (bool value) {
                                            setState(() {
                                              if (value == true) {
                                                _selectedItem1.add(
                                                    _PrestacionesList1[index]);
                                              } else {
                                                _selectedItem1.remove(
                                                    _PrestacionesList1[index]);
                                              }
                                            });
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: addChecked1, child: Text('AGREGAR')),
                ],
              ),
            ),
          ),
        ));
  }
}
