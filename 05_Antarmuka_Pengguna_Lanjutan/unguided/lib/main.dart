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
      theme: ThemeData(
        colorSchemeSeed: Colors.blue.shade700,
        useMaterial3: true,
      ),
      home: const WisataScreen(),
    );
  }
}

class WisataScreen extends StatelessWidget {
  const WisataScreen({super.key});

  final List<Map<String, String>> wisataList = const [
    {
      'nama': 'Telaga Sunyi',
      'gambar':
          'https://salsawisata.com/wp-content/uploads/2023/12/tiket-masuk-telaga-sunyi.webp',
      'deskripsi':
          'Telaga Sunyi adalah destinasi alam tersembunyi di kaki Gunung Slamet, sekitar 15 km dari pusat Purwokerto. '
              'Dikenal karena airnya yang jernih dan suasananya yang tenang, tempat ini cocok untuk menenangkan diri atau menikmati keindahan alam. '
              'Dikelilingi pepohonan pinus dan suara alam, Telaga Sunyi memberikan pengalaman wisata yang sejuk dan damai.'
    },
    {
      'nama': 'Alun-Alun Purwokerto',
      'gambar':
          'https://radarbanyumas.disway.id/upload/2021/03/Renovasi-Tahap-II-Alun-Alun-Purwokerto-Dialokasikan-Anggaran-16-Miliar.jpg',
      'deskripsi':
          'Alun-Alun Purwokerto merupakan ruang publik yang menjadi pusat kegiatan masyarakat. '
              'Dikelilingi oleh pepohonan rindang, masjid agung, dan berbagai fasilitas umum, tempat ini cocok untuk bersantai bersama keluarga. '
              'Pada malam hari, area ini semakin semarak dengan lampu warna-warni dan jajanan khas Purwokerto yang menggugah selera.'
    },
    {
      'nama': 'Menara Pandang Teratai',
      'gambar':
          'https://asset.kompas.com/crops/4lwSYEJ1LY1N6SrXs6WXpzkCRfs=/122x2:1280x774/1200x800/data/photo/2023/11/11/654f9e00d9ccd.jpg',
      'deskripsi':
          'Menara Pandang Teratai adalah ikon baru di Purwokerto yang menawarkan pemandangan kota dari ketinggian. '
              'Terletak di kawasan pusat kota, menara ini memiliki desain modern berbentuk teratai yang menjadi simbol keindahan dan ketenangan. '
              'Dari atas menara, pengunjung dapat menikmati panorama kota Purwokerto, Gunung Slamet, dan suasana sekitar alun-alun.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 218, 231, 248),
              Color.fromARGB(255, 179, 205, 243),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              expandedHeight: 250.0,
              backgroundColor: Colors.blue.shade700,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text(
                  'Rekomendasi Wisata',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black54,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'https://salsawisata.com/wp-content/uploads/2023/12/tiket-masuk-telaga-sunyi.webp',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
            ),

            // Sliver list for wisata items
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final wisata = wisataList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: WisataCard(
                        nama: wisata['nama']!,
                        gambar: wisata['gambar']!,
                        deskripsi: wisata['deskripsi']!,
                      ),
                    );
                  },
                  childCount: wisataList.length,
                ),
              ),
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
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      shadowColor: Colors.blue.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  gambar,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.blue));
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    nama,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),

          // Deskripsi
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              deskripsi,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ),

          // Tombol aksi
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 4),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Membuka informasi $nama...'),
                      backgroundColor: Colors.blue.shade700,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: const Icon(Icons.place),
                label: const Text(
                  'Kunjungi Tempat',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
