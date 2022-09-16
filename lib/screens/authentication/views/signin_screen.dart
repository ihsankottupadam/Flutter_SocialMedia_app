import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/helpers/ui_helper.dart';
import 'package:social_media/screens/authentication/views/forgot_password.dart';
import 'package:social_media/screens/authentication/views/signup_screen.dart';

import 'package:social_media/widets/input_field.dart';
import 'package:social_media/extensions/better_context.dart';

import '../../../widets/google_button.dart';
import '../providers/signin_provider.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInProvider(),
      child: Scaffold(
        // backgroundColor: Colors.white,
        // TODO:check another solution for resposive padding
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double maxWidth = constraints.maxWidth;
              bool isLandscape = maxWidth > constraints.maxHeight;
              SignInProvider provider = context.read<SignInProvider>();
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isLandscape ? maxWidth * 0.2 : maxWidth * 0.05),
                child: Center(
                  child: SingleChildScrollView(
                    child: SizedBox(
                        width: double.infinity,
                        child: Form(
                            key: provider.formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Image.asset(
                                //   'assets/images/vimo_logo.png',
                                //   width: 100,
                                // ),
                                const Text('Sign In',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                const SizedBox(height: 40),
                                InputField(
                                  controller: provider.emailController,
                                  hintText: 'Email',
                                  validator: provider.checkEmail,
                                ),
                                UiHelper.verticalSpaceMed,
                                InputField(
                                  controller: provider.passwordController,
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
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () =>
                                            provider.forgotPassword(context),
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
                                  child: Consumer<SignInProvider>(
                                      builder: (context, provider, _) {
                                    return ElevatedButton(
                                        onPressed: () {
                                          if (!provider.isLoading) {
                                            provider.signIn(context);
                                          }
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
                                            : const Text('Sign in'));
                                  }),
                                ),
                                UiHelper.verticalSpaceMed,
                                const GoogleButton(),
                                const SizedBox(height: 40),
                                RichText(
                                    text: TextSpan(
                                        text: 'Don\'t have account, ',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: [
                                      TextSpan(
                                          text: 'Sign up',
                                          style: const TextStyle(
                                            color: Colors.blue,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => context.pushReplace(
                                                const SignUpScreen()))
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
