import 'package:flutter/material.dart';

class getEquipamientoLabel extends StatelessWidget {
  String question;

  getEquipamientoLabel({this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 17.0),
          )
        ],
      ),
    );
  }
}
