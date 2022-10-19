
import 'package:flutter/material.dart';

popUpModalSheet(context,Widget modalWidget) async {
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
          child: modalWidget));
}
