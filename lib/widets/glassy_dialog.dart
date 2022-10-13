import 'dart:ui';

import 'package:flutter/material.dart';

class GlassyDialog extends StatelessWidget {
  const GlassyDialog({Key? key, required this.content}) : super(key: key);
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0x44000000),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0x88ffffff))),
            child: Material(color: Colors.transparent, child: content),
          ),
        ),
      ),
    );
  }
}
