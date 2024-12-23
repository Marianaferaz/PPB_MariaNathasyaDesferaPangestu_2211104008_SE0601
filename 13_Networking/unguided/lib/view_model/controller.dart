import 'package:get/get.dart';

class NoteController extends GetxController {
  // List untuk menyimpan catatan
  var notes = <Map<String, String>>[].obs;

  // Fungsi untuk menambah catatan
  void addNote(String title, String description) {
    notes.add({'title': title, 'description': description});
  }

  // Fungsi untuk menghapus catatan
  void deleteNote(int index) {
    notes.removeAt(index);
  }
}