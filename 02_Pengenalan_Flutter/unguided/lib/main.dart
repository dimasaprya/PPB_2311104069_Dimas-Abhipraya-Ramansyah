import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Homepage(),);
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Sekilas Info", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))), backgroundColor: const Color.fromARGB(255, 0, 57, 157),),
      body: Center(
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 0, 68, 185),
                  child: Center(
                    child: Text("Dimas Abhipraya Ramansyah", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, 
                      color: Colors.white))), 
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 0, 121, 221),
                  child: Center(
                    child: Text("2311104069", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, 
                      color: Colors.white))),
                ),
                 SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 0, 140, 255),
                  child: Center(
                    child: Text("S1 Software Engineering", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, 
                      color: Colors.white))),
                ),
                 SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 19, 149, 255),
                  child: Center(
                    child: Text("24 Oktober 2005", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, 
                      color: Colors.white))),
                ),
                 SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 44, 160, 255),
                  child: Center(
                    child: Text("Mancing di Rolbox", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, 
                      color: Colors.white))),
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 81, 174, 250),
                  child: Center(
                    child: Text("Dapet Kraken", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, 
                      color: Colors.white))),
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 411,
                  color: const Color.fromARGB(255, 120, 194, 255),
                  child: Center(
                    child: Text("Dapet megalodon", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, 
                      color: Colors.white))),
                ), 
              ], 
            ),
          ],
        ), 
      ),
    );
  }
}