import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:social_media/extensions/better_context.dart';
import 'package:social_media/screens/post/View/new_post.dart';
import 'package:social_media/services/platform_service.dart';

class NewPostChooseScreen extends StatelessWidget {
  const NewPostChooseScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double min = math.min(size.height, size.width);
    return Scaffold(
      appBar: AppBar(
        title: const Text('New post'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ColBtn(
                    icon: Icons.camera,
                    title: 'Camera',
                    size: min / 2.5,
                    onPressed: () => _choosePhoto(context, ImageSource.camera),
                  ),
                  ColBtn(
                      icon: Icons.image,
                      title: 'Gallery',
                      size: min / 2.5,
                      onPressed: () =>
                          _choosePhoto(context, ImageSource.gallery)),
                ],
              ),
              FutureBuilder<List<String>>(
                future: PlatformService().getRecentImages(count: 40),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    final images = snapshot.data!;
                    return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: images.length,
                        itemBuilder: (context, indext) {
                          File imageFile = File(images[indext]);
                          return GestureDetector(
                            onTap: () {
                              context.navigateTo(
                                  NewPostScreen(imageFile: imageFile));
                            },
                            child: Image.file(
                              imageFile,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.low,
                              cacheWidth: 300,
                              width: double.infinity,
                            ),
                          );
                        });
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _choosePhoto(BuildContext context, source) async {
    final ImagePicker picker = ImagePicker();
    picker
        .pickImage(
      source: source,
      maxHeight: 1080,
      maxWidth: 1080,
      imageQuality: 80,
      preferredCameraDevice: CameraDevice.front,
    )
        .then((image) {
      if (image != null) {
        File imageFile = File(image.path);
        context.navigateTo(NewPostScreen(imageFile: imageFile));
      }
    });
  }
}

class ColBtn extends StatelessWidget {
  const ColBtn(
      {Key? key,
      required this.icon,
      required this.title,
      this.onPressed,
      required this.size})
      : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;
  final double size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: size,
        height: size,
        child: Padding(
          padding: EdgeInsets.all(size * .1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon, size: size * .25),
              Text(title,
                  style: TextStyle(
                      fontSize: size * 0.1, fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}
