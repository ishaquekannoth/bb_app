import 'package:bb_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum PopUpType{
  snackBar,
  toast
}


class ShowMyPopUp {
  static popUpMessenger(BuildContext context,
      {required String message, Color? snackbarColor,Color? toastColor,required PopUpType type}) {
    return type==PopUpType.snackBar? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: snackbarColor??KColors.kRedColor,
        margin: const EdgeInsets.all(10),
        content: Text(
          message,
          style: const TextStyle(
              letterSpacing: 2, fontWeight: FontWeight.w500, fontSize: 14),
          textAlign: TextAlign.center,
        ))):Fluttertoast.showToast(msg: message,
          backgroundColor: toastColor??Colors.black
        );
  }
}
