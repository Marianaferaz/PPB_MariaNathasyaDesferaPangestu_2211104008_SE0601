import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  List<dynamic> posts = []; // Menyimpan data post yang diterima

  // Fungsi untuk GET data
  Future<void> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        posts = json.decode(response.body) as List<dynamic>;
      } else {
        throw Exception(
            'Failed to load posts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch posts. Error: $e');
    }
  }

  // Fungsi untuk POST data
  Future<void> createPost() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'userId': 1,
        }),
      );
      if (response.statusCode == 201) {
        final newPost = json.decode(response.body);
        posts.add(newPost); // Menambahkan data baru ke daftar posts
      } else {
        throw Exception(
            'Failed to create post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to create post. Error: $e');
    }
  }

  // Fungsi untuk UPDATE data
  Future<void> updatePost(int postId) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/posts/$postId'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Updated Title',
          'body': 'Updated Body',
          'userId': 1,
        }),
      );
      if (response.statusCode == 200) {
        final updatedPostIndex =
            posts.indexWhere((post) => post['id'] == postId);
        if (updatedPostIndex != -1) {
          posts[updatedPostIndex] = {
            'id': postId,
            'title': 'Updated Title',
            'body': 'Updated Body',
            'userId': 1,
          };
        } else {
          throw Exception('Post with id $postId not found in local data');
        }
      } else {
        throw Exception(
            'Failed to update post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to update post. Error: $e');
    }
  }

  // Fungsi untuk DELETE data
  Future<void> deletePost(int postId) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/posts/$postId'));
      if (response.statusCode == 200) {
        posts.removeWhere((post) => post['id'] == postId);
      } else {
        throw Exception(
            'Failed to delete post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete post. Error: $e');
    }
  }
}