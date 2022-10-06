import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/profile/provider/user_profile_provider.dart';
import 'package:social_media/services/user_service.dart';
import 'package:social_media/util.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final profileProvider = Util.context.read<UserProfileProvider>();
    bool isFollowing = profileProvider.isFollowing(widget.userId);

    return SizedBox(
      height: 30,
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              isLoading = true;
            });
            UserService()
                .followUser(widget.userId)
                .whenComplete(() {
                  setState(() {
                    isLoading = false;
                  });
                })
                .then((followed) =>
                    profileProvider.setFollwing(widget.userId, followed))
                .onError((error, _) => Util.showSnackbar(error.toString()));
          },
          style: ElevatedButton.styleFrom(
              primary: isFollowing ? Colors.indigoAccent : Colors.blue),
          child: isLoading
              ? const SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ))
              : Text(isFollowing ? 'Following' : 'Follow')),
    );
  }
}
