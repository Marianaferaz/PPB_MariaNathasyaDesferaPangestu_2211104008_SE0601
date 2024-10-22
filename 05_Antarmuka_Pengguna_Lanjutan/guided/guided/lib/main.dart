import 'package:flutter/material.dart';
//import 'package:guided/flexible_expanded.dart';
//import 'package:guided/listview_separated.dart';
//import 'package:guided/listview_builder.dart';
//import 'package:guided/customscroll_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const FlexibleExpandedScreen(title: 'Flexible and Expanded Demo'),
      //home: const ListViewSeparatedExample(),
      //home: const ListViewBuilderExample()
      //home: const CustomScrollViewExample()
    );
  }
}