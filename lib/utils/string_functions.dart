import 'package:intl/intl.dart';

/// Capitalize first letter of a String
///
extension StringExtension on String {
  ///
  String capitalized() {
    try {
      if (length == 0) {
        return this;
      } else if (length == 1) {
        return this[0].toUpperCase();
      }
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } catch (e) {
      return this;
    }
  }

  ///
  String removeEndZeros() {
    if (length > 4) {
      return substring(0, length - 3);
    }
    return this;
  }

  ///
  String minutesSeconds() {
    int minute = 0;
    int seconds = 0;
    String time = replaceAll(".0", "");
    minute = int.parse(time) ~/ 60;
    seconds = int.parse(time) % 60;

    return "$minute:${seconds > 9 ? seconds : "0$seconds"}";
  }

  ///
  String phoneNumberFormat() {
    String value = "";
    for (int i = 0; i < length; i++) {
      var j = i + 1;
      if (j % 3 == 0) {
        value = value + this[i];
        value = "$value ";
      } else {
        value = value + this[i];
      }
    }
    return value;
  }

  ///
  dateTimeFromUTC() {
    DateFormat dt = DateFormat("dd/MM/yyyy HH:mm:ss");
    try {
      DateTime dateTime = DateTime.parse(this);
      return dt.format(dateTime);
    } catch (e) {
      return this;
    }
  }

  ///
  secondsToDaysHoursMinutesSeconds() {
    try {
      int seconds = int.parse(this);
      int days = seconds ~/ 86400;
      int hours = (seconds % 86400) ~/ 3600;
      int minutes = (seconds % 86400 % 3600) ~/ 60;
      int second = seconds % 86400 % 3600 % 60;
      return "$days Days ${hours > 9 ? hours : "0$hours"}h ${minutes > 9 ? minutes : "0$minutes"}m ${second > 9 ? second : "0$second"}s";
    } catch (e) {
      return this;
    }
  }

  ///
  dateFromUTC() {
    DateFormat dt = DateFormat("dd/MM/yyyy");
    try {
      DateTime dateTime = DateTime.parse(this);
      return dt.format(dateTime);
    } catch (e) {
      return this;
    }
  }

  /// Process url
  processURL() {
    String url = this;
    try {
      if (url.contains("https://") || url.contains("http://")) {
        return url;
      } else {
        return "https://$url";
      }
    } catch (e) {
      return this;
    }
  }
}
