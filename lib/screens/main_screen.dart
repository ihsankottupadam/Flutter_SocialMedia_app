import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/feeeds/view/feeds_screen.dart';
import 'package:social_media/Tabs/profile/provider/user_profile_provider.dart';
import 'package:social_media/Tabs/profile/view/user_profile_screen.dart';
import 'package:social_media/extensions/better_context.dart';
import 'package:social_media/screens/post/View/choose_screen.dart';
import 'package:social_media/widets/profil_icon.dart';

import '../Tabs/tabs.dart';

class MainSCreen extends StatefulWidget {
  const MainSCreen({Key? key}) : super(key: key);
  @override
  State<MainSCreen> createState() => _MainSCreenState();
}

class _MainSCreenState extends State<MainSCreen> {
  final screens = const [
    FeedsScreen(),
    SearchScreen(),
    SizedBox(),
    MessagesScreen(),
    UserProfileScreen()
  ];
  int currIndex = 0;
  @override
  void initState() {
    context.read<UserProfileProvider>().refresh(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currIndex],
      extendBody: true,
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.navigateTo(const NewPostChooseScreen()),
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavbar(),
    );
  }

  Widget _buildBottomNavbar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Color(0x33000000), blurRadius: 3),
          ],
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black.withOpacity(0.4),
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
                backgroundColor: Colors.transparent,
                icon: SizedBox(),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.message), label: 'Chat'),
              BottomNavigationBarItem(icon: ProfilIcon(), label: 'Profile'),
            ],
            onTap: (index) {
              if (index == 2) return;
              setState(() {
                currIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
