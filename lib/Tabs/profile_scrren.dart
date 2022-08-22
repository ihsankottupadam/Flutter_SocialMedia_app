import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

import 'package:social_media/database/testDb.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          ProfileWidget(
            heiht: math.max(size.height * .3, size.width * .3),
          ),
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
        physics: ClampingScrollPhysics(),

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

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key, required this.heiht}) : super(key: key);
  final double heiht;

  @override
  Widget build(BuildContext context) {
    double circHeight = heiht * 2 / 3;
    return Column(
      children: [
        SizedBox(
          height: heiht,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: circHeight,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Color(0xff8bfeff), Color(0xfffb84ff)],
                  // begin: Alignment.topCenter,
                  // end: Alignment.bottomCenter,
                )),
                child: Container(
                    decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0x00000000),
                        Theme.of(context).scaffoldBackgroundColor
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0, 1]),
                )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  elevation: 10,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(circHeight),
                    child: Image.asset(
                      'assets/images/my_dp.jpeg',
                      width: circHeight,
                      height: circHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: circHeight / 2),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 12,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(8)),
                    child: const Icon(Icons.camera_alt),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Ihsan Kottupdam',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextButton(onPressed: () {}, child: const Text('Edit Profile')),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            ProfileItemCount(
              item: 'Total Post',
              count: '120',
            ),
            ProfileItemCount(
              item: 'Followers',
              count: '5.3 K',
            ),
            ProfileItemCount(
              item: 'Following',
              count: '1.1 K',
            )
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class ProfileItemCount extends StatelessWidget {
  const ProfileItemCount({
    Key? key,
    required this.item,
    required this.count,
  }) : super(key: key);
  final String item;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          count,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        )
      ],
    );
  }
}
