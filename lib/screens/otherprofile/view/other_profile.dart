import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/profile/view/widgets/profile_shimmer.dart';

import 'package:social_media/Tabs/profile/view/widgets/user_posts_grid.dart';
import 'package:social_media/screens/otherprofile/provider/other_profile_provider.dart';

import 'widgets/other_profile_widget.dart';

class OtherProfileScreen extends StatelessWidget {
  const OtherProfileScreen({Key? key, required this.userId}) : super(key: key);
  final String userId;
  @override
  Widget build(BuildContext context) {
    final provider = context.read<OtherProfileProvider>();
    Size size = MediaQuery.of(context).size;
    final ScrollController scrollController = ScrollController();
    provider.refresh(context, userId);
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () async {
            await provider.refresh(context, userId);
          },
          child: ListView(
            controller: scrollController,
            shrinkWrap: true,
            children: [
              Consumer<OtherProfileProvider>(builder: (context, value, _) {
                final profileInfo = value.profileInfo;

                if (profileInfo != null) {
                  return Column(
                    children: [
                      OtherProfileWidget(
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
                return const ProfileShimmer();
              }),
            ],
          )),
    );
  }
}
