import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/profile/provider/user_profile_provider.dart';
import 'widgets/profile_widgets.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserProfileProvider>();
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
        onRefresh: provider.refresh,
        child: ListView(
          children: [
            ProfileWidget(
              heiht: math.max(size.height * .3, size.width * .3),
            )
          ],
        ));
  }
}
