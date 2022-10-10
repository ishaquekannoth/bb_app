import 'package:bb_app/view/Screens/registration/otp/otp_modal_screen.dart';
import 'package:flutter/material.dart';

popUpModalSheet(context) async {
  final size = MediaQuery.of(context).size;
  return await showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) => SizedBox(
          width: size.width * 0.8,
          height: size.height * 0.7,
          child: const OTPmodalWidget()));
}
