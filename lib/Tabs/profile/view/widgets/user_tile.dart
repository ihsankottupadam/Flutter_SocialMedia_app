import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_media/Tabs/profile/view/widgets/follow_button.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key, required this.userId}) : super(key: key);
  final String userId; //TODO
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(
            'https://png.pngtree.com/png-vector/20190114/ourlarge/pngtree-vector-avatar-icon-png-image_313572.jpg'),
      ),
      title: Text(userId),
      subtitle: Text('@username'),
      trailing: FollowButton(
        userId: userId,
      ),
    );
  }
}
