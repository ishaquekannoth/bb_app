import 'package:bb_app/view/Screens/registration/widgets/custom_form_field.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: ListView(
              children: [
                Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [CircleAvatar()])),
                Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: const CustomFormField(
                      type: FieldType.normalInputField,
                      hintText: "User Name",
                      icon: Icons.person,
                    )),
                Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: const CustomFormField(
                      type: FieldType.eMail,
                      hintText: "E-Mail",
                      icon: Icons.email,
                    )),
                Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: const CustomFormField(
                    type: FieldType.password,
                    hintText: "Password",
                    icon: Icons.password,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50.0,
                      width: 210.0,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 40.0),
                      child: ElevatedButton(
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => {},
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text(
                        'Already have an account ? Sign in here',
                        style: TextStyle(fontWeight: FontWeight.bold),
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
          )),
    );
  }
}
