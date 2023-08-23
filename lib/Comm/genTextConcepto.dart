import 'package:flutter/material.dart';

class getTextCocepto extends StatelessWidget {

  String concepto;

  getTextCocepto({this.concepto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(concepto,
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