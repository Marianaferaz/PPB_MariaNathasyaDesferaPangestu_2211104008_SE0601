import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Mahasiswa'),
        backgroundColor: const Color.fromARGB(255, 188, 134, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Nama: Maria Nathasya Desfera Pangestu',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'NIM: 2211104008',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Angkatan: 2022',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Program Studi: S1 Rekayasa Perangkat Lunak',
              style: TextStyle(fontSize: 16),
            ),
             SizedBox(height: 16),
            Text(
              'Universitas: Telkom University Purwokerto',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}