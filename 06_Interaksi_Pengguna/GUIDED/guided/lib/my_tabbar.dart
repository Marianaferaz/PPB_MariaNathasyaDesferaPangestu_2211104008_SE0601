import 'package:flutter/material.dart';

class MyTabbar extends StatefulWidget {
  const MyTabbar({super.key});

  @override
  State<MyTabbar> createState() => _MyTabbarState();
}

class _MyTabbarState extends State<MyTabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contoh Tab Bar"),
          backgroundColor: Colors.amber,
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.food_bank),
              text: "Menu",
            ),
            Tab(
              icon: Icon(Icons.food_bank),
              text: "Calendar",
            ),
            Tab(
              icon: Icon(Icons.food_bank),
              text: "History",
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text("Ini Konten Menu"),
            ),
            Center(
              child: Text("Ini Konten Calendar"),
            ),
            Center(
              child: Text("Ini Konten History"),
            ),
          ],
        ),
      ),
    );
  }
}