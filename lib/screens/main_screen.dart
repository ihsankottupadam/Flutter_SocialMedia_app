import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media/widets/profil_icon.dart';

import '../Tabs/tabs.dart';

class MainSCreen extends StatefulWidget {
  const MainSCreen({Key? key}) : super(key: key);
  @override
  State<MainSCreen> createState() => _MainSCreenState();
}

class _MainSCreenState extends State<MainSCreen> {
  final screens = const [
    HomeScreen(),
    SearchScreen(),
    MessagesScreen(),
    ProfileScreen()
  ];
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screens[currIndex],
          Align(alignment: Alignment.bottomCenter, child: _buildBottomNavbar())
        ],
      ),
    );
  }

  Container _buildBottomNavbar() {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0x33000000), blurRadius: 3),
        ],
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: currIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.5),
          iconSize: 20,
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.message), label: 'Chat'),
            BottomNavigationBarItem(icon: ProfilIcon(), label: 'Profile'),
          ],
          onTap: (index) {
            setState(() {
              currIndex = index;
            });
          },
        ),
      ),
    );
  }
}
