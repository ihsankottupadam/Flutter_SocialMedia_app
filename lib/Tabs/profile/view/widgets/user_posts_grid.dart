import 'package:flutter/material.dart';
import 'package:social_media/Tabs/profile/model/user_profile_model.dart';
import 'package:social_media/Tabs/profile/view/user_posts_screen.dart';
import 'package:social_media/extensions/better_context.dart';

class UserPostsGrid extends StatelessWidget {
  const UserPostsGrid(
      {Key? key, required this.controller, required this.profileInfo})
      : super(key: key);
  final UserProfileModel profileInfo;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    List<CurrentUserPost> posts = profileInfo.currentUserPosts;
    return GridView.builder(
        controller: controller,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.navigateTo(UserPostsScreen(
                posts: posts,
                index: index,
                userDetails: profileInfo.userDetails,
              ));
            },
            child: Hero(
              tag: posts[index].id,
              child: Image.network(
                posts[index].image,
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }
}
