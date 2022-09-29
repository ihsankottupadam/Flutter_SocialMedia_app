import 'package:flutter/material.dart';
import 'package:social_media/extensions/better_context.dart';

import '../../../../screens/settings/views/setttings_screen.dart';

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
              ),
              Positioned(
                  top: 15,
                  right: 15,
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    shape: const CircleBorder(),
                    color: Colors.transparent,
                    child: IconButton(
                        onPressed: () {
                          context.navigateTo(const SettingsScreen());
                        },
                        icon: const Icon(Icons.settings)),
                  ))
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Ihsan Kottupdam',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextButton(onPressed: () {}, child: const Text('Edit Profile')),
        const SizedBox(height: 10),
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
        const SizedBox(height: 10),
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
