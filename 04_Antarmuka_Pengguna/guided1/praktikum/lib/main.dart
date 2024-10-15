import 'package:flutter/material.dart';
import 'package:praktikum/list_view.dart';


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
      home: ListViewApp(title: "List View"),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.blue[100],
                child: const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Hi!"),
                      ]),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.blue[200],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("We're Ateez"),
                      Image.network(
                        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fvibrancemagazine.com%2Fateez-akan-rilis-lima-music-video-baru-mulai-besok%2F&psig=AOvVaw0Tp528YYxbYZP-1Jyw6cPH&ust=1729040556738000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqGAoTCIijmpWYj4kDFQAAAAAdAAAAABCHAQ',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text("Check out our new song now."),
                color: Colors.blue[300],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text("Hope you guys like it."),
                color: Colors.blue[400],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text("Thank you, we love you Atiny"),
                color: Colors.blue[500],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text("See you soon."),
                color: Colors.blue[600],
              ),
            ]
        ),
      ),
    );
  }
}