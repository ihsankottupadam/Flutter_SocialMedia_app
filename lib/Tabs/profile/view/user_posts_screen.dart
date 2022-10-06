import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:social_media/Tabs/profile/model/user_profile_model.dart';
import 'package:social_media/Tabs/profile/view/widgets/user_postcard.dart';

class UserPostsScreen extends StatelessWidget {
  const UserPostsScreen(
      {Key? key,
      required this.posts,
      required this.index,
      required this.userDetails})
      : super(key: key);
  final List<CurrentUserPost> posts;
  final UserDetails userDetails;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: ScrollablePositionedList.builder(
          itemCount: posts.length,
          initialScrollIndex: index,
          itemBuilder: (context, index) {
            return UserPostCard(post: posts[index], userDetails: userDetails);
          }),
    );
  }
}
