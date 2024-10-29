import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPackage extends StatefulWidget {
  const MyPackage({super.key});

  @override
  _MyPackageState createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackage> {
  String? selectedValue; // Menyimpan nilai yang dipilih pada dropdown
  final List<String> items = ['Item 1', 'Item 2', 'Item 3']; // Daftar item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Belajar Package",
          style: GoogleFonts.poppins(), // Menggunakan font Poppins di sini
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Masukkan Nama: ",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              obscuringCharacter: "*",
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Masukkan Password: ",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {},
              child: Text(
                'Ini adalah Elevated Button',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              child: Text('Ini adalah Text Button'),
            ),
            // DROPDOWN
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedValue,
              hint: Text('Pilih Item'),
              isExpanded: true,
              dropdownColor: Colors.white,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black, fontSize: 16),
              underline: Container(
                height: 2,
                color: Colors.grey,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}