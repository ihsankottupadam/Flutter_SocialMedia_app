import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:social_media/Tabs/profile/model/userdetails.dart';
import 'package:social_media/Tabs/profile/provider/user_profile_provider.dart';
import 'package:social_media/util.dart';
export 'package:social_media/Tabs/profile/model/userdetails.dart';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

class UserProfileModel {
  UserProfileModel({
    required this.userDetails,
    required this.currentUserPosts,
  });

  final UserDetails userDetails;
  final List<CurrentUserPost> currentUserPosts;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        userDetails: UserDetails.fromJson(json["userDetails"]),
        currentUserPosts: List<CurrentUserPost>.from(
            json["currentUserPosts"].map((x) => CurrentUserPost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userDetails": userDetails.toJson(),
        "currentUserPosts":
            List<dynamic>.from(currentUserPosts.map((x) => x.toJson())),
      };
  isFollwing() {
    Util.context.read<UserProfileProvider>().following.contains(userDetails.id);
  }
}

class CurrentUserPost {
  CurrentUserPost({
    required this.id,
    required this.userId,
    required this.image,
    required this.caption,
    required this.hashtags,
    required this.likes,
    required this.savedBy,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String userId;
  final String image;
  final String caption;
  final List<String> hashtags;
  final List<String> likes;
  final List<dynamic> savedBy;
  final List<dynamic> comments;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory CurrentUserPost.fromJson(Map<String, dynamic> json) =>
      CurrentUserPost(
        id: json["_id"],
        userId: json["userId"],
        image: json["image"],
        caption: json["caption"],
        hashtags: List<String>.from(json["hashtags"].map((x) => x)),
        likes: List<String>.from(json["likes"].map((x) => x)),
        savedBy: List<dynamic>.from(json["savedBy"].map((x) => x)),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "image": image,
        "caption": caption,
        "hashtags": List<String>.from(hashtags.map((x) => x)),
        "likes": List<String>.from(likes.map((x) => x)),
        "savedBy": List<dynamic>.from(savedBy.map((x) => x)),
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
