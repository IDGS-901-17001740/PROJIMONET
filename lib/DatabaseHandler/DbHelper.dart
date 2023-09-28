import 'package:esn/Model/AlimentacionModel.dart';
import 'package:esn/Model/AportacionSemanal.dart';
import 'package:esn/Model/ApoyoEnEspecieModel.dart';
import 'package:esn/Model/CaracteristicasCasa.dart';
import 'package:esn/Model/DispoModel.dart';
import 'package:esn/Model/EgresoSemanal.dart';
import 'package:esn/Model/EquipamientoModel.dart';
import 'package:esn/Model/EscolaridadSeguridadSocial.dart';
import 'package:esn/Model/EstadoCasaConstruccionModel.dart';
import 'package:esn/Model/EstructuraFamiliarModel.dart';
import 'package:esn/Model/FotoModel.dart';
import 'package:esn/Model/NombreAsentamiento.dart';
import 'package:esn/Model/PrestacionesLaboralesModel.dart';
import 'package:esn/Model/RemesasModel.dart';
import 'package:esn/Model/ResolucionBALModel.dart';
import 'package:esn/Model/ResolucionModel.dart';
import 'package:esn/Model/Salud_PertenenciaIndigenaTablaModel.dart';
import 'package:esn/Model/ServiciosModel.dart';
import 'package:esn/Model/UserModel.dart';
import 'package:esn/Screens/ApoyosEnEspecie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:esn/Model/DatosGeneralesModel.dart';

import '../Model/CodigoPostalModel.dart';
import '../Model/ComunidadesModel.dart';
import '../Model/DocumentosModel.dart';

class DbHelper {
  static Database _db;

  static const String DB_Name = 'esn.db';
  static const String Table_User = 'usuario';
  static const String Table_Data = 'datosGenerales';
  static const String Table_Servicios = 'servicios';
  static const String Table_DatosFamiliares = 'estructuraFamiliar';
  static const String Table_Escolaridad = 'escolaridadSeguridadSocial';
  static const String Table_Salud = 'saludPertenenciaIndigena';
  static const String Table_Vivienda = 'estadoDeLaCasaYConstruccion';
  static const String Table_Casa = 'caracteristicas_Casa';
  static const String Table_Equipamiento = 'equipamiento';
  static const String Table_aportacionSemanalIngresos =
      'aportacionSemanalIngresos';
  static const String Table_EgresoSemanalM = 'aportacionSemanalEgresos';
  static const String Table_ApoyoEspecie = 'apoyoEnEspecie';
  static const String Table_Remesas = 'remesas';
  static const String Table_Documentos = 'documentos';
  static const String Table_Alimentacion = 'alimentacion';
  static const String Table_Resolucion = 'resolucion';
  static const String Table_ResolucionBAL = 'resolucionBAL';
  static const String Table_Fotografia = 'fotografia';

  static const int Version = 3;

  static const String C_idUsuario = 'idUsuario';
  static const String C_NombreUsuario = 'nombreUsuario';
  static const String C_Nombre = 'nombre';
  static const String C_ApellidoP = 'apellidoP';
  static const String C_ApellidoM = 'apellidoM';
  static const String C_Rol = 'rol';
  static const String C_Password = 'contrasenia';

  static const String Table_Dispositivo = 'dispositivo';
  static const String C_Dispositivo = 'dispositivo';

  static const String C_FolioDisp = 'folioDisp';

  static const String C_Folio = 'folio';
  static const String C_FechaCaptura = 'fechaCaptura';
  static const String C_Calle = 'calle';
  static const String C_EntreCalles = 'entreCalles';
  static const String C_ClaveGrupo = 'claveGrupo';
  static const String C_Grupo = 'grupo';
  static const String C_NoExt = 'noExt';
  static const String C_NoInt = 'noInt';
  static const String C_Fecha = 'fecha';
  static const String C_Localidad = 'localidad';
  static const String C_Telefono = 'telefono';
  static const String C_CP = 'claveCodigoPostal';
  static const String C_ClaveEstado = 'claveEstado';
  static const String C_Estado = 'estado';
  static const String C_ClaveComunidad = 'claveComunidad';
  static const String C_NombreComunidad = 'nombreComunidad';

  static const String C_ClaveMunicipio = 'claveMunicipio';
  static const String C_Municipio = 'municipio';

  static const String C_ClaveTipoAsentamiento = 'claveTipoAsentamiento';
  static const String C_OrdenTipoAsentamiento = 'ordenTipoAsentamiento';
  static const String C_TipoAsentamiento = 'tipoAsentamiento';

  static const String C_ClaveAsentamiento = 'claveAsentamiento';
  static const String C_NombreAsentamiento = 'nombreAsentamiento';

  static const String C_ClaveTipoVialidad = 'claveTipoVialidad';
  static const String C_OrdenTipoVialidad = 'ordenTipoVialidad';
  static const String C_TipoVialidad = 'tipoVialidad';

  //Tabla Servicios
  static const String C_pk_bano = 'pk_bano';
  static const String C_int_orden_bano = 'int_orden_bano';
  static const String C_txt_desc_bano = 'txt_desc_bano';
  static const String C_ClaveServAgua = 'claveServAgua';
  static const String C_OrdenServAgua = 'ordenServAgua';
  static const String C_ServAgua = 'servAgua';
  static const String C_ClaveServGas = 'claveServGas';
  static const String C_OrdenServGas = 'ordenServGas';
  static const String C_ServGas = 'servGas';
  static const String C_ClaveServLuz = 'claveServLuz';
  static const String C_OrdenServLuz = 'ordenServLuz';
  static const String C_ServLuz = 'servLuz';
  static const String C_ClaveServSanitario = 'claveServSanitario';
  static const String C_OrdenServSanitario = 'ordenServSanitario';
  static const String C_ServSanitario = 'servSanitario';

  //Tabla estructura Familiar
  static const String C_Nombres = 'nombre';
  static const String C_PrimerApellido = 'primerApellido';
  static const String C_SegundoApellido = 'segundoApellido';
  static const String C_ClaveSexo = 'claveSexo';
  static const String C_OrdenSexo = 'ordenSexo';
  static const String C_Sexo = 'sexo';
  static const String C_FechaNacimiento = 'fechaNacimiento';
  static const String C_ClaveEntidad = 'claveEntidad';
  static const String C_EntidadNacimiento = 'entidadNacimiento';
  static const String C_ClaveEstadoCivil = 'claveEstadoCivil';
  static const String C_OrdenEstadoCivil = 'ordenEstadoCivil';
  static const String C_EstadoCivil = 'estadoCivil';
  static const String C_ClaveParentesco = 'claveParentesco';
  static const String C_OrdenParentesco = 'OrdenParentesco';
  static const String C_Parentesco = 'parentesco';
  static const String C_IngresoSemanal = 'ingresoSemanal';
  static const String C_IngresoMensual = 'ingresoMensual';

  //Tabla escolaridad seguridad social
  static const String C_ClaveEscolaridad = 'ClaveEscolaridad';
  static const String C_OrdenEscolaridad = 'OrdenEscolaridad';
  static const String C_Escolaridad = 'Escolaridad';
  static const String C_ClaveGradoEscolar = 'ClaveGradoEscolar';
  static const String C_GradoEscolar = 'GradoEscolar';
  static const String C_ClaveAsisteEscuela = 'ClaveAsisteEscuela';
  static const String C_OrdenAsisteEscuela = 'OrdenAsisteEscuela';
  static const String C_AsisteEscuela = 'AsisteEscuela';
  static const String C_ClaveOcupacion = 'ClaveOcupacion';
  static const String C_OrdenOcupacion = 'OrdenOcupacion';
  static const String C_Ocupacion = 'Ocupacion';
  static const String C_ClaveTipoEmpleo = 'ClaveTipoEmpleo';
  static const String C_OrdenTipoEmpleo = 'OrdenTipoEmpleo';
  static const String C_TipoEmpleo = 'TipoEmpleo';
  static const String C_pk_prestacioneslab = 'pk_prestacioneslab';
  static const String C_int_OrdenPrestacionesLab = 'int_OrdenPrestacionesLab';
  static const String C_txt_desc_prestacioneslab = 'txt_desc_prestacioneslab';
  static const String C_ClaveJubilacion = 'ClaveJubilacion';
  static const String C_OrdenJubilacion = 'OrdenJubilacion';
  static const String C_Jubilacion = 'Jubilacion';

