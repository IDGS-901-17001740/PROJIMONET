/*import 'package:esn/Model/DispoModel.dart';
import 'package:flutter/material.dart';
import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genLoginSignupHeader.dart';
import 'package:esn/Comm/genTextFormField.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/UserModel.dart';
import 'package:esn/Screens/LoginForm.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conUserName = TextEditingController();
  final _conApellidoP = TextEditingController();
  final _conApellidoM = TextEditingController();
  final _conRol = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();
  final _conDispositivo = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  setDispositivo() async {
    String dispositivo = _conDispositivo.text;
    DispoModel dModel = DispoModel(dispositivo: dispositivo);
    await dbHelper.saveDispo(dModel).then((userData) {
      alertDialog(context, "Se registro correctamente");
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: No se guardaron los datos");
    });
  }

  signUp() async {
    String idu = "";
    String nombreU = _conUserId.text;
    String nombre = _conUserName.text;
    String apellidoP = _conApellidoP.text;
    String apellidoM = _conApellidoM.text;
    String rol = _conRol.text;
    String passwd = _conPassword.text;
    String cpasswd = _conCPassword.text;

    if (_formKey.currentState.validate()) {
      if (passwd != cpasswd) {
        alertDialog(context, 'La contraseña no coincide');
      } else {
        _formKey.currentState.save();

        UserModel uModel =
            UserModel(null, nombreU, nombre, apellidoP, apellidoM, rol, passwd);
        await dbHelper.saveData(uModel).then((userData) {
          alertDialog(context, "Se registro correctamente");
          setDispositivo();
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginForm()));
        }).catchError((error) {
          print(error);
          alertDialog(context, "Error: No se guardaron los datos");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  genLoginSignupHeader('Registrar'),
                  getTextFormField(
                    controller: _conDispositivo,
                    icon: Icons.tablet_android,
                    hintName: 'Nombre del Dispositivo',
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conUserId,
                      icon: Icons.person_outline,
                      hintName: 'Nombre de Usuario'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conUserName,
                      icon: Icons.person,
                      inputType: TextInputType.name,
                      hintName: 'Nombre'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conApellidoP,
                      icon: Icons.person,
                      hintName: 'Apellido Paterno'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conApellidoM,
                      icon: Icons.person,
                      hintName: 'Apellido Materno'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conRol, icon: Icons.person, hintName: 'Rol'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: _conPassword,
                    icon: Icons.lock,
                    hintName: 'Contraseña',
                    isObscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: _conCPassword,
                    icon: Icons.lock,
                    hintName: 'Confirmar Contraseña',
                    isObscureText: true,
                  ),
                  Container(
                    margin: EdgeInsets.all(30.0),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        'Registrar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: signUp,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Ya tienes cuenta? '),
                        TextButton(
                          child: Text(
                            'Ingresar',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => LoginForm()),
                                (Route<dynamic> route) => false);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/
