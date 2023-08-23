import 'package:esn/DatabaseHandler/DbHelper.dart';
import 'package:esn/Model/ComunidadesModel.dart';
import 'package:esn/Model/CodigoPostalModel.dart';

class CategoryService {
  DbHelper _repository;
  CategoryService() {
    _repository = DbHelper();
  }

  readCategoriesApoyos() async {
    return await _repository.readData('tb_ApoyosGobMx');
  }

  readProporcionado() async {
    return await _repository.readProporcionado();
  }

  readCategoriesFrecuenciasA() async {
    return await _repository.readData('tb_FrecuenciasApoyos');
  }

  readCtegoriesTipoVialidad() async {
    return await _repository.readData('tb_TiposVialidad');
  }

  readTipoAsenta(String Asienta) async {
    return await _repository.readOrdenTipoAsenta(Asienta);
  }

  readTipoVialidad(String Vialidad) async {
    return await _repository.readOrdenTipoVialidad(Vialidad);
  }

  readOrdenEstado(String Estado) async {
    return await _repository.readOrdenEstado(Estado);
  }

  readOrdenApoyo(String Apoyo) async {
    return await _repository.readOrdenApoyo(Apoyo);
  }

  readClaveApoyo(String Frecuencia) async {
    return await _repository.readClaveApoyo(Frecuencia);
  }

  readOrdenFrecuencia(String Frecuencia) async {
    return await _repository.readOrdenFrecuencia(Frecuencia);
  }

  readClaveFrecuencia(String Frecuencia) async {
    return await _repository.readClaveFreciencia(Frecuencia);
  }

  readOrdenEstadoCivil(String Civil) async {
    return await _repository.readOrdenEstadosCivil(Civil);
  }

  readOrdenParentesco(String Parentesco) async {
    return await _repository.readOrdenParentesco(Parentesco);
  }

  readOrdenEscolaridad(String escolaridad) async {
    return await _repository.readOrdenEscolaridad(escolaridad);
  }

  readOrdenGrado(String grado) async {
    return await _repository.readOrdenGrado(grado);
  }

  readOrdenOcupacion(String Ocupacion) async {
    return await _repository.readOrdenOcupacion(Ocupacion);
  }

  readOrdenTipoEmpl(String TipoEmpleo) async {
    return await _repository.readOrdenTipoEmpleo(TipoEmpleo);
  }

  readOrdenDerecho(String derecho) async {
    return await _repository.readOrdenDerechoA(derecho);
  }

  readOrdenMotivoDerecho(String motivoDerecho) async {
    return await _repository.readOrdenMotivoDerecho(motivoDerecho);
  }

  readOrdenCapacidadesDif(String capacidades) async {
    return await _repository.readOrdenCapacidadesDif(capacidades);
  }

  readOrdenAdicciones(String Adiccion) async {
    return await _repository.readOrdenAdicciones(Adiccion);
  }

  readOrdenPuebloIndigena(String pueblo) async {
    return await _repository.readOrdenPuebloIndigena(pueblo);
  }

  readOrdencasa(String casa) async {
    return await _repository.readOrdenCasa(casa);
  }

  readOrdenPiso(String piso) async {
    return await _repository.readOrdenPiso(piso);
  }

  readOrdenTenencia(String tenencia) async {
    return await _repository.readOrdenTenencia(tenencia);
  }

  readOrdenTecho(String techo) async {
    return await _repository.readOrdenTecho(techo);
  }

  readOrdenMuro(String muro) async {
    return await _repository.readOrdenMuros(muro);
  }

  readCtegoriesMunicipios() async {
    return await _repository.readData('tb_Municipios');
  }

  readCtegoriesTipoAsentamiento() async {
    return await _repository.readData('tb_TiposAsentamiento');
  }

  readCategoriesEstadosCiviles() async {
    return await _repository.readData('tb_EstadosCiviles');
  }

  readCategoriesParentesco() async {
    return await _repository.readParentesco();
  }

  Folio() async {
    return await _repository.readFolio('datosGenerales');
  }

  readCategoriesEcolaridades() async {
    return await _repository.readData('tb_Escolaridades');
  }

  readCategoriesDerechohabiencias() async {
    return await _repository.readData('tb_Derechohabiencias');
  }

  readCategoriesMotivoDerechohabiencias() async {
    return await _repository.readData('tb_MotivoDerechohabiencias');
  }

  readCategoriesTipoEmpleos() async {
    return await _repository.readData('tb_TipoEmpleos');
  }

  readCategoriesOcupaciones() async {
    return await _repository.readData('tb_Ocupaciones');
  }

