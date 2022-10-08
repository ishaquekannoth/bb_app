import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  HeadingText({
    required this.text,
    this.style = const TextStyle(fontWeight: FontWeight.w600),
    this.fontWeight,
    this.padding = const EdgeInsets.only(left: 10, top: 0, bottom: 0, right: 0),
    this.margin = const EdgeInsets.only(left: 0, top: 0, bottom: 10, right: 0),
    Key? key,
  }) : super(key: key);
  final String text;
  TextStyle? style;
  FontWeight? fontWeight = FontWeight.w600;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: padding,
      margin: margin,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
