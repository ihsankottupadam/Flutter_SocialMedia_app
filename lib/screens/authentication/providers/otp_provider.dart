import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:provider/provider.dart';
import 'package:social_media/extensions/better_context.dart';

import 'package:social_media/screens/main_screen.dart';

import 'package:social_media/widets/loading_alert.dart';

import '../../../models/usermodel.dart';
import '../../../services/auth_service.dart';
import '../models/signupdata.dart';
import 'auth_provider.dart';

class OtpProvider extends ChangeNotifier {
  final BuildContext context;
  final otpFieldController = OtpFieldController();

  String mobileNum = '';
  String otpValue = '';
  bool otpIsError = false;
  OtpProvider(this.context);

  onOtpChanged(String otp) {
    otpValue = otp;
    notifyListeners();
  }

  // onOtpCompleted(String otp) {
  //   print('com $otp');
  //   verfiyOtp();
  // }

  verfiyOtp(SignUpData signUpData) {
    _showLoading();
    AuthService()
        .verifyOTP(signUpData, otpValue)
        .whenComplete(_hideLoading)
        .then((user) => _navigate(context, user))
        .onError((error, _) => context.showError(message: error.toString()));
  }

  resendOtp(SignUpData signUpData) {
    AuthService().signup(signUpData);
  }

  _navigate(BuildContext context, User user) {
    context.pushReplace(const MainSCreen());
    context.read<AuthProvider>().saveUser(user);
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
}
