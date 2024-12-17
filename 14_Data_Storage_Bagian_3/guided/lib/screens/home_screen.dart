import 'package:flutter/material.dart';
import 'package:guided/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _posts = []; // Menyimpan list posts
  bool _isLoading = false; // Untuk indikator loading
  final ApiService _apiService = ApiService(); // Instance ApiService

  // Fungsi untuk menampilkan SnackBar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // Fungsi untuk memanggil API dan menangani operasi
  Future<void> _handleApiOperation(
      Future<void> operation, String successMessage) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await operation; // Menjalankan operasi API
      setState(() {
        _posts = _apiService.posts;
      });
      _showSnackBar(successMessage);
    } catch (e) {
      _showSnackBar('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Request Example'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 222, 135, 240),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_posts.isEmpty)
              const Text(
                "Tekan tombol GET untuk mengambil data",
                style: TextStyle(fontSize: 16),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text(
                            _posts[index]['title'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Text(
                            _posts[index]['body'],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handleApiOperation(
                  _apiService.fetchPosts(), 'Data berhasil diambil!'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('GET'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _handleApiOperation(
                  _apiService.createPost(), 'Data berhasil ditambahkan!'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('POST'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _handleApiOperation(
                  _apiService.updatePost(1), 'Data berhasil diperbarui!'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('UPDATE'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _handleApiOperation(
                  _apiService.deletePost(1), 'Data berhasil dihapus!'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('DELETE'),
            ),
          ],
        ),
      ),
    );
  }
}
