import 'package:diacritic/diacritic.dart';
import 'package:esn/Comm/comHelper.dart';
import 'package:esn/replaceAll/replaceAllLetter.dart';

import 'package:intl/intl.dart';

class CURP {
  String removeDiacriticsn(String str) {
    if (str == '') {
      return str;
    } else {
      str.substring(0);
      if (str.codeUnitAt(0) == 209) {
        return str;
      } else {
        str = removeDiacritics(str);
        return str;
      }
    }
  }

  List<String> vowels = ['A', 'E', 'I', 'O', 'U'];
  List<String> consonante = [
    'B',
    'C',
    'D',
    'F',
    'G',
    'H',
    'J',
    'K',
    'L',
    'M',
    'N',
    'Ñ',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  Map<String, Map<String, String>> entidades = {
    '1': {'nombre': 'AGUASCALIENTES', 'abrev': 'AS'},
    '2': {'nombre': 'BAJA CALIFORNIA', 'abrev': 'BC'},
    '3': {'nombre': 'BAJA CALIFORNIA SUR', 'abrev': 'BS'},
    '4': {'nombre': 'CAMPECHE', 'abrev': 'CC'},
    '5': {'nombre': 'COAHUILA', 'abrev': 'CL'},
    '6': {'nombre': 'COLIMA', 'abrev': 'CM'},
    '7': {'nombre': 'CHIAPAS', 'abrev': 'CS'},
    '8': {'nombre': 'CHIHUAHUA', 'abrev': 'CH'},
    '9': {'nombre': 'DISTRITO FEDERAL', 'abrev': 'DF'},
    '10': {'nombre': 'DURANGO', 'abrev': 'DG'},
    '11': {'nombre': 'GUANAJUATO', 'abrev': 'GT'},
    '12': {'nombre': 'GUERRERO', 'abrev': 'GR'},
    '13': {'nombre': 'HIDALGO', 'abrev': 'HG'},
    '14': {'nombre': 'JALISCO', 'abrev': 'JC'},
    '15': {'nombre': 'ESTADO DE MEXICO', 'abrev': 'MC'},
    '16': {'nombre': 'MICHOACAN', 'abrev': 'MN'},
    '17': {'nombre': 'MORELOS', 'abrev': 'MS'},
    '18': {'nombre': 'NAYARIT', 'abrev': 'NT'},
    '19': {'nombre': 'NUEVO LEON', 'abrev': 'NL'},
    '20': {'nombre': 'OAXACA', 'abrev': 'OC'},
    '21': {'nombre': 'PUEBLA', 'abrev': 'PL'},
    '22': {'nombre': 'QUERETARO', 'abrev': 'QT'},
    '23': {'nombre': 'QUINTANA ROO', 'abrev': 'QR'},
    '24': {'nombre': 'SAN LUIS POTOSI', 'abrev': 'SP'},
    '25': {'nombre': 'SINALOA', 'abrev': 'SL'},
    '26': {'nombre': 'SONORA', 'abrev': 'SR'},
    '27': {'nombre': 'TABASCO', 'abrev': 'TC'},
    '28': {'nombre': 'TAMAULIPAS', 'abrev': 'TS'},
    '29': {'nombre': 'TLAXCALA', 'abrev': 'TL'},
    '30': {'nombre': 'VERACRUZ', 'abrev': 'VZ'},
    '31': {'nombre': 'YUCATAN', 'abrev': 'YN'},
    '32': {'nombre': 'ZACATECAS', 'abrev': 'ZS'},
    '87': {'nombre': 'DOBLE NACIONALIDAD', 'abrev': 'NE'},
    '33': {'nombre': 'NACIDO EXTRANJERO O NATURALIZADO', 'abrev': 'NE'},
  };

  digito_verificador(String curp) {
    List<String> curpV = curp.split("");
    print(curpV);
    var contador = 18;
    var count = 0;
    var valor = 0;
    var sumaria = 0;

    Map<String, int> verificadores = {
      '0': 0,
      '1': 1,
      '2': 2,
      '3': 3,
      '4': 4,
      '5': 5,
      '6': 6,
      '7': 7,
      '8': 8,
      '9': 9,
      'A': 10,
      'B': 11,
      'C': 12,
      'D': 13,
      'E': 14,
      'F': 15,
      'G': 16,
      'H': 17,
      'I': 18,
      'J': 19,
      'K': 20,
      'L': 21,
      'M': 22,
      'N': 23,
      'Ñ': 24,
      'O': 25,
      'P': 26,
      'Q': 27,
      'R': 28,
      'S': 29,
      'T': 30,
      'U': 31,
      'V': 32,
      'W': 33,
      'X': 34,
      'Y': 35,
      'Z': 36
    };

    for (int i = 0; i < curp.length; i++) {
      var posicion = curp[i];

      for (var entrada in verificadores.entries) {
        if (entrada.key == posicion) {
          valor = (entrada.value * contador);
          print('${valor}' + '=' + '${entrada.value}' + '*' + '${contador}');
        }
      }

      contador = contador - 1;

      sumaria = sumaria + valor;
    }

    print(sumaria);

    var i = 2798 % 10;
    print(i);

    //Sacar el residuo
    var num_ver = sumaria % 10;

    print(num_ver);

    //Devuelve el valor absoluto en caso de que sea negativo
    num_ver = num_ver < 0 ? -num_ver : num_ver;

    //En caso de que sea 10 el digito es 0
    if (num_ver != 0) {
      num_ver = 10 - num_ver;
    }

    return num_ver.toString();
  }

  //Verificar si la palabra del nombre es invalida
  es_nombre_invalido(String nombre) {
    switch (nombre.toUpperCase()) {
      case 'DA':
      case 'DAS':
      case 'DE':
      case 'DEL':
      case 'DER':
      case 'DI':
      case 'DIE':
      case 'DD':
      case 'EL':
      case 'LA':
      case 'LOS':
      case 'LAS':
      case 'LE':
      case 'LES':
      case 'MAC':
      case 'MC':
      case 'VAN':
      case 'VON':
        return true;

        break;
    }

    return false;
  }

  generarCurp(String nombre, String apellidoP, String apellidoM, String sexo,
      String fechaNacimiento, String entidadF, context) {
    // Validación de la fecha de nacimiento
    if (fechaNacimiento.length < 10) {
      alertDialog(context, "Error: La fecha no puede ser menor a 10 digitos");
    } else {
      DateTime fecha = DateFormat('dd-MM-yyyy').parse(fechaNacimiento);
      String fechaFormateada = DateFormat('yyyy-MM-dd').format(fecha);
      DateTime fechaNac = DateTime.parse(fechaFormateada);
      DateTime fechaActual = DateTime.now();
      print(fechaNac);
      if (fechaNac.isAfter(fechaActual)) {
        alertDialog(context,
            "Error: la fecha de nacimiento no puede ser mayor al día actual");
        print("Error: la fecha de nacimiento no puede ser mayor al día actual");
      } else {
        if (apellidoM == '') {
          apellidoM = "X";
        }
        print(nombre);
        print(apellidoP);
        print(apellidoM);
        print(sexo);
        print(fechaNacimiento);
        print(entidadF);
        replaceAllLetter rpl = new replaceAllLetter();
        entidadF = rpl.replaceLetter(entidadF);
        entidadF = entidadF.replaceAll(" ", "");
        var enie = "Ñ";
        var ascii = enie.codeUnitAt(0);
        nombre = removeDiacriticsn(nombre).toUpperCase();
        apellidoP = removeDiacriticsn(apellidoP).toUpperCase();
        //apellidoM = removeDiacriticsn(apellidoM).toUpperCase();
        List<String> lista_nombres = nombre.split(" ");
        List<String> nacimiento = fechaNacimiento.split("-");
        String dia_nacimiento = nacimiento[0];
        String mes_nacimiento = nacimiento[1];
        String anio_nacimiento = nacimiento[2];
        sexo = sexo.trim().toUpperCase();
        String curp = "";

        print(nombre);
        print(apellidoP);
        print(apellidoM);
        print(sexo);
        print(fechaNacimiento);
        print(entidadF);

        /* Si el primer nombre es jose o maria, y tiene más nombres,
    se remueve el primer nombre*/
        if (lista_nombres.length > 1 &&
            (lista_nombres[0] == 'JOSE' ||
                lista_nombres[0] == 'J.' ||
                lista_nombres[0] == 'J' ||
                lista_nombres[0] == 'MARIA' ||
                lista_nombres[0] == 'MA.' ||
                lista_nombres[0] == 'MA')) {
          lista_nombres.removeAt(0);
        }

        String nombreFinal;
        List<String> lista_nombres_aux = [];
        for (var i = 0; i < lista_nombres.length; i++) {
          nombreFinal = lista_nombres[i];

          if (!this.es_nombre_invalido(nombreFinal)) {
            lista_nombres_aux.add(nombreFinal);
          }
        }

        lista_nombres = lista_nombres_aux;

        /* Si el apellido es compuesto, verifica que no tenga palabras invalidas */
        List<String> array_ap = apellidoP.split("");

        List<String> array_am = apellidoM.split("");
        List<String> array_ap_aux = [];
        List<String> array_am_aux = [];

        //Validacón del primer apellido
        if (array_ap.length > 1) {
          for (var i = 0; i < array_ap.length; i++) {
            var apellido = array_ap[i];

            if (!this.es_nombre_invalido(apellido)) {
              array_ap_aux.add(apellido);
            }
          }

          apellidoP = array_ap_aux.join("");
        }

        //Validamos el segundo apellido
        if (array_am.length > 1) {
          for (var i = 0; i < array_am.length; i++) {
            var apellido = array_am[i];
            if (!this.es_nombre_invalido(apellido)) {
              array_am_aux.add(apellido);
            }
          }

          apellidoM = array_am_aux.join(" ");
        }

        /*
      Primer carácter alfabético del primer apellido.
      Si el carácter es la letra "Ñ", entonces se
      asigna la letra "X" en su lugar.
    */

        var aux = "X";
        if (array_ap[0].toUpperCase().codeUnitAt(0) == ascii) {
          curp = "X";
        } else {
          curp = array_ap[0].toUpperCase();
        }

        //Al convertir en arreglo el apellido, se devuelve sin la
        //primera letra ya que no se toma en cuenta

        array_ap = apellidoP.substring(1).split("");
        var previous_letter = null;

        for (var letter in array_ap) {
          var letter_aux = removeDiacritics(letter);

          if (this.vowels.contains(letter_aux)) {
            /**
                 * Si en los apellidos o en el nombre aparecieran caracteres
                 * especiales como diagonal (/), guión (-), o punto (.), se captura tal
                 * cual viene en el documento probatorio y la aplicación asignará una
                 * "X" en caso de que esa posición intervenga para la conformación
                 * de la clave.
                 */
            if (previous_letter != '/' &&
                previous_letter != '-' &&
                previous_letter != '.') {
              aux = letter_aux;
            }

            break;
          }

          previous_letter = letter_aux;
        }

        curp = curp + aux;

        /**
         * Primer carácter alfabético del segundo apellido.
         * Si el carácter es la letra "Ñ", entonces se
         * asigna la letra "X" en su lugar.
         * Si no tine segundo apellido entonces asigna
         * la letra "X" en su lugar.
         */

        array_am = apellidoM.split("");

        if (!array_am.isEmpty &&
            array_am[0].toUpperCase().codeUnitAt(0) != ascii) {
          curp = curp + array_am[0];
        } else {
          curp = curp + "X";
        }

        /**
         * Primer carácter alfabético del primer nombre, en caso de José o María
         * se empleara el segundo nombre si lo hubiera.
         */

        var primerNombre = lista_nombres[0].substring(0, 1);
        var primer_nombre_primer_caracter = primerNombre[0];

        if (primer_nombre_primer_caracter.toUpperCase().codeUnitAt(0) ==
            ascii) {
          curp = curp + "X";
        } else {
          curp = curp + primer_nombre_primer_caracter;
        }

        //Dos ultimos datos del año de nacimiento
        curp = curp +
            anio_nacimiento
                .toString()
                .substring(anio_nacimiento.toString().length - 2);

        curp = curp + mes_nacimiento.toString();
        curp = curp + dia_nacimiento.toString();
        curp = curp + sexo.substring(0, 1);

        //ENTIDAD
        if (!entidades.containsKey(entidadF)) {
          return '';
        }

        curp = curp + entidades[entidadF]['abrev'];

        //Primer consonante no inicial del apellido paterno
        aux = "X";
        array_ap = apellidoP.substring(1).split("");

        for (var letter in array_ap) {
          var letter_aux = removeDiacritics(letter);

          if (this.consonante.contains(letter_aux)) {
            aux = letter_aux;
            break;
          }
        }
        curp = curp + aux;

        //primer consonante no inicial del segundo apellido
        aux = "X";
        array_am = apellidoM.substring(1).split("");
        for (var letter in array_am) {
          var letter_aux = letter;

          print(letter_aux);
          if (this.consonante.contains(letter_aux)) {
            if (letter_aux.toUpperCase().codeUnitAt(0) == ascii) {
              aux = "X";
            } else {
              aux = letter_aux;
            }

            break;
          }
        }

        curp = curp + aux;

        //Primer consonante no inicial del nombre
        aux = "X";
        var primer_nombre_letras = lista_nombres[0].substring(1).split("");
        for (var letter in primer_nombre_letras) {
          if (this.consonante.contains(letter)) {
            aux = letter;
            break;
          }
        }
        curp = curp + aux;

        //Dos digitos para evitar duplicaciones

        //Homoclave

        curp = curp + (int.parse(anio_nacimiento) < 2000 ? '0' : 'A');

        curp = curp + digito_verificador(curp.toUpperCase());

        //Quitar palabra antisonante
        curp = cambiar_palabra_antisonante(curp);
        print(curp);

        return curp;
      }
    }
    return '';
  }

  cambiar_palabra_antisonante(String curp) {
    print(curp);
    var primeras_4_letras = curp.substring(0, 4);
    print(primeras_4_letras);

    String curpFinal;

    switch (primeras_4_letras) {
      case 'BACA':
      case 'BAKA':
      case 'BUEI':
      case 'BUEY':
      case 'CACA':
      case 'CACO':
      case 'CAGA':
      case 'CAGO':
      case 'CAKA':
      case 'CAKO':
      case 'COGE':
      case 'COGI':
      case 'COJA':
      case 'COJE':
      case 'COJI':
      case 'COJO':
      case 'COLA':
      case 'CULO':
      case 'FALO':
      case 'FETO':
      case 'GETA':
      case 'GUEI':
      case 'GUEY':
      case 'JETA':
      case 'JOTO':
      case 'KACA':
      case 'KACO':
      case 'KAGA':
      case 'KAGO':
      case 'KAKA':
      case 'KAKO':
      case 'KOGE':
      case 'KOGI':
      case 'KOJA':
      case 'KOJE':
      case 'KOJI':
      case 'KOJO':
      case 'KOLA':
      case 'KULO':
      case 'LILO':
      case 'LOCA':
      case 'LOCO':
      case 'LOKA':
      case 'LOKO':
      case 'MAME':
      case 'MAMO':
      case 'MEAR':
      case 'MEAS':
      case 'MEON':
      case 'MIAR':
      case 'MION':
      case 'MOCO':
      case 'MOKO':
      case 'MULA':
      case 'MULO':
      case 'NACA':
      case 'NACO':
      case 'PEDA':
      case 'PEDO':
      case 'PENE':
      case 'PIPI':
      case 'PITO':
      case 'POPO':
      case 'PUTA':
      case 'PUTO':
      case 'QULO':
      case 'RATA':
      case 'ROBA':
      case 'ROBE':
      case 'ROBO':
      case 'RUIN':
      case 'SENO':
      case 'TETA':
      case 'VACA':
      case 'VAGA':
      case 'VAGO':
      case 'VAKA':
      case 'VUEI':
      case 'VUEY':
      case 'WUEI':
      case 'WUEY':
        curp = curp.replaceRange(1, 2, "X");
        print(curp);
        break;
    }

    return curp;
  }
}
