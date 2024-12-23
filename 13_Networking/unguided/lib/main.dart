import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unguided/view/homepage.dart';
import 'package:unguided/view/catatan.dart';

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
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/add', page: () => TambahCatatan()),
      ],
    );
  }
}