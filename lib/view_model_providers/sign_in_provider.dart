import 'package:bb_app/model/sign_in/sign_in_request_model.dart';
import 'package:bb_app/model/sign_in/sign_in_response.dart';
import 'package:bb_app/services/registration_services/sign_in_service.dart';
import 'package:bb_app/utils/colors.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/common_widgets/show_snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  FlutterSecureStorage signedInData = const FlutterSecureStorage();
  final signInFormKey = GlobalKey<FormState>();
  

  void onSigninButtonPress(context) async {
    if (signInFormKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final data = SignInRequestModel(email: email, password: password);
      SignInResponseModel? signInResponse =
          await SignInService().signMeIn(data);
      if (signInResponse == null) {
        ShowMyPopUp.popUpMessenger(context,
            toastColor: KColors.kRedColor,
            type: PopUpType.toast,
            message: 'No response..Try Again');
        isLoadingToggler();
        return;
      } else if (signInResponse.isSuccess == true) {
        isLoadingToggler();
        await signedInData.deleteAll();
        await signedInData.write(
            key: "token", value: signInResponse.profile?.token);
        await signedInData.write(key: "isLoggedIn", value: "true");
        await signedInData.write(key: "emailId", value: signInResponse.profile!.email.toString());
        await signedInData.write(key: "name", value: signInResponse.profile!.name.toString());
        await signedInData.write(key: "phone", value: signInResponse.profile!.phone.toString());
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Routes.mainDisplayer, (route) => false);
      } else {
        ShowMyPopUp.popUpMessenger(context,
            type: PopUpType.toast,
            toastColor: KColors.kRedColor,
            message: signInResponse.message.toString());
        isLoadingToggler();
        return;
      }
    }
  }

  void isLoadingToggler() {
    isLoading = !isLoading;
    notifyListeners();
  }

  //FlutterSecureStorage get userLoggedIn => signedInData;
}
