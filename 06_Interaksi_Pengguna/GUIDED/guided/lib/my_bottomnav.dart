import 'package:flutter/material.dart';
import 'package:guided/my_package.dart';
import 'package:guided/my_tabbar.dart';

class MyBottomnav extends StatefulWidget {
  const MyBottomnav({super.key});

  @override
  State<MyBottomnav> createState() => _MyBottomnavState();
}

class _MyBottomnavState extends State<MyBottomnav> {
  int _currentIndex = 0;

  static List<Widget> _page = <Widget>[
    MyTabbar(),
    MyPackage(),
    MyPackage(),
  ];

  void _onTappedItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Bottom Navigation Bar"),
        backgroundColor: Colors.amber,
      ),
      body: _page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "History",
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onTappedItem,
      ),
    );
  }
}