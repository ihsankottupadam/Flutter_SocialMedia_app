import 'dart:convert';

String signUpDataToJson(SignUpData data) => json.encode(data.toJson());

class SignUpData {
  SignUpData({
    required this.email,
    required this.phoneNumber,
    required this.username,
    required this.fullname,
    required this.password,
    this.confirmPassword,
  });

  final String email;
  final String phoneNumber;
  final String username;
  final String fullname;
  final String password;
  final String? confirmPassword;
  factory SignUpData.fromJson(Map<String, dynamic> json) {
    return SignUpData(
        username: json['username'],
        fullname: json['fullname'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        password: json['password'],
        confirmPassword: json['confirmPassword']);
  }
  Map<String, dynamic> toJson() => {
        "username": username,
        "fullname": fullname,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "confirmPassword": confirmPassword
      };
}
