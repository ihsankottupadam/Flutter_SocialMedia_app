import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/profile/provider/user_profile_provider.dart';
import 'package:social_media/helpers/helperservice.dart';
import 'package:social_media/models/postmodel.dart';
import 'package:social_media/screens/authentication/providers/auth_provider.dart';
import 'package:social_media/services/post_service.dart';
import 'package:social_media/widets/dialog_menu.dart';

import '../../../../helpers/app_imposrts.dart';

class PostCard extends StatelessWidget {
  PostCard({Key? key, required this.post}) : super(key: key);
  final PostModel post;
  final transformationController = TransformationController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 15,
                backgroundImage: NetworkImage(post.avatar)),
            title: GestureDetector(
              onTap: () => navigateToProfile(context, post.userId),
              child: Text(
                post.userName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            trailing: _buildMenu(context),
          ),
          InteractiveViewer(
            panEnabled: false,
            minScale: 1,
            transformationController: transformationController,
            maxScale: 2.5,
            onInteractionEnd: (details) {
              transformationController.value = Matrix4.identity();
            },
            clipBehavior: Clip.none,
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/black_shade.png'),
              image: NetworkImage(post.image),
              fit: BoxFit.fitWidth,
              width: double.infinity,
              imageErrorBuilder: (conext, _, __) {
                return Image.asset(
                  'assets/images/black_shade.png',
                  width: double.infinity,
                );
              },
            ),
          ),
          // Image.network(
          //   post.image,
          //   width: double.infinity,
          //   fit: BoxFit.fitWidth,
          // ),
          Row(
            children: [
              LikeButton(post: post),
              LabelButton(
                icon: Icons.chat_bubble_outline,
                text: post.comments.length.toString(),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(child: Text(post.caption)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    String curUserId = AuthProvider.currUser!.id;
    final profileProvider = context.watch<UserProfileProvider>();
    return Consumer<UserProfileProvider>(builder: (context, _, __) {
      return DialogMenu(items: [
        if (post.userId == curUserId)
          DialogMenuItem(
            icon: Icons.delete,
            text: 'Delete',
            onSelect: () {
              HelperService().deletePost(post.id);
            },
          )
        else
          DialogMenuItem(
            icon: profileProvider.isFollowing(post.userId)
                ? Icons.person_remove_rounded
                : Icons.person_add,
            text:
                profileProvider.isFollowing(post.userId) ? 'Unollow' : 'Follow',
            onSelect: () {
              HelperService.followUser(post.userId);
            },
          ),
        DialogMenuItem(icon: Icons.save_alt, text: 'Save', onSelect: () {}),
        DialogMenuItem(icon: Icons.share, text: 'Share', onSelect: () {}),
        if (post.userId != curUserId)
          DialogMenuItem(
              icon: Icons.report_rounded,
              text: 'Report',
              onSelect: () {
                HelperService.reportPost(post.id);
              })
      ]);
    });
  }
}

class LabelButton extends StatelessWidget {
  const LabelButton(
      {Key? key, required this.icon, required this.text, this.onTap})
      : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            const SizedBox(
              width: 5,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({
    Key? key,
    required this.post,
  }) : super(key: key);
  final PostModel post;
  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    bool isLiked = widget.post.likes.contains(AuthProvider.currUser!.id);
    return GestureDetector(
      onTap: () {
        PostService().likePost(widget.post.id).onError((error, _) {
          log('dd', error: error.toString());
          onLike(!isLiked);
        });
        onLike(isLiked);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isLiked
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_outline),
            const SizedBox(
              width: 5,
            ),
            Row(
              children: [
                Text(
                  widget.post.likes.length.toString(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void onLike(bool isLiked) {
    if (isLiked) {
      widget.post.likes.remove(AuthProvider.currUser!.id);
    } else {
      widget.post.likes.add(AuthProvider.currUser!.id);
    }
    setState(() {});
  }
}
