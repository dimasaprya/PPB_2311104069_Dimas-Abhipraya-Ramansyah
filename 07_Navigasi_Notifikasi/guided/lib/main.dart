import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:convert';
// import 'package:guided/model/model.dart';
import 'pages/secondPage.dart';

void main(){
  runApp(MyApp());
}

// Future<void> loadJsonData() async {
//   final String response = await rootBundle.loadString("lib/model/model.json");
//   final data = json.decode(response);
//   Album album = Album.fromJson(data);
//   print(album.title);
// }

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    // loadJsonData();
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Halam Ke Mana?",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Secondpage(title: "Halaman 2")),
                );
              },
              child: const Text("Ke Sini"),
            ),
          ],
        ),
      ),
    );
  }
}