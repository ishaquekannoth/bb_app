import 'package:bb_app/model/otp/otp_request_model.dart';
import 'package:bb_app/model/otp/otp_request_response_model.dart';
import 'package:bb_app/model/otp/otp_verification_request_model.dart';
import 'package:bb_app/model/otp/otp_verification_response_model.dart';
import 'package:bb_app/services/registration_services/otp_request_verify_service.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/Screens/registration/otp/otp_modal_sheet.dart';
import 'package:bb_app/view/common_widgets/show_snackbar_widget.dart';
import 'package:flutter/material.dart';

class OTPRequestResponseViewModel extends ChangeNotifier {
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  final otpFormKey = GlobalKey<FormState>();
  final otpVerificationFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  String hashForOtp = "";
  String phoneNumber = "";

  onOTPrequestButtonPress(context) async {
    if (otpFormKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final phoneNumber = phoneNumberController.text.trim();
      final data = OTPrequestModel(phoneNumber: phoneNumber);
      OTPrequestResponseModel? otpRequestResponse =
          await OTPService().otpRequestService(data);
      if (otpRequestResponse == null) {
        ShowMyPopUp.popUpMessenger(context,
            message: 'No response..Try Again', type: PopUpType.snackBar);
        isLoadingToggler();
        return;
      } else if (otpRequestResponse.isSuccess == true) {
        isLoadingToggler();
        hashForOtp = otpRequestResponse.hashKey.toString();
        // Navigator.of(context)
        //     .pushNamed(Routes.otpModalScreen);
        popUpModalSheet(context);
      } else {
        ShowMyPopUp.popUpMessenger(context,
            type: PopUpType.snackBar,
            message: otpRequestResponse.message.toString());
        isLoadingToggler();
        return;
      }
    } else {
      return null;
    }
  }

  onVerifyOTP(context) async {
    if (otpVerificationFormKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final OTPverificationRequestModel data = OTPverificationRequestModel(
          hashkey: hashForOtp.toString(), otp: otpController.text);

      final OTPverificationResponseModel? verificationResponse =
          await OTPService().otpVerificationService(data);

      if (verificationResponse == null) {
        ShowMyPopUp.popUpMessenger(context,
            message: 'No response..Try Again', type: PopUpType.toast);
        isLoadingToggler();
        return;
      } else if (verificationResponse.success == true) {
        isLoadingToggler();
        phoneNumber = phoneNumberController.text;
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.signUp, (Route<dynamic> route) => false,
            arguments: phoneNumber);
      } else {
        ShowMyPopUp.popUpMessenger(context,
            type: PopUpType.toast,
            message: verificationResponse.message.toString());
        isLoadingToggler();
        return;
      }
    }
    return null;
  }

  void isLoadingToggler() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void disposeControllers() {
    phoneNumberController.clear();
    otpController.clear();
    notifyListeners();
  }

  void onChangeRequest(BuildContext context) {
    disposeControllers();
    notifyListeners();
    Navigator.of(context).pop();
  }
}