  readCategoriesGradosEscolares() async {
    return await _repository.readData('tb_GradosEscolares');
  }

  readCategoriesDiscapacidades() async {
    return await _repository.readData('tb_CapacidadesDiferentes');
  }

  readCategoriesCondicionesSalud() async {
    return await _repository.readData('tb_CondicionesSalud');
  }

  readCategoriesAdicciones() async {
    return await _repository.readData('tb_Adicciones');
  }

  readCategoriesPuebloIndigena() async {
    return await _repository.readData('tb_EtniasIndigenas');
  }

  readCategoriesTipoVivienda() async {
    return await _repository.readData('tb_TipoVivienda');
  }

  readCategoriesTipoPiso() async {
    return await _repository.readData('tb_TipoPisos');
  }

  readCategoriesTipoTenencia() async {
    return await _repository.readData('tb_Tenencias');
  }

  readCategoriesTipoTecho() async {
    return await _repository.readData('tb_Techos');
  }

  readCategoriesTipoMuro() async {
    return await _repository.readData('tb_TiposMuro');
  }

  readCategoriesEstados() async {
    return await _repository.readData('tb_Estados');
  }

  readCategoriesCodigoPostal() async {
    return await _repository.readCp();
  }

  readCategoriesCodigoPostal2(String CP) async {
    return await _repository.readCodigoPostal(
        "tb_CPs", CodigoPostalModel(ClaveCP: int.parse(CP)));
  }

  readCategoriesComunidades() async {
    return await _repository.readData('tb_Comunidades');
  }

  readCategoriesClasificaciones() async {
    return await _repository.readData('tb_ClasCondicionesSalud');
  }

  readDatosGeenerales(int folio) async {
    return await _repository.readDatosGeenerales("datosGenerales", folio);
  }

  readFecha(int folio) async {
    return await _repository.readFecha(folio);
  }

  readConSlud(int folio) async {
    return await _repository.readConSlud(folio);
  }

  readEscolaridad(int id) async {
    return await _repository.readEscolaridad(id);
  }

  readEdad(int id) async {
    return await _repository.readEdad(id);
  }

  readAlimentacionQ(int id) async {
    return await _repository.readAlimentacionQ(id);
  }

  readInfraestructura_Vivienda(int id) async {
    return await _repository.readInfraestructura_Vivienda(id);
  }

  readServices(int id) async {
    return await _repository.readServices(id);
  }

  readServicioBanio(int folio) async {
    return await _repository.readDatosGeenerales("servicios", folio);
  }

  readEstructura1(int folio) async {
    return await _repository.readEstructura1("estructuraFamiliar", folio);
  }

  readEstructura2(int folio) async {
    return await _repository.readEstructura2("estructuraFamiliar", folio);
  }

  readEstructura3(int folio) async {
    return await _repository.readEstructura3("estructuraFamiliar", folio);
  }

  readEstructura4(int folio) async {
    return await _repository.readEstructura4("estructuraFamiliar", folio);
  }

  readEstructura5(int folio) async {
    return await _repository.readEstructura5("estructuraFamiliar", folio);
  }

  readEstructura6(int folio) async {
    return await _repository.readEstructura6("estructuraFamiliar", folio);
  }

  readEstructura7(int folio) async {
    return await _repository.readEstructura7("estructuraFamiliar", folio);
  }

  readEstructura8(int folio) async {
    return await _repository.readEstructura8("estructuraFamiliar", folio);
  }

  readEstructura9(int folio) async {
    return await _repository.readEstructura9("estructuraFamiliar", folio);
  }

  readEstructura10(int folio) async {
    return await _repository.readEstructura10("estructuraFamiliar", folio);
  }

  readEscolaridad1(int folio) async {
    return await _repository.readEscolaridad1(
        "escolaridadSeguridadSocial", folio);
  }

  readEscolaridad2(int folio) async {
    return await _repository.readEscolaridad2(
        "escolaridadSeguridadSocial", folio);
  }

  readEscolaridad3(int folio) async {
    return await _repository.readEscolaridad3(
        "escolaridadSeguridadSocial", folio);
  }

  readEscolaridad4(int folio) async {
    return await _repository.readEscolaridad4(
        "escolaridadSeguridadSocial", folio);
  }

  readEscolaridad5(int folio) async {
    return await _repository.readEscolaridad5(
        "escolaridadSeguridadSocial", folio);
  }

  readEscolaridad6(int folio) async {
    return await _repository.readEscolaridad6(
        "escolaridadSeguridadSocial", folio);
  }

  readEscolaridad7(int folio) async {
    return await _repository.readEscolaridad7(
        "escolaridadSeguridadSocial", folio);
  }

