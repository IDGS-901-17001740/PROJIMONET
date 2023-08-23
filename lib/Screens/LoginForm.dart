import 'dart:convert';

import 'package:esn/Comm/Metodos/TextFormater.dart';
import 'package:esn/Model/DispoModel.dart';
import 'package:esn/Model/VersionModel.dart';
import 'package:esn/SQLBD/Sql.dart';
import 'package:esn/Screens/DatosGenerales.dart';
import 'package:esn/Screens/TablaFolios.dart';
import 'package:esn/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:esn/Comm/comHelper.dart';
import 'package:esn/Comm/genLoginSignupHeader.dart';
import 'package:esn/Comm/genTextFormField.dart';
import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/UserModel.dart';
import 'package:esn/Screens/SignupForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _nombreUsuario = TextEditingController();
  final _contrasenia = TextEditingController();

  final _dispositivo = TextEditingController();

  List<VersionModel> _Version = [];

  @override
  void initState() {
    getVersion();

    super.initState();
  }

  getVersion() async {
    _Version = [];
    var data = await DbHelper().readVersion();

    data.forEach((category) {
      setState(() {
        var dataModel = VersionModel();
        dataModel.versionApp = category['versionApp'];
        _Version.add(dataModel);
      });
    });
  }

  login() async {
    var ver = _Version.map((e) => e.versionApp).first;
    print(ver);
    if (ver == "1.0.10") {
      String nombreUsuario = _nombreUsuario.text;
      String contrasenia = _contrasenia.text;

      if (nombreUsuario.isEmpty) {
        alertDialog(context, 'Introduce un nombre de Usuario');
      } else if (contrasenia.isEmpty) {
        alertDialog(context, 'Introduce una contrasenia');
      } else {
        await DbHelper()
            .getLoginUser(nombreUsuario, contrasenia)
            .then((usuarioData) {
          if (usuarioData != null) {
            setSP(usuarioData).whenComplete(() async {
              SharedPreferences _pref = await SharedPreferences.getInstance();
              await _pref.getString('txt_usuario_usu');
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => TablaFolios()),
                  (Route<dynamic> route) => false);
            });
          } else {
            alertDialog(context, 'Error: Credenciales de acceso incorrectas');
          }
        }).catchError((error) {
          print(error);
          alertDialog(context, 'Error: Fallo inserperado en al Iniciar Sesión');
        });
      }
    } else {
      alertDialog(context, 'Error: La version no coincide con la actual');
    }
  }

  Future setSP(UserModel u) async {
    final SharedPreferences sp = await _pref;
    sp.setInt('pk_clave_usu', u.pk_clave_usu);
    sp.setString('txt_usuario_usu', u.txt_usuario_usu);
    sp.setString('txt_nombre_usu', u.txt_nombre_usu);
    sp.setString('txt_email_usu', u.txt_email_usu);
    sp.setString('txt_contrasena_usu', u.txt_contrasena_usu);
    sp.setString('num_activo_usu', u.num_activo_usu);
    sp.setString('fk_clave_rol', u.fk_clave_rol);
    sp.setString('fk_clave_emp', u.fk_clave_emp);
    sp.setString('dispositivo', u.dispositivo);
  }

