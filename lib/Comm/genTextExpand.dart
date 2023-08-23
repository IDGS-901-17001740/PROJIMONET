import 'package:flutter/material.dart';

class genTextExpand extends StatefulWidget {
  TextEditingController controller;
  String hintName;
  TextInputType inputType;
  String keyb;
  Function funcion;

  genTextExpand(
      {this.controller,
      this.hintName,
      this.inputType,
      this.keyb,
      this.funcion});

  @override
  State<genTextExpand> createState() => _genTextExpandState();
}

class _genTextExpandState extends State<genTextExpand> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 600,
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        controller: widget.controller,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintText: widget.hintName,
          labelText: widget.hintName,
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
