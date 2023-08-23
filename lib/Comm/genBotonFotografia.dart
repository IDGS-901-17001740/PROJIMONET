import 'package:flutter/material.dart';

class botonFoto extends StatelessWidget {
  Function funcion;

  botonFoto({this.funcion});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      width: double.infinity,
      child: TextButton.icon(
        onPressed: funcion,
        icon: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
        label: Text('TOMAR FOTOGRAFIA', style: TextStyle(color: Colors.white)),
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
