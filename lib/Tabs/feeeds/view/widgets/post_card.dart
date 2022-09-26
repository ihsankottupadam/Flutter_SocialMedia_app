import 'package:flutter/material.dart';
import 'package:social_media/models/postmodel.dart';
import 'package:social_media/screens/authentication/providers/auth_provider.dart';
import 'package:social_media/services/post_service.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);
  final PostModel post;
  //TODO-change
  final String defaultAvathar =
      'https://www.pngitem.com/pimgs/m/522-5220445_anonymous-profile-grey-person-sticker-glitch-empty-profile.png';
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                radius: 15, backgroundImage: NetworkImage(defaultAvathar)),
            title: Text(
              post.userId,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
            ),
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ),
          FadeInImage(
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
                Text(post.caption),
              ],
            ),
          )
        ],
      ),
    );
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
        PostService().likePost(widget.post.id).onError((error, stackTrace) {
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
