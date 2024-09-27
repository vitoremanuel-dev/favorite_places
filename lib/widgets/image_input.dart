import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _storedImage = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      // Caso haja imagem eu quero que ela apareça no lugar do container
      child: _storedImage != null
          ? Image.file(
              _storedImage!,
              fit: BoxFit.cover,
              width: double.infinity,
            )
          : TextButton.icon(
              onPressed: _takePicture,
              label: const Text('Tirar Foto'),
              icon: const Icon(Icons.camera),
            ),
    );
  }
}
