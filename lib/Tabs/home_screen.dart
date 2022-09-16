import 'package:flutter/material.dart';
import 'package:social_media/database/testdb.dart';
import 'package:social_media/models/user_story.dart';

import '../constants/constants.dart';
import '../widets/storybar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('vimo'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        StoryBar(),
        PostsView(),
      ]),
    );
  }
}

class PostsView extends StatelessWidget {
  PostsView({Key? key}) : super(key: key);
  final posts = TestDB.stories;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 60),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => PostCard(post: posts[index]),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);
  final UserStory post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Column(
        children: [
          Card(
            elevation: 10,
            clipBehavior: Clip.hardEdge,
            // margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              children: [
                _buildHeader(),
                _buildContent(),
              ],
            ),
          ),
          _buildFooter()
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      padding: const EdgeInsets.all(3),
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(Icons.favorite, color: Colors.red)),
                  Text(
                    '1.2 K',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  IconButton(
                      padding: const EdgeInsets.all(3),
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(Icons.chat_bubble_outline)),
                  Text(
                    '520',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  // const SizedBox(width: 10),
                  // IconButton(
                  //     padding: const EdgeInsets.all(3),
                  //     constraints: const BoxConstraints(),
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.send)),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  ListTile _buildHeader() {
    return ListTile(
      visualDensity: const VisualDensity(vertical: 0.01),
      leading: CircleAvatar(
          backgroundImage:
              NetworkImage(post.avatar ?? Constants.defaultAvathar)),
      title: Text(
        post.userName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      // subtitle: const Text(''),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
    );
  }

  Padding _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 100),
        child: Image.network(
          post.contents[0].contentUri,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
