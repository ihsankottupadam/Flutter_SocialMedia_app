import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Tabs/feeeds/providers/feeds_provider.dart';
import 'package:social_media/extensions/better_context.dart';
import 'package:social_media/screens/main_screen.dart';
import 'package:social_media/util.dart';

import '../../../models/usermodel.dart';
import '../../../services/post_service.dart';
import '../../authentication/providers/auth_provider.dart';
import '../models/imagepostmodel.dart';

class NewPostProvider with ChangeNotifier {
  bool isLoading = false;

  final captionController = TextEditingController();
  post(BuildContext context, String imagePath) {
    _showLoading();
    User user = AuthProvider.currUser!;
    final post = ImagePostModel(
      userId: user.id,
      file: imagePath,
      caption: captionController.text,
    );
    PostService().postImage(post).whenComplete(_hideLoading).then((value) {
      Util.context.read<FeedsProvider>().refresh();
    }).onError((error, _) => Util.showSnackbar(error.toString()));
    context.pushRemoveUntil(const MainSCreen());
    captionController.clear();
  }

  void _showLoading() {
    isLoading = true;
    notifyListeners();
  }

  void _hideLoading() {
    isLoading = false;
    notifyListeners();
  }
}
