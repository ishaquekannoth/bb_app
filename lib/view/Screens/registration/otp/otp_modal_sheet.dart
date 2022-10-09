import 'package:bb_app/view/Screens/registration/otp/otp_modal_screen.dart';
import 'package:flutter/material.dart';

popUpModalSheet(context) async{
  return await showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) => const OTPmodalWidget());
}
