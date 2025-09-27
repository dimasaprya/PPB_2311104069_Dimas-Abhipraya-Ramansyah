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
      appBar: AppBar(title: Center(child: Text("Aplikasi Pertama")), backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              color: Colors.red,
              child: Center(
                child: Container(height: 50, width: 50, color: Colors.black)), 
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              color: Colors.orange,
              child: Center(
                child: Container(height: 50, width: 50, color: Colors.black)),
            ),
             SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              color: Colors.yellow,
              child: Center(
                child: Container(height: 50, width: 50, color: Colors.black)),
            ),
             SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              color: Colors.green,
              child: Center(
                child: Container(height: 50, width: 50, color: Colors.black)),
            ),
             SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              color: Colors.blue,
              child: Center(
                child: Container(height: 50, width: 50, color: Colors.black)),
            ),
             SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              color: Colors.blueGrey,
              child: Center(
                child: Container(height: 50, width: 50, color: Colors.black)),
            ), 
          ], 
        ), 
      ),
    );
  }
}