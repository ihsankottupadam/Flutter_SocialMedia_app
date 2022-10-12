import 'package:flutter/material.dart';

import 'package:social_media/Tabs/profile/model/userdetails.dart';
import 'package:social_media/Tabs/profile/view/widgets/follow_button.dart';
import 'package:social_media/screens/authentication/providers/auth_provider.dart';

import '../../../../helpers/app_imposrts.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key, required this.userId}) : super(key: key);
  // final UserDetails userDetails;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => navigateToProfile(context, userId),
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        //backgroundImage: NetworkImage(userDetails.avatar),
      ),
      title: Text(userId),
      //subtitle: Text('@${userDetails.username}'),
      trailing: userId == AuthProvider.currUser!.id
          ? const SizedBox()
          : FollowButton(
              userId: userId,
            ),
    );
  }
}
