import 'package:flutter/cupertino.dart';
import 'package:social_media/extensions/better_context.dart';

import '../../../Tabs/profile/model/user_profile_model.dart';
import '../../../services/user_service.dart';
import '../../authentication/providers/auth_provider.dart';

class OtherProfileProvider with ChangeNotifier {
  UserProfileModel? profileInfo;
  Future refresh(BuildContext context, String userId) async {
    if (profileInfo?.userDetails.id != userId) {
      profileInfo = null;
      //notifyListeners();
    }
    await UserService().getUserInfo(userId).then((value) {
      profileInfo = value;
      notifyListeners();
    }).onError((error, _) => context.showError(message: error.toString()));
  }

  onFollowDone(followed) {
    followed
        ? profileInfo?.userDetails.followers.add(AuthProvider.currUser!.id)
        : profileInfo?.userDetails.followers.remove(AuthProvider.currUser!.id);
    notifyListeners();
  }
}
