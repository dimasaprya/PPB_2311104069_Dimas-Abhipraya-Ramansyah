import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/note_list_page.dart';
import 'pages/add_note_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => NoteListPage()),
        GetPage(name: '/add', page: () => AddNotePage()),
      ],
    );
  }
}
