import 'package:bb_app/model/otp/otp_request_response_model.dart';
import 'package:bb_app/view_model_providers/otp_request_view_model.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OTPmodalWidget extends StatelessWidget {
  const OTPmodalWidget({this.otpResponseWithHash, super.key});
  final OTPrequestResponseModel? otpResponseWithHash;
  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<OTPRequestResponseViewModel>(context);
    // final routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as OTPrequestResponseModel;
    return Scaffold(
      body: Container(
        
        margin: const EdgeInsets.all(25),
        child: Form(
          key: pageController.otpVerificationFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: PinCodeTextField(
                  autoDisposeControllers: false,
                  errorTextMargin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.7),
                  pinTheme: const PinTheme.defaults(
                      shape: PinCodeFieldShape.circle,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white),
                  enableActiveFill: true,
                  errorTextSpace: 40,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.length != 6) {
                      return "Invalid OTP";
                    }
                    return null;
                  },
                  controller: pageController.otpController,
                  appContext: context,
                  length: 6,
                  onChanged: (value) {},
                ),
              ),
              pageController.isLoading == true
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        pageController.onVerifyOTP(context);
                      },
                      child: const Text('Verify'))
            ],
          ),
        ),
      ),
    );
  }
}
