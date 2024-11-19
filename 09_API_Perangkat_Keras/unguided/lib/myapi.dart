import 'dart:io';

import 'package:flutter/material.dart';
import 'image_picker.dart';

class MyApiPage extends StatefulWidget {
  const MyApiPage({Key? key}) : super(key: key);

  @override
  _MyApiPageState createState() => _MyApiPageState();
}

class _MyApiPageState extends State<MyApiPage> {
  String? _selectedImage; // Untuk menyimpan path gambar yang dipilih

  void _updateImage(String? imagePath) {
    setState(() {
      _selectedImage = imagePath;
    });
  }

  void _clearImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Memilih Gambar'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 232, 153, 244),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: _selectedImage != null
                  ? Image.file(
                      File(_selectedImage!),
                      fit: BoxFit.cover,
                    )
                  : const Icon(
                      Icons.image,
                      size: 100,
                      color: Colors.grey,
                    ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    final imagePath = await ImagePickerPage.pickFromCamera();
                    _updateImage(imagePath);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text('Camera'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 191, 221, 255),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final imagePath = await ImagePickerPage.pickFromGallery();
                    _updateImage(imagePath);
                  },
                  icon: const Icon(Icons.photo),
                  label: const Text('Gallery'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 191, 221, 255),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearImage,
              child: const Text('Hapus Gambar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 191, 221, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}