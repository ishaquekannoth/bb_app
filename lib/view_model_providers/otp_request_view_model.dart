import 'package:bb_app/model/otp/otp_request_model.dart';
import 'package:bb_app/model/otp/otp_request_response_model.dart';
import 'package:bb_app/model/otp/otp_verification_request_model.dart';
import 'package:bb_app/model/otp/otp_verification_response_model.dart';
import 'package:bb_app/services/registration_services/otp_request_verify_service.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/common_widgets/show_snackbar_widget.dart';
import 'package:flutter/material.dart';

class OTPRequestResponseViewModel extends ChangeNotifier {
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  bool isLoading = false;
  final otpFormKey = GlobalKey<FormState>();
  final otpVerificationFormKey = GlobalKey<FormState>();

  onOTPrequestButtonPress(context) async {
    if (otpFormKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final phoneNumber = phoneNumberController.text.trim();
      final data = OTPrequestModel(phoneNumber: phoneNumber);
      OTPrequestResponseModel? otpRequestResponse =
          await OTPService().otpRequestService(data);
      if (otpRequestResponse == null) {
        ShowMyPopUp.popUpSnackBar(context,
            popUpType: PopUpType.snackBar, message: 'No response..Try Again');
        isLoadingToggler();
        return;
      } else if (otpRequestResponse.isSuccess == true) {
        isLoadingToggler();
        Navigator.of(context)
            .pushNamed(Routes.otpModalScreen, arguments: otpRequestResponse);
      } else {
        ShowMyPopUp.popUpSnackBar(context,
            popUpType: PopUpType.snackBar,
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

  onVerifyOTP(OTPrequestResponseModel withHash, context) async {
    if (otpVerificationFormKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final OTPverificationRequestModel data = OTPverificationRequestModel(
          hashkey: withHash.hashKey.toString(), otp: otpController.text);

      final OTPverificationResponseModel? verificationResponse =
          await OTPService().otpVerificationService(data);

      if (verificationResponse == null) {
        ShowMyPopUp.popUpSnackBar(context,
            popUpType: PopUpType.snackBar, message: 'No response..Try Again');
        isLoadingToggler();
        return;
      } else if (verificationResponse.success == true) {
        isLoadingToggler();
        Navigator.of(context)
            .pushNamed(Routes.test, arguments: phoneNumberController.text);
      } else {
        ShowMyPopUp.popUpSnackBar(context,
            popUpType: PopUpType.snackBar,
            message: verificationResponse.message.toString());
        isLoadingToggler();
        return;
      }
    }
    return null;
  }
}
