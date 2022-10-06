import 'package:flutter/material.dart';

import 'package:social_media/Tabs/profile/model/userdetails.dart';
import 'package:social_media/Tabs/profile/view/widgets/follow_button.dart';

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({Key? key, required this.userDetails}) : super(key: key);
  final UserDetails userDetails;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: SizedBox(
        width: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(userDetails.avatar),
              ),
              Text(
                userDetails.fullname,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                  width: double.infinity,
                  child: FollowButton(userId: userDetails.id))
            ],
          ),
        ),
      ),
    );
  }
}
