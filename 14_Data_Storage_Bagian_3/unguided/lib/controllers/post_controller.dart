import 'package:get/get.dart';
import '../services/api_service.dart';

class PostController extends GetxController {
  final ApiService apiService = ApiService();

  var posts = <dynamic>[].obs;
  var isLoading = false.obs;

  Future<void> getPosts() async {
    isLoading.value = true;
    await apiService.fetchPosts();
    posts.value = apiService.posts;
    isLoading.value = false;

    Get.snackbar('Sukses', 'Data berhasil diambil');
  }

  Future<void> addPost() async {
    await apiService.createPost();
    posts.value = apiService.posts;
    Get.snackbar('Sukses', 'Data berhasil ditambahkan');
  }

  Future<void> updatePost() async {
    await apiService.updatePost();
    posts.refresh();
    Get.snackbar('Sukses', 'Data berhasil diperbarui');
  }

  Future<void> deletePost() async {
    await apiService.deletePost();
    posts.refresh();
    Get.snackbar('Sukses', 'Data berhasil dihapus');
  }
}
