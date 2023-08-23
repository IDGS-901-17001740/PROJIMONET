import 'package:flutter/services.dart';

class AlphaNumericInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Solo permitir letras y números
    final newString = newValue.text.replaceAll(RegExp(r'[^\w\sÑ./]+'), '');
    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}

class NumericInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Solo permitir letras y números
    final newString = newValue.text.replaceAll(RegExp(r'[^\w\sÑ/]+'), '');
    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}
