import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/extensions/better_context.dart';
import 'package:social_media/extensions/string.dart';
import 'package:social_media/models/usermodel.dart';
import 'package:social_media/screens/authentication/providers/auth_provider.dart';
import 'package:social_media/screens/main_screen.dart';

import '../../../services/auth_service.dart';
import '../models/signindata.dart';
import '../views/forgot_password.dart';

class SignInProvider extends ChangeNotifier {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  signIn(BuildContext context) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    isLoading = true;
    notifyListeners();
    SignInData signInData = SignInData(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    AuthService()
        .signIn(signInData)
        .whenComplete(_hideLoading)
        .then((user) => _navigate(context, user))
        .onError((error, _) => context.showError(message: error.toString()));
  }

  _hideLoading() {
    isLoading = false;
    notifyListeners();
  }

  _navigate(BuildContext context, User user) {
    context.pushReplace(const MainSCreen());
    context.read<AuthProvider>().saveUser(user);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  forgotPassword(BuildContext context) {
    context.navigateTo(ForgotPasswordScreen(
      email: emailController.text.isEmail ? emailController.text : null,
    ));
  }

  String? checkEmail(String? val) {
    if (val == null) return null;
    return val.trim().isEmail ? null : 'Enter valid Email';
  }
}
