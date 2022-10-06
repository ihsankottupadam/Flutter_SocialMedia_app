import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.token,
    required this.id,
    required this.refreshToken,
  });

  final String token;
  final String id;
  final String refreshToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
      token: json["token"],
      id: json["userDetails"]["_id"],
      refreshToken: json["refreshToken"]);

  Map<String, dynamic> toJson() =>
      {"token": token, "id": id, "refreshToken": refreshToken};
}
