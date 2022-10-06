import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heiht = math.max(size.height * .3, size.width * .3);
    double circHeight = heiht * 2 / 3;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: SizedBox(
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: heiht,
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      elevation: 10,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(circHeight),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(circHeight)),
                          width: circHeight,
                          height: circHeight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _makeBox(heiht * .5),
            const SizedBox(height: 10),
            _makeBox(heiht * .5),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _makeBox(heiht * .3, 20),
                _makeBox(heiht * .3, 20),
                _makeBox(heiht * .3, 20)
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 12,
                  itemBuilder: (_, __) => Container(
                        margin: const EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        color: Colors.white,
                      )),
            )
          ],
        ),
      ),
    );
  }

  _makeBox(double w, [double h = 15]) => Container(
        width: w,
        height: h,
        color: Colors.white,
      );
}
