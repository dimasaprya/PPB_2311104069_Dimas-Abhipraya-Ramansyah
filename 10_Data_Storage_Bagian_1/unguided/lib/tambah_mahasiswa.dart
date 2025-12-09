import 'package:flutter/material.dart';
import 'sql_helper.dart';

class TambahMahasiswa extends StatefulWidget {
  @override
  _TambahMahasiswaState createState() => _TambahMahasiswaState();
}

class _TambahMahasiswaState extends State<TambahMahasiswa> {
  final namaController = TextEditingController();
  final nimController = TextEditingController();
  final alamatController = TextEditingController();
  final hobiController = TextEditingController();

  void simpan() async {
    await SQLHelper.createData(
      namaController.text,
      nimController.text,
      alamatController.text,
      hobiController.text,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Biodata Mahasiswa"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            TextField(
              controller: nimController,
              decoration: InputDecoration(labelText: "NIM"),
            ),
            TextField(
              controller: alamatController,
              decoration: InputDecoration(labelText: "Alamat"),
            ),
            TextField(
              controller: hobiController,
              decoration: InputDecoration(labelText: "Hobi"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: simpan,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
