import 'package:flutter/material.dart';

void main() {
  runApp(const BottomNavApp());
}

class BottomNavApp extends StatelessWidget {
  const BottomNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan BottomNavigationBar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Controller untuk form input
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Fungsi untuk menampilkan alert saat submit
  void _submitForm() {
    final nama = _namaController.text;
    final email = _emailController.text;

    if (nama.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap isi semua field!')),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Data Dikirim'),
          content: Text('Nama: $nama\nEmail: $email'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // Daftar halaman
  late final List<Widget> _pages = <Widget>[
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: _namaController,
            decoration: InputDecoration(
              labelText: 'Masukkan Nama',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Masukkan Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    ),
    const Center(
      child: Text(
        'Ini adalah halaman Wisata',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
      child: Text(
        'Ini adalah halaman Profil',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0
              ? 'Beranda'
              : _selectedIndex == 1
                  ? 'Search'
                  : 'Profile',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
