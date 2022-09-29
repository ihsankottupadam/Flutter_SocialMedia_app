import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

import 'package:social_media/database/testdb.dart';
import 'package:social_media/extensions/better_context.dart';
import 'package:social_media/screens/settings/views/setttings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          // ProfileWidget(
          //   heiht: math.max(size.height * .3, size.width * .3),
          // ),
          const ProfilePostView()
        ],
      ),
    );
  }
}

class ProfilePostView extends StatefulWidget {
  const ProfilePostView({Key? key}) : super(key: key);

  @override
  State<ProfilePostView> createState() => _ProfilePostViewState();
}

class _ProfilePostViewState extends State<ProfilePostView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 10)]),
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.dashboard,
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        FontAwesomeIcons.tag,
                        color: Colors.black,
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: TabBarView(children: [
                PostView(conut: 14),
                PostView(
                  conut: 3,
                ),
              ]),
            ),
          ],
        ));
  }
}

class PostView extends StatelessWidget {
  const PostView({Key? key, required this.conut}) : super(key: key);
  final int conut;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(bottom: 60),
        physics: const ClampingScrollPhysics(),

        // shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 7, mainAxisSpacing: 7),
        itemCount: conut,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 100,
            child: Image.network(
              TestDB.postUrls[index < 4 ? index : 3],
              fit: BoxFit.cover,
            ),
          );
        });
  }
}
