import 'package:flutter/material.dart';
import 'package:social_media/screens/settings/views/widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [const SettingsTile(title: 'Logout', icon: Icons.logout)],
      ),
    );
  }
}
