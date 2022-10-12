
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/profile/provider/user_profile_provider.dart';
import 'package:social_media/extensions/better_context.dart';
import 'package:social_media/screens/authentication/providers/auth_provider.dart';
import 'package:social_media/screens/authentication/views/signin_screen.dart';

class SettingsProvider with ChangeNotifier {
  logout(BuildContext context) {
    context.pushRemoveUntil(const SigninScreen());
    context.read<UserProfileProvider>().reset();
    context.read<AuthProvider>().deleteUser();
  }
}
