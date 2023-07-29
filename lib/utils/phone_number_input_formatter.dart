import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == -1) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;

      ///
      if (text[0] == "0") {
        if (nonZeroIndex % 4 == 0 &&
            nonZeroIndex != text.length &&
            nonZeroIndex == 4) {
          buffer.write(' '); // Add double spaces.
        } else if ((nonZeroIndex + 2) % 3 == 0 &&
            nonZeroIndex != text.length &&
            nonZeroIndex > 3) {
          buffer.write(' '); // Add double spaces.
        }
      } else {
        if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
          buffer.write(' '); // Add double spaces.
        }
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
