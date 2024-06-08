// dependencies:
//   flutter:
//     sdk: flutter
//   image_picker: ^0.8.4+1
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(ImagePickerApp());
}

class ImagePickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Picker Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  getImageFromGallery(context);
                },
                child: Text('Select Image from Gallery'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DisplayImage(imagePath: pickedFile.path)),
      );
    }
  }
}

class DisplayImage extends StatelessWidget {
  final String imagePath;

  const DisplayImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Image'),
      ),
      body: Image.file(File(imagePath)),
    );
  }
}
