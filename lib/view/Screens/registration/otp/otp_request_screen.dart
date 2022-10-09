import 'package:bb_app/view/Screens/registration/widgets/custom_form_field.dart';
import 'package:bb_app/view_model_providers/otp_request_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTPrequestScreen extends StatelessWidget {
  const OTPrequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<OTPRequestResponseViewModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: pageController.otpFormKey,
              autovalidateMode: AutovalidateMode.always,
              child: CustomFormField(
                  hintText: "Phone Number",
                  controller: pageController.phoneNumberController,
                  type: FieldType.phoneNumber),
            ),
            pageController.isLoading == true
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () =>
                        pageController.onOTPrequestButtonPress(context),
                    child: const Text("Request OTP"))
          ],
        ),
      ),
    );
  }
}
