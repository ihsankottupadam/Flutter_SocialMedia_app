import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widets/input_field.dart';
import '../providers/newpost_provider.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key, required this.imageFile}) : super(key: key);
  final File imageFile;
  @override
  Widget build(BuildContext context) {
    final provider = context.read<NewPostProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('New post')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(child: Image.file(imageFile, fit: BoxFit.contain)),
            InputField(
              controller: provider.captionController,
              hintText: 'Caption',
            ),
            SizedBox(
                width: double.infinity,
                child:
                    Consumer<NewPostProvider>(builder: (context, provider, _) {
                  return ElevatedButton(
                      onPressed: () {
                        if (provider.isLoading) return;
                        provider.post(context, imageFile.path);
                      },
                      child: provider.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text('Post'));
                }))
          ],
        ),
      ),
    );
  }
}
