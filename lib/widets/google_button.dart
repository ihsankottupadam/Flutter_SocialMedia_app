import 'package:flutter/material.dart';

import '../helpers/ui_helper.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: const BorderSide(color: Colors.black26)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/google-icon.png'),
              UiHelper.horizondalSpaceMed,
              const Text('Continue with Google',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black))
            ],
          )),
    );
  }
}
