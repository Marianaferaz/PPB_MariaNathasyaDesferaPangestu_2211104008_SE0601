# PPB_MariaNathasyaDesferaPangestu_2211104008_SE0601
TUGAS PENDAHULUAN
PEMROGRAMAN PERANGKAT BERGERAK
MODUL IV 
ANTARMUKA PENGGUNA

![image](ss/Telyu%20logo.jpg)

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

Membuat Tampilan Antarmuka

Soal:
1. Membuat Antarmuka Pengguna dengan tampilan seperti berikut:
![image](ss/Soal_1_TP.jpg)

Source code:
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Rekomendasi Wisata'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Baturraden",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.network(
                "https://visitjawatengah.jatengprov.go.id/assets/images/2a2f08e2-8100-4da7-98ed-b8919535bbc8.jpg",
                width: 300,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Text(
                    'Gambar tidak bisa dimuat',
                    style: TextStyle(color: Colors.red),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Salah satu tempat wisata yang menjadi idola dan wajib di kunjungi saat berada di Kabupaten Banyumas adalah Lokawisata Baturraden. Yap, obyek wisata yang berada di wilayah Kecamatan Baturraden, Kabupaten Banyumas dan memiliki fasilitas terlengkap ini tidak bisa dilewatkan untuk dikunjungi. Lokasinya juga cukup dekat dengan pusat kota Purwokerto hanya sekitar 15 KM dan menempati ketinggian 640-750 mdpl. Tempat wisata ini cocok untuk semua umur, mulai dari anak-anak hingga orang tua. Selain wahana yang unik, Baturraden adalah destinasi untuk menikmati kuliner khas Banyumas, seperti mendoan, Pecel Banyumas, dan lain-lain. Semua itu dapat dinikmati sambil merasakan kesejukan dan keindahan lereng Gunung Slamet.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Menuju ke Baturraden")),
                );
              },
              child: const Text("Kunjungi tempat"),
            ),
          ],
        ),
      ),
    );
  }
}

Screenshot Output:
![image](ss/hasil%20run%20tp.jpg)
![image](ss/codingan%20tp.png)

Deskripsi Program:
Aplikasi Flutter ini dirancang untuk menampilkan informasi dasar mengenai tempat wisata di Batu Raden. Dengan tampilan yang sederhana namun juga informatif karena bisa menampilkan gambar, deskripsi singkat, dan  tombol interaktif. Saat pengguna mengklik tombol Kunjungi Lokasi, maka aplikasi akan memberikan pemberitahuan singkat sebagai umpan balik. Secara keseluruhan, aplikasi ini fungsinya sebagai panduan singkat bagi pengguna yang ingin mengetahui lebih banyak mengenai Batu Raden. Dibuat dengan menggunakan framework Flutter memungkinkan Anda dalam mengembangkan aplikasi lintas platform dengan tampilan yang menarik dan responsif.