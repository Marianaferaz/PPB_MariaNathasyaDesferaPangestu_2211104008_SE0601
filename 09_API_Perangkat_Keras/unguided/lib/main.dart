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
        primarySwatch: Colors.purple,
      ),
      home: const MyApiPage(),
    );
  }
}