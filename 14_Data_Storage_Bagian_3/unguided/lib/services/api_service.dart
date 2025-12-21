import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  List<dynamic> posts = [];

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      posts = json.decode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> createPost() async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': 'Flutter Post',
        'body': 'Ini contoh POST',
        'userId': 1,
      }),
    );

    if (response.statusCode == 201) {
      posts.insert(0, {
        'id': posts.length + 1,
        'title': 'Flutter Post',
        'body': 'Ini contoh POST',
      });
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future<void> updatePost() async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/1'),
      body: json.encode({
        'title': 'Updated Title',
        'body': 'Updated Body',
        'userId': 1,
      }),
    );

    if (response.statusCode == 200) {
      posts[0]['title'] = 'Updated Title';
      posts[0]['body'] = 'Updated Body';
    } else {
      throw Exception('Failed to update post');
    }
  }

  Future<void> deletePost() async {
    final response = await http.delete(
      Uri.parse('$baseUrl/posts/1'),
    );

    if (response.statusCode == 200) {
      posts.removeAt(0);
    } else {
      throw Exception('Failed to delete post');
    }
  }
}
