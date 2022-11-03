import 'package:flutter/material.dart';

class PushFunctions {
  static final GlobalKey<NavigatorState> globalNavigationKey =
      GlobalKey<NavigatorState>();
  static push(page) {
    globalNavigationKey.currentState
        ?.push(MaterialPageRoute(builder: (context) => page));
  }

  static pushAndRemoveUntilNamed(String route) {
    globalNavigationKey.currentState
        ?.pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }
   static pushReplacementNamed(String route) {
    globalNavigationKey.currentState
        ?.pushReplacementNamed(route);
  }

  static pushAndRemoveUntil(page) {
    globalNavigationKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => page,
        ),
        (route) => false);
  }

  

  static pushReplace(page) {
    globalNavigationKey.currentState
        ?.pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  static pop() {
    globalNavigationKey.currentState?.pop();
  }
}
