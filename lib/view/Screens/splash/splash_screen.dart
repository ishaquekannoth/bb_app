import 'dart:async';

import 'package:bb_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model_providers/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashController =
        Provider.of<SplashViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 2), () {
        splashController.checkLogin();
      });
    });
    return Scaffold(
      backgroundColor: KColors.kThemePurple,
      body: Center(
          child: Image.asset(
        'lib/assets/images/sign_up.jpg',
        height: 120,
      )),
    );
  }
}
