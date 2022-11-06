import 'package:bb_app/utils/push_function.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserManagerViewModel extends ChangeNotifier {
  FlutterSecureStorage? signIndata;
  UserManagerViewModel() {
    signIndata = const FlutterSecureStorage();
  }
  onLogoutButtonPress()async {
    FlutterSecureStorage pref = const FlutterSecureStorage();
  await  pref.deleteAll();
  await   pref.write(key: "isLoggedIn", value: "false");
  await   pref.write(key: "token", value: "");
  PushFunctions.pushAndRemoveUntilNamed(Routes.splash);
  }
}
