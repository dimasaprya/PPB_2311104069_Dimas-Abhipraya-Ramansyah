import 'package:flutter/material.dart';
import 'register_page.dart';
import 'main_page.dart';
import '../utils/notification.dart'; // pastikan file ini sudah ada

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(Icons.apple, size: 70, color: Colors.black),
                const SizedBox(height: 20),
                const Text(
                  "Masuk ke Akunmu",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Kata Sandi",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),

                // 🔹 Tombol Login
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                  ),
                  onPressed: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      // 🔸 Tampilkan notifikasi sukses
                      showTopNotification(
                        context,
                        title: "Login Berhasil!",
                        message: "Selamat datang kembali 👋",
                        color: Colors.green.shade600,
                        icon: Icons.check_circle,
                      );

                      // 🔸 Delay sedikit agar notifikasi sempat tampil
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MainPage(
                              userName: "Pengguna",
                              userEmail: emailController.text,
                            ),
                          ),
                        );
                      });
                    } else {
                      // 🔸 Notifikasi error
                      showTopNotification(
                        context,
                        title: "Login Gagal!",
                        message: "Mohon isi semua field.",
                        color: Colors.red.shade600,
                        icon: Icons.error,
                      );
                    }
                  },
                  child: const Text(
                    "Masuk",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 15),

                // 🔹 Link ke halaman register
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()),
                    );
                  },
                  child: const Text(
                    "Belum memiliki akun? Registrasi",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
