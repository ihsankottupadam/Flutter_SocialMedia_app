import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media/functions/api_functions.dart';
import 'package:social_media/models/postmodel.dart';
import 'package:social_media/services/post_service.dart';
import 'package:social_media/util.dart';

class FeedsProvider with ChangeNotifier {
  List<PostModel> posts = [];
  bool isLoading = true;
  late GlobalKey<NavigatorState> navigatorKey;
  init() {
    if (posts.isEmpty) {
      refresh();
    }
  }

  Future<void> refresh() async {
    await PostService()
        .getPosts()
        .whenComplete(() => _hideLoading())
        .then((postList) => posts = postList.reversed.toList())
        .catchError((error) => _error('Loadin failed', error, refresh));
    notifyListeners();
  }

  _error(String head, String e, Future Function() onRetry) {
    final context = Util.navigatorState.currentContext!;
    if (e == networkError) {
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
}
