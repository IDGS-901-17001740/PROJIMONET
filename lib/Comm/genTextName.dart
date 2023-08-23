import 'package:esn/Comm/Metodos/TextFormater.dart';
import 'package:flutter/material.dart';

class genTextName extends StatelessWidget {
  TextEditingController controller;
  String hintName;

  genTextName({this.controller, this.hintName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: 300,
      child: TextFormField(
        inputFormatters: [AlphaNumericInputFormatter()],
        textCapitalization: TextCapitalization.characters,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintText: hintName,
          labelText: hintName,
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
