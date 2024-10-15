import 'package:flutter/material.dart';

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
      home: const ListViewApp(title: 'Flutter Demo Home Page'),
    );
  }
}

class ListViewApp extends StatefulWidget {
  const ListViewApp({super.key, required this.title});

  final String title;

  @override
  State<ListViewApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ListViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text("A"),),
            ),
            Container(
              height: 200,
              color: Colors.amber[500],
              child: const Center(
                child: Text("B"),
              ),
            ),
            Container(
              height: 300,
              color: Colors.amber[200],
              child: const Center(
                child: Text("C"),
              ),
            ),
          ],
        )
      ),
    );
  }
}