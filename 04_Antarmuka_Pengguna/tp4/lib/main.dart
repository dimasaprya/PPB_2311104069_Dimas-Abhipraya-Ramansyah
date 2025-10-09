import 'package:flutter/material.dart';

void main() {
  runApp(const RekomendasiWisataApp());
}

class RekomendasiWisataApp extends StatelessWidget {
  const RekomendasiWisataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Rekomendasi Wisata',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.purple.shade700,
          centerTitle: true,
          elevation: 4,
        ),
        body: const WisataScreen(),
      ),
    );
  }
}

class WisataScreen extends StatelessWidget {
  const WisataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF3E5F5), Color(0xFFE1BEE7)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8,
              shadowColor: Colors.purple.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Candi Borobudur',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Gambar dengan efek fade-in dan rounded corner
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://www.smsperkasa.com/_next/image?url=https%3A%2F%2Fcpanel-blog.smsperkasa.com%2Fwp-content%2Fuploads%2F2023%2F09%2FSejarah-candi-borobudur.png&w=3840&q=75',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const SizedBox(
                            height: 200,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.purple,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            height: 200,
                            child: Center(
                              child: Text('Gagal memuat gambar'),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Text(
                      'Candi Borobudur adalah candi Buddha terbesar di dunia dan salah satu situs warisan dunia UNESCO, '
                      'terletak di Magelang, Jawa Tengah. Dibangun pada abad ke-8 oleh Dinasti Syailendra, '
                      'monumen ini menampilkan arsitektur megah dengan relief yang menggambarkan ajaran Buddha.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Tombol dengan efek gradasi
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.purple.shade600,
                          foregroundColor: Colors.white,
                          elevation: 3,
                        ),
                        child: const Text(
                          'Kunjungi Tempat',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
