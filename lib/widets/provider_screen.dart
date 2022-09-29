import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/profile/provider/user_profile_provider.dart';

abstract class ProviderScreen<T> extends StatelessWidget {
  const ProviderScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (cont) => UserProfileProvider(),
      child: Builder(
        builder: (context) {
          return buildScreen(context);
        },
      ),
    );
  }

  ChangeNotifier? onCreateProvider(BuildContext context);
  Widget buildScreen(BuildContext context);
}
