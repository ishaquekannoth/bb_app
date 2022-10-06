import 'package:bb_app/utils/design_widget.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/Screens/registration/sign_in/sign_in_screen.dart';
import 'package:bb_app/view_model_providers/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInViewModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BookMe Up',
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          primarySwatch: Colors.deepPurple,
        ),
        initialRoute: Routes.signIn,
        routes: {
          Routes.signIn: (context) => const SignIn(),
          Routes.test: (context) => const RegistrationScreen()
        },
      ),
    );
  }
}
