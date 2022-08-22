class UserStory {
  UserStory(
      {required this.userid,
      required this.userName,
      required this.contents,
      this.avatar,
      this.isFullViewd = false});
  final int userid;
  final String? avatar;
  final String userName;
  final List<StoryItem> contents;
  bool isFullViewd;
}

class StoryItem {
  StoryItem({
    required this.contentUri,
    this.isViewed = false,
    this.postId,
  });
  final String contentUri;
  bool isViewed;
  final String? postId;
}
