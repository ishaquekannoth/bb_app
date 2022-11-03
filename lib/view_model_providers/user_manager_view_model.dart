import 'package:bb_app/utils/push_function.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserManagerViewModel extends ChangeNotifier {
  onLogoutButtonPress() {
    FlutterSecureStorage pref = const FlutterSecureStorage();
    pref.write(key: "isLoggedIn", value: "false");
    pref.write(key: "token", value: "");
    PushFunctions.pushAndRemoveUntilNamed(Routes.splash);
  }
}
