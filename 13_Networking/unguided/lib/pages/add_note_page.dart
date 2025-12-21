import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';

class AddNotePage extends StatelessWidget {
  final NoteController controller = Get.find();
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Catatan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.addNote(titleCtrl.text, descCtrl.text);
                Get.back();
              },
              child: const Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }
}
