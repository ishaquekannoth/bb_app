import 'package:bb_app/utils/colors.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/Screens/registration/widgets/custom_form_field.dart';
import 'package:bb_app/view_model_providers/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<SignUpViewModel>(context);
    final routeArg = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: const Color(0xff380231),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Registration'),
      ),
      body: Stack(
        children: [
          Container(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: pageController.signUpFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircleAvatar(
                                  radius: 35,
                                )
                              ])),
                      Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CustomFormField(
                            type: FieldType.normalInputField,
                            hintText: "User Name",
                            icon: Icons.person,
                            controller: pageController.nameController,
                          )),
                      Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CustomFormField(
                            type: FieldType.eMail,
                            hintText: "E-Mail",
                            icon: Icons.email,
                            controller: pageController.emailController,
                          )),
                      Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: CustomFormField(
                          type: FieldType.password,
                          hintText: "Password",
                          icon: Icons.password,
                          controller: pageController.passwordController,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      pageController.isLoading == true
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              child: const Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () => {
                                pageController.onRegisterButton(
                                    routeArg.toString(), context)
                              },
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            child: const Text(
                              'Already have an account ? Sign in here',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: KColors.kWhiteColor),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(Routes.signIn);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
