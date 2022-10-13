

import 'package:bb_app/model/sign_up/sign_up_request_model.dart';
import 'package:bb_app/model/sign_up/sign_up_response_model.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/common_widgets/show_snackbar_widget.dart';
import 'package:flutter/cupertino.dart';

import '../services/registration_services/sign_up_service.dart';

class SignUpViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  bool isLoading = false;
  final signUpFormKey = GlobalKey<FormState>();

  onRegisterButton(String phoneNumber, context) async {
    if (signUpFormKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final name = nameController.text.trim();
      final data = SignUpRequestModel(
          email: email, password: password, name: name, phone: phoneNumber);
      SignUpResponseModel? signUpResponse =
          await SignupService().signMeUp(data);
      if (signUpResponse == null) {
        ShowMyPopUp.popUpMessenger(context,
            type: PopUpType.snackBar, message: 'No response..Try Again');
        isLoadingToggler();
        return;
      } else if (signUpResponse.isSuccess == true) {
        isLoadingToggler();
        ShowMyPopUp.popUpMessenger(context,
            type: PopUpType.toast, message: 'Registered Successfully');
        await Future.delayed(const Duration(seconds: 1));
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.mainDisplayer, (Route<dynamic> route) => false);
      } else {
        ShowMyPopUp.popUpMessenger(context,
            type: PopUpType.snackBar,
            message: signUpResponse.message.toString());
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
