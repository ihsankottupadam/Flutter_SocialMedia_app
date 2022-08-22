import 'package:flutter/material.dart';
import 'package:social_media/Tabs/home_screen.dart';
import 'package:social_media/screens/login_screen.dart';
import 'package:social_media/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vimo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xffEFF3F5)),
      home: MainSCreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
