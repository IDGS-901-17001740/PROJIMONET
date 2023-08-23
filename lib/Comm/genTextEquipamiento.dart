import 'package:flutter/material.dart';

class getTextEquipamiento extends StatelessWidget {
  String encabezado;

  getTextEquipamiento({this.encabezado});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(encabezado,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 24.0
            ),)
        ],
      ),
    );
  }
}