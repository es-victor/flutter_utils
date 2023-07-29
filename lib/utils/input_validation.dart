import 'package:flutter/services.dart';

class InputValidation {
  ///
  static FilteringTextInputFormatter digitsOnly =
      FilteringTextInputFormatter.allow(
    RegExp(r'^\d*'),
  );

  ///
  static FilteringTextInputFormatter twoDecimalNumber =
      FilteringTextInputFormatter.allow(
    RegExp(r'^\d*\.?\d{0,2}'),
  );

  ///
  static isValidEmail(String value) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
    return !regExp.hasMatch(value);
  }

  ///
  static isValidDateFormat(String value) {
    try {
      List<String> s = value.split("/");
      if (s.last.length == 4 &&
          !int.parse(s.first).isNaN &&
          s.first.length == 2 &&
          !int.parse(s.last).isNaN &&
          s[1].length == 2 &&
          !int.parse(s[1]).isNaN) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
