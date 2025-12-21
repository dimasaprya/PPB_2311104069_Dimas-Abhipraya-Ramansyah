import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class PostViewModel extends GetxController {
  final ApiService _apiService = ApiService();

  var posts = <Post>[].obs;
  var isLoading = false.obs;

  Future<void> getPosts() async {
    try {
      isLoading.value = true;
      posts.value = await _apiService.fetchPosts();
      Get.snackbar('Sukses', 'Data berhasil diambil');
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengambil data');
    } finally {
      isLoading.value = false;
    }
  }

  String get totalPost => 'Total Post: ${posts.length}';
}
