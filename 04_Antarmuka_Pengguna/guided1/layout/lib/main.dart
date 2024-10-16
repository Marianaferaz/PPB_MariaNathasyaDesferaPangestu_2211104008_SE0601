import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.grey,
        ),
        body: Column(
          children: [
            // Baris atas dengan teks dan lingkaran
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,',
                        style: TextStyle(
                            fontSize: 24,
                            color: const Color.fromARGB(255, 111, 20, 221)),
                      ),
                      Text(
                        '2211104008 - Maria Nathasya Desfera Pangestu',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  // Lingkaran hitam di pojok kanan
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
            ),
            SizedBox(height: 80), // Jarak antara baris atas dan kotak
            // Kotak ungu yang lebih besar dengan sudut melengkung
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 111, 20, 221),
                borderRadius: BorderRadius.circular(20), // Sudut melengkung
              ),
            ),
          ],
        ),
      ),
    );
  }
}
