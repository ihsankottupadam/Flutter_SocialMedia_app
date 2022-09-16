import 'dart:convert';

String signInDataToJson(SignInData data) => json.encode(data.toJson());

class SignInData {
  SignInData({
    required this.email,
    required this.password,
  });

  final String? email;
  final String password;

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
