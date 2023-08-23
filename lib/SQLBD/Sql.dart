import 'package:esn/Comm/comHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sql_conn/sql_conn.dart';

class Sql {
  var check = 1;

  String di = "'\\'";
  connect(BuildContext ctx) async {
    try {
      await SqlConn.connect(
          /* ip: '172.20.10.4',
          port: '1433',
          databaseName: 'baleon',
          username: 'sa',
          password: '1234567' */
          ip: '192.168.1.6',
          port: '50554',
          databaseName: 'baleon',
          username: 'balapp',
          password: 'Balapp2023.'
          );
      alertDialog(ctx, 'Conexión Exitosa');
      return SqlConn.isConnected;
    } catch (e) {
      alertDialog(ctx, 'Error al conectarse a la base de datos');
      print(e);
      print('No se conecto');
      check = 0;
      return SqlConn.disconnect();
    }
  }

  guardarAlimentacion(
      context,
      folio,
      folioDisp,
      pregunta1,
      pregunta2,
      pregunta3,
      pregunta4,
      pregunta5,
      pregunta6,
      pregunta7,
      pregunta8,
      pregunta9,
      pregunta10,
      pregunta11,
      pregunta12,
      usuario,
      dispositivo) async {
    await connect(context);

    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarAlimentacion @folio = $folio, @folioDisp = '$folioDisp', @pregunta1 = '$pregunta1', " +
              "@pregunta2 = '$pregunta2', @pregunta3 = '$pregunta3', " +
              "@pregunta4 = '$pregunta4', @pregunta5 = '$pregunta5', @pregunta6 = '$pregunta6', " +
              "@pregunta7 = '$pregunta7', @pregunta8 = '$pregunta8', @pregunta9 = '$pregunta9', " +
              "@pregunta10 = '$pregunta10',@pregunta11 = '$pregunta11', @pregunta12 = '$pregunta12'," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo'");
      print('Listo Alimentacion');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarAportacionSemanalEgresos(
      context,
      folio,
      folioDisp,
      vivienda,
      alimentacion,
      luz,
      gas,
      agua,
      telefono,
      transporte,
      atencionMedica,
      otrosGastos,
      celular,
      educacion,
      totalSemanal,
      totalMensual,
      usuario,
      dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarAportacionSemanalEgresos @folio = $folio, " +
              "@folioDisp = '$folioDisp', @vivienda = $vivienda, @alimentacion = $alimentacion, @luz = $luz, " +
              "@agua = $agua, @telefono = $telefono, @transporte = $transporte, @atencionMedica = $atencionMedica, " +
              "@celular = $celular, @educacion = $educacion,@gas = $gas, @otrosGastos = $otrosGastos, " +
              "@totalSemanal = $totalSemanal, @totalMensual = $totalMensual," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo'");
      print('Listo egresos');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarAportacionSemanalIngresos(
      context,
      folio,
      folioDisp,
      padre,
      madre,
      hijos,
      prospera,
      adultosMayoresProspera,
      becas,
      otros,
      pension,
      totalSemanal,
      totalMensual,
      usuario,
      dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarAportacionSemanalIngresos @folio = $folio, " +
              "@folioDisp = '$folioDisp', @padre = '$padre', @madre = '$madre', @hijos = '$hijos', @prospera = '$prospera', " +
              "@adultosMayoresProspera = '$adultosMayoresProspera', @becas = '$becas', @otros = $otros, @pension = '$pension', " +
              "@totalSemanal = '$totalSemanal', @totalMensual = '$totalMensual'," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo'");
      print('Listo Ingresos');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarApoyoEnEspecie(
      context,
      folio,
      folioDisp,
      claveApoyo,
      ordenApoyo,
      apoyo,
      proporcionadoPor,
      claveFrecuencia,
      ordenFrecuencia,
      frecuencia,
      otro,
      usuario,
      dispositivo) async {
    print(claveApoyo);
    print(claveApoyo.runtimeType);
    try {
      /* folio = int.parse(folio);
        claveApoyo = int.parse(claveApoyo);
        ordenApoyo = int.parse(ordenApoyo);
        ordenFrecuencia = int.parse(ordenFrecuencia);
        claveFrecuencia = int.parse(claveFrecuencia); */
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarApoyoEnEspecie @folio = $folio, " +
              "@folioDisp = '$folioDisp', @claveApoyo = $claveApoyo, " +
              "@apoyo = '$apoyo',@ordenApoyo= $ordenApoyo, @proporcionadoPor = '$proporcionadoPor', " +
              "@claveFrecuencia = $claveFrecuencia, @ordenFrecuencia = $ordenFrecuencia," +
              "@frecuencia = '$frecuencia', @otro = '$otro', @usuario = '$usuario', @dispositivo = '$dispositivo'");
      print('Listo apoyo especie');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarCaracteristicasCasa(
      context,
      folio,
      folioDisp,
      numCuartos,
      cuartosDormir,
      cocinaSeparada,
      cuartoBanioExclusivo,
      usuario,
      dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarCaracteristicas_Casa @folio = $folio, " +
              "@folioDisp = '$folioDisp', @numCuartos = '$numCuartos', @cuartosDormir = '$cuartosDormir', " +
              "@cocinaSeparada = '$cocinaSeparada', @cuartoBanioExclusivo = '$cuartoBanioExclusivo'," +
              "@usuario = '$usuario', @dispositivo = '$dispositivo'");
      print('Listo casa');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarDatosGenerales(
      context,
      folio,
      folioDisp,
      fechaCaptura,
      calle,
      entreCalles,
      claveGrupo,
      grupo,
      noExt,
      noInt,
      fecha,
      claveCodigoPostal,
      claveEstado,
      estado,
      claveComunidad,
      nombreComunidad,
      claveMunicipio,
      municipio,
      claveAsentamiento,
      nombreAsentamiento,
      claveTipoAsentamiento,
      ordenTipoAsentamiento,
      tipoAsentamiento,
      claveTipoVialidad,
      ordenTipoVialidad,
      tipoVialidad,
      incompleto,
      localidad,
      telefono,
      usuario,
      dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarDatosGenerales @folio = '$folio'," +
              "@folioDisp = '$folioDisp'," +
              "@fechaCaputura = '$fechaCaptura'," +
              "@calle = '$calle'," +
              "@entreCalles = '$entreCalles'," +
              "@claveGrupo = '$claveGrupo'," +
              "@grupo = '$grupo'," +
              "@noExt = '$noExt'," +
              "@noInt = '$noInt'," +
              "@fecha = '$fecha'," +
              "@localidad = '$localidad'," +
              "@telefono = '$telefono'," +
              "@claveCodigoPostal = '$claveCodigoPostal'," +
              "@claveEstado = '$claveEstado'," +
              "@estado = '$estado'," +
              "@claveComunidad = '$claveComunidad'," +
              "@nombreComunidad = '$nombreComunidad'," +
              "@claveMunicipio = '$claveMunicipio'," +
              "@municipio = '$municipio'," +
              "@claveAsentamiento = '$claveAsentamiento'," +
              "@nombreAsentamiento = '$nombreAsentamiento'," +
              "@claveTipoAsentamiento = '$claveTipoAsentamiento'," +
              "@ordenTipoAsentamiento = '$ordenTipoAsentamiento'," +
              "@tipoAsentamiento = '$tipoAsentamiento'," +
              "@claveTipoVialidad = '$claveTipoVialidad'," +
              "@ordenTipoVialidad = '$ordenTipoVialidad'," +
              "@tipoVialidad = '$tipoVialidad'," +
              "@incompleto = '$incompleto'," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo'");
      print('Listo datos');
      print(res);
      return res;
    } catch (e) {
      print(e);

      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarDocumentos(context, folio, folioDisp, curp, actaNacimiento,
      comprobanteDomicilio, ine, usuario, dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarDocumentos @folio = $folio, " +
              "@folioDisp = '$folioDisp', @curp = '$curp', @actaNacimiento = '$actaNacimiento', " +
              "@comprobanteDomicilio = '$comprobanteDomicilio', @ine = '$ine'," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo'");
      print('Listo documentos');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarEquipamiento(
      context,
      folio,
      folioDisp,
      pk_equipamientosRefri,
      txt_desc_equipamientosRefri,
      tieneRefri,
      sirveRefri,
      pk_equipamientosEstufa,
      txt_desc_equipamientosEstufa,
      tieneEstufa,
      sirveEstufa,
      pk_equipamientosVideoDVDBlueRay,
      txt_desc_equipamientosVideoDVDBlueRay,
      tieneVideoDVDBlueRay,
      sirveVideoDVDBlueRay,
      pk_equipamientosLavadora,
      txt_desc_equipamientosLavadora,
      tieneLavadora,
      sirveLavadora,
      pk_equipamientosLicuadora,
      txt_desc_equipamientosLicuadora,
      tieneLicuadora,
      sirveLicuadora,
      pk_equipamientosTelevision,
      txt_desc_equipamientosTelevision,
      tieneTelevision,
      sirveTelevision,
      pk_equipamientosRadio,
      txt_desc_equipamientosRadio,
      tieneRadio,
      sirveRadio,
      pk_equipamientosSala,
      txt_desc_equipamientosSala,
      tieneSala,
      sirveSala,
      pk_equipamientosComedor,
      txt_desc_equipamientosComedor,
      tieneComedor,
      sirveComedor,
      pk_equipamientosAutoMovil,
      txt_desc_equipamientosAutoMovil,
      tieneAutoMovil,
      sirveAutoMovil,
      pk_equipamientosCama,
      txt_desc_equipamientosCama,
      tieneCama,
      sirveCama,
      pk_equipamientosCelular,
      txt_desc_equipamientosCelular,
      tieneCelular,
      sirveCelular,
      pk_equipamientosMotocicleta,
      txt_desc_equipamientosMotocicleta,
      tieneMotocicleta,
      sirveMotocicleta,
      pk_equipamientosComputadora,
      txt_desc_equipamientosComputadora,
      tieneComputadora,
      sirveComputadora,
      pk_equipamientosHorno,
      txt_desc_equipamientosHorno,
      tieneHorno,
      sirveHorno,
      pk_equipamientosTelefono,
      txt_desc_equipamientosTelefono,
      tieneTelefono,
      sirveTelefono,
      CondicionesGenerales,
      usuario,
      dispositivo) async {
    try {
      print(folioDisp);
      var res = await SqlConn.writeData("EXEC dbo.SP_insertarEquipamiento @folio = '$folio', " +
          "@folioDisp = '$folioDisp', " +
          "@pk_equipamientosRefri = '$pk_equipamientosRefri', " +
          "@txt_desc_equipamientosRefri = '$txt_desc_equipamientosRefri', " +
          "@tieneRefri = '$tieneRefri', @sirveRefri = '$sirveRefri'," +
          "@pk_equipamientosEstufa ='$pk_equipamientosEstufa', " +
          "@txt_desc_equipamientosEstufa = '$txt_desc_equipamientosEstufa',@tieneEstufa = '$tieneEstufa', " +
          "@sirveEstufa ='$sirveEstufa', @pk_equipamientosVideoDVDBlueRay = '$pk_equipamientosVideoDVDBlueRay', " +
          "@txt_desc_equipamientosVideoDVDBlueRay = '$txt_desc_equipamientosVideoDVDBlueRay', " +
          "@tieneVideoDVDBlueRay = '$tieneVideoDVDBlueRay', " +
          "@sirveVideoDVDBlueRay = '$sirveVideoDVDBlueRay', " +
          "@pk_equipamientosLavadora = '$pk_equipamientosLavadora', " +
          "@txt_desc_equipamientosLavadora = '$txt_desc_equipamientosLavadora', " +
          "@tieneLavadora = '$tieneLavadora', " +
          "@sirveLavadora = '$sirveLavadora', " +
          "@pk_equipamientosLicuadora = '$pk_equipamientosLicuadora', " +
          "@txt_desc_equipamientosLicuadora = '$txt_desc_equipamientosLicuadora', " +
          "@tieneLicuadora = '$tieneLicuadora', " +
          "@sirveLicuadora = '$sirveLicuadora', " +
          "@pk_equipamientosTelevision = '$pk_equipamientosTelevision', " +
          "@txt_desc_equipamientosTelevision = '$txt_desc_equipamientosTelevision', " +
          "@tieneTelevision = '$tieneTelevision', " +
          "@sirveTelevision = '$sirveTelevision', " +
          "@pk_equipamientosRadio = '$pk_equipamientosRadio', " +
          "@txt_desc_equipamientosRadio = '$txt_desc_equipamientosRadio', " +
          "@tieneRadio = '$tieneRadio', " +
          "@sirveRadio = '$sirveRadio', " +
          "@pk_equipamientosSala = '$pk_equipamientosSala', " +
          "@txt_desc_equipamientosSala = '$txt_desc_equipamientosSala', " +
          "@tieneSala = '$tieneSala', " +
          "@sirveSala = '$sirveSala', " +
          "@pk_equipamientosComedor = '$pk_equipamientosComedor', " +
          "@txt_desc_equipamientosComedor = '$txt_desc_equipamientosComedor', " +
          "@tieneComedor = '$tieneComedor', " +
          "@sirveComedor = '$sirveComedor', " +
          "@pk_equipamientosAutoMovil = '$pk_equipamientosAutoMovil', " +
          "@txt_desc_equipamientosAutoMovil = '$txt_desc_equipamientosAutoMovil', " +
          "@tieneAutoMovil = '$tieneAutoMovil', " +
          "@sirveAutoMovil = '$sirveAutoMovil', " +
          "@pk_equipamientosCama = '$pk_equipamientosCama', " +
          "@txt_desc_equipamientosCama = '$txt_desc_equipamientosCama', " +
          "@tieneCama = '$tieneCama', " +
          "@sirveCama = '$sirveCama', " +
          "@pk_equipamientosCelular = '$pk_equipamientosCelular', " +
          "@txt_desc_equipamientosCelular = '$txt_desc_equipamientosCelular', " +
          "@tieneCelular = '$tieneCelular', " +
          "@sirveCelular = '$sirveCelular', " +
          "@pk_equipamientosMotocicleta = '$pk_equipamientosMotocicleta', " +
          "@txt_desc_equipamientosMotocicleta = '$txt_desc_equipamientosMotocicleta', " +
          "@tieneMotocicleta = '$tieneMotocicleta', " +
          "@sirveMotocicleta = '$sirveMotocicleta', " +
          "@pk_equipamientosComputadora = '$pk_equipamientosComputadora', " +
          "@txt_desc_equipamientosComputadora = '$txt_desc_equipamientosComputadora', " +
          "@tieneComputadora = '$tieneComputadora', " +
          "@sirveComputadora = '$sirveComputadora', " +
          "@pk_equipamientosHorno = '$pk_equipamientosHorno', " +
          "@txt_desc_equipamientosHorno = '$txt_desc_equipamientosHorno', " +
          "@tieneHorno = '$tieneHorno', " +
          "@sirveHorno = '$sirveHorno', " +
          "@pk_equipamientosTelefono = '$pk_equipamientosTelefono', " +
          "@txt_desc_equipamientosTelefono = '$txt_desc_equipamientosTelefono', " +
          "@tieneTelefono = '$tieneTelefono', " +
          "@sirveTelefono = '$sirveTelefono', " +
          "@CondicionesGenerales = '$CondicionesGenerales'," +
          "@usuario = '$usuario'," +
          "@dispositivo = '$dispositivo'");
      print('Listo equipama');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarEscolaridadSeguridadSocial(
      context,
      folio,
      folioDisp,
      claveEscolaridad,
      ordenEscolaridad,
      escolaridad,
      claveGradoEscolar,
      gradoEscolar,
      claveAsisteEscuela,
      ordenAsisteEscuela,
      asisteEscuela,
      claveOcupacion,
      ordenOcupacion,
      ocupacion,
      claveTipoEmpleo,
      ordenTipoEmpleo,
      tipoEmpleo,
      pk_prestacionesLab,
      int_ordenPrestacionesLab,
      txt_desc_prestacionesLab,
      claveJubilacion,
      ordenJubilacion,
      jubilacion,
      claveDerechohabiencia,
      ordenDerechohabiencia,
      derechohabiencia,
      claveMotivoDerechohabiencia,
      ordenMotivoDerechohabiencia,
      motivoDerechohabiencia,
      otroEscolaridad,
      otroOcupacion,
      otroTipoEmpleo,
      usuario,
      dispositivo,
      orden) async {
    try {
      print('$int_ordenPrestacionesLab');
      print('$txt_desc_prestacionesLab');
      print('$pk_prestacionesLab');
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarEscolaridadSeguridadSocial @folio = $folio, @folioDisp = '$folioDisp', " +
              "@ClaveEscolaridad = $claveEscolaridad, " +
              "@ordenEscolaridad = $ordenEscolaridad, " +
              "@Escolaridad = '$escolaridad', " +
              "@ClaveGradoEscolar = $claveGradoEscolar, " +
              "@GradoEscolar = '$gradoEscolar', " +
              "@ClaveAsisteEscuela = $claveAsisteEscuela, " +
              "@OrdenAsisteEscuela = $ordenAsisteEscuela, " +
              "@AsisteEscuela = '$asisteEscuela', " +
              "@ClaveOcupacion = $claveOcupacion, " +
              "@OrdenOcupacion = $ordenOcupacion, " +
              "@Ocupacion = '$ocupacion', " +
              "@ClaveTipoEmpleo = $claveTipoEmpleo, " +
              "@OrdenTipoEmpleo = $ordenTipoEmpleo, " +
              "@TipoEmpleo = '$tipoEmpleo', " +
              "@pk_prestacioneslab = '$pk_prestacionesLab', " +
              "@int_OrdenPrestacionesLab = '$int_ordenPrestacionesLab', " +
              "@txt_desc_prestacioneslab = '$txt_desc_prestacionesLab', " +
              "@ClaveJubilacion = $claveJubilacion, " +
              "@OrdenJubilacion = $ordenJubilacion, " +
              "@Jubilacion = '$jubilacion', " +
              "@ClaveDerechohabiencia = $claveDerechohabiencia, " +
              "@OrdenDerechohabiencia = $ordenDerechohabiencia, " +
              "@Derechohabiencia = '$derechohabiencia', " +
              "@ClaveMotivoDerechohabiencia = $claveMotivoDerechohabiencia, " +
              "@OrdenMotivoDerechohabiencia = $ordenMotivoDerechohabiencia, " +
              "@MotivoDerechohabiencia = '$motivoDerechohabiencia', " +
              "@otroEscolaridad = '$otroEscolaridad', " +
              "@otroOcupacion = '$otroOcupacion', " +
              "@otroTipoEmpleo = '$otroTipoEmpleo'," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo', @orden = $orden");
      print('Listo escolaridad');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al mandar datos');
    }
  }

  guardarEstadoDeLaCasaYConstruccion(
      context,
      folio,
      folioDisp,
      ClaveTipoVivienda,
      OrdenTipoVivienda,
      TipoVivienda,
      ClaveTipoPiso,
      OrdenTipoPiso,
      TipoPiso,
      ClaveTenencia,
      OrdenTenencia,
      Tenencia,
      ClaveTecho,
      OrdenTecho,
      Techo,
      ClaveTipoMuro,
      OrdenTipoMuro,
      TipoMuro,
      otroMuro,
      otroTecho,
      otroTenencia,
      otroTipoPiso,
      otroTipoVivienda,
      usuario,
      dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarEstadoDeLaCasaYConstruccion @folio = '$folio', " +
              "@folioDisp = '$folioDisp', @ClaveTipoVivienda = '$ClaveTipoVivienda', " +
              "@OrdenTipoVivienda = '$OrdenTipoVivienda', @TipoVivienda = '$TipoVivienda', " +
              "@ClaveTipoPiso = '$ClaveTipoPiso', @OrdenTipoPiso = '$OrdenTipoPiso', @TipoPiso = '$TipoPiso', " +
              "@ClaveTenencia = '$ClaveTenencia', @OrdenTenencia = '$OrdenTenencia', @Tenencia = '$Tenencia', " +
              "@ClaveTecho = '$ClaveTecho', @OrdenTecho = '$OrdenTecho', @Techo = '$Techo', @ClaveTipoMuro = '$ClaveTipoMuro', " +
              "@OrdenTipoMuro = '$OrdenTipoMuro', @TipoMuro = '$TipoMuro', @otroMuro = '$otroMuro', @otroTecho = '$otroTecho', " +
              "@otroTenencia = '$otroTenencia', @otroTipoPiso = '$otroTipoPiso', @otroTipoVivienda = '$otroTipoVivienda'," +
              "@usuario = '$usuario', @dispositivo = '$dispositivo'");
      print('Listo construccion');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarEstructuraFamiliar(
      context,
      folio,
      folioDisp,
      nombre,
      primerApellido,
      segundoApellido,
      claveSexo,
      ordenSexo,
      sexo,
      fechaNacimiento,
      claveEntidad,
      entidadNacimiento,
      curp,
      claveEstadoCivil,
      ordenEstadoCivil,
      estadoCivil,
      claveParentesco,
      OrdenParentesco,
      parentesco,
      otroEstadoCivil,
      otroParentesco,
      usuario,
      dispositivo,
      orden) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarEstructuraFamiliar @folio = '$folio', @folioDisp = '$folioDisp', " +
              "@nombre = '$nombre', @primerApellido = '$primerApellido', @segundoApellido = '$segundoApellido', @claveSexo = '$claveSexo', " +
              "@ordenSexo = '$ordenSexo', @sexo = '$sexo', @fechaNacimiento = '$fechaNacimiento', @claveEntidad = '$claveEntidad', " +
              "@entidadNacimiento = '$entidadNacimiento', @curp = '$curp', @claveEstadoCivil = '$claveEstadoCivil', " +
              "@ordenEstadoCivil = '$ordenEstadoCivil', @estadoCivil = '$estadoCivil', @claveParentesco = '$claveParentesco', " +
              "@OrdenParentesco = '$OrdenParentesco', @parentesco = '$parentesco', @otroEstadoCivil = '$otroEstadoCivil', " +
              "@otroParentesco = '$otroParentesco'," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo', @orden = '$orden'");
      print('Listo estructura');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarFotografia(
      context, folio, folioDisp, fileFoto, usuario, dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarFotografia @folio = '$folio', @folioDisp = '$folioDisp', " +
              "@fileFoto = '$fileFoto'," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo'");
      print('Listo foto');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarRemesas(
      context,
      folio,
      folioDisp,
      dineroOtrosPaises,
      claveFrecuenciaApoyo,
      ordenFrecuenciaApoyo,
      frecuencia,
      usuario,
      dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarRemesas @folio = '$folio',@folioDisp = '$folioDisp', " +
              "@dineroOtrosPaises = '$dineroOtrosPaises', @claveFrecuenciaApoyo = '$claveFrecuenciaApoyo', " +
              "@ordenFrecuenciaApoyo = '$ordenFrecuenciaApoyo', @frecuencia = '$frecuencia'," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo'");
      print('Listo remesas');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarResolucion(
      context,
      folio,
      folioDisp,
      puntaje,
      escalaNecesidad,
      inseguridadAlimenticia,
      clasificacionPobresa,
      usuario,
      dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarResolucion @folio = '$folio', " +
              "@folioDisp = '$folioDisp', @puntaje = '$puntaje', @escalaNecesidad = '$escalaNecesidad', " +
              "@inseguridadAlimenticia = '$inseguridadAlimenticia', @clasificacionPobresa = '$clasificacionPobresa'," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo'");
      print('Listo resolucion');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarResolucionBAL(
      context,
      folio,
      folioDisp,
      tipo,
      claveFrecuencia,
      ordenFrecuencia,
      frecuencia,
      claveDuracion,
      ordenDuracion,
      duracion,
      otorgarApoyo,
      observaciones,
      usuario,
      dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarResolucionBAL @folio = '$folio', " +
              "@folioDisp = '$folioDisp', @tipo = '$tipo', @claveFrecuencia = '$claveFrecuencia',@ordenFrecuencia = '$ordenFrecuencia', " +
              "@frecuencia = '$frecuencia', @claveDuracion = '$claveDuracion',@ordenDuracion = '$ordenDuracion', @duracion = '$duracion', " +
              "@otorgarApoyo = '$otorgarApoyo', @observaciones = '$observaciones'," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo'");
      print('Listo resolicionbal');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarSaludPertenenciaIndigena(
      context,
      folio,
      folioDisp,
      ClaveCapacidadDiferente,
      OrdenCapacidadDiferente,
      CapacidadDiferente,
      ClaveAdiccion,
      OrdenAdiccion,
      Adiccion,
      peso,
      talla,
      imc,
      ClaveCondicionesSalud,
      OrdenCondicionesSalud,
      CondicionesSalud,
      ClaveClasCondicionesSalud,
      OrdenClasCondicionesSalud,
      ClasCondicionesSalud,
      ponderacion,
      fileFoto1,
      fileFoto2,
      fileFoto3,
      fileFoto4,
      fileFoto5,
      ClaveEtniaIndigena,
      OrdenEtniaIndigena,
      EtniaIndigena,
      incompleto,
      otroCapacidadDiferente,
      otroAdicciones,
      usuario,
      dispositivo,
      orden) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarSaludPertenenciaIndigena @folio = '$folio'," +
              "@folioDisp = '$folioDisp'," +
              "@ClaveCapacidadDiferente = '$ClaveCapacidadDiferente', " +
              "@OrdenCapacidadDiferente = '$OrdenCapacidadDiferente', " +
              "@CapacidadDiferente = '$CapacidadDiferente', @ClaveAdiccion = '$ClaveAdiccion'," +
              "@OrdenAdiccion = '$OrdenAdiccion', " +
              "@Adiccion = '$Adiccion', @peso = '$peso', @talla = '$talla', @imc = '$imc'," +
              "@ClaveCondicionesSalud = '$ClaveCondicionesSalud', " +
              "@OrdenCondicionesSalud = '$OrdenCondicionesSalud', " +
              "@CondicionesSalud = '$CondicionesSalud'," +
              "@ClaveClasCondicionesSalud = '$ClaveClasCondicionesSalud', " +
              "@OrdenClasCondicionesSalud = '$OrdenClasCondicionesSalud'," +
              "@ClasCondicionesSalud = '$ClasCondicionesSalud', " +
              "@ponderacion = '$ponderacion', @fileFoto1 = '$fileFoto1', @fileFoto2 = '$fileFoto2'," +
              "@fileFoto3 = '$fileFoto3', " +
              "@fileFoto4 = '$fileFoto4',@fileFoto5 = '$fileFoto5'," +
              "@ClaveEtniaIndigena = '$ClaveEtniaIndigena', " +
              "@OrdenEtniaIndigena = '$OrdenEtniaIndigena', @EtniaIndigena = '$EtniaIndigena'," +
              "@incompleto = '$incompleto', " +
              "@otroCapacidadDiferente = '$otroCapacidadDiferente'," +
              "@otroAdicciones = '$otroAdicciones'," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo', @orden = '$orden'");

      print('Listo salud');
      return res;
    } catch (e) {
      print('Exception: ' + e.toString());

      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarServicios(
      context,
      folio,
      folioDisp,
      pk_bano,
      int_orden_bano,
      txt_desc_bano,
      otroBano,
      claveServAgua,
      ordenServAgua,
      servAgua,
      otroAgua,
      claveServGas,
      ordenServGas,
      servGas,
      otroGas,
      claveServLuz,
      ordenServLuz,
      servLuz,
      otroLuz,
      claveServSanitario,
      ordenServSanitario,
      servSanitario,
      otroSanitario,
      usuario,
      dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarServicios @folio = '$folio', " +
              "@folioDisp = '$folioDisp', " +
              "@pk_bano = '$pk_bano', " +
              "@int_orden_bano = '$int_orden_bano', " +
              "@txt_desc_bano = '$txt_desc_bano', " +
              "@otroBano = '$otroBano', " +
              "@claveServAgua = '$claveServAgua', " +
              "@ordenServAgua = '$ordenServAgua', " +
              "@servAgua = '$servAgua', " +
              "@otroAgua = '$otroAgua', " +
              "@claveServGas = '$claveServGas', " +
              "@ordenServGas = '$ordenServGas', " +
              "@servGas = '$servGas', " +
              "@otroGas = '$otroGas', " +
              "@claveServLuz = '$claveServLuz', " +
              "@ordenServLuz = '$ordenServLuz', " +
              "@servLuz = '$servLuz', " +
              "@otroLuz = '$otroLuz', " +
              "@claveServSanitario = '$claveServSanitario', " +
              "@ordenServSanitario = '$ordenServSanitario', " +
              "@servSanitario = '$servSanitario', " +
              "@otroSanitario = '$otroSanitario'," +
              "@usuario = '$usuario'," +
              "@dispositivo = '$dispositivo'");
      print('Listo servicios');
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarIntegranteClasificacion(context, folio, orden_integrante,
      pk_clasificacion, usuario, folioDisp, dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarIntegrante_clasificacion @folio = '$folio'," +
              "@orden_integrante = '$orden_integrante', @pk_clasificacion = '$pk_clasificacion'," +
              "@usuario = '$usuario', @dispositivo = '$dispositivo', @folioDisp = '$folioDisp'");
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarIntegranteCondiciones(context, folio, orden_integrante, pk_condiciones,
      ponderacion, usuario, folioDisp, dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarIntegrante_condiciones @folio = '$folio'," +
              "@orden_Integrante = '$orden_integrante', @pk_condicion = '$pk_condiciones'," +
              "@ponderacion = '$ponderacion',@usuario = '$usuario', @dispositivo = '$dispositivo', @folioDisp = '$folioDisp'");
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  guardarIntegrantePrestacionLaboral(context, folio, orden_integrante,
      pk_prestacionLaboral, usuario, folioDisp, dispositivo) async {
    try {
      var res = await SqlConn.writeData(
          "EXEC dbo.SP_insertarIntegrante_prestacionLaboral @folio = '$folio'," +
              "@orden_integrante = '$orden_integrante', @pk_prestacionLaboral = '$pk_prestacionLaboral'," +
              "@usuario = '$usuario', @dispositivo = '$dispositivo', @folioDisp = '$folioDisp'");
      return res;
    } catch (e) {
      print(e);
      alertDialog(context, 'Ocurrio un problema al registrar');
    }
  }

  // -------- Obtener usuarios ------
  readUsuarioByDispositivo(context, dispositivo) async {
    await connect(context);
    if (SqlConn.isConnected) {
      try {
        var res = await SqlConn.readData(
            "SELECT * FROM view_tb_usuarios WHERE CONVERT(VARCHAR,dispositivo) = '$dispositivo'");
        print(res);
        return res;
      } catch (e) {
        print(e);
      }
    } else {
      print('NO SE CONECTO');
    }
  }

  // ----- Consulta de lpi

  readLPIByMount(mes, context) async {
    await connect(context);
    if (SqlConn.isConnected) {
      try {
        var res =
            await SqlConn.readData("SELECT * FROM view_lpi WHERE mes = '$mes'");

        return res;
      } catch (e) {
        print(e);
        alertDialog(
            context, 'Error al consultar lineas de pobreza por ingresos');
      }
    }
  }

// --------------------------Incompleto ---------------------------
  readAlimentacionIncompleto(ctx) async {
    try {
      var res =
          await SqlConn.readData("SELECT * FROM view_alimentacion_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readAportacionesIncompleto() async {
    try {
      var res =
          await SqlConn.readData("SELECT * FROM view_aportaciones_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readEgresoIncompleto() async {
    try {
      var res = await SqlConn.readData("SELECT * FROM view_egresos_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readApoyoIncompleto() async {
    try {
      var res = await SqlConn.readData("SELECT * FROM view_apoyo_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readCasaIncompleto() async {
    try {
      var res = await SqlConn.readData("SELECT * FROM view_casa_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readDatosGeneralesIncompleto() async {
    try {
      var res = await SqlConn.readData(
          "SELECT * FROM view_datosGenerales_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readDocumentosIncompleto() async {
    try {
      var res =
          await SqlConn.readData("SELECT * FROM view_documentos_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readEquipamientoIncompleto() async {
    try {
      var res =
          await SqlConn.readData("SELECT * FROM view_equipamiento_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readEstadoDeLaCasaIncompleto() async {
    try {
      var res = await SqlConn.readData(
          "SELECT * FROM view_estadoDelaCasa_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readEstructuraFamiliarIncompleto() async {
    try {
      var res = await SqlConn.readData(
          "SELECT * FROM view_estructuraFamiliar_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readEscolaridadIncompleto() async {
    try {
      var res =
          await SqlConn.readData("SELECT * FROM view_escolaridad_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readFotografiaIncompleto() async {
    try {
      var res =
          await SqlConn.readData("SELECT * FROM view_fotografia_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readRemesasIncompleto() async {
    try {
      var res = await SqlConn.readData("SELECT * FROM view_remseas_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readResolucionIncompleto() async {
    try {
      var res =
          await SqlConn.readData("SELECT * FROM view_resolucion_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readResolucionBalIncompleto() async {
    try {
      var res =
          await SqlConn.readData("SELECT * FROM view_resolucionBAL_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readServiciosIncompleto() async {
    try {
      var res =
          await SqlConn.readData("SELECT * FROM view_servicios_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readSaludPertenenciaIncompleto() async {
    try {
      var res = await SqlConn.readData(
          "SELECT * FROM view_saludPertenencia_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readIntegranteClasificacionIncompleto() async {
    try {
      var res = await SqlConn.readData(
          "SELECT * FROM view_integranteClasificacion_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readIntegranteCondicionIncompleto() async {
    try {
      var res = await SqlConn.readData(
          "SELECT * FROM view_integranteCondicion_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  readIntegrantePrestacionLabIncompleto() async {
    try {
      var res = await SqlConn.readData(
          "SELECT * FROM view_integrantePrestacionLab_incompleto");
      return res;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getComunidadesSQL(context) async {
    await connect(context);
    if (SqlConn.isConnected) {
      try {
        var res = await SqlConn.readData("SELECT * FROM tb_Comunidades");
        return res;
      } catch (e) {
        print(e);
      }
    }
  }

  Future<dynamic> getGruposSQL(context) async {
    await connect(context);
    if (SqlConn.isConnected) {
      try {
        var res = await SqlConn.readData("SELECT * FROM tb_Grupos");
        return res;
      } catch (e) {
        print(e);
      }
    }
  }
}
