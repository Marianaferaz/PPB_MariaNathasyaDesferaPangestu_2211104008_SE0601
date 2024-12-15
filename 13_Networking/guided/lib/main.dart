import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guided/view/detail.dart';
import 'package:guided/view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/', page: () => MyHomePage(title: 'GetX Modul 13')),
        GetPage(name: '/detail', page: () => DetailPage()),
      ],
    );
  }
}
