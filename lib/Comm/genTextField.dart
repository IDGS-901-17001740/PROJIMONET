import 'package:esn/Comm/Metodos/TextFormater.dart';
import 'package:flutter/material.dart';

class getTextField extends StatelessWidget {
  TextEditingController controller;
  TextInputType inputType;
  bool readOnly;

  getTextField({this.controller, this.inputType, this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty || value == null) {
            return 'Este campo no puede estar vacio';
          }
          return null;
        },
        inputFormatters: [AlphaNumericInputFormatter()],
        keyboardType: inputType,
        readOnly: readOnly,
        textCapitalization: TextCapitalization.characters,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2.0, color: Colors.black26, style: BorderStyle.solid),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2.0, color: Colors.blue, style: BorderStyle.solid),
            ),
            fillColor: Colors.grey[120],
            filled: true),
      ),
    );
  }
}
