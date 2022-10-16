import 'package:flutter/material.dart';

class MyBookings extends StatelessWidget {
  const MyBookings ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
      ),
    );
  }
}
