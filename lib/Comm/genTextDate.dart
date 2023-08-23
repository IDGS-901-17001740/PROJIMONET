import 'package:flutter/material.dart';
import 'package:masked_text_field/masked_text_field.dart';

class getTextDate extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  TextInputType inputType;

  getTextDate({this.controller, this.hintName, this.inputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 300,
      child: MaskedTextField(
        textFieldController: controller,
        inputDecoration: InputDecoration(
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
        mask: 'xx-xx-xxxxx',
        maxLength: 15,
        keyboardType: inputType,
        onChange: (String value) {
          print(value);
        },
      ),
    );
  }
}
