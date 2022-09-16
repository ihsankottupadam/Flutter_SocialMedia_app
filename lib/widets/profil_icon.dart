import 'package:flutter/cupertino.dart';

class ProfilIcon extends StatelessWidget {
  const ProfilIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/images/my_dp.jpeg',
          width: 30,
          height: 30,
          fit: BoxFit.cover,
        ));
  }
}
