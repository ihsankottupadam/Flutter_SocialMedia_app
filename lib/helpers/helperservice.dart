import 'package:provider/provider.dart';
import 'package:social_media/Tabs/feeeds/providers/feeds_provider.dart';
import 'package:social_media/services/post_service.dart';

import '../Tabs/profile/provider/user_profile_provider.dart';
import '../services/user_service.dart';
import '../util.dart';

class HelperService {
  static Future<bool>? followUser(String userId) {
    UserService().followUser(userId).then((followed) {
      Util.showSnackbar(followed ? 'Followed' : 'Unfollowed');
      Util.context.read<UserProfileProvider>().setFollowing(userId, followed);
      return followed;
    }).onError((error, _) => Util.showSnackbar(error.toString()));
    return null;
  }

  static void reportPost(String postId) {
    PostService().reportPost(postId).then((reported) {
      if (reported) Util.showSnackbar('Post reported');
    }).onError((error, _) => Util.showSnackbar(error.toString()));
  }

  deletePost(String postId) {
    PostService().deletePost(postId).then((value) {
      Util.context.read<FeedsProvider>().removePost(postId);
      Util.showSnackbar('Post deleted successfully');
    }).onError((error, _) => Util.showSnackbar(error.toString()));
  }
}
