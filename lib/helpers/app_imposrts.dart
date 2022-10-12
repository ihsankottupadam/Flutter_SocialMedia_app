import 'package:flutter/material.dart';
import 'package:social_media/Tabs/profile/view/user_profile_screen.dart';
import 'package:social_media/screens/authentication/providers/auth_provider.dart';

import 'package:social_media/extensions/better_context.dart';

import 'package:social_media/screens/otherprofile/view/other_profile.dart';
export 'package:social_media/extensions/better_context.dart';

void navigateToProfile(BuildContext context, String userId) {
  if (userId == AuthProvider.currUser!.id) {
    context.navigateTo(const UserProfileScreen());
  } else {
    context.navigateTo(OtherProfileScreen(userId: userId));
  }
}
