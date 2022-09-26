import 'dart:convert';

ImagePostModel imagePostModelFromJson(String str) =>
    ImagePostModel.fromJson(json.decode(str));

String imagePostModelToJson(ImagePostModel data) => json.encode(data.toJson());

class ImagePostModel {
  ImagePostModel({
    required this.userId,
    required this.file,
    required this.caption,
  });

  final String userId;
  final String file;
  final String caption;

  factory ImagePostModel.fromJson(Map<String, dynamic> json) => ImagePostModel(
        userId: json["userId"],
        file: json["file"],
        caption: json["caption"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "file": file,
        "caption": caption,
      };
}
