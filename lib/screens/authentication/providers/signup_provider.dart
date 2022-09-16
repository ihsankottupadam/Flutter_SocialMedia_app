import 'package:flutter/material.dart';

import 'package:social_media/extensions/better_context.dart';

import 'package:social_media/services/auth_service.dart';

import '../models/signupdata.dart';
import '../views/otp_screen.dart';

class SignUpProvider with ChangeNotifier {
  BuildContext context;
  SignUpProvider(this.context);
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  signUp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    isLoading = true;
    notifyListeners();

    SignUpData signUpData = SignUpData(
      email: emailController.text.trim(),
      phoneNumber: phoneController.text,
      username: userNameController.text,
      fullname: nameController.text,
      password: passwordController.text,
      confirmPassword: confirmPassController.text,
    );
    isLoading = true;
    notifyListeners();
    AuthService()
        .signup(signUpData)
        .whenComplete(_hideLoading)
        .then((value) => context.pushReplace(OtpScreen(signUpData: value)))
        .onError((error, _) => context.showError(message: error.toString()));
  }

  _hideLoading() {
    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  String? checkUserName(String? val) {
    if (val == null) return null;

    if (val.length < 3) return 'Username must contain atleast 3 characters';
    var regExp = RegExp(r"^[a-z0-9]+$");
    if (!regExp.hasMatch(val)) {
      return 'User name donot contain special characters';
    }
    return null;
  }

  String? checkName(String? val) {
    if (val == null) return null;
    if (val.trim().isEmpty) return 'Enter yor name';
    return null;
  }

  String? checkEmail(String? val) {
    if (val == null) return null;
    var emailExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailExp.hasMatch(val.trim()) ? null : 'Enter valid Email';
  }

  String? checkPhoneNumber(String? val) {
    if (val == null) return null;
    if (val.length != 10) return 'Mobile number not valid';
    return null;
  }

  String? checkPassword(String? val) {
    if (val == null) return null;
    if (val.length < 8) return 'Password must contain atleast 8 characters';
    return null;
  }

  String? checkConformPassword(String? val) {
    if (val == null) return null;
    if (passwordController.text != val) return 'Password not match';
    return null;
  }
}