  readEscolaridad8(int folio) async {
    return await _repository.readEscolaridad8(
        "escolaridadSeguridadSocial", folio);
  }

  readEscolaridad9(int folio) async {
    return await _repository.readEscolaridad9(
        "escolaridadSeguridadSocial", folio);
  }

  readEscolaridad10(int folio) async {
    return await _repository.readEscolaridad10(
        "escolaridadSeguridadSocial", folio);
  }

  readEquipamiento(int folio) async {
    return await _repository.readEquipamiento("equipamiento", folio);
  }

  readAportaciones(int folio) async {
    return await _repository.readAportaciones(
        "aportacionSemanalIngresos", folio);
  }

  readEgresos(int folio) async {
    return await _repository.readEgresos("aportacionSemanalEgresos", folio);
  }

  readApoyoEspecie(int folio) async {
    return await _repository.readApoyoEspecie("apoyoEnEspecie", folio);
  }

  readRemesas(int folio) async {
    return await _repository.readRemesas("remesas", folio);
  }

  readDocmentos(int folio) async {
    return await _repository.readDocumentos("documentos", folio);
  }

  readAlimentacion(int folio) async {
    return await _repository.readAlimentacion("alimentacion", folio);
  }

  readResolucion(int folio) async {
    return await _repository.readResolucion("resolucion", folio);
  }

  readResolucionBal(int folio) async {
    return await _repository.readResolucionBal("resolucionBal", folio);
  }

  readCasa(int folio) async {
    return await _repository.readCasa("caracteristicas_Casa", folio);
  }

  readEstadoCasa(int folio) async {
    return await _repository.readCasa("estadoDeLaCasaYConstruccion", folio);
  }

  readCategoriesFrecuancia() async {
    return await _repository.readData('tb_Frecuencias');
  }

  readCategoriesDuraciones() async {
    return await _repository.readData('tb_Duraciones');
  }

  readDisp() async {
    return await _repository.readDispo('dispositivo');
  }

  readSaludPertenencia(int folio) async {
    return await _repository.readSaludPertenencia(
        'saludPertenenciaIndigena', folio);
  }

  readSaludPertenencia2(int folio) async {
    return await _repository.readSaludPertenencia2(
        'saludPertenenciaIndigena', folio);
  }

  readSaludPertenencia3(int folio) async {
    return await _repository.readSaludPertenencia3(
        'saludPertenenciaIndigena', folio);
  }

  readSaludPertenencia4(int folio) async {
    return await _repository.readSaludPertenencia4(
        'saludPertenenciaIndigena', folio);
  }

  readSaludPertenencia5(int folio) async {
    return await _repository.readSaludPertenencia5(
        'saludPertenenciaIndigena', folio);
  }

  readSaludPertenencia6(int folio) async {
    return await _repository.readSaludPertenencia6(
        'saludPertenenciaIndigena', folio);
  }

  readSaludPertenencia7(int folio) async {
    return await _repository.readSaludPertenencia7(
        'saludPertenenciaIndigena', folio);
  }

  readSaludPertenencia8(int folio) async {
    return await _repository.readSaludPertenencia8(
        'saludPertenenciaIndigena', folio);
  }

  readSaludPertenencia9(int folio) async {
    return await _repository.readSaludPertenencia9(
        'saludPertenenciaIndigena', folio);
  }

  readTipoZona(int folio) async {
    return await _repository.readTipoZona(folio);
  }

  readIngresoF(int folio) async {
    return await _repository.readIngresoF(folio);
  }

  readSaludPertenencia10(int folio) async {
    return await _repository.readSaludPertenencia10(
        'saludPertenenciaIndigena', folio);
  }

  readPrestacionesLaborales() async {
    return await _repository.readData('tb_PrestacionesLaborales');
  }

  readVersion() async {
    return await _repository.readVersion();
  }

  readPKPrestacionesLaborales(String prestacion) async {
    return await _repository.readPKPrestacionesLaborales(prestacion);
  }

  readOrdenPrestacionesLaborales(String prestacion) async {
    return await _repository.readOrdenPrestacionesLaborales(prestacion);
  }

  readOrdenCodicionesSlud(String condicion) async {
    return await _repository.readOrdenCodicionesSlud(condicion);
  }

  readPonderacionCondicionesSalud(String condicion) async {
    return await _repository.readPonderacionCondicionesSalud(condicion);
  }

  readOrdenClasCodicionesSlud(String condicion) async {
    return await _repository.readOrdenClasCodicionesSlud(condicion);
  }

  readClaveClasCondicionesSalud(String condicion) async {
    return await _repository.readClaveClasCondicionesSalud(condicion);
  }
}
