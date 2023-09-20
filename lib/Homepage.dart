import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera and Gallery Access'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selectedImage != null)
              Image.file(
                File(_selectedImage!.path),
                width: 200,
                height: 200,
              ),
            ElevatedButton(
              onPressed: () async {
                selectImageFromCamera();
              },
              child: const Text('Click For Camera'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                selectImageFromGallery();
              },
              child: const Text('Click For Gallery'),
            )
          ],
        ),
      ),
    );
  }

  selectImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = XFile(pickedImage.path);
      });
    }
  }

  selectImageFromGallery() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}
