import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/post_viewmodel.dart';

class HomeView extends StatelessWidget {
  final PostViewModel viewModel = Get.put(PostViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MVVM - API Post')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: viewModel.getPosts,
            child: const Text('Ambil Data'),
          ),
          Obx(() => Text(viewModel.totalPost)),
          Expanded(
            child: Obx(() {
              if (viewModel.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: viewModel.posts.length,
                itemBuilder: (context, index) {
                  final post = viewModel.posts[index];
                  return Card(
                    child: ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
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
