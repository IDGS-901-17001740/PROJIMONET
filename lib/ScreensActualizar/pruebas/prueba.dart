import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:flutter/material.dart';

class Prueba extends StatefulWidget {
  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
 

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    //_markSelectedItems(); // Marcar elementos seleccionados
    return SafeArea(child: Scaffold(
      body: Center(child: Container(
        child: Column(
          children: [
            SfSignaturePad(
              backgroundColor: Colors.grey,
              minimumStrokeWidth: 4.0,
              maximumStrokeWidth: 6.0,
            ),
            ElevatedButton(
              onPressed: () async{}, 
            child: Text(''))
          ],
        ),
        
        height: 300,
        width: 300,
      )),
    ));
  }
}
