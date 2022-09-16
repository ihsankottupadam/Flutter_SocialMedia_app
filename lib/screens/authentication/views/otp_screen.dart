import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../models/signupdata.dart';
import '../providers/otp_provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key, required this.signUpData}) : super(key: key);
  final SignUpData signUpData;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OtpProvider(context),
      child: Builder(builder: (context) {
        final provider = context.read<OtpProvider>();
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Lottie.asset('assets/lottie/109224-otp-sent.json',
                        width: 150, fit: BoxFit.contain),
                    const SizedBox(height: 20),
                    const Text(
                      'Verification',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text:
                                "We've sent an SMS with an verification code to your phone ",
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black),
                            children: [
                              TextSpan(
                                  text: signUpData.phoneNumber
                                      .replaceRange(2, 6, '** ***'),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Consumer<OtpProvider>(builder: (context, provider, _) {
                      return OTPTextField(
                        controller: provider.otpFieldController,
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceEvenly,
                        fieldWidth: 35,
                        fieldStyle: FieldStyle.box,
                        otpFieldStyle: OtpFieldStyle(),
                        outlineBorderRadius: 5,
                        spaceBetween: 0,
                        hasError: provider.otpIsError,
                        style: const TextStyle(fontSize: 17),
                        onChanged: provider.onOtpChanged,
                        //onCompleted: provider.onOtpCompleted,
                      );
                    }),
                    const SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "OTP not recived?  ",
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => provider.resendOtp(signUpData),
                                text: 'RESEND',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: Consumer<OtpProvider>(builder: (context, _, __) {
                        return ElevatedButton(
                            onPressed: () => provider.otpValue.length == 4
                                ? provider.verfiyOtp(signUpData)
                                : null,
                            child: const Text('Verify'));
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
