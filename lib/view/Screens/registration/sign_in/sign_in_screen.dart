import 'package:bb_app/utils/colors.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/Screens/registration/widgets/custom_form_field.dart';
import 'package:bb_app/view_model_providers/otp_request_view_model.dart';
import 'package:bb_app/view_model_providers/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    final signInProv = Provider.of<SignInViewModel>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: KColors.kWhiteColor,
      resizeToAvoidBottomInset: true,
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: signInProv.signInFormKey,
        child: Container(
          margin: const EdgeInsets.all(10),
          height: height * .99,
          width: width * .99,
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: const Text(
                          "Please fill your details to acess your account",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .03),
                  CustomFormField(
                    hintText: "Email/phone",
                    type: FieldType.eMail,
                    controller: signInProv.emailController,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomFormField(
                    hintText: "Password",
                    type: FieldType.password,
                    icon: Icons.password,
                    controller: signInProv.passwordController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: height * .02),
                  signInProv.isLoading
                      ? const CircularProgressIndicator()
                      : GFButton(
                          onPressed: () {
                            signInProv.onSigninButtonPress(context);
                          },
                          blockButton: true,
                          shape: GFButtonShape.standard,
                          borderShape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          text: "Sign In",
                          color: Theme.of(context).primaryColorDark,
                          fullWidthButton: true,
                          size: GFSize.LARGE,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                  SizedBox(height: height * .02),
                  SocialLoginButton(
                      width: width * 0.71,
                      height: height * 0.05,
                      buttonType: SocialLoginButtonType.google,
                      onPressed: () {}),
                  SizedBox(height: height * .02),
                  SocialLoginButton(
                      width: width * 0.71,
                      height: height * 0.05,
                      buttonType: SocialLoginButtonType.facebook,
                      onPressed: () {}),
                  SizedBox(height: height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text(
                          'Dont have an account ? Sign Up here',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Provider.of<OTPRequestResponseViewModel>(context,listen: false)
                              .disposeControllers();
                          Navigator.of(context)
                              .pushNamed(Routes.otpRequestScreen);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
