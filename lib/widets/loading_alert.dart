import 'package:flutter/material.dart';

class LoadingAlert extends StatelessWidget {
  const LoadingAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const Center(
        child:
            SizedBox(width: 40, height: 40, child: CircularProgressIndicator()),
      ),
    );
  }
}
