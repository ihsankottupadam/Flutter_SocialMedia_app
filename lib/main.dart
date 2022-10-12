import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/feeeds/providers/feeds_provider.dart';
import 'package:social_media/Tabs/profile/provider/user_profile_provider.dart';

import 'package:social_media/screens/authentication/providers/auth_provider.dart';
import 'package:social_media/screens/authentication/views/signin_screen.dart';
import 'package:social_media/screens/main_screen.dart';
import 'package:social_media/screens/otherprofile/provider/other_profile_provider.dart';
import 'package:social_media/screens/post/providers/newpost_provider.dart';
import 'package:social_media/screens/settings/providers/settings_provider.dart';
import 'package:social_media/util.dart';

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
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => NewPostProvider()),
        ChangeNotifierProvider(create: (_) => FeedsProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        ChangeNotifierProvider(create: (_) => OtherProfileProvider())
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tailus',
      navigatorKey: Util.navigatorState,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xffEFF3F5),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              // iconTheme: IconThemeData(color: Colors.black),
              foregroundColor: Colors.black)),
      home: context.watch<AuthProvider>().user != null
          ? const MainSCreen()
          : const SigninScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