  static const String C_ClaveDerechohabiencia = 'ClaveDerechohabiencia';
  static const String C_OrdenDerechohabiencia = 'OrdenDerechohabiencia';
  static const String C_Derechohabiencia = 'Derechohabiencia';
  static const String C_ClaveMotivoDerechohabiencia =
      'ClaveMotivoDerechohabiencia';
  static const String C_OrdenMotivoDerechohabiencia =
      'OrdenMotivoDerechohabiencia';
  static const String C_MotivoDerechohabiencia = 'MotivoDerechohabiencia';

  //Tabla Salud_Pertenencia Indigena
  //Capacidades Diferentes
  static const String C_ClaveCapacidadDiferente = 'ClaveCapacidadDiferente';
  static const String C_OrdenCapacidadDiferente = 'OrdenCapacidadDiferente';
  static const String C_CapacidadDiferente = 'CapacidadDiferente';
  //Adicciones
  static const String C_ClaveAdiccion = 'ClaveAdiccion';
  static const String C_OrdenAdiccion = 'OrdenAdiccion';
  static const String C_Adiccion = 'Adiccion';
  //Peso, Talla, IMC
  static const String C_peso = 'peso';
  static const String C_talla = 'talla';
  static const String C_imc = 'imc';
  //Condiciones de salud
  static const String C_ClaveCondicionesSalud = 'ClaveCondicionesSalud';
  static const String C_OrdenCondicionesSalud = 'OrdenCondicionesSalud';
  static const String C_CondicionesSalud = 'CondicionesSalud';
  //Clasificación Condición de salud
  static const String C_ClaveClasCondicionesSalud = 'ClaveClasCondicionesSalud';
  static const String C_OrdenClasCondicionesSalud = 'OrdenClasCondicionesSalud';
  static const String C_ClasCondicionesSalud = 'ClasCondicionesSalud';
  //Ponderación
  static const String C_ponderacion = 'ponderacion';
  //Foto
  static const String C_fileFoto = 'fileFoto';
  //Pueblo indigena
  static const String C_ClaveEtniaIndigena = 'ClaveEtniaIndigena';
  static const String C_OrdenEtniaIndigena = 'OrdenEtniaIndigena';
  static const String C_EtniaIndigena = 'EtniaIndigena';

  //Tabla Estado de la casa y construcion
  static const String C_ClaveTipoVivienda = 'ClaveTipoVivienda';
  static const String C_OrdenTipoVivienda = 'OrdenTipoVivienda';
  static const String C_TipoVivienda = 'TipoVivienda';
  static const String C_ClaveTipoPiso = 'ClaveTipoPiso';
  static const String C_OrdenTipoPiso = 'OrdenTipoPiso';
  static const String C_TipoPiso = 'TipoPiso';
  static const String C_ClaveTenencia = 'ClaveTenencia';
  static const String C_OrdenTenencia = 'OrdenTenencia';
  static const String C_Tenencia = 'Tenencia';
  static const String C_ClaveTecho = 'ClaveTecho';
  static const String C_OrdenTecho = 'OrdenTecho';
  static const String C_Techo = 'Techo';
  static const String C_ClaveTipoMuro = 'ClaveTipoMuro';
  static const String C_OrdenTipoMuro = 'OrdenTipoMuro';
  static const String C_TipoMuro = 'TipoMuro';

  //Tabla Estado de la casa y construcion
  static const String C_numCuartos = 'numCuartos';
  static const String C_cuartosDormir = 'cuartosDormir';
  static const String C_cocinaSeparada = 'cocinaSeparada';
  static const String C_cuartoBanioExclusivo = 'cuartoBanioExclusivo';

  //Tabla Equipamiento
  static const String C_pk_equipamientosRefri = 'pk_equipamientosRefri';
  static const String C_txt_desc_equipamientosRefri =
      'txt_desc_equipamientosRefri';
  static const String C_tieneRefri = 'tieneRefri';
  static const String C_sirveRefri = 'sirveRefri';
  static const String C_pk_equipamientosEstufa = 'pk_equipamientosEstufa';
  static const String C_txt_desc_equipamientosEstufa =
      'txt_desc_equipamientosEstufa';
  static const String C_tieneEstufa = 'tieneEstufa';
  static const String C_sirveEstufa = 'sirveEstufa';
  static const String C_pk_equipamientosVideoDVDBlueRay =
      'pk_equipamientosVideoDVDBlueRay';
  static const String C_txt_desc_equipamientosVideoDVDBlueRay =
      'txt_desc_equipamientosVideoDVDBlueRay';
  static const String C_tieneVideoDVDBlueRay = 'tieneVideoDVDBlueRay';
  static const String C_sirveVideoDVDBlueRay = 'sirveVideoDVDBlueRay';
  static const String C_pk_equipamientosLavadora = 'pk_equipamientosLavadora';
  static const String C_txt_desc_equipamientosLavadora =
      'txt_desc_equipamientosLavadora';
  static const String C_tieneLavadora = 'tieneLavadora';
  static const String C_sirveLavadora = 'sirveLavadora';
  static const String C_pk_equipamientosLicuadora = 'pk_equipamientosLicuadora';
  static const String C_txt_desc_equipamientosLicuadora =
      'txt_desc_equipamientosLicuadora';
  static const String C_tieneLicuadora = 'tieneLicuadora';
  static const String C_sirveLicuadora = 'sirveLicuadora';
  static const String C_pk_equipamientosTelevision =
      'pk_equipamientosTelevision';
  static const String C_txt_desc_equipamientosTelevision =
      'txt_desc_equipamientosTelevision';
  static const String C_tieneTelevision = 'tieneTelevision';
  static const String C_sirveTelevision = 'sirveTelevision';
  static const String C_pk_equipamientosRadio = 'pk_equipamientosRadio';
  static const String C_txt_desc_equipamientosRadio =
      'txt_desc_equipamientosRadio';
  static const String C_tieneRadio = 'tieneRadio';
  static const String C_sirveRadio = 'sirveRadio';
  static const String C_pk_equipamientosSala = 'pk_equipamientosSala';
  static const String C_txt_desc_equipamientosSala =
      'txt_desc_equipamientosSala';
  static const String C_tieneSala = 'tieneSala';
  static const String C_sirveSala = 'sirveSala';
  static const String C_pk_equipamientosComedor = 'pk_equipamientosComedor';
  static const String C_txt_desc_equipamientosComedor =
      'txt_desc_equipamientosComedor';
  static const String C_tieneComedor = 'tieneComedor';
  static const String C_sirveComedor = 'sirveComedor';
  static const String C_pk_equipamientosAutoMovil = 'pk_equipamientosAutoMovil';
  static const String C_txt_desc_equipamientosAutoMovil =
      'txt_desc_equipamientosAutoMovil';
  static const String C_tieneAutoMovil = 'tieneAutoMovil';
  static const String C_sirveAutoMovil = 'sirveAutoMovil';
  static const String C_pk_equipamientosCama = 'pk_equipamientosCama';
  static const String C_txt_desc_equipamientosCama =
      'txt_desc_equipamientosCama';
  static const String C_tieneCama = 'tieneCama';
  static const String C_sirveCama = 'sirveCama';
  static const String C_pk_equipamientosCelular = 'pk_equipamientosCelular';
  static const String C_txt_desc_equipamientosCelular =
      'txt_desc_equipamientosCelular';
  static const String C_tieneCelular = 'tieneCelular';
  static const String C_sirveCelular = 'sirveCelular';
  static const String C_pk_equipamientosMotocicleta =
      'pk_equipamientosMotocicleta';
  static const String C_txt_desc_equipamientosMotocicleta =
      'txt_desc_equipamientosMotocicleta';
  static const String C_tieneMotocicleta = 'tieneMotocicleta';
  static const String C_sirveMotocicleta = 'sirveMotocicleta';
  static const String C_pk_equipamientosComputadora =
      'pk_equipamientosComputadora';
  static const String C_txt_desc_equipamientosComputadora =
      'txt_desc_equipamientosComputadora';
  static const String C_tieneComputadora = 'tieneComputadora';
  static const String C_sirveComputadora = 'sirveComputadora';
  static const String C_pk_equipamientosHorno = 'pk_equipamientosHorno';
  static const String C_txt_desc_equipamientosHorno =
      'txt_desc_equipamientosHorno';
  static const String C_tieneHorno = 'tieneHorno';
  static const String C_sirveHorno = 'sirveHorno';
  static const String C_pk_equipamientosTelefono = 'pk_equipamientosTelefono';
  static const String C_txt_desc_equipamientosTelefono =
      'txt_desc_equipamientosTelefono';
  static const String C_tieneTelefono = 'tieneTelefono';
  static const String C_sirveTelefono = 'sirveTelefono';
  static const String C_CondicionesGenerales = 'CondicionesGenerales';

