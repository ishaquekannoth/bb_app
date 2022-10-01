import 'package:bb_app/View/Screens/register/sign_in/sign_in_screen.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BB App',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: Routes.home,
      routes: {
        '/': (context) => SignIn(),
      },
    );
  }
}
