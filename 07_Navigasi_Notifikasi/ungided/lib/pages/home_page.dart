import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:another_flushbar/flushbar.dart';
import '../models/product.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  final List<Product> cart;
  const HomePage({super.key, required this.cart});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> products = [
    Product(
      name: 'iPhone 17 Pro Max',
      price: 30249000,
      description:
          'iPhone 17 Pro Max adalah varian premium dari seri iPhone 17 yang dirilis oleh Apple pada tahun 2025.',
      image: 'assets/produk1.jpeg',
    ),
    Product(
      name: 'iPhone 17',
      price: 17249000,
      description:
          'Seri iPhone 17 menghadirkan peningkatan besar, termasuk layar ProMotion 120Hz dan sistem kamera lebih baik.',
      image: 'assets/produk3.jpeg',
    ),
    Product(
      name: 'iPhone 16',
      price: 13990000,
      description:
          'Seri iPhone 16 membawa performa tinggi, kamera AI, dan tombol kamera baru.',
      image: 'assets/produk2.jpeg',
    ),
  ];

  final List<String> banners = [
    'assets/banner.jpeg',
    'assets/banner2.jpeg',
    'assets/banner3.webp',
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startBannerAutoSlide();
  }

  void _startBannerAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _showTopNotification(String message) {
    Flushbar(
      title: "Berhasil!",
      message: message,
      backgroundColor: Colors.green.shade600,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(12),
      borderRadius: BorderRadius.circular(12),
      icon: const Icon(Icons.check_circle, color: Colors.white),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat("#,###", "id_ID");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Apple Store"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: [
          // 🔹 Banner Slider
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: banners.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(banners[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(banners.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 10 : 6,
                        height: _currentPage == index ? 10 : 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.black
                              : Colors.grey.shade400,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          const Text(
            "Produk Pilihan",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // 🔹 Grid Produk
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          product: product,
                          onAddToCart: (selectedProduct) {
                            setState(() {
                              widget.cart.add(selectedProduct);
                            });
                            _showTopNotification(
                                "${selectedProduct.name} berhasil ditambahkan ke keranjang");
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15)),
                            child: Image.asset(product.image, fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(product.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(
                                'Rp ${formatCurrency.format(product.price)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
