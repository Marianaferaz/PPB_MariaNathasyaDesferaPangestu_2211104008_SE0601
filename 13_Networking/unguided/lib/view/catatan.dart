import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
import 'package:unguided/view_model/controller.dart';

class TambahCatatan extends StatelessWidget {
  TambahCatatan({super.key});

  final NoteController noteController = Get.find<NoteController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Silahkan Tambah Catatan'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 188, 214),
        foregroundColor: const Color.fromARGB(255, 20, 20, 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Masukkan Judul Catatan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Masukkan Isi Deskripsi',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  noteController.addNote(
                    titleController.text,
                    descriptionController.text,
                  );
                  Get.back(); // Kembali ke halaman utama
                } else {
                  Get.snackbar(
                    'Ada Kesalahan',
                    'Judul dan Deskripsi Catatan tidak boleh kosong!',
                    backgroundColor: const Color.fromARGB(255, 255, 104, 74),
                    colorText: const Color.fromARGB(255, 20, 20, 20),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 210, 233, 255), // Warna biru
                foregroundColor: const Color.fromARGB(255, 20, 20, 20), // Warna teks hitam
              ),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
