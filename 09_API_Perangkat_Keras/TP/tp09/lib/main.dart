import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart'; // Pastikan sudah mengimpor package dotted_border

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImagePickerScreen(),
    );
  }
}

class ImagePickerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Latihan Memilih Gambar'),
        ),
        backgroundColor: Colors.yellow.shade300,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            // Container for image icon dengan dotted (garis putus-putus)
            DottedBorder(
              color: Colors.grey, // Color of the dotted border
              strokeWidth: 2,
              dashPattern: [5, 4], // Pattern of dashes
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              child: Container(
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 150,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Button Camera dan Gallery
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt, color: Colors.black),
                  label: Text(
                    'Camera',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[300],
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.photo,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Gallery',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[300],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Button Hapus Gambar
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Hapus Gambar',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow.shade700,
                padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.yellow.shade50,
    );
  }
}