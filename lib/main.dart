import 'package:esn/Screens/Fotografia.dart';
import 'package:esn/Screens/LoginForm.dart';
import 'package:esn/ScreensActualizar/pruebas/prueba.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PROJIMONET v1.0.11',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: //LoginForm());
        Fotografia(dispositivo: 't01',
                folio: '150',
                folioDisp: 't150-5',
                usuario: 'amartinez'));
    //TablaFolios());
    //DatosGenerales());
    //TablaFolios(usuario: '4'));
    //Prueba());
    /* EstructuraFamiliarTabla(
                dispositivo: 't01',
                folio: '150',
                folioDisp: 't150-5',
                usuario: 'amartinez')); */
  }
}
