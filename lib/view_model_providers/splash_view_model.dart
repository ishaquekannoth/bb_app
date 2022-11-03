import 'package:bb_app/utils/push_function.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashViewModel extends ChangeNotifier {
  // this function is to check wheather the user is logged in or not
  Future<void> checkLogin() async {
    FlutterSecureStorage pref = const FlutterSecureStorage();
    final isLogggedIn = await pref.read(key: "isLoggedIn");
    if (isLogggedIn == null || isLogggedIn == "false") {
      PushFunctions.pushAndRemoveUntilNamed(Routes.signIn);
    } else {
      PushFunctions.pushAndRemoveUntilNamed(Routes.mainDisplayer);
    }
  }
}
