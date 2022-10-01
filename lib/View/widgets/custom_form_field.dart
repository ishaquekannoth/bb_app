import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum FieldType {
  eMail,
  password,
}

class CustomFormField extends StatelessWidget {
  final FieldType type;
  final String? hintText;
  final IconData? icon;
  final TextEditingController? controller;
  const CustomFormField(
      {
      this.controller,
      required this.type,
      this.hintText = "E-mail",
      super.key,
      this.icon = Icons.email});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(width * 0.01),
      child: TextFormField(
        controller: controller,
        inputFormatters: [
          type == FieldType.eMail
              ? LengthLimitingTextInputFormatter(40)
              : LengthLimitingTextInputFormatter(16)
        ],

        keyboardType: type==FieldType.eMail?TextInputType.emailAddress:TextInputType.none,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: type == FieldType.password,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              icon,
              color: Colors.deepPurple,
            ),
            hintText: hintText,
            errorStyle: const TextStyle(color: Colors.blue),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple)),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple)),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    style: BorderStyle.solid, color: Colors.deepPurple)),
            contentPadding:
                EdgeInsets.only(left: 0, top: 0, bottom: height * 0.02),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)))),
        validator: type == FieldType.eMail
            ? ((value) {
                if (value == '' || value == null) {
                  return "$hintText Cant be empty";
                } else if (value.length < 4) {
                  return "$hintText Must be 6-16 charactors long";
                } else if (!EmailValidator.validate(value)) {
                  return "Invalid Email";
                } else {
                  return "OK";
                }
              })
            : (value) {
                if (value == '' || value == null) {
                  return "$hintText Cant be empty";
                } else if (value.length < 6 || value.length > 16) {
                  return "Password Must be 6-16 charactors";
                } else {
                  return "OK";
                }
              },
      ),
    );
  }
}