class UserModel {
  int pk_clave_usu;
  String txt_usuario_usu;
  String txt_nombre_usu;
  String txt_email_usu;
  String num_activo_usu;
  String fk_clave_rol;
  String fk_clave_emp;
  String txt_contrasena_usu;
  String dispositivo;

  UserModel(
      {this.pk_clave_usu,
      this.txt_usuario_usu,
      this.txt_nombre_usu,
      this.txt_email_usu,
      this.num_activo_usu,
      this.fk_clave_rol,
      this.fk_clave_emp,
      this.txt_contrasena_usu,
      this.dispositivo});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'pk_clave_usu': pk_clave_usu,
      'nombreUsuario': txt_usuario_usu,
      'txt_nombre_usu': txt_nombre_usu,
      'txt_email_usu': txt_email_usu,
      'num_activo_usu': num_activo_usu,
      'fk_clave_rol': fk_clave_rol,
      'fk_clave_emp': fk_clave_emp,
      'txt_contrasena_usu': txt_contrasena_usu,
      'dispositivo': dispositivo,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    pk_clave_usu = map['pk_clave_usu'];
    txt_usuario_usu = map['txt_usuario_usu'];
    txt_nombre_usu = map['txt_nombre_usu'];
    txt_email_usu = map['txt_email_usu'];
    num_activo_usu = map['num_activo_usu'];
    fk_clave_rol = map['fk_clave_rol'];
    fk_clave_emp = map['fk_clave_emp'];
    txt_contrasena_usu = map['txt_contrasena_usu'];
    dispositivo = map['dispositivo'];
  }
}
