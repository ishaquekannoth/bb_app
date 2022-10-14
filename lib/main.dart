import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/Screens/favourites/booking_history.dart';
import 'package:bb_app/view/Screens/home_screen/homescreen.dart';
import 'package:bb_app/view/Screens/hotels/single_hotel_details.dart';
import 'package:bb_app/view/Screens/profile/profile.dart';
import 'package:bb_app/view/Screens/registration/otp/otp_modal_screen.dart';
import 'package:bb_app/view/Screens/registration/otp/otp_request_screen.dart';
import 'package:bb_app/view/Screens/registration/sign_in/sign_in_screen.dart';
import 'package:bb_app/view/Screens/registration/sign_up/sign_up_screen.dart';
import 'package:bb_app/view/Screens/search/search_screen.dart';
import 'package:bb_app/view/main_displayer_page/main_displayer_page.dart';
import 'package:bb_app/view_model_providers/main_page_navbar_provider.dart';
import 'package:bb_app/view_model_providers/otp_request_view_model.dart';
import 'package:bb_app/view_model_providers/sign_in_provider.dart';
import 'package:bb_app/view_model_providers/sign_up_view_model.dart';
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
        ChangeNotifierProvider(create: (context) => SignInViewModel()),
        ChangeNotifierProvider(create: (context) => MainPageViewModel()),
        ChangeNotifierProvider(
            create: (context) => OTPRequestResponseViewModel()),
        ChangeNotifierProvider(create: (context) => SignUpViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BookMe Up',
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          primarySwatch: Colors.deepPurple,
        ),
        initialRoute: Routes.mainDisplayer,
        routes: {
          Routes.mainDisplayer: (context) => const MainDisplayer(),
          Routes.home: (context) => const HomeScreen(),
          Routes.signIn: (context) => const SignIn(),
          Routes.otpRequestScreen: (context) => const OTPrequestScreen(),
          Routes.otpModalScreen: (context) => const OTPmodalWidget(),
          Routes.searchScreen: (context) => const SearchScreen(),
          Routes.favourites: (context) => const FavouritesScreen(),
          Routes.profile: (context) => const ProfileScreen(),
          Routes.signUp: (context) => const SignUpScreen(),
          Routes.singleHotelDetails: (context) =>
              const SingleHotelDetailsScreen()
        },
      ),
    );
  }
}
