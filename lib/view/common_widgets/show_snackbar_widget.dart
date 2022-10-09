import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum PopUpType{snackBar,toast}
class ShowMyPopUp {
  static popUpSnackBar(BuildContext context,
      {required String message, Color? color,required PopUpType popUpType}) {
    return
    popUpType==PopUpType.snackBar? 
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
        ))):()async=>await Fluttertoast.showToast(msg: message,textColor: Colors.black,backgroundColor: Colors.black);
  }

}
