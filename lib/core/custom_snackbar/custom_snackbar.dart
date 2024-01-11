import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
