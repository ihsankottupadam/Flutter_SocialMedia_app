import 'package:flutter/material.dart';

Future navigateTo(BuildContext context, Widget screen) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => screen));
}
