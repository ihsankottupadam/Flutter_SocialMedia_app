import 'package:flutter/material.dart';
import 'package:social_media/extensions/better_context.dart';
import 'package:social_media/extensions/string.dart';
import 'package:social_media/screens/authentication/views/signin_screen.dart';
import 'package:social_media/services/auth_service.dart';

import '../../../widets/loading_alert.dart';

class ForgotPassdProvider with ChangeNotifier {
  String? email;
  final BuildContext context;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  ForgotPassdProvider(
    this.context,
    this.email,
  ) {
    init();
  }

  init() {
    emailController.text = email ?? '';
  }

  forgotPassword() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    _showLoading();
    AuthService()
        .forgotPassword(emailController.text.trim())
        .whenComplete(_hideLoading)
        .then((_) => _showSuccessAlert())
        .onError((error, _) => context.showError(message: error.toString()));
  }

  _showLoading() {
    showDialog(
        context: context,
        builder: (context) {
          return const LoadingAlert();
        });
  }

  _hideLoading() {
    Navigator.pop(context);
  }

  String? checkEmail(String? val) {
    if (val == null) return null;
    return val.trim().isEmail ? null : 'Enter valid Email';
  }

  _showSuccessAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Email sent'),
            content: const Text(
                'A email sent to your email, please check your email to reset password'),
            actions: [
              TextButton(
                  onPressed: () {
                    context.pushRemoveUntil(const SigninScreen());
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }
}
