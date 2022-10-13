import 'package:flutter/material.dart';
import 'package:social_media/Tabs/profile/model/user_profile_model.dart';
import 'package:social_media/Tabs/profile/view/user_posts_screen.dart';
import 'package:social_media/Tabs/profile/view/users_screen.dart';
import 'package:social_media/extensions/better_context.dart';

import '../../../../screens/settings/views/setttings_screen.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.heiht,
    required this.postCount,
    required this.profileInfo,
  }) : super(key: key);
  final double heiht;
  final UserProfileModel profileInfo;
  final int postCount;

  @override
  Widget build(BuildContext context) {
    double circHeight = heiht * 2 / 3;
    UserDetails userDetails = profileInfo.userDetails;
    return Column(
      children: [
        SizedBox(
          height: heiht,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: circHeight,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Color(0xff8bfeff), Color(0xfffb84ff)],
                  // begin: Alignment.topCenter,
                  // end: Alignment.bottomCenter,
                )),
                child: Container(
                    decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        const Color(0x00000000),
                        Theme.of(context).scaffoldBackgroundColor
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0, 1]),
                )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  elevation: 10,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(circHeight),
                    child: Image.network(
                      userDetails.avatar,
                      width: circHeight,
                      height: circHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: circHeight / 2),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 12,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(8)),
                    child: const Icon(Icons.camera_alt),
                  ),
                ),
              ),
              Positioned(
                  top: 15,
                  right: 15,
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    shape: const CircleBorder(),
                    color: Colors.transparent,
                    child: IconButton(
                        onPressed: () {
                          context.navigateTo(const SettingsScreen());
                        },
                        icon: const Icon(Icons.settings)),
                  ))
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          userDetails.fullname,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 5),
        Text(
          '@${userDetails.username}',
          style: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        TextButton(onPressed: () {}, child: const Text('Edit Profile')),
        const SizedBox(height: 5),
        Text(userDetails.bio, maxLines: 3),
        const SizedBox(height: 5),
        Row(
          children: [
            ProfileItemCount(
              item: 'Total Post',
              count: '$postCount',
              onTap: () {
                context.navigateTo(UserPostsScreen(
                    posts: profileInfo.currentUserPosts,
                    userDetails: profileInfo.userDetails,
                    index: 0));
              },
            ),
            ProfileItemCount(
              item: 'Followers',
              count: '${userDetails.followers.length}',
              onTap: () {
                context.navigateTo(UsersScreen(
                    title: 'Followes', users: userDetails.followers));
              },
            ),
            ProfileItemCount(
              item: 'Following',
              count: '${userDetails.following.length}',
              onTap: () {
                context.navigateTo(UsersScreen(
                    title: 'Following', users: userDetails.following));
              },
            )
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class ProfileItemCount extends StatelessWidget {
  const ProfileItemCount({
    Key? key,
    required this.item,
    required this.count,
    this.onTap,
  }) : super(key: key);
  final String item;
  final String count;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Text(
                item,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                count,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              )
            ],
          ),
        ),
      ),
    );
  }
}
