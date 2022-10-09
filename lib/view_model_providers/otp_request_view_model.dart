import 'package:bb_app/model/otp/otp_request_model.dart';
import 'package:bb_app/model/otp/otp_request_response_model.dart';
import 'package:bb_app/services/registration_services/otp_request_service.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/common_widgets/show_snackbar_widget.dart';
import 'package:flutter/material.dart';

class OTPRequestViewModel extends ChangeNotifier {
  final phoneNumberController = TextEditingController();
  bool isLoading = false;
  final otpFormKey = GlobalKey<FormState>();

  void onOTPbuttonPress(BuildContext context) async {
    if (otpFormKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final phoneNumber = phoneNumberController.text.trim();
      final data = OTPrequestModel(phoneNumber: phoneNumber);
      OTPrequestResponseModel? otpRequestResponse =
          await OTPService().otpRequestService(data);
      if (otpRequestResponse == null) {
        ShowMySnackBar.popUpSnackBar(context,
            message: 'No response..Try Again');
        isLoadingToggler();
        return;
      } else if (otpRequestResponse.isSuccess == true) {
        isLoadingToggler();
        Navigator.of(context).pushNamed(Routes.test);
      } else {
        ShowMySnackBar.popUpSnackBar(context,
            message: otpRequestResponse.message.toString());
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