  //Tabla Aportacion Semanal
  static const String C_padre = 'padre';
  static const String C_madre = 'madre';
  static const String C_hijos = 'hijos';
  static const String C_prospera = 'prospera';
  static const String C_adultosMayoresProspera = 'adultosMayoresProspera';
  static const String C_becas = 'becas';
  static const String C_otros = 'otros';
  static const String C_pension = 'pension';
  static const String C_totalSemanal = 'totalSemanal';
  static const String C_totalMensual = 'totalMensual';

  //Tabla EgresoSemanalM
  static const String C_vivienda = 'vivienda';
  static const String C_alimentacion = 'alimentacion';
  static const String C_luz = 'luz';
  static const String C_gas = 'gas';
  static const String C_agua = 'agua';
  static const String C_telefono = 'telefono';
  static const String C_transporte = 'transporte';
  static const String C_atencionMedica = 'atencionMedica';
  static const String C_otrosGastos = 'otrosGastos';
  static const String C_celular = 'celular';
  static const String C_educacion = 'educacion';
  static const String C_EtotalSemanal = 'totalSemanal';
  static const String C_EtotalMensual = 'totalMensual';

  //Tabla Apoyo en especie
  static const String C_tipoApoyo = 'tipoApoyo';
  static const String C_quienProporciona = 'quienProporciona';
  static const String C_frecuenciaApoyo = 'frecuenciaApoyo';

  //Tabla Remesas
  static const String C_dineroOtrosPaises = 'dineroOtrosPaises';
  static const String C_ClaveFrecuencia = 'claveFrecuenciaApoyo';
  static const String C_OrdenFrecuencia = 'ordenFrecuenciaApoyo';
  static const String C_frecuencia = 'frecuencia';

  //Tabla Documentos
  static const String C_curp = 'curp';
  static const String C_actaNacimiento = 'actaNacimiento';
  static const String C_comprobanteDomicilio = 'comprobanteDomicilio';
  static const String C_ine = 'ine';

  //Tabla Alimentacion
  static const String C_pregunta1 = 'pregunta1';
  static const String C_pregunta2 = 'pregunta2';
  static const String C_pregunta3 = 'pregunta3';
  static const String C_pregunta4 = 'pregunta4';
  static const String C_pregunta5 = 'pregunta5';
  static const String C_pregunta6 = 'pregunta6';
  static const String C_pregunta7 = 'pregunta7';
  static const String C_pregunta8 = 'pregunta8';
  static const String C_pregunta9 = 'pregunta9';
  static const String C_pregunta10 = 'pregunta10';
  static const String C_pregunta11 = 'pregunta11';
  static const String C_pregunta12 = 'pregunta12';

  //Tabla Resolucion
  static const String C_puntaje = 'puntaje';
  static const String C_escalaNecesidad = 'escalaNecesidad';
  static const String C_inseguridadAlimenticia = 'inseguridadAlimenticia';
  static const String C_clasificacionPobresa = 'clasificacionPobresa';

//Tabla ResolucionBAL
  static const String C_tipo = 'tipo';
  static const String C_frecuenciaR = 'frecuencia';
  static const String C_duracion = 'duracion';
  static const String C_otorgarApoyo = 'otorgarApoyo';
  static const String C_observaciones = 'observaciones';

  // Tabla fotografia
  static const String C_FileFoto = 'fileFoto';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getExternalStorageDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {}

  readData(table) async {
    var connection = await db;
    return await connection.query(table);
  }

  readFrecuencia(frecuencia) async {
    var conn = await db;
    return await conn.rawQuery(
        "SELECT * FROM tb_Frecuencias WHERE Frecuencia = '$frecuencia'");
  }

  readCp() async {
    var connection = await db;
    return await connection.rawQuery("SELECT DISTINCT ClaveCP FROM tb_CPs");
  }

  readProporcionado() async {
    var connection = await db;
    return await connection
        .rawQuery("SELECT DISTINCT ProporcionadoPor FROM tb_ApoyosGobMx;");
  }

