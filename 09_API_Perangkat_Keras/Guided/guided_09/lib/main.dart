import 'package:flutter/material.dart';
import 'package:guided_09/image_picker.dart';
import 'package:guided_09/myapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 9',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyApiPage(),
      home: ImageFromGalleryEx(ImageSourceType.camera),
    );
  }
}