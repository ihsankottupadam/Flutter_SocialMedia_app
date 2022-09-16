import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/authentication/providers/auth_provider.dart';
import 'package:social_media/screens/authentication/views/signin_screen.dart';
import 'package:social_media/screens/settings/providers/settings_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider())
      ],
      child: MaterialApp(
        title: 'Vimo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color(0xffEFF3F5)),
        home: SigninScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
