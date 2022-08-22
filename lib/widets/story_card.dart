import 'package:flutter/material.dart';
import 'package:social_media/Tabs/Home/story_viewscreen.dart';

import '../constants/constants.dart';
import '../models/user_story.dart';

class StoryCard extends StatefulWidget {
  const StoryCard({Key? key, required this.storyModel, required this.onTap})
      : super(key: key);
  final UserStory storyModel;
  final VoidCallback onTap;

  @override
  State<StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
                context,
                PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (_, __, ___) =>
                        StoryViewSCreen(story: widget.storyModel)))
            .whenComplete(() {
          setState(() {
            widget.storyModel.isFullViewd = true;
          });
        });
        widget.storyModel.isFullViewd = true;
      },
      child: SizedBox(
        width: 70,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: !widget.storyModel.isFullViewd
                          ? const Color(
                              0xFFF71A81,
                            )
                          : Colors.grey,
                      width: 2),
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    widget.storyModel.avatar ?? Constants.defaultAvathar,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              widget.storyModel.userName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
