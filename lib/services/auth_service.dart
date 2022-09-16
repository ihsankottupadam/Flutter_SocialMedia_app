import 'dart:developer';

import 'package:dio/dio.dart';

import '../screens/authentication/models/signindata.dart';
import '../screens/authentication/models/signupdata.dart';

class AuthService {
  BaseOptions baseOptions =
      BaseOptions(baseUrl: 'https://tailus-api.herokuapp.com/api/v1/auth/');

  Future<SignUpData> signup(SignUpData signUpData) async {
    try {
      var response = await Dio(baseOptions).post(
        'signup',
        data: signUpData.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return SignUpData.fromJson(response.data['userDetails']);
      } else {
        throw defaultError;
      }
    } catch (e) {
      return handleError(e);
    }
  }

  Future signIn(SignInData signInData) async {
    try {
      var response = await Dio(baseOptions).post(
        'signin',
        data: signInData.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log(response.toString());
      } else {
        throw defaultError;
      }
    } catch (e) {
      handleError(e);
    }
  }

  Future verifyOTP(SignUpData signUpData, String otp) async {
    try {
      var data = signUpData.toJson();
      data['Otp'] = otp;
      var response = await Dio(baseOptions).post('verifyOtp', data: data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
      } else {
        throw 'OTP verification failed';
      }
    } catch (e) {
      handleError(e);
    }
  }

  Future forgotPassword(String email) async {
    try {
      var response =
          await Dio(baseOptions).post('forgotPassword', data: {"email": email});
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
      } else {
        throw defaultError;
      }
    } catch (e) {
      handleError(e);
    }
  }

  String defaultError = 'Something went wrong!';
  handleError(e) {
    if (e is DioError) {
      if (e.message.startsWith('SocketException')) {
        throw 'Check internet connection';
      }
      if (e.response?.data['error'] != null) {
        throw e.response!.data['error'];
      }
      throw defaultError;
    }
    throw e.toString();
  }
}
