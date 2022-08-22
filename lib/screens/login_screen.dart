import 'package:flutter/material.dart';
import 'package:social_media/helpers/ui_helper.dart';
import 'package:social_media/widets/input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _emailPhoneController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // TODO:check another solution for resposive padding
        body: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;
            bool isLandscape = maxWidth > constraints.maxHeight;
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? maxWidth * 0.2 : maxWidth * 0.05),
              child: Center(
                child: Container(
                    width: double.infinity,
                    child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InputField(
                              controller: _emailPhoneController,
                              hintText: 'Phone number or Email',
                            ),
                            UiHelper.verticalSpaceMed,
                            InputField(
                              controller: _passwordController,
                              hintText: 'Password',
                              isPassword: true,
                              maxLength: 20,
                              validator: (value) {
                                if (value == null) {
                                  return null;
                                }
                                if (value.length < 8) {
                                  return 'Password must contain atleast 8 characters';
                                }
                                return null;
                              },
                            ),
                            UiHelper.verticalSpaceSmall,
                            SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton(
                                    onPressed: save,
                                    child: const Text('Sign In')))
                          ],
                        ))),
              ),
            );
          },
        ),
      ),
    );
  }

  save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
  }
}
