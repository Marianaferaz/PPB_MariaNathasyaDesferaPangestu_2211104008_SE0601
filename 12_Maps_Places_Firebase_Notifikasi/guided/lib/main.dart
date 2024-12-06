import 'package:flutter/material.dart';
import 'package:guided/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 12',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 222, 135,240)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}