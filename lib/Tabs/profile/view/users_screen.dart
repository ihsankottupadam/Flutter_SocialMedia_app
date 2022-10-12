import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/profile/provider/user_profile_provider.dart';
import 'package:social_media/Tabs/profile/view/widgets/user_tile.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key, required this.title, required this.users})
      : super(key: key);
  final String title;
  final List<String> users;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Consumer<UserProfileProvider>(builder: (context, _, __) {
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) => UserTile(userId: users[index]),
        );
      }),
    );
  }
}
