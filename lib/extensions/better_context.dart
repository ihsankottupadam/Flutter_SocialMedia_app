import 'package:flutter/material.dart';

extension BetterNaviation on BuildContext {
  navigateTo(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => screen));
  }

  back() {
    Navigator.of(this).pop();
  }

  pushReplace(Widget screen) {
    Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => screen));
  }

  pushRemoveUntil(Widget screen) {
    Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        (route) => false);
  }
}

extension BetterContext on BuildContext {
  showError({required String message, String? action, Function? onAction}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        action: action != null
            ? SnackBarAction(label: action, onPressed: () {})
            : null));
  }

  Size get size => MediaQuery.of(this).size;
  Orientation get orientation => MediaQuery.of(this).orientation;
}
