import 'package:flutter/material.dart';

void main() {
  runApp(const RekomendasiWisataApp());
}

class RekomendasiWisataApp extends StatelessWidget {
  const RekomendasiWisataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Banyumas',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Rekomendasi Wisata',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue.shade700,
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
          colors: [Color.fromARGB(255, 204, 221, 243), Color.fromARGB(255, 153, 192, 237)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            WisataCard(
              nama: 'Telaga Sunyi',
              gambar:
                  'https://salsawisata.com/wp-content/uploads/2023/12/tiket-masuk-telaga-sunyi.webp',
              deskripsi:
                  'Telaga Sunyi adalah destinasi alam tersembunyi di kaki Gunung Slamet, sekitar 15 km dari pusat Purwokerto. '
                  'Dikenal karena airnya yang jernih dan suasananya yang tenang, tempat ini cocok untuk menenangkan diri atau menikmati keindahan alam. '
                  'Dikelilingi pepohonan pinus dan suara alam, Telaga Sunyi memberikan pengalaman wisata yang sejuk dan damai.',
            ),
            SizedBox(height: 30),
            WisataCard(
              nama: 'Alun-Alun Purwokerto',
              gambar:
                  'https://radarbanyumas.disway.id/upload/2021/03/Renovasi-Tahap-II-Alun-Alun-Purwokerto-Dialokasikan-Anggaran-16-Miliar.jpg',
              deskripsi:
                  'Alun-Alun Purwokerto merupakan ruang publik yang menjadi pusat kegiatan masyarakat. '
                  'Dikelilingi oleh pepohonan rindang, masjid agung, dan berbagai fasilitas umum, tempat ini cocok untuk bersantai bersama keluarga. '
                  'Pada malam hari, area ini semakin semarak dengan lampu warna-warni dan jajanan khas Purwokerto yang menggugah selera. ',
            ),
            SizedBox(height: 30),
            WisataCard(
              nama: 'Menara Pandang Teratai',
              gambar:
                  'https://asset.kompas.com/crops/4lwSYEJ1LY1N6SrXs6WXpzkCRfs=/122x2:1280x774/1200x800/data/photo/2023/11/11/654f9e00d9ccd.jpg',
              deskripsi:
                  'Menara Pandang Teratai adalah ikon baru di Purwokerto yang menawarkan pemandangan kota dari ketinggian. '
                  'Terletak di kawasan pusat kota, menara ini memiliki desain modern berbentuk teratai yang menjadi simbol keindahan dan ketenangan. '
                  'Dari atas menara, pengunjung dapat menikmati panorama kota Purwokerto, Gunung Slamet, dan suasana sekitar alun-alun.',
            ),
          ],
        ),
      ),
    );
  }
}

class WisataCard extends StatelessWidget {
  final String nama;
  final String gambar;
  final String deskripsi;

  const WisataCard({
    super.key,
    required this.nama,
    required this.gambar,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      shadowColor: Colors.blue.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              nama,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),

            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                gambar,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 200,
                    child: Center(child: Text('Gagal memuat gambar')),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            Text(
              deskripsi,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Membuka informasi $nama...'),
                      backgroundColor: Colors.blue,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.blue.shade600,
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
    );
  }
}
