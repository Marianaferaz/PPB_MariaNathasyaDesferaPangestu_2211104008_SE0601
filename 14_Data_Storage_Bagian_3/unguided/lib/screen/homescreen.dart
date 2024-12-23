import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unguided/controller/controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController controller = Get.put(ApiController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Storage API'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 210, 233, 255),
        foregroundColor: const Color.fromARGB(255, 20, 20, 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : controller.posts.isEmpty
                    ? const Text(
                        "Untuk mengambil data silahkan tekan tombol GET",
                        style: TextStyle(fontSize: 12),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: controller.posts.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 4,
                              child: ListTile(
                                title: Text(
                                  controller.posts[index]['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                subtitle: Text(
                                  controller.posts[index]['body'],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            );
                          },
                        ),
                      )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: controller.fetchPosts,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 230, 188, 255),
                    foregroundColor: const Color.fromARGB(255, 20, 20, 20), // Warna teks hitam
                  ),
                  child: const Text('GET'),
                ),
                ElevatedButton(
                  onPressed: controller.createPost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 232, 163),
                    foregroundColor: const Color.fromARGB(255, 20, 20, 20), // Warna teks hitam
                  ),
                  child: const Text('POST'),
                ),
                ElevatedButton(
                  onPressed: controller.updatePost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 209, 255, 148),
                    foregroundColor: const Color.fromARGB(255, 20, 20, 20), // Warna teks hitam
                  ),
                  child: const Text('UPDATE'),
                ),
                ElevatedButton(
                  onPressed: controller.deletePost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 188, 214),
                    foregroundColor: const Color.fromARGB(255, 20, 20, 20), // Warna teks hitam
                  ),
                  child: const Text('DELETE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
