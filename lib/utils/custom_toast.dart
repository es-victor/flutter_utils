import 'package:fluttertoast/fluttertoast.dart';

import '../colors.dart';

class CustomToast {
  static success(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 12,
      backgroundColor: cToastSuccess,
      timeInSecForIosWeb: 2,
    );
  }

  static successTop(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      fontSize: 12,
      backgroundColor: cToastSuccess,
      timeInSecForIosWeb: 2,
    );
  }

  static errorPrimary(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 12,
      backgroundColor: cGrey8,
      textColor: cGrey2,
      timeInSecForIosWeb: 2,
    );
  }

  static errorPrimaryTop(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      fontSize: 12,
      backgroundColor: cGrey8,
      textColor: cGrey2,
      timeInSecForIosWeb: 2,
    );
  }

  static errorSecondary(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 12,
      backgroundColor: cToastError,
      timeInSecForIosWeb: 2,
    );
  }

  static errorSecondaryTop(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      fontSize: 12,
      backgroundColor: cToastError,
      timeInSecForIosWeb: 2,
    );
  }

  static normal(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      fontSize: 12,
      textColor: cWhite,
      backgroundColor: cGrey3,
      timeInSecForIosWeb: 2,
    );
  }

  static primary(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      fontSize: 12,
      backgroundColor: cToastDefault,
      timeInSecForIosWeb: 2,
    );
  }
}
