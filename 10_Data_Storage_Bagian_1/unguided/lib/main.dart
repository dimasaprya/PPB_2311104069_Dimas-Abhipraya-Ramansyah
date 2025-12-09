import 'package:flutter/material.dart';
import 'sql_helper.dart';
import 'tambah_mahasiswa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> mahasiswa = [];

  @override
  void initState() {
    super.initState();
    loadMahasiswa();
  }

  void loadMahasiswa() async {
    final data = await SQLHelper.getData();
    setState(() {
      mahasiswa = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite Biodata Mahasiswa"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemCount: mahasiswa.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(mahasiswa[index]['nama'],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NIM     : ${mahasiswa[index]['nim']}"),
                  Text("Alamat  : ${mahasiswa[index]['alamat']}"),
                  Text("Hobi    : ${mahasiswa[index]['hobi']}"),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahMahasiswa()),
          );
          loadMahasiswa();
        },
      ),
    );
  }
}
