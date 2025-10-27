import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

TextEditingController inputanNama = TextEditingController();
TextEditingController inputanPassword = TextEditingController();
String nama = "";
int password = 0;
int currentIndex = 0;
List<Widget> pages = [Text("Home"), Text("Menu"), Text("Settings")];
int? item = 1;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text("DropDown Button", style: GoogleFonts.poppins()),
            DropdownButton(
              value: item,
              items: [
                DropdownMenuItem(child: Text("Jakarta"), value: 1),
                DropdownMenuItem(child: Text("Tegal"), value: 2),
                DropdownMenuItem(child: Text("Bandung"), value: 3),
              ],
              onChanged: (value) {
                setState(() {
                  item = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}