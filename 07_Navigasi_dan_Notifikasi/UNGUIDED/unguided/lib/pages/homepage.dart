import 'package:flutter/material.dart';
import '../model/product.dart';
import 'detail.dart';

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      title: 'ACNE CICA Plus Clear Serum 20ml',
      price: 99000,
      imageUrl:
          'https://down-id.img.susercontent.com/file/a50973fef308de29c244824b003a01bb',
      description:
          'Acne Cica Serum, solution for acne skin! Serum ini dapat digunakan untuk semua jenis kulit terutama kulit sensitif dan acne prone skin yang berfungsi untuk meredakan kemerahan juga kulit iritasi. Dengan kandungan 7 macam bahan cica complex yang akan menenangkan masalah kulit kemerahan serta mengunci kelembapan kulit. Produk ini cocok untuk kamu yang mengalami masalah kulit berjerawat.',
     ),
    Product(
      id: '2',
      title: 'NACIFIC X ATEEZ Daily Mood Lip Cream',
      price: 72000,
      imageUrl:
          'https://down-mx.img.susercontent.com/file/sg-11134207-7rdw2-lxcoaijn3ulb71',
      description:
          'Mengandung Vitamin E & Argan Oil yang menutrisi dan membantu melembabkan bibir. Tersedia dalam 8 pilihan warna menarik yang pastinya akan membuat penampilan kamu jadi lebih terpancar serta nyaman digunakan untuk aktivitas sehari-hari. Serta akan ada special gift berupa ID Photo & 4 Cuts Photo Ateez yang akan dikirimkan random sesuai jumlah pembelian kalian.',
    ),
    Product(
      id: '3',
      title: 'NACIFIC X ATEEZ : Exclusive Vegan Hand Butter',
      price: 69000,
      imageUrl:
          'https://pinkbeatshop.com/cdn/shop/files/handbutterateez_1000x.webp?v=1710653110',
      description:
          'Hand Cream yang mengandung Shea butter dan Ceramide berfungsi melembabkan telapak tangan yang kering serta memberikan keharuman yang menyegarkan setelah dipakai. Dengan kandungan tersebut maka akan membuat kulit telapak tangan anda menjadi lebih lembut, menjaga skin barrier dari paparan uv, serta membantu mencerahkan dengan kandungan licorice extract. Serta ada special gift berupa ID Photo Ateez yang akan dikirimkan random sesuai jumlah pembelian kalian.',
    ),
    Product(
      id: '4',
      title: 'Nacific Origin Red Salicylic Acid Toner 150ml',
      price: 152000,
      imageUrl:
          'https://m.media-amazon.com/images/I/51SyPdPn+VL.AC_UF1000,1000_QL80.jpg',
      description:
          'Memiliki kandungan Salicylic Acid yang berfungsi sebagai gentle exfoliator, 6 tipe Hyaluronic Acid sebagai protektor permukaan kulit untuk melembabkan dan melindungi skin barrier, serta Derma Clera dari ekstrak White Rice Flowers yang berfungsi meredakan kulit sensitif. Produk ini cocok untuk anda yang memiliki kulit sensitif dan acne prone skin.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Nacific Store'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 214, 101)),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ProductDetailPages(product: products[i]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: products[i]
                    .backgroundColor, // Warna latar belakang kontainer produk
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(products[i].imageUrl, fit: BoxFit.cover),
                ),
                footer: Container(
                  color: products[i].backgroundColor ??
                      const Color.fromARGB(255, 255, 228, 120), // BackgroundColor pada footer
                  child: GridTileBar(
                    backgroundColor: Colors.transparent, // Set transparan
                    title: Text(
                      products[i].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black), // Warna teks agar menjadi kontras
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}