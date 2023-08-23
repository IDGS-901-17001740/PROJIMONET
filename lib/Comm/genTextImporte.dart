import 'package:esn/Comm/Metodos/TextFormater.dart';
import 'package:flutter/material.dart';

class getTextImporte extends StatelessWidget {
  TextEditingController controller;

  getTextImporte({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        inputFormatters: [AlphaNumericInputFormatter()],
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
