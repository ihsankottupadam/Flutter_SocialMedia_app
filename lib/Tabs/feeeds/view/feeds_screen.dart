import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:social_media/Tabs/feeeds/view/widgets/post_card.dart';
import 'package:social_media/Tabs/feeeds/view/widgets/suggestion_card.dart';
import 'package:social_media/screens/post/providers/newpost_provider.dart';

import '../../../widets/storybar.dart';
import '../providers/feeds_provider.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<FeedsProvider>();
    provider.init();
    return Scaffold(
      appBar: AppBar(title: const Text('Tailus')),
      body: RefreshIndicator(
        onRefresh: provider.refresh,
        child: ListView(
          children: [
            StoryBar(),
            Consumer<NewPostProvider>(
              builder: (context, value, _) {
                if (value.isLoading) {
                  return const LinearProgressIndicator();
                }
                return const SizedBox();
              },
            ),
            Consumer<FeedsProvider>(
              builder: (context, value, _) {
                if (provider.isLoading) {
                  return const SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Center(child: CircularProgressIndicator()));
                }
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.posts.length,
                    itemBuilder: (context, index) {
                      if (value.posts.length ~/ 2 == index &&
                          value.suggestions.isNotEmpty) {
                        var sugestions = value.suggestions;
                        return Column(
                          children: [
                            SizedBox(
                              height: 180,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: sugestions.length,
                                  itemBuilder: (context, index) =>
                                      SuggestionCard(
                                          userDetails: sugestions[index])),
                            ),
                            PostCard(post: value.posts[index])
                          ],
                        );
                      }
                      return PostCard(post: value.posts[index]);
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
