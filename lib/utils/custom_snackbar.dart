import 'package:flutter/material.dart';

import '../constants.dart';

class CustomSnackbar {
  CustomSnackbar();
  static snackbar({
    required BuildContext context,
    required String text,
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Theme.of(context).primaryColor,
        margin: const EdgeInsets.all(p2),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
