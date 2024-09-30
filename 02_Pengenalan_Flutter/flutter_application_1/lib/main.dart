import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Biodata'),
          backgroundColor: Colors.deepPurple, // Mengatur warna AppBar
        ),
        body: YourBiodata(),
      ),
    );
  }
}

class YourBiodata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/Myfoto.jpg'), // Ganti dengan path gambarmu
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Maria Nathasya Desfera Pangestu',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
            ),
            Center(child: Text('NIM: 2211104008')),
            Center(child: Text('Program Studi: Rekayasa Perangkat Lunak')),
            Center(child: Text('Jenis Kelamin: Perempuan')),
            SizedBox(height: 20),
            Text(
              'Hobi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            Row(
              children: [
                Icon(Icons.music_note, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text('Mendengarkan musik dan menonton film'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Cita-cita',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            Text('Menjadi orang sukses dan bisa menonton konser artis favorit'),
            SizedBox(height: 16),
            Card(
              color: Colors.grey,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Saya adalah seorang mahasiswa dari prodi RPL di Telkom University Purwokerto.',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}