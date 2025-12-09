import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:intl/intl.dart';
import '../utils/notification.dart'; // tetap dipakai untuk notifikasi beli sekarang

class DetailPage extends StatelessWidget {
  final Product product;
  final Function(Product) onAddToCart;

  const DetailPage({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(product.image, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              product.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Rp ${NumberFormat("#,###", "id_ID").format(product.price)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Tombol Aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol Tambah ke Keranjang
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                  ),
                  onPressed: () {
                    onAddToCart(product); // ✅ hanya panggil fungsi
                  },
                  icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                  label: const Text(
                    "Keranjang",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(width: 15),

                // Tombol Beli Sekarang
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                  ),
                  onPressed: () {
                    showTopNotification(
                      context,
                      title: "Pembayaran Berhasil!",
                      message:
                          "Terima kasih telah membeli ${product.name} 💚",
                      color: Colors.green.shade600,
                      icon: Icons.check_circle,
                    );
                  },
                  icon: const Icon(Icons.payment, color: Colors.white),
                  label: const Text(
                    "Beli Sekarang",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
