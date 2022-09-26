import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.token,
    required this.id,
    required this.email,
  });

  final String token;
  final String id;
  final String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["encryptToken"],
        id: json["id"],
        email: json["email"] ?? json["userDetals"]["email"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
        "email": email,
      };
}
