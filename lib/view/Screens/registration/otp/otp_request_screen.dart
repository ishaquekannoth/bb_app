import 'package:bb_app/utils/colors.dart';
import 'package:bb_app/utils/image_constants.dart';
import 'package:bb_app/view/Screens/registration/widgets/custom_form_field.dart';
import 'package:bb_app/view_model_providers/otp_request_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTPrequestScreen extends StatelessWidget {
  const OTPrequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<OTPRequestResponseViewModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: KColors.kWhiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 200,
                height: 200,
                child: Center(
                    child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Image.asset("lib/assets/images/NoImage.png"),
                  imageUrl: bridalImage,
                  fit: BoxFit.cover,
                ))),
            Form(
              key: pageController.otpFormKey,
              autovalidateMode: AutovalidateMode.always,
              child: CustomFormField(
                  icon: Icons.phone_android_outlined,
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
