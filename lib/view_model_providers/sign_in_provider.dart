import 'package:bb_app/model/sign_in/sign_in_request_model.dart';
import 'package:bb_app/model/sign_in/sign_in_response.dart';
import 'package:bb_app/services/registration_services/sign_in_service.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/common_widgets/show_snackbar_widget.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  final signInFormKey = GlobalKey<FormState>();

  void onSigninButtonPress(BuildContext context) async {
    if (signInFormKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final data = SignInRequestModel(email: email, password: password);
      SignInResponseModel? signInResponse =
          await SignInService().signMeIn(data);
      if (signInResponse == null) {
        ShowMySnackBar.popUpSnackBar(context,
            message: 'No response..Try Again');
        isLoadingToggler();
        return;
      } else if (signInResponse.isSuccess == true) {
        isLoadingToggler();
        Navigator.of(context).pushNamed(Routes.mainDisplayer);
      }
      //  else if (signInResponse.isSuccess == false) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       ShowSnackBar.popUp(message: signInResponse.message.toString()));
      //   isLoadingToggler();
      //   return;
      // }
      else {
      ShowMySnackBar.popUpSnackBar(context,
            message: signInResponse.message.toString());
        isLoadingToggler();
        return;
      }
    } else {
      return null;
    }
  }

  void isLoadingToggler() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
