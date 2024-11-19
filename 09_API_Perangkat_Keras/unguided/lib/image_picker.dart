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
