import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class HomeScreen extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Praktikum 14 - API GetX')),
      body: Column(
        children: [
          Wrap(
            spacing: 8,
            children: [
              ElevatedButton(
                onPressed: controller.getPosts,
                child: const Text('GET'),
              ),
              ElevatedButton(
                onPressed: controller.addPost,
                child: const Text('POST'),
              ),
              ElevatedButton(
                onPressed: controller.updatePost,
                child: const Text('UPDATE'),
              ),
              ElevatedButton(
                onPressed: controller.deletePost,
                child: const Text('DELETE'),
              ),
            ],
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.posts.isEmpty) {
                return const Center(child: Text('Data belum ada'));
              }

              return ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  final post = controller.posts[index];
                  return Card(
                    child: ListTile(
                      title: Text(post['title']),
                      subtitle: Text(post['body']),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
