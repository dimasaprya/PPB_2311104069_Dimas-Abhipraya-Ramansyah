import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseURL =
      "https://693bba76b762a4f15c3e0a33.mockapi.io/mahasiswa";
  List<dynamic> post = [];

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(baseURL));

      if (response.statusCode == 200) {
        print("Data berhasil diambil");
        post = jsonDecode(response.body);
        print("Response Body: ${response.body}");
        if (post.isNotEmpty) {
          print("Item pertama: ${post[0]}");
        }
      }
    } catch (e) {
      throw Exception('Gagal mengambil data: $e');
    }
  }

  Future<void> postData(String name, String nim) async {
    try {
      final response = await http.post(
        Uri.parse(baseURL),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"name": name, "nim": nim}),
      );

      if (response.statusCode == 201) {
        print("Data dengan nama $name dan nim $nim ditambahkan");
      }
    } catch (e) {
      throw Exception('Gagal menambahkan data: $e');
    }
  }

  Future<void> updateData(String id, String name, String nim) async {
    try {
      final response = await http.put(
        Uri.parse('$baseURL/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"name": name, "nim": nim}),
      );

      if (response.statusCode == 200) {
        print("Data dengan id $id diupdate menjadi nama $name dan nim $nim");
      }
    } catch (e) {
      throw Exception('Gagal mengupdate data: $e');
    }
  }

  Future<void> deleteData(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseURL/$id'));

      if (response.statusCode == 200) {
        print("Data dengan id $id dihapus");
      }
    } catch (e) {
      throw Exception('Gagal menghapus data: $e');
    }
  }
}