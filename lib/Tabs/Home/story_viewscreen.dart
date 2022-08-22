import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_media/constants/constants.dart';
import 'package:social_media/models/user_story.dart';

class StoryViewSCreen extends StatefulWidget {
  const StoryViewSCreen({Key? key, required this.story}) : super(key: key);
  final UserStory story;

  @override
  State<StoryViewSCreen> createState() => _StoryViewSCreenState();
}

class _StoryViewSCreenState extends State<StoryViewSCreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 7), () {
      Navigator.pop(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('storyScreen'),
      direction: DismissDirection.down,
      onDismissed: (direction) {
        Navigator.pop(context);
      },
      child: Material(
        color: Colors.black,
        child: SafeArea(
          child: Stack(
            children: [
              GridTileBar(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        widget.story.avatar ?? Constants.defaultAvathar)),
                title: Text(
                  widget.story.userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('2 hourse ago'),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
              ),
              Image.network(
                widget.story.contents[0].contentUri,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
