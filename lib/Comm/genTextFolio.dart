import 'package:flutter/material.dart';

class getTextFolio extends StatelessWidget {
  TextEditingController controller;


  getTextFolio({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.black26, style: BorderStyle.solid
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.blue, style: BorderStyle.solid
              ),
            ),
            fillColor: Colors.grey[120],
            filled: true,
        ),
      ),
    );
  }
}
