import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera & Gallery',
      debugShowCheckedModeBanner: false,
      home: const ImagePickerPage(),
    );
  }
}

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  /// Ambil gambar dari galeri
  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  /// Ambil gambar dari kamera
  Future<void> pickFromCamera() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  /// Hapus gambar
  void removeImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unguided Modul 09"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),

          /// Container untuk gambar
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.grey[200],
            ),
            child: _image != null
                ? Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.image,
                    size: 80,
                    color: Colors.grey,
                  ),
          ),

          const SizedBox(height: 30),

          /// Tombol Gallery
          ElevatedButton.icon(
            onPressed: pickFromGallery,
            icon: const Icon(Icons.photo_library),
            label: const Text("Gallery"),
          ),

          const SizedBox(height: 10),

          /// Tombol Camera
          ElevatedButton.icon(
            onPressed: pickFromCamera,
            icon: const Icon(Icons.camera_alt),
            label: const Text("Camera"),
          ),

          const SizedBox(height: 10),

          /// Tombol Hapus
          ElevatedButton.icon(
            onPressed: removeImage,
            icon: const Icon(Icons.delete),
            label: const Text("Hapus Gambar"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
