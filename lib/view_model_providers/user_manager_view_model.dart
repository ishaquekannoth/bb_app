import 'package:bb_app/utils/push_function.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserManagerViewModel extends ChangeNotifier {
  FlutterSecureStorage? signIndata;
  String? _userName = '';
  String? _phoneNumber = '';
  String? _token = '';
  String? _email = '';

  UserManagerViewModel() {
    onInit();
  }
  onInit() async {
    _userName = await const FlutterSecureStorage().read(key: "name");
    _phoneNumber = await const FlutterSecureStorage().read(key: "phone");
    _token = await const FlutterSecureStorage().read(key: "token");
    _email = await const FlutterSecureStorage().read(key: "emailId");
    notifyListeners();
  }

  onLogoutButtonPress() async {
    FlutterSecureStorage pref = const FlutterSecureStorage();
    await pref.deleteAll();
    await pref.write(key: "isLoggedIn", value: "false");
    await pref.write(key: "token", value: "");
    PushFunctions.pushAndRemoveUntilNamed(Routes.splash);
  }

  String get userName => _userName ?? "";
  String get phone => _phoneNumber ?? "";
  String get token => _token ?? "";
  String get email => _email ?? "";
}
