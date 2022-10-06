List<PostModel> postsFromJson(List list) =>
    List<PostModel>.from(list.map((x) => PostModel.fromJson(x)));

class PostModel {
  PostModel({
    required this.id,
    required this.userId,
    required this.avatar,
    required this.userName,
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
  final String avatar;
  final String userName;
  final String image;
  final String caption;
  final List<String> hashtags;
  final List<String> likes;
  final List<dynamic> savedBy;
  final List<dynamic> comments;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["_id"],
        userId: json["userId"]["_id"],
        userName: json["userId"]["username"],
        avatar: json["userId"]["avatar"],
        image: json["image"],
        caption: json["caption"],
        hashtags: List<String>.from(json["hashtags"].map((x) => x)),
        likes: List<String>.from(json["likes"].map((x) => x)),
        savedBy: List<dynamic>.from(json["savedBy"].map((x) => x)),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
