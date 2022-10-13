import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/profile/model/user_profile_model.dart';
import 'package:social_media/screens/authentication/providers/auth_provider.dart';
import 'package:social_media/services/user_service.dart';
import 'package:social_media/extensions/better_context.dart';

import '../../../util.dart';
import '../../feeeds/providers/feeds_provider.dart';

class UserProfileProvider with ChangeNotifier {
  UserProfileModel? profileInfo;
  List<String> following = [];
  Future refresh(BuildContext context) async {
    await UserService().getUserInfo(AuthProvider.currUser!.id).then((value) {
      profileInfo = value;
      following = profileInfo!.userDetails.following;
      notifyListeners();
    }).onError((error, _) => context.showError(message: error.toString()));
  }

  bool isFollowing(String userId) {
    return following.contains(userId);
  }

  setFollowing(String userId, bool followed) {
    if (!followed) {
      Util.context.read<FeedsProvider>()
        ..removePostsfromUser(userId)
        ..refreshSuggestion();
    }
    followed ? following.add(userId) : following.remove(userId);
    notifyListeners();
  }

  void reset() {
    following.clear();
    profileInfo = null;
  }
}
