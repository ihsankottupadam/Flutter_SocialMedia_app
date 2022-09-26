import 'package:flutter/material.dart';

class Util {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static showSnackbar(String text) {
    final context = Util.navigatorState.currentContext!;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  static BuildContext get context => navigatorState.currentContext!;
}
