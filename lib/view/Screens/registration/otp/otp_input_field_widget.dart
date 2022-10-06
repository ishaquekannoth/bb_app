import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SizedBox otpFileds(
      {required TextEditingController controller,
      required BuildContext context,
      required bool isEnabled}) {
    return SizedBox(
      height: 50,
      width: 50,
      child: TextFormField(
        enabled: isEnabled,
        controller: controller,
        decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            errorStyle: TextStyle(color: Colors.blue),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
            disabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    style: BorderStyle.solid, color: Colors.deepPurple)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)))),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            controller.clear();
          }
        },
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }