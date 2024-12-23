import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unguided/view_model/controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Catatan Sederhana GetX'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 188, 214),
        foregroundColor: const Color.fromARGB(255, 20, 20, 20),
      ),
      body: Obx(
        () => noteController.notes.isEmpty
            ? const Center(
                child: Text('Kamu masih belum memiliki catatan.'),
              )
            : ListView.builder(
                itemCount: noteController.notes.length,
                itemBuilder: (context, index) {
                  final note = noteController.notes[index];
                  return Card(
                    child: ListTile(
                      title: Text(note['title']!),
                      subtitle: Text(note['description']!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          noteController.deleteNote(index);
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add');
        },
        backgroundColor: const Color.fromARGB(255, 255, 188, 214),
        foregroundColor: const Color.fromARGB(255, 20, 20, 20),
        child: const Icon(Icons.add),
      ),
    );
  }
}