/*   String usuario;
  Future<void> mostrar_Usuario() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.getString('txt_usuario_usu');
  } */

  guardarDispositivo() async {
    await DbHelper().eliminarDispositivo();

    String dispositivo = _dispositivo.text;

    try {
      DbHelper().guardarDispositivo(dispositivo);
      Navigator.pop(context);
      alertDialog(context, 'Nombre del Dispositivo guardado con exito');
    } catch (e) {
      print(e);
      alertDialog(context, 'Error al guardar el nombre del dispositivo');
    }
  }

  List<DispoModel> _dispo = [];
  var dispositivo;
  getDispo() async {
    _dispo = [];
    var categories = await CategoryService().readDisp();
    categories.forEach((category) {
      setState(() {
        var categoryModel = DispoModel();
        categoryModel.dispositivo = category['dispositivo'];
        _dispo.add(categoryModel);
      });
    });

    dispositivo = _dispo.map((e) => e.dispositivo.toString()).first;
    print(dispositivo);
  }

  List<UserModel> _usuarios = [];
  getUsuario() async {
    await getDispo();
    _usuarios = [];
    var data = await Sql().readUsuarioByDispositivo(context, dispositivo);
    if (data != null) {
      print(data);
      await DbHelper().eliminarUsuarios();
      await getLPI();

      final List result = jsonDecode(data);
      result.forEach((dataUser) {
        setState(() {
          var dataUsuario = UserModel();
          dataUsuario.pk_clave_usu = dataUser['pk_clave_usu'];
          dataUsuario.txt_usuario_usu = dataUser['txt_usuario_usu'];
          dataUsuario.txt_contrasena_usu =
              dataUser['txt_contrasena_usu'].toString();
          dataUsuario.txt_nombre_usu = dataUser['txt_nombre_usu'];
          dataUsuario.txt_email_usu = dataUser['txt_email_usu'];
          dataUsuario.num_activo_usu = dataUser['num_activo_usu'].toString();
          dataUsuario.fk_clave_rol = dataUser['fk_clave_rol'].toString();
          dataUsuario.fk_clave_emp = dataUser['fk_clave_emp'].toString();

          _usuarios.add(dataUsuario);

          try {
            DbHelper().saveUsuario(
                dataUsuario.pk_clave_usu,
                dataUsuario.txt_usuario_usu,
                dataUsuario.txt_contrasena_usu,
                dataUsuario.txt_nombre_usu,
                dataUsuario.txt_email_usu,
                dataUsuario.num_activo_usu,
                dataUsuario.fk_clave_rol,
                dataUsuario.fk_clave_emp,
                dispositivo);
            alertDialog(context, 'Usuarios descargados con Exito');
          } catch (e) {
            print(e);
            alertDialog(context, 'Error al descargar usuarios');
          }
        });
      });
    }
  }

  String obtenerMes() {
    final meses = [
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic'
    ];

    final fechaActual = DateTime.now();
    final mesActual = fechaActual.month;

    return meses[mesActual - 1];
  }

  getLPI() async {
    var data = await Sql().readLPIByMount(obtenerMes(), context);
    List result = jsonDecode(data);
    var anio;
    var mes;
    var canastaAlimentaria_rural;
    var canastaAlimentaria_urbano;
    var canastaNoAlimentaria_rural;
    var canastaNoAlimentaria_urbano;
    result.forEach((data) {
      anio = data['anio'];
      mes = data['mes'];
      canastaAlimentaria_rural = data['canastaAlimentaria_rural'];
      canastaAlimentaria_urbano = data['canastaAlimentaria_urbano'];
      canastaNoAlimentaria_rural = data['canastaNoAlimentaria_rural'];
      canastaNoAlimentaria_urbano = data['canastaNoAlimentaria_urbano'];
    });
    print(anio);
    print(mes);
    print(canastaAlimentaria_rural);
    print(canastaAlimentaria_urbano);
    print(canastaNoAlimentaria_rural);
    print(canastaNoAlimentaria_urbano);

    try {
      await DbHelper().eliminarLPI();
      await DbHelper().guardarLPI(
          anio,
          mes,
          canastaAlimentaria_rural,
          canastaAlimentaria_urbano,
          canastaNoAlimentaria_rural,
          canastaNoAlimentaria_urbano);
    } catch (e) {
      print(e);
    }
  }

  getComunidades() async {
    var data = await Sql().getComunidadesSQL(context);
    if (data != null) {
      await DbHelper().deleteComunidades();
      var pk_Comunidad;
      var orden_Comunidad;
      var comunidad;

      List result = jsonDecode(data);

      result.forEach((data) {
        pk_Comunidad = data['pk_Comunidad'];
        orden_Comunidad = data['orden_Comunidad'];
        comunidad = data['Comunidad'];
        print(comunidad);
        try {
          DbHelper()
              .updateComunidades(pk_Comunidad, orden_Comunidad, comunidad);
        } catch (e) {
          print(e);
        }
      });
    }
  }

  getGrupos() async {
    var data = await Sql().getGruposSQL(context);
    if (data != null) {
      await DbHelper().deleteGrupos();
      var claveGrupo;
      var orden_Grupo;
      var grupo;

      List result = jsonDecode(data);

      result.forEach((data) {
        claveGrupo = data['ClaveGrupo'];
        orden_Grupo = data['orden_Grupo'];
        grupo = data['Grupo'];

        try {
          DbHelper().updateGrupos(claveGrupo, orden_Grupo, grupo);
        } catch (e) {
          print(e);
        }
      });
    }
  }

  bool _mostrar = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROJIMONET V1.0.11'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLoginSignupHeader('LOGIN'),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('REGISTRA EL NOMBRE DEL DISPOSITIVO'),
                      TextButton(
                          onPressed: () {
                            _showAlert(context);
                          },
                          child: Text(
                            'REGISTRAR',
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: TextButton(
                    child: Text(
                      'DESCARGAR USUARIOS',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      getUsuario();
                      getComunidades();
                      getGrupos();
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                getTextFormField(
                    controller: _nombreUsuario,
                    icon: Icons.person,
                    hintName: 'NOMBRE DE USUARIO'),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [AlphaNumericInputFormatter()],
                    controller: _contrasenia,
                    obscureText: _mostrar,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor introduce la contraseña';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () => mostrarContrasena(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'CONTRASEÑA',
                      labelText: 'CONTRASEÑA',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: TextButton(
                    child: Text(
                      'INICIAR SESIÓN',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: login,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              content: getTextFormField(controller: _dispositivo),
              title: Text('Ingresa el Nombre del Dispositivo'),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    child: Text('Salir')),
                TextButton(
                    onPressed: guardarDispositivo, child: Text('Guardar'))
              ],
            ));
  }

  void mostrarContrasena() {
    if (_mostrar == true) {
      setState(() {
        _mostrar = false;
      });
    } else {
      setState(() {
        _mostrar = true;
      });
    }
  }
}
