import 'package:bb_app/View/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignIn extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: formKey,
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
                  const CustomFormField(
                    hintText: "Email",
                    type: FieldType.eMail,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const CustomFormField(
                    hintText: "Password",
                    type: FieldType.password,
                    icon: Icons.password,
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
                  GFButton(
                    onPressed: () {
                      formKey.currentState?.validate();
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
                          // // Navigator.of(context).pushNamed(SignUp.routeName);
                          // showModalBottomSheet(
                          //   isScrollControlled: true,
                          //   shape: const RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.vertical(
                          //           top: Radius.circular(20))),
                          //   context: context,
                          //   builder: (context) => OTPverifier(),
                          // ).then((value) {                           
                          //   signUpProv.clearControllers();
                          //   signUpProv.changeOTPfieldStatus(false);
            
                          // });
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