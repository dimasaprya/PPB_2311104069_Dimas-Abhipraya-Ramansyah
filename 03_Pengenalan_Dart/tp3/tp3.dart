// import 'dart:io';

// // Fungsi perkalian sederhana
// int kali(int a, int b) {
//   return a * b;
// }

// void main() {
//   // Input angka pertama
//   stdout.write("Masukkan angka pertama: ");
//   int a = int.parse(stdin.readLineSync()!);

//   // Input angka kedua
//   stdout.write("Masukkan angka kedua: ");
//   int b = int.parse(stdin.readLineSync()!);

//   // Hitung hasil
//   int hasil = kali(a, b);
//   print("Hasil perkalian $a x $b = $hasil");
// }

import 'dart:io';

void main() {
  // Input batas angka
  stdout.write("Hitung jumlah bilangan dari 1 sampai: ");
  int batas = int.parse(stdin.readLineSync()!);

  // Perulangan for
  int jumlahFor = 0;
  for (int i = 1; i <= batas; i++) {
    jumlahFor += i;
  }
  print("Jumlah bilangan 1 sampai $batas (for loop) = $jumlahFor");

  // Perulangan while
  int jumlahWhile = 0;
  int j = 1;
  while (j <= batas) {
    jumlahWhile += j;
    j++;
  }
  print("Jumlah bilangan 1 sampai $batas (while loop) = $jumlahWhile");
}
