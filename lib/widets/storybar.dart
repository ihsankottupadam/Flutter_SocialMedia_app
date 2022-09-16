import 'package:flutter/material.dart';
import 'package:social_media/widets/story_card.dart';

import '../database/testdb.dart';
import '../models/user_story.dart';

class StoryBar extends StatelessWidget {
  StoryBar({Key? key}) : super(key: key);
  final List<UserStory> stories = TestDB.stories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => StoryCard(
                storyModel: stories[index < 4 ? index : 3],
                onTap: () {},
              )),
    );
  }
}
