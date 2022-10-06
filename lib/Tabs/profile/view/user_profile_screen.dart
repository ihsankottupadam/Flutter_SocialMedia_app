import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/profile/provider/user_profile_provider.dart';
import 'package:social_media/Tabs/profile/view/widgets/profile_shimmer.dart';

import 'package:social_media/Tabs/profile/view/widgets/user_posts_grid.dart';
import 'widgets/profile_widgets.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserProfileProvider>();
    Size size = MediaQuery.of(context).size;
    final ScrollController scrollController = ScrollController();
    provider.refresh(context);
    return RefreshIndicator(
        onRefresh: () async {
          await provider.refresh(context);
        },
        child: ListView(
          controller: scrollController,
          shrinkWrap: true,
          children: [
            Consumer<UserProfileProvider>(builder: (context, value, _) {
              final profileInfo = value.profileInfo;

              if (profileInfo != null) {
                return Column(
                  children: [
                    ProfileWidget(
                      heiht: math.max(size.height * .3, size.width * .3),
                      profileInfo: profileInfo,
                      postCount: profileInfo.currentUserPosts.length,
                    ),
                    SizedBox(
                        height: size.height,
                        child: UserPostsGrid(
                          profileInfo: profileInfo,
                          controller: scrollController,
                        ))
                  ],
                );
              }
              return ProfileShimmer(); //TODO
            }),
          ],
        ));
  }
}
