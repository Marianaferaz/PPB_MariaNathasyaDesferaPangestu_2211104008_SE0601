# PPB_MariaNathasyaDesferaPangestu_2211104008_SE0601
PEMROGRAMAN PERANGKAT BERGERAK
MODUL IX
API PERANGKAT KERAS

![image](ss/Telyu%20logo.png)

Disusun Oleh:
Maria Nathasya Desfera Pangestu/2211104008
SE0601

Asisten Praktikum:
Muhammad Faza Zulian Gesit Al Barru
Aisyah Hasna Aulia

Dosen Pengampu:
Yudha Islami Sulistya, S.Kom., M.Cs.

PROGRAM STUDI S1 SOFTWARE ENGINEERING
FAKULTAS INFORMATIKA
TELKOM UNIVERSITY PURWOKERTO
2024

UNGUIDED
Main Dart
Sreenshot code main dart:<br>
![image](09_API_Perangkat_Keras/ss/unguided_code_maindart.png)<br>

Source code:<br>
import 'package:flutter/material.dart';
import 'myapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Memilih Gambar',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyApiPage(),
    );
  }
} 
<br>

Image Picker Dart
Sreenshot code image picker dart:<br>
![image](09_API_Perangkat_Keras/ss/unguided_code_image_picker.png)<br>

Source code:<br>
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage {
  static final ImagePicker _picker = ImagePicker();

  // Fungsi untuk mengambil gambar dari galeri
  static Future<String?> pickFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      return pickedFile?.path;
    } catch (e) {
      print("Error picking image from gallery: $e");
      return null;
    }
  }

  // Fungsi untuk mengambil gambar dari kamera
  static Future<String?> pickFromCamera() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      return pickedFile?.path;
    } catch (e) {
      print("Error picking image from camera: $e");
      return null;
    }
  }
}
<br>

Myapi Dart
Sreenshot code myapi dart:<br>
![image](09_API_Perangkat_Keras/ss/unguided_code_myapi.png)<br>

Source code:<br>
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
<br>

Hasil Output
![image](09_API_Perangkat_Keras/ss/unguided9_output_1.png)<br>

![image](09_API_Perangkat_Keras/ss/unguided9_output_2.png)<br>

![image](09_API_Perangkat_Keras/ss/unguided9_output_3.png)<br>

![image](09_API_Perangkat_Keras/ss/unguided9_output_4.png)<br>

![image](09_API_Perangkat_Keras/ss/unguided9_output_5.png)<br>

![image](09_API_Perangkat_Keras/ss/unguided9_output_6.png)<br>

![image](09_API_Perangkat_Keras/ss/unguided9_output_7.png)<br>

Penjelasan code<br>
Kode tersebut gunanya untuk menampilkan gambar pada Flutter. Bagian atasnya untuk mengatur tema dan tampilan utama aplikasi. Aplikasi ini menggunakan warna ungu sebagai warna utama dan menggunakan halaman MyApiPage sebagai halaman awal. Di bagian bawah kode terdapat fungsi-fungsi yang memungkinkan pengguna memilih gambar dari galeri ataupun kamera dari handphone mereka; fungsi ini menggunakan library image_picker sehingga memungkinkan aplikasi berinteraksi dengan kamera atau galeri handphone. Intinya kode ini untuk aplikasi Flutter yang bisa membuat pengguna memilih gambar dari handphone mereka. 