  readOrdenTipoAsenta(String Asienta) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden FROM tb_TiposAsentamiento where tipoAsentamiento like '${Asienta}'");
  }

  readOrdenTipoVialidad(String Vialidad) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_TiposVialidad where TipoVialidad like '${Vialidad}'");
  }

  readParentesco() async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Parentesco FROM tb_Parentescos WHERE Orden <> 0 ORDER BY ABS(Orden)");
  }

  readVersion() async {
    var connection = await db;
    return await connection.rawQuery("SELECT versionApp FROM versionApp");
  }

  readPKPrestacionesLaborales(String prestacion) async {
    var connection = await db;
    return await connection.rawQuery(
        "select Pk_PrestacionesLaborales from tb_PrestacionesLaborales where txt_desc_prestacioneslab like '%${prestacion}%'");
  }

  readOrdenPrestacionesLaborales(String prestacion) async {
    var connection = await db;
    return await connection.rawQuery(
        "select Orden_PrestacionesLaborales from tb_PrestacionesLaborales where txt_desc_prestacioneslab like '%${prestacion}%'");
  }

  readTipoZona(int folio) async {
    var connection = await db;
    return await connection.rawQuery(
        "Select TipoZona from  tb_CPs where ClaveCP = (select claveCodigoPostal from datosGenerales where folio = ${folio}) and Asentamiento like  (select nombreAsentamiento from datosGenerales where folio = ${folio})");
  }

  readIngresoF(int folio) async {
    var connection = await db;
    return await connection.rawQuery(
        "select totalMensual from aportacionSemanalIngresos where folio = ${folio};");
  }

  readOrdenCodicionesSlud(String condicion) async {
    var connection = await db;
    return await connection.rawQuery(
        "select Orden from tb_CondicionesSalud where CondicionesSalud like '%${condicion}%'");
  }

  readPonderacionCondicionesSalud(String condicion) async {
    var connection = await db;
    return await connection.rawQuery(
        "select Ponderacion from tb_CondicionesSalud where CondicionesSalud like '%${condicion}%'");
  }

  readOrdenClasCodicionesSlud(String condicion) async {
    var connection = await db;
    return await connection.rawQuery(
        "select OrdenClasCondicionesSalud from tb_ClasCondicionesSalud where ClasCondicionesSalud like '%${condicion}%'");
  }

  readClaveClasCondicionesSalud(String condicion) async {
    var connection = await db;
    return await connection.rawQuery(
        "select ClaveClasCondicionesSalud from tb_ClasCondicionesSalud where ClasCondicionesSalud like '%${condicion}%'");
  }

  readOrdenEstado(String Estado) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_Estados where Estado like '${Estado}'");
  }

  readClaveApoyo(String Apoyo) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT ClaveApoyo  FROM tb_ApoyosGobMx where Apoyo like '${Apoyo}'");
  }

  readOrdenFrecuencia(String Frecuencia) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT OrdenFrecuencia  FROM tb_FrecuenciasApoyos where Frecuencia like '${Frecuencia}'");
  }

  readClaveFreciencia(String Frecuencia) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT ClaveFrecuencia  FROM tb_FrecuenciasApoyos where Frecuencia like '${Frecuencia}'");
  }

  readOrdenApoyo(String Apoyo) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT OrdenApoyo  FROM tb_ApoyosGobMx where Apoyo like '${Apoyo}'");
  }

  readOrdenEstadosCivil(String Civil) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_EstadosCiviles where EstadoCivil like '${Civil}'");
  }

  readOrdenParentesco(String Parentesco) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_Parentescos where Parentesco like '${Parentesco}'");
  }

  readOrdenEscolaridad(String escolar) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_Escolaridades where Escolaridad like '${escolar}'");
  }

  readEscolaridad(int id) async {
    var connection = await db;
    return await connection.rawQuery(
        "select ClaveEscolaridad, Derechohabiencia, int_OrdenPrestacionesLab from escolaridadSeguridadSocial where folio = $id;");
  }

  readEdad(int id) async {
    var connection = await db;
    return await connection.rawQuery(
        "select fechaNacimiento from estructuraFamiliar where folio =  ${id};");
  }

  readAlimentacionQ(int id) async {
    var connection = await db;
    return await connection.rawQuery(
        "select pregunta2, pregunta4, pregunta6 from alimentacion where folio =  ${id};");
  }

  readInfraestructura_Vivienda(int id) async {
    var connection = await db;
    return await connection.rawQuery(
        "select ClaveTipoPiso, ClaveTecho, ClaveTipoMuro ,ClaveTenencia from estadoDeLaCasaYConstruccion where folio =  ${id};");
  }

  readServices(int id) async {
    var connection = await db;
    return await connection.rawQuery(
        "select pk_bano, claveServLuz, claveServAgua, claveServSanitario, claveServGas from servicios where folio =  ${id};");
  }

  readOrdenGrado(String grado) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_GradosEscolares where GradoEscolar like '${grado}'");
  }

  readOrdenOcupacion(String ocupacion) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_Ocupaciones where Ocupacion like '${ocupacion}'");
  }

  readOrdenTipoEmpleo(String tipoEmple) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_TipoEmpleos where TipoEmpleo like '${tipoEmple}'");
  }

  readOrdenDerechoA(String derecho) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_Derechohabiencias where Derechohabiencia like '${derecho}'");
  }

  readOrdenMotivoDerecho(String motivoDere) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_MotivoDerechohabiencias where MotivoDerechohabiencia like '${motivoDere}'");
  }

  readOrdenCapacidadesDif(String Capacidades) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_CapacidadesDiferentes where CapacidadDiferente like '${Capacidades}'");
  }

  readOrdenAdicciones(String Adicciones) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_Adicciones where Adiccion like '${Adicciones}'");
  }

  readOrdenPuebloIndigena(String Pueblo) async {
    var connection = await db;
    Pueblo = Pueblo.replaceAll("'", "''");
    print(Pueblo);
    print(
        "SELECT Orden FROM tb_EtniasIndigenas where EtniaIndigena = '$Pueblo'");
    return await connection.rawQuery(
        "SELECT Orden FROM tb_EtniasIndigenas where EtniaIndigena = '$Pueblo'");
  }

  readOrdenCasa(String casa) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_TipoVivienda where TipoVivienda like '${casa}'");
  }

  readOrdenPiso(String piso) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_TipoPisos where TipoPiso like '${piso}'");
  }

  readOrdenTenencia(String tenencia) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_Tenencias where Tenencia like '${tenencia}'");
  }

  readOrdenTecho(String techo) async {
    var connection = await db;
    return await connection
        .rawQuery("SELECT Orden  FROM tb_Techos where Techo like '${techo}'");
  }

  readOrdenMuros(String muros) async {
    var connection = await db;
    return await connection.rawQuery(
        "SELECT Orden  FROM tb_TiposMuro where TipoMuro like '${muros}'");
  }

  readFolio(table) async {
    var connection = await db;
    return await connection.query(table,
        where: "folio = (select max(folio) from datosGenerales)");
  }

  readDatosGeenerales(table, int folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = ${folio}");
  }

  readFecha(int folio) async {
    var connection = await db;
    return await connection
        .rawQuery("select fecha from datosGenerales where folio = $folio;");
  }

  readConSlud(int folio) async {
    var connection = await db;
    return await connection.rawQuery(
        "select ClaveCondicionesSalud from saludPertenenciaIndigena where folio = $folio;");
  }

  readServicioBanio(table, int folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = ${folio}");
  }

  readEstructura1(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) from estructuraFamiliar where folio = ${folio})");
  }

  readEstructura2(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 1 from estructuraFamiliar where folio = ${folio})");
  }

  readEstructura3(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 2 from estructuraFamiliar where folio = ${folio})");
  }

  readEstructura4(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 3 from estructuraFamiliar where folio = ${folio})");
  }

  readEstructura5(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 4 from estructuraFamiliar where folio = ${folio})");
  }

  readEstructura6(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 5 from estructuraFamiliar where folio = ${folio})");
  }

  readEstructura7(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 6 from estructuraFamiliar where folio = ${folio})");
  }

  readEstructura8(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 7 from estructuraFamiliar where folio = ${folio})");
  }

  readEstructura9(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 8 from estructuraFamiliar where folio = ${folio})");
  }

  readEstructura10(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 9 from estructuraFamiliar where folio = ${folio})");
  }

  readEscolaridad1(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) from escolaridadSeguridadSocial where folio = ${folio})");
  }

  readEscolaridad2(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 1 from escolaridadSeguridadSocial where folio = ${folio})");
  }

  readEscolaridad3(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 2 from escolaridadSeguridadSocial where folio = ${folio})");
  }

  readEscolaridad4(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 3 from escolaridadSeguridadSocial where folio = ${folio})");
  }

  readEscolaridad5(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 4 from escolaridadSeguridadSocial where folio = ${folio})");
  }

  readEscolaridad6(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 5 from escolaridadSeguridadSocial where folio = ${folio})");
  }

  readEscolaridad7(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 6 from escolaridadSeguridadSocial where folio = ${folio})");
  }

  readEscolaridad8(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 7 from escolaridadSeguridadSocial where folio = ${folio})");
  }

  readEscolaridad9(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 8 from escolaridadSeguridadSocial where folio = ${folio})");
  }

  readEscolaridad10(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 9 from escolaridadSeguridadSocial where folio = ${folio})");
  }

  readCodigoPostal(table, CodigoPostalModel codigoPostalModel) async {
    var connection = await db;
    return await connection.query(table,
        where: "ClaveCP = ${codigoPostalModel.ClaveCP} ");
  }

  readEquipamiento(table, folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = '${folio}' ");
  }

  readAportaciones(table, folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = '${folio}' ");
  }

  readEgresos(table, folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = '${folio}' ");
  }

  readApoyoEspecie(table, folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = '${folio}' ");
  }

  readRemesas(table, folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = '${folio}' ");
  }

  readDocumentos(table, folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = '${folio}' ");
  }

  readAlimentacion(table, folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = '${folio}' ");
  }

  readResolucion(table, folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = '${folio}' ");
  }

  readResolucionBal(table, folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = '${folio}' ");
  }

  readCasa(table, folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = '${folio}' ");
  }

  readEstadoCasa(table, folio) async {
    var connection = await db;
    return await connection.query(table, where: "folio = '${folio}' ");
  }

  Future<int> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_User, user.toMap());
    return res;
  }

  Future<int> saveDatosGenerales(DatosGeneralesModel datosGenerales) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Data, datosGenerales.toMap());
    return res;
  }

  Future<int> saveEscolaridadSocial(
      EscolaridadSeguridadSocial escolaridadSeguridadSocial) async {
    var dbClient = await db;
    var res = await dbClient.insert(
        Table_Escolaridad, escolaridadSeguridadSocial.toMap());
    return res;
  }

  Future<int> saveVivienda(
      EstadoCasaConstruccionModel estadoCasaConstruccionModel) async {
    var dbClient = await db;
    var res = await dbClient.insert(
        Table_Vivienda, estadoCasaConstruccionModel.toMap());
    return res;
  }

  Future<int> saveCasa(CaracteristicasCasa caracteristicasCasa) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Casa, caracteristicasCasa.toMap());
    return res;
  }

  Future<int> saveSalud(
      Salud_PertenenciaIndigenenaTablaModel indigenenaTablaModel) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Salud, indigenenaTablaModel.toMap());
    return res;
  }

  Future<int> saveEquipamiento(EquipamientoMovil equipamientoMovil) async {
    var dbClient = await db;
    var res =
        await dbClient.insert(Table_Equipamiento, equipamientoMovil.toMap());
    return res;
  }

  Future<int> saveApoyoSemanal(AportacionSemanal aportacionSemanal) async {
    var dbClient = await db;
    var res = await dbClient.insert(
        Table_aportacionSemanalIngresos, aportacionSemanal.toMap());
    return res;
  }

  Future<int> saveEgresoSemanal(EgresoSemanal egresoSemanal) async {
    var dbClient = await db;
    var res =
        await dbClient.insert(Table_EgresoSemanalM, egresoSemanal.toMap());
    return res;
  }

  Future<int> saveApoyoEnEspecie(ApoyoEnEspecieModel apoyosEnEspecie) async {
    var dbClient = await db;
    var res =
        await dbClient.insert(Table_ApoyoEspecie, apoyosEnEspecie.toMap());
    return res;
  }

  Future<int> saveRemesas(RemesasModel remesasModel) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Remesas, remesasModel.toMap());
    return res;
  }

  Future<int> saveDocumentos(DocumentosModel documentosModel) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Documentos, documentosModel.toMap());
    return res;
  }

  Future<int> saveAlimentacion(AlimentacionModel alimentacionModel) async {
    var dbClient = await db;
    var res =
        await dbClient.insert(Table_Alimentacion, alimentacionModel.toMap());
    return res;
  }

  Future<int> saveResolucion(ResolucionModel resolucionModel) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Resolucion, resolucionModel.toMap());
    return res;
  }

  Future<int> saveResolucionBAL(ResolucionBALModel resolucionBALModel) async {
    var dbClient = await db;
    var res =
        await dbClient.insert(Table_ResolucionBAL, resolucionBALModel.toMap());
    return res;
  }

