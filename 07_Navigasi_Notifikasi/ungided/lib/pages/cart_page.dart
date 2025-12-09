import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:intl/intl.dart';
import 'package:another_flushbar/flushbar.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;
  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void showPaymentDialog() {
    double total = widget.cartItems.fold(0, (sum, item) => sum + item.price);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Konfirmasi Pembayaran"),
        content: Text(
          'Rp ${NumberFormat("#,###", "id_ID").format(total)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Batal", style: TextStyle(color: Colors.black)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                widget.cartItems.clear();
              });

              // 🔹 Ganti snackbar jadi flushbar (notifikasi di atas)
              Flushbar(
                title: "Pembayaran Berhasil!",
                message: "Keranjang telah dikosongkan.",
                backgroundColor: Colors.green.shade600,
                duration: const Duration(seconds: 3),
                margin: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(12),
                flushbarPosition: FlushbarPosition.TOP,
                icon: const Icon(Icons.check_circle, color: Colors.white),
              ).show(context);
            },
            child: const Text("Bayar", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double total = widget.cartItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Keranjang"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: widget.cartItems.isEmpty
          ? const Center(child: Text("Keranjang ko1song"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return ListTile(
                        leading: Image.asset(item.image, width: 50),
                        title: Text(item.name),
                        subtitle: Text(
                          'Rp ${NumberFormat("#,###", "id_ID").format(item.price)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Total: Rp ${NumberFormat("#,###", "id_ID").format(total)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                        ),
                        onPressed: showPaymentDialog,
                        child: const Text(
                          "Bayar Sekarang",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
