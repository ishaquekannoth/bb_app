import 'package:flutter/material.dart';

class ShowMySnackBar {
  static popUpSnackBar(BuildContext context,{required String message, Color? color}) {
    return 
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(10),
        content: Text(
          message,
          style: const TextStyle(
              letterSpacing: 2, fontWeight: FontWeight.w500, fontSize: 14),
          textAlign: TextAlign.center,
        )));
  }
}
