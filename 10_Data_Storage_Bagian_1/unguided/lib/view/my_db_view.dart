import 'package:flutter/material.dart';
import 'package:unguided/helper/db_helper.dart';

class MyDatabaseView extends StatefulWidget {
  final Map<String, dynamic>? item; // Menambahkan parameter item untuk edit

  const MyDatabaseView({super.key, this.item});

  @override
  State<MyDatabaseView> createState() => _MyDatabaseViewState();
}

class _MyDatabaseViewState extends State<MyDatabaseView> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _hobiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      // Jika data ada (edit mode), masukkan data ke dalam controller
      _namaController.text = widget.item?['nama'] ?? '';
      _nimController.text = widget.item?['nim'] ?? '';
      _alamatController.text = widget.item?['alamat'] ?? '';
      _hobiController.text = widget.item?['hobi'] ?? '';
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _alamatController.dispose();
    _hobiController.dispose();
    super.dispose();
  }

  void _saveData() async {
    if (_namaController.text.isEmpty ||
        _nimController.text.isEmpty ||
        _alamatController.text.isEmpty ||
        _hobiController.text.isEmpty) {
      _showSnackbar('Tidak boleh kosong!');
      return;
    }

    if (widget.item == null) {
      // Jika item null berarti tambah data
      await dbHelper.insert({
        'nama': _namaController.text,
        'nim': _nimController.text,
        'alamat': _alamatController.text,
        'hobi': _hobiController.text,
      });
    } else {
      // Jika item tidak null berarti edit data
      await dbHelper.update({
        'id': widget.item?['id'],
        'nama': _namaController.text,
        'nim': _nimController.text,
        'alamat': _alamatController.text,
        'hobi': _hobiController.text,
      });
    }

    Navigator.pop(context);
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  //Mendefinisikan fungsi buildText
  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item == null
            ? 'Tambah Biodata Mahasiswa'
            : 'Edit Biodata Mahasiswa'),
        backgroundColor: const Color.fromARGB(255, 222, 135, 240),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildTextField(
              controller: _namaController,
              label: 'Nama',
              icon: Icons.person,
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _nimController,
              label: 'NIM',
              icon: Icons.confirmation_num,
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _alamatController,
              label: 'Alamat',
              icon: Icons.home,
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _hobiController,
              label: 'Hobi',
              icon: Icons.local_activity,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveData,
              child: const Text(
                'Simpan',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 222, 135, 240)),
            ),
          ],
        ),
      ),
    );
  }
} 