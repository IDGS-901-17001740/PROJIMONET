import 'package:flutter/material.dart';

class getTextAportaciones extends StatelessWidget {

  String encabezado;

  getTextAportaciones({this.encabezado});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(encabezado,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30.0
            ),)
        ],
      ),
    );
  }
}