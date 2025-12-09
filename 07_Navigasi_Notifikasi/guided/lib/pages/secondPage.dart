import 'package:flutter/material.dart';

class Secondpage extends StatefulWidget{
  const Secondpage({super.key, required this.title});
  final String title;

  @override
  StatefulElement createElement() {
    // TODO: implement createElement
    return super.createElement();
  }State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Halaman Kedua! ✌🏻",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: const Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}