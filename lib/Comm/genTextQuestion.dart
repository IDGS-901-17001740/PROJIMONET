import 'package:flutter/material.dart';

class getTextQuestion extends StatelessWidget {
  String question;

  getTextQuestion({this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
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
