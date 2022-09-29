// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    required this.phoneNumber,
    required this.avatar,
    required this.coverPhoto,
    required this.bio,
    required this.followers,
    required this.posts,
    required this.saved,
    required this.following,
    required this.private,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String username;
  final String fullname;
  final String email;
  final int phoneNumber;
  final String avatar;
  final String coverPhoto;
  final String bio;
  final List<String> followers;
  final List<dynamic> posts;
  final List<dynamic> saved;
  final List<String> following;
  final bool private;
  final bool blocked;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json["_id"],
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        avatar: json["avatar"],
        coverPhoto: json["coverPhoto"],
        bio: json["bio"],
        followers: List<String>.from(json["followers"].map((x) => x)),
        posts: List<dynamic>.from(json["posts"].map((x) => x)),
        saved: List<dynamic>.from(json["saved"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
        private: json["private"],
        blocked: json["blocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "fullname": fullname,
        "email": email,
        "phoneNumber": phoneNumber,
        "avatar": avatar,
        "coverPhoto": coverPhoto,
        "bio": bio,
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "posts": List<dynamic>.from(posts.map((x) => x)),
        "saved": List<dynamic>.from(saved.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "private": private,
        "blocked": blocked,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
