import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:social_media/helpers/ui_helper.dart';
import 'package:social_media/screens/authentication/views/signin_screen.dart';

import 'package:social_media/widets/input_field.dart';
import 'package:social_media/extensions/better_context.dart';

import '../../../widets/google_button.dart';
import '../providers/signup_provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(context),
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double maxWidth = constraints.maxWidth;
              bool isLandscape = maxWidth > constraints.maxHeight;
              SignUpProvider provider = context.read<SignUpProvider>();
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isLandscape ? maxWidth * 0.2 : maxWidth * 0.05),
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                        width: double.infinity,
                        child: Form(
                            key: context.read<SignUpProvider>().formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InputField(
                                  controller: provider.userNameController,
                                  hintText: 'Username',
                                  validator: provider.checkUserName,
                                ),
                                UiHelper.verticalSpaceMed,
                                InputField(
                                  controller: provider.nameController,
                                  hintText: 'Full Name',
                                  validator: provider.checkName,
                                ),
                                UiHelper.verticalSpaceMed,
                                InputField(
                                  inputType: TextInputType.emailAddress,
                                  controller: provider.emailController,
                                  hintText: 'E-mail',
                                  validator: provider.checkEmail,
                                ),
                                UiHelper.verticalSpaceMed,
                                InputField(
                                  inputType: TextInputType.number,
                                  controller: provider.phoneController,
                                  hintText: 'Phone number',
                                  validator: provider.checkPhoneNumber,
                                  maxLength: 10,
                                ),
                                UiHelper.verticalSpaceMed,
                                InputField(
                                  controller: provider.passwordController,
                                  hintText: 'Password',
                                  isPassword: true,
                                  maxLength: 20,
                                  validator: provider.checkPassword,
                                ),
                                UiHelper.verticalSpaceMed,
                                InputField(
                                  controller: provider.confirmPassController,
                                  hintText: 'Confirm Password',
                                  isPassword: true,
                                  maxLength: 20,
                                  validator: provider.checkConformPassword,
                                ),
                                UiHelper.verticalSpaceMed,
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ),
                                      )
                                    ]),
                                UiHelper.verticalSpaceSmall,
                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: Consumer<SignUpProvider>(
                                      builder: (context, provider, _) {
                                    return ElevatedButton(
                                        onPressed: () {
                                          if (provider.isLoading) return;
                                          provider.signUp();
                                        },
                                        child: provider.isLoading
                                            ? const SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              )
                                            : const Text('Sign Up'));
                                  }),
                                ),
                                UiHelper.verticalSpaceMed,
                                const GoogleButton(),
                                const SizedBox(height: 40),
                                RichText(
                                    text: TextSpan(
                                        text: 'Already have account, ',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: [
                                      TextSpan(
                                          text: 'Sign in',
                                          style: const TextStyle(
                                            color: Colors.blue,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => context.pushReplace(
                                                const SigninScreen()))
                                    ]))
                              ],
                            ))),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
