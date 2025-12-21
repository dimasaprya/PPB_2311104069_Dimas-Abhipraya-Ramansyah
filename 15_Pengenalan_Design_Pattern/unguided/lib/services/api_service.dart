import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Gagal mengambil data');
    }
  }
}