///////////////////////////////////////////////////////////////////////////////////
  Future<int> saveDispo(DispoModel dispoModel) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Dispositivo, dispoModel.toMap());
    return res;
  }

  readDispo(table) async {
    var connection = await db;
    return await connection.query(table);
  }
  /////////////////////////////////////
  
  

  Future<UserModel> getLoginUser(String userId, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM tb_usuarios WHERE "
        "txt_usuario_usu = '$userId' AND "
        "txt_contrasena_usu = '$password'");

    if (res.length > 0) {
      
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  Future<int> upDateDatosGenerales(
      DatosGeneralesModel datosGeneralesModel) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_Data, datosGeneralesModel.toMap(),
        where: "folio = ${datosGeneralesModel.folio}");
    return res;
  }

  eliminarEstructura(folio, dispositivo) async {
    var dbClient = await db;
    var res = await dbClient
        .rawQuery("DELETE FROM estructuraFamiliar WHERE folio = $folio");
    print('Se elimino');
    return res;
  }

  eliminarEscolaridad(folio, dispositivo) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery(
        "DELETE FROM escolaridadSeguridadSocial WHERE folio = $folio AND dispositivo = '$dispositivo'");
    return res;
  }

  eliminarSalud(folio, dispositivo) async {
    var dbClient = await db;
    try {
      var res = await dbClient.rawQuery(
          "DELETE FROM saludPertenenciaIndigena WHERE folio = $folio AND dispositivo = '$dispositivo'");
      print('Se elimino');
      print(res);
      return res;
    } catch (e) {
      print(e);
    }
  }

  Future<int> upDateEquipamiento(EquipamientoMovil equipamientoMovil) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Equipamiento, equipamientoMovil.toMap(),
        where: "folio = ${equipamientoMovil.folio} ");
    return res;
  }

  Future<int> upDateApoyo(AportacionSemanal aportacionSemanal) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_aportacionSemanalIngresos, aportacionSemanal.toMap(),
        where: "folio = ${aportacionSemanal.folio}");
    return res;
  }

  Future<int> upDateEgreso(EgresoSemanal egresoSemanal) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_EgresoSemanalM, egresoSemanal.toMap(),
        where: "folio = ${egresoSemanal.folio} ");
    return res;
  }

  Future<int> upDateApoyoEspecie(
      ApoyoEnEspecieModel apoyoEnEspecieModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_ApoyoEspecie, apoyoEnEspecieModel.toMap(),
        where: "folio = ${apoyoEnEspecieModel.folio} ");
    return res;
  }

  Future<int> upDateRemesas(RemesasModel remesasModel) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_Remesas, remesasModel.toMap(),
        where: "folio = ${remesasModel.folio} ");
    return res;
  }

  Future<int> upDateDocumentos(DocumentosModel documentosModel) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_Documentos, documentosModel.toMap(),
        where: "folio = ${documentosModel.folio} ");
    return res;
  }

  Future<int> upDateAlimentacion(AlimentacionModel alimentacionModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Alimentacion, alimentacionModel.toMap(),
        where: "folio = ${alimentacionModel.folio} ");
    return res;
  }

  Future<int> upDateResolucion(ResolucionModel resolucionModel) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_Resolucion, resolucionModel.toMap(),
        where: "folio = ${resolucionModel.folio} ");
    return res;
  }

  Future<int> upDateResolucionBAL(ResolucionBALModel resolucionBALModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_ResolucionBAL, resolucionBALModel.toMap(),
        where: "folio = ${resolucionBALModel.folio} ");
    return res;
  }

  Future<int> upDateFoto(FotoModel fotoModel) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_Fotografia, fotoModel.toMap(),
        where: "folio = ${fotoModel.folio} ");
    return res;
  }

  Future<int> upDateCasa(CaracteristicasCasa caracteristicasCasa) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_Casa, caracteristicasCasa.toMap(),
        where: "folio = ${caracteristicasCasa.folio} ");
    return res;
  }

  Future<int> upDateVivienda(
      EstadoCasaConstruccionModel casaConstruccionModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Vivienda, casaConstruccionModel.toMap(),
        where: "folio = ${casaConstruccionModel.folio} ");
    return res;
  }

  Future<int> saveEstructuraFamiliar(
      EstructuraFamilarModel estructuraFamilar) async {
    var dbClient = await db;
    var res =
        await dbClient.insert(Table_DatosFamiliares, estructuraFamilar.toMap());
    return res;
  }

  Future<int> saveFoto(FotoModel fotoModel) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Fotografia, fotoModel.toMap());
    return res;
  }

  Future<List<DatosGeneralesModel>> datos() async {
    var dbClient = await db;

    final List<Map<String, dynamic>> datosMap = await dbClient
        .rawQuery('SELECT * FROM datosGenerales WHERE Estatus = 0');

    return List.generate(datosMap.length, (i) {
      return DatosGeneralesModel(
          folio: datosMap[i]['folio'],
          fecha: datosMap[i]['fecha'],
          folioDisp: datosMap[i]['folioDisp'],
          incompleto: datosMap[i]['incompleto']);
    });
  }

  readSaludPertenencia(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) from saludPertenenciaIndigena where folio = ${folio})");
  }

  readSaludPertenencia2(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 1 from saludPertenenciaIndigena where folio = ${folio})");
  }

  readSaludPertenencia3(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) +2 from saludPertenenciaIndigena where folio = ${folio})");
  }

  readSaludPertenencia4(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 3 from saludPertenenciaIndigena where folio = ${folio})");
  }

  readSaludPertenencia5(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 4 from saludPertenenciaIndigena where folio = ${folio})");
  }

  readSaludPertenencia6(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 5 from saludPertenenciaIndigena where folio = ${folio})");
  }

  readSaludPertenencia7(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 6 from saludPertenenciaIndigena where folio = ${folio})");
  }

  readSaludPertenencia8(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 7 from saludPertenenciaIndigena where folio = ${folio})");
  }

  readSaludPertenencia9(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 8 from saludPertenenciaIndigena where folio = ${folio})");
  }

  readSaludPertenencia10(table, int folio) async {
    var connection = await db;
    return await connection.query(table,
        where:
            "folio = ${folio} and ROWID = (select min(ROWID) + 9 from saludPertenenciaIndigena where folio = ${folio})");
  }

  Future<int> upDateSalud1(
      Salud_PertenenciaIndigenenaTablaModel
          salud_pertenenciaIndigenenaTablaModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Salud, salud_pertenenciaIndigenenaTablaModel.toMap(),
        where:
            "folio = ${salud_pertenenciaIndigenenaTablaModel.folio} and ROWID = (select min(ROWID) from saludPertenenciaIndigena where folio = ${salud_pertenenciaIndigenenaTablaModel.folio})");
    return res;
  }

  Future<int> upDateSalud2(
      Salud_PertenenciaIndigenenaTablaModel
          salud_pertenenciaIndigenenaTablaModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Salud, salud_pertenenciaIndigenenaTablaModel.toMap(),
        where:
            "folio = ${salud_pertenenciaIndigenenaTablaModel.folio} and ROWID = (select min(ROWID) + 1 from saludPertenenciaIndigena where folio = ${salud_pertenenciaIndigenenaTablaModel.folio})");
    return res;
  }

  Future<int> upDateSalud3(
      Salud_PertenenciaIndigenenaTablaModel
          salud_pertenenciaIndigenenaTablaModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Salud, salud_pertenenciaIndigenenaTablaModel.toMap(),
        where:
            "folio = ${salud_pertenenciaIndigenenaTablaModel.folio} and ROWID = (select min(ROWID) + 2 from saludPertenenciaIndigena where folio = ${salud_pertenenciaIndigenenaTablaModel.folio})");
    return res;
  }

  Future<int> upDateSalud4(
      Salud_PertenenciaIndigenenaTablaModel
          salud_pertenenciaIndigenenaTablaModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Salud, salud_pertenenciaIndigenenaTablaModel.toMap(),
        where:
            "folio = ${salud_pertenenciaIndigenenaTablaModel.folio} and ROWID = (select min(ROWID) + 3 from saludPertenenciaIndigena where folio = ${salud_pertenenciaIndigenenaTablaModel.folio})");
    return res;
  }

  Future<int> upDateSalud5(
      Salud_PertenenciaIndigenenaTablaModel
          salud_pertenenciaIndigenenaTablaModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Salud, salud_pertenenciaIndigenenaTablaModel.toMap(),
        where:
            "folio = ${salud_pertenenciaIndigenenaTablaModel.folio} and ROWID = (select min(ROWID) + 4 from saludPertenenciaIndigena where folio = ${salud_pertenenciaIndigenenaTablaModel.folio})");
    return res;
  }

  Future<int> upDateSalud6(
      Salud_PertenenciaIndigenenaTablaModel
          salud_pertenenciaIndigenenaTablaModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Salud, salud_pertenenciaIndigenenaTablaModel.toMap(),
        where:
            "folio = ${salud_pertenenciaIndigenenaTablaModel.folio} and ROWID = (select min(ROWID) + 5 from saludPertenenciaIndigena where folio = ${salud_pertenenciaIndigenenaTablaModel.folio})");
    return res;
  }

  Future<int> upDateSalud7(
      Salud_PertenenciaIndigenenaTablaModel
          salud_pertenenciaIndigenenaTablaModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Salud, salud_pertenenciaIndigenenaTablaModel.toMap(),
        where:
            "folio = ${salud_pertenenciaIndigenenaTablaModel.folio} and ROWID = (select min(ROWID) + 6 from saludPertenenciaIndigena where folio = ${salud_pertenenciaIndigenenaTablaModel.folio})");
    return res;
  }

  Future<int> upDateSalud8(
      Salud_PertenenciaIndigenenaTablaModel
          salud_pertenenciaIndigenenaTablaModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Salud, salud_pertenenciaIndigenenaTablaModel.toMap(),
        where:
            "folio = ${salud_pertenenciaIndigenenaTablaModel.folio} and ROWID = (select min(ROWID) + 7 from saludPertenenciaIndigena where folio = ${salud_pertenenciaIndigenenaTablaModel.folio})");
    return res;
  }

  Future<int> upDateSalud9(
      Salud_PertenenciaIndigenenaTablaModel
          salud_pertenenciaIndigenenaTablaModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Salud, salud_pertenenciaIndigenenaTablaModel.toMap(),
        where:
            "folio = ${salud_pertenenciaIndigenenaTablaModel.folio} and ROWID = (select min(ROWID) + 8 from saludPertenenciaIndigena where folio = ${salud_pertenenciaIndigenenaTablaModel.folio})");
    return res;
  }

  Future<int> upDateSalud10(
      Salud_PertenenciaIndigenenaTablaModel
          salud_pertenenciaIndigenenaTablaModel) async {
    var dbClient = await db;
    var res = await dbClient.update(
        Table_Salud, salud_pertenenciaIndigenenaTablaModel.toMap(),
        where:
            "folio = ${salud_pertenenciaIndigenenaTablaModel.folio} and ROWID = (select min(ROWID) + 9 from saludPertenenciaIndigena where folio = ${salud_pertenenciaIndigenenaTablaModel.folio})");
    return res;
  }

  Future<int> updateIncompleto(String incom, int folio) async {
    var dbClient = await db;
    var res = await dbClient.rawUpdate(
        "UPDATE ${Table_Data} SET incompleto = ? WHERE folio = ?",
        [incom, folio]);
    print(res);
    return res;
  }

  //----------------------------------------------------------------------------------------------------//
  //QUERYS PARA SQLSERVER//
  readAlimentacionSQL() async {
    var connection = await db;
    List<Map> res =
        await connection.rawQuery("SELECT * FROM view_alimentacion");
    //print(res);
    return res;
  }

  readAportacionSemanalEgresosSQL() async {
    var connection = await db;
    List<Map> res = await connection.rawQuery("SELECT  * FROM view_egresos");
    return res;
  }

  readAportacionSemanalIngresosSQL() async {
    var connection = await db;
    List<Map> res =
        await connection.rawQuery("SELECT  * FROM view_aportaciones");
    return res;
  }

  readApoyoEnEspecieSQL() async {
    var connection = await db;
    List<Map> res = await connection.rawQuery("SELECT  * FROM view_apoyo");
    return res;
  }

  readCaracteristicasCasaSQL() async {
    var connection = await db;
    List<Map> res = await connection.rawQuery("SELECT  * FROM view_casa");
    return res;
  }

  readDatosGeneralesSQL() async {
    var connection = await db;
    List<Map> res =
        await connection.rawQuery("SELECT  * FROM view_datosGenerales");
    return res;
  }

  readDocumentosSQL() async {
    var connection = await db;
    List<Map> res = await connection.rawQuery("SELECT  * FROM view_documentos");
    return res;
  }

  readEquipamientoSQL() async {
    var connection = await db;
    List<Map> res =
        await connection.rawQuery("SELECT  * FROM view_equipamiento");
    return res;
  }

  readEscolaridadSeguridadSocialSQL() async {
    var connection = await db;
    List<Map> res =
        await connection.rawQuery("SELECT  * FROM view_escolaridad");
    return res;
  }

  readEstadoDeLaCasaYConstruccionSQL() async {
    var connection = await db;
    List<Map> res =
        await connection.rawQuery("SELECT  * FROM view_estadoDelaCasa");
    return res;
  }

  readEstructuraFamiliarSQL() async {
    var connection = await db;
    List<Map> res =
        await connection.rawQuery("SELECT  * FROM view_estructuraFamiliar");
    return res;
  }

  readFotografiaSQL() async {
    var connection = await db;
    List<Map> res = await connection.rawQuery("SELECT  * FROM view_fotografia");
    return res;
  }

  readRemesasSQL() async {
    var connection = await db;
    List<Map> res = await connection.rawQuery("SELECT  * FROM view_remseas");
    return res;
  }

  readResolucionSQL() async {
    var connection = await db;
    List<Map> res = await connection.rawQuery("SELECT  * FROM view_resolucion");
    return res;
  }

  readResolucionBALSQL() async {
    var connection = await db;
    List<Map> res =
        await connection.rawQuery("SELECT  * FROM view_resolucionBAL");
    return res;
  }

  readSaludPertenciaIndigenaSQL() async {
    var connection = await db;
    List<Map> res =
        await connection.rawQuery("SELECT  * FROM view_saludPertenencia");
    return res;
  }

  readServiciosSQL() async {
    var connection = await db;
    List<Map> res = await connection.rawQuery("SELECT  * FROM view_servicios");
    return res;
  }

  // -----------------------------------------------------------------------------------------------

  // -------------- Guardar usuario ----------
  saveUsuario(
      pk_clave_usu,
      txt_usuario_usu,
      txt_contrasena_usu,
      txt_nombre_usu,
      txt_email_usu,
      num_activo_usu,
      fk_clave_rol,
      fk_clave_emp,
      dispositivo) async {
    var connection = await db;
    return await connection.rawQuery(
        "INSERT INTO tb_usuarios (pk_clave_usu,txt_usuario_usu,txt_contrasena_usu,txt_nombre_usu," +
            "txt_email_usu,num_activo_usu,fk_clave_rol,fk_clave_emp,dispositivo)" +
            "VALUES ($pk_clave_usu,'$txt_usuario_usu','$txt_contrasena_usu'," +
            "'$txt_nombre_usu','$txt_email_usu',$num_activo_usu,$fk_clave_rol,$fk_clave_emp,'$dispositivo')");
  }

  // Consultas para servicios
  readServicioBano() async {
    var conn = await db;
    return await conn.rawQuery("SELECT * FROM tb_bano");
  }

  readServicioAgua() async {
    var conn = await db;
    return await conn.rawQuery("SELECT * FROM tb_ServAgua");
  }

  readServicioGas() async {
    var conn = await db;
    return await conn.rawQuery("SELECT * FROM tb_ServGas");
  }

  readServicioLuz() async {
    var conn = await db;
    return await conn.rawQuery("SELECT * FROM tb_ServLuz");
  }

  readServicioSanitario() async {
    var conn = await db;
    return await conn.rawQuery("SELECT * FROM tb_ServSanitario");
  }

  readIntegranteCondicion() async {
    var connection = await db;
    List<Map> res =
        await connection.rawQuery("SELECT  * FROM view_integranteCondicion");
    return res;
  }

  readIntegranteClasificacion() async {
    var connection = await db;
    List<Map> res = await connection
        .rawQuery("SELECT  * FROM view_integranteClasificacion");
    return res;
  }

  readIntegrantePrestacionLab() async {
    var connection = await db;
    List<Map> res = await connection
        .rawQuery("SELECT  * FROM view_integrantePrestacionLab");
    return res;
  }

  //Guardar servicios

  insertFolioServ(folio, usuario, dispositivo, folioDisp) async {
    var conn = await db;
    return await conn.rawQuery("INSERT INTO servicios (folio,usuario," +
        "dispositivo, folioDisp) VALUES ($folio, '$usuario'," +
        "'$dispositivo', '$folioDisp')");
  }

  guardarServBano(folio, pk_bano, int_orden_bano, txt_desc_bano, otroBano,
      usuario, dispositivo, folioDisp) async {
    var conn = await db;
    return await conn.rawQuery(
        "INSERT INTO servicios (folio, pk_bano,int_orden_bano, txt_desc_bano, otroBano, usuario," +
            "dispositivo, folioDisp)" +
            "VALUES ($folio, $pk_bano, $int_orden_bano, '$txt_desc_bano', '$otroBano', '$usuario'," +
            "'$dispositivo', '$folioDisp')");
  }

  updateServBano(
      folio, pk_bano, int_orden_bano, txt_desc_bano, otroBano) async {
    var conn = await db;
    return await conn.rawQuery(
        "UPDATE servicios SET pk_bano = '$pk_bano', int_orden_bano = '$int_orden_bano'," +
            "txt_desc_bano = '$txt_desc_bano', otroBano = '$otroBano' WHERE folio = $folio");
  }

  guardarServLuz(folio, clave, orden, servLuz, otroLuz) async {
    var conn = await db;
    return await conn.rawQuery("UPDATE servicios SET claveServLuz = $clave," +
        "ordenServLuz = $orden, servLuz = '$servLuz', otroLuz = '$otroLuz'  WHERE folio = $folio");
  }

  guardarServAgua(folio, clave, orden, servAgua, otroAgua) async {
    var conn = await db;
    return await conn.rawQuery("UPDATE servicios SET claveServAgua = $clave," +
        "ordenServAgua = $orden, servAgua = '$servAgua', otroAgua = '$otroAgua'  WHERE folio = $folio");
  }

  guardarServSanitario(
      folio, clave, orden, servSanitario, otroSanitario) async {
    var conn = await db;
    return await conn.rawQuery("UPDATE servicios SET claveServSanitario = $clave," +
        "ordenServSanitario = $orden, servSanitario = '$servSanitario', otroSanitario = '$otroSanitario'  WHERE folio = $folio");
  }

  guardarServGas(folio, clave, orden, servGas, otroGas) async {
    var conn = await db;
    return await conn.rawQuery("UPDATE servicios SET claveServGas = $clave," +
        "ordenServGas = $orden, servGas = '$servGas', otroGas = '$otroGas'  WHERE folio = $folio");
  }

  // Guardar nombre del dispositivo
  guardarDispositivo(dispositivo) async {
    var conn = await db;
    return await conn.rawQuery(
        "INSERT INTO dispositivo (dispositivo) " + "VALUES ('$dispositivo')");
  }

  guardarPrestacionLaboral(orden_Integrante, pk_prestacionLaboral, folio,
      folioDisp, usuario, dispositivo) async {
    var conn = await db;
    return await conn.rawQuery(
        "INSERT INTO integrante_prestacionLaboral (orden_Integrante,pk_prestacionLaboral,folio,folioDisp,usuario,dispositivo)" +
            "VALUES ($orden_Integrante,$pk_prestacionLaboral,$folio,'$folioDisp','$usuario','$dispositivo')");
  }

  guardarCondicionSalud(orden_Integrante, pk_condicion, folio, ponderacion,
      folioDisp, usuario, dispositivo) async {
    var conn = await db;
    return await conn.rawQuery(
        "INSERT INTO integrante_condiciones (orden_Integrante,pk_condicion,ponderacion,folio,folioDisp,usuario,dispositivo)" +
            "VALUES ($orden_Integrante,$pk_condicion,$folio,$ponderacion,'$folioDisp','$usuario','$dispositivo')");
  }

  guardarClasificacionSalud(orden_Integrante, pk_clasificacion, folio,
      folioDisp, usuario, dispositivo) async {
    var conn = await db;
    return await conn.rawQuery(
        "INSERT INTO integrante_clasificacion (orden_integrante,pk_clasificacion,folio,folioDisp,usuario,dispositivo)" +
            "VALUES ($orden_Integrante,$pk_clasificacion,$folio,'$folioDisp','$usuario','$dispositivo')");
  }

  /// .------
  readAsentamientos(String asenta) async {
    var conn = await db;
    return await conn
        .rawQuery("SELECT * FROM tb_CPs where Asentamiento = '$asenta'");
  }

  eliminarDispositivo() async {
    var conn = await db;
    return await conn.rawQuery("DELETE FROM dispositivo");
  }

  eliminarUsuarios() async {
    var conn = await db;
    return await conn.rawQuery("DELETE FROM tb_usuarios");
  }

  readServiciosA(folio) async {
    var conn = await db;
    return await conn
        .rawQuery("SELECT * FROM servicios WHERE folio = '$folio'");
  }

  // Actualizar estatus

  updateEstatus() async {
    var conn = await db;
    return await conn.rawQuery("UPDATE datosGenerales SET estatus = 1");
  }

  readGrupo(clave) async {
    var conn = await db;
    List<Map> res =
        await conn.rawQuery("SELECT * FROM tb_Grupos WHERE Grupo = '$clave'");
    return res;
  }

  readComunidades() async {
    var conn = await db;
    List<Map> res = await conn.rawQuery("SELECT * FROM tb_Comunidades");
    return res;
  }

  readDatosGenerales(folio) async {
    var conn = await db;
    List<Map> res = await conn
        .rawQuery("SELECT * FROM datosGenerales WHERE folio = '$folio'");
    return res;
  }

  readIngresoMensual(folio) async {
    var conn = await db;
    List<Map> res = await conn.rawQuery(
        "SELECT * FROM aportacionSemanalIngresos WHERE folio = '$folio'");
    return res;
  }

  readEstructuraFamiliar(folio) async {
    var conn = await db;
    List<Map> res = await conn
        .rawQuery("SELECT * FROM estructuraFamiliar WHERE folio = '$folio'");
    return res;
  }

  readEscolaridadP(folio) async {
    var conn = await db;
    List<Map> res = await conn.rawQuery(
        "SELECT * FROM escolaridadSeguridadSocial WHERE folio = '$folio'");
    return res;
  }

  readSalud(folio) async {
    var conn = await db;
    List<Map> res = await conn.rawQuery(
        "SELECT * FROM saludPertenenciaIndigena WHERE folio = '$folio'");
    return res;
  }

  readPrestacionesLab(folio) async {
    var conn = await db;
    List<Map> res = await conn.rawQuery(
        "SELECT * FROM integrante_prestacionLaboral p " +
            "INNER JOIN tb_PrestacionesLaborales i ON p.pk_prestacionLaboral = i.Pk_PrestacionesLaborales " +
            "AND folio = '$folio'");
    return res;
  }

  readAlimentacionP(folio) async {
    var conn = await db;
    List<Map> res = await conn.rawQuery(
        "SELECT pregunta1, pregunta2, pregunta3, pregunta4, pregunta5, pregunta6,pregunta7, pregunta8, pregunta9, pregunta10, pregunta11, pregunta12 FROM alimentacion WHERE folio = '$folio'");

    return res;
  }

  readVivienda(folio) async {
    var conn = await db;
    List<Map> res = await conn.rawQuery(
        "SELECT * FROM estadoDeLaCasaYConstruccion WHERE folio = '$folio'");
    return res;
  }

  readCaracteristicaCasa(folio) async {
    var conn = await db;
    List<Map> res = await conn.rawQuery("SELECT * FROM caracteristicas_Casa");
    return res;
  }

  /* createTable() async {
    var conn = await db;
    var res = await conn.rawQuery(
        "CREATE TABLE tb_lineaPobrezaIngresos(anio int,mes nvarchar(4),canastaAlimentaria_rural float,canastaAlimentaria_urbano float,canastaNoAlimentaria_rural float,canastaNoAlimentaria_urbano float);");
    return res;
  } */

  guardarLPI(
      int anio,
      String mes,
      double canastaAlimentaria_rural,
      double canastaAlimentaria_urbano,
      double canastaNoAlimentaria_rural,
      double canastaNoAlimentaria_urbano) async {
    var conn = await db;
    var res = await conn.rawQuery(
        "INSERT INTO tb_lineaPobrezaIngresos (anio, mes ,canastaAlimentaria_rural,canastaAlimentaria_urbano," +
            "canastaNoAlimentaria_rural, canastaNoAlimentaria_urbano)" +
            "VALUES ($anio, '$mes', $canastaAlimentaria_rural, $canastaAlimentaria_urbano," +
            "$canastaNoAlimentaria_rural, $canastaNoAlimentaria_urbano);");
    return res;
  }

  eliminarLPI() async {
    var conn = await db;
    var res = await conn.rawQuery("DELETE FROM tb_lineaPobrezaIngresos");
    return res;
  }

  readLPI() async {
    var conn = await db;
    var res = await conn.rawQuery("SELECT * FROM tb_lineaPobrezaIngresos");
    return res;
  }

  Future<int> saveServicios(ServiciosModel serviciosModel) async {
    var dbClient = await db;
    var res = await dbClient.insert('servicios', serviciosModel.toMap());
    return res;
  }

  readSelectPresta(orden, folio) async {
    var conn = await db;
    List<Map<String, dynamic>> res = await conn.rawQuery(
        "SELECT * FROM integrante_prestacionLaboral WHERE folio = $folio AND orden_Integrante = $orden");
    return res;
  }

  Future<List<int>> getSelectPresta(orden, folio) async {
    var conn = await db;
    final List<Map<String, dynamic>> selectedItemsData = await conn.rawQuery(
        "SELECT * FROM integrante_prestacionLaboral WHERE folio = $folio AND orden_Integrante = $orden");
    final List<int> selectedIds = selectedItemsData
        .map((data) => int.parse(data['pk_prestacionLaboral']))
        .toList();

    return selectedIds;
  }

  Future<List<PrestacionesLaboralesModel>> getItems() async {
    var conn = await db;
    final result = await conn.query('tb_PrestacionesLaborales');
    return result
        .map((json) => PrestacionesLaboralesModel.fromMap(json))
        .toList();
  }

  eliminarEstudio(folio) async {
    var conn = await db;
    var res = await conn
        .rawQuery('UPDATE DatosGenerales SET estatus = 3 WHERE folio = $folio');
    return res;
  }

  eliminarIngtegrante_prestacion(folio, orden_integrante) async {
    var conn = await db;
    var res = await conn.rawQuery(
        'DELETE FROM integrante_prestacionLaboral WHERE folio = $folio AND orden_integrante = $orden_integrante');
    return res;
  }

  eliminarIngtegrante_clasificacion(folio) async {
    var conn = await db;
    var res = await conn
        .rawQuery('DELETE FROM integrante_clasificacion WHERE folio = $folio');
    return res;
  }

  eliminarIngtegrante_condicion(folio) async {
    var conn = await db;
    var res = await conn
        .rawQuery('DELETE FROM integrante_condiciones WHERE folio = $folio');
    return res;
  }

  updateComunidades(
      int pk_Comunidad, int orden_Comunidad, String comunidad) async {
    var conn = await db;
    String sql =
        "INSERT INTO tb_Comunidades (pk_Comunidad,orden_Comunidad,Comunidad) VALUES ($pk_Comunidad,$orden_Comunidad,'${comunidad}');";
    print(sql);
    var res = await conn.rawQuery(sql);
    return res;
  }

  deleteComunidades() async {
    var conn = await db;
    var res = await conn.rawQuery("DELETE FROM tb_Comunidades");
    return res;
  }

  updateGrupos(int claveGrupo, int orden_Grupo, String grupo) async {
    var conn = await db;
    var res = await conn.rawQuery(
        "INSERT INTO tb_Grupos(ClaveGrupo,orden_Grupo,Grupo) VALUES ($claveGrupo,$orden_Grupo,'${grupo}');");
    return res;
  }

  deleteGrupos() async {
    var conn = await db;
    var res = await conn.rawQuery("DELETE FROM tb_Grupos");
    return res;
  }
}
