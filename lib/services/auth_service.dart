import 'dart:developer';

import '../models/usermodel.dart';
import '../screens/authentication/models/signindata.dart';
import '../screens/authentication/models/signupdata.dart';
import 'base_api_service.dart';

class AuthService extends BaseApiService {
  @override
  String setEndPoint() => '/auth';
  Future<SignUpData> signup(SignUpData signUpData) async {
    try {
      var response = await dio.post(
        '/signup',
        data: signUpData.toJson(),
      );
      if (response.isOk) {
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
      var response = await dio.post(
        '/signin',
        data: signInData.toJson(),
      );
      if (response.isOk) {
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
      var response = await dio.post('/verifyOtp', data: data);
      if (response.isOk) {
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
      var response = await dio.post('/forgotPassword', data: {"email": email});
      if (response.isOk) {
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      throw handleError(e);
    }
  }
}
