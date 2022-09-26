import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/api_urls.dart';
import '../functions/api_functions.dart';
import '../models/usermodel.dart';
import '../screens/authentication/models/signindata.dart';
import '../screens/authentication/models/signupdata.dart';

class AuthService {
  BaseOptions baseOptions =
      BaseOptions(baseUrl: '${ApiUri.baseUrl}${ApiUri.auth}');

  Future<SignUpData> signup(SignUpData signUpData) async {
    try {
      var response = await Dio(baseOptions).post(
        'signup',
        data: signUpData.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return SignUpData.fromJson(response.data['userDetails']);
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<User> signIn(SignInData signInData) async {
    try {
      var response = await Dio(baseOptions).post(
        'signin',
        data: signInData.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log(response.data.toString());
        return User.fromJson(response.data);
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      log(e.toString());
      throw handleError(e);
    }
  }

  Future<User> verifyOTP(SignUpData signUpData, String otp) async {
    try {
      var data = signUpData.toJson();
      data['Otp'] = otp;
      var response = await Dio(baseOptions).post('verifyOtp', data: data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log(response.toString());
        return User.fromJson(response.data);
      } else {
        throw 'OTP verification failed';
      }
    } catch (e) {
      throw handleError(e);
    }
  }

  Future forgotPassword(String email) async {
    try {
      var response =
          await Dio(baseOptions).post('forgotPassword', data: {"email": email});
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      throw handleError(e);
    }
  }
}
