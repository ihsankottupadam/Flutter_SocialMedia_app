import 'package:flutter/material.dart';
import 'package:social_media/Tabs/profile/model/userdetails.dart';
import 'package:social_media/models/postmodel.dart';
import 'package:social_media/services/base_api_service.dart';
import 'package:social_media/services/post_service.dart';
import 'package:social_media/services/user_service.dart';
import 'package:social_media/util.dart';

class FeedsProvider with ChangeNotifier {
  List<PostModel> posts = [];
  List<UserDetails> suggestions = [];
  bool isLoading = true;
  late GlobalKey<NavigatorState> navigatorKey;
  init() {
    if (posts.isEmpty) {
      refresh();
    }
  }

  Future<void> refresh() async {
    _loadSugestions();
    await PostService()
        .getPosts()
        .whenComplete(() => _hideLoading())
        .then((postList) => posts = postList)
        .catchError((error) => _error('Loadin failed', error, refresh));
    notifyListeners();
  }

  void refreshSuggestion() async {
    suggestions = await UserService().getSuggestions();
    notifyListeners();
  }

  void _loadSugestions() async {
    suggestions = await UserService().getSuggestions();
  }

  _error(String head, String e, Future Function() onRetry) {
    final context = Util.navigatorState.currentContext!;
    if (e == BaseApiService.neteorkError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$head, No Network'),
          action: SnackBarAction(
            label: 'Retry',
            onPressed: () {
              onRetry.call();
            },
          )));
    } else {
      Util.showSnackbar(e);
    }
  }

  _hideLoading() {
    isLoading = false;
    notifyListeners();
  }

  removePost(String postId) {
    posts.removeWhere((post) => post.id == postId);
    notifyListeners();
  }

  removePostsfromUser(String userId) {
    posts.removeWhere((post) => post.userId == userId);
    notifyListeners();
  }

  void reset() {
    posts.clear();
    suggestions.clear();
  }
}
