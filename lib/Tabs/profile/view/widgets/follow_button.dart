import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/feeeds/providers/feeds_provider.dart';
import 'package:social_media/Tabs/profile/provider/user_profile_provider.dart';
import 'package:social_media/services/user_service.dart';
import 'package:social_media/util.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({Key? key, required this.userId, this.onDone})
      : super(key: key);
  final String userId;
  final Function(bool)? onDone;
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
      width: 100,
      child: ElevatedButton(
        onPressed: () {
          if (isLoading) return;
          if (mounted) {
            setState(() {
              isLoading = true;
            });
          }
          UserService().followUser(widget.userId).whenComplete(() {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          }).then((followed) {
            widget.onDone?.call(followed);
            if (!followed) {
              Util.context
                  .read<FeedsProvider>()
                  .removePostsfromUser(widget.userId);
            }
            profileProvider.setFollwing(widget.userId, followed);
          }).onError((error, _) => Util.showSnackbar(error.toString()));
        },
        style: ElevatedButton.styleFrom(
            primary: isFollowing ? const Color(0xFFB0DAFD) : Colors.blue),
        child: isLoading
            ? const SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                ))
            : isFollowing
                ? const Text('Following', style: TextStyle(color: Colors.black))
                : const Text('Follow', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
