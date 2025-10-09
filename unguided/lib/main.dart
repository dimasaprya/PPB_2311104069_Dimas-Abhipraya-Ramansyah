import 'dart:io';

void main() {

  // SOAL 1
  //   stdout.write("Masukkan nilai: ");
  //   int nilai = int.parse(stdin.readLineSync()!);

  //   String hasil = cekNilai(nilai);
  //   if (hasil.isNotEmpty) {
  //     print("$nilai merupakan $hasil");
  //   } else {
  //     print("Nilai tidak valid");
  //   }
  // }

  // String cekNilai(int nilai) {
  //   if (nilai > 70) {
  //     return "Nilai A";
  //   } else if (nilai > 40 && nilai <= 70) {
  //     return "Nilai B";
  //   } else if (nilai > 0 && nilai <= 40) {
  //     return "Nilai C";
  //   } else {
  //     return "";

  // SOAL 2
  // stdout.write("Masukkan tinggi piramida: ");
  // int tinggi = int.parse(stdin.readLineSync()!);
  // for (int i = 1; i <= tinggi; i++) {

  //   for (int j = 1; j <= tinggi - i; j++) {
  //     stdout.write(" ");
  //   }

  //   for (int k = 1; k <= (2 * i - 1); k++) {
  //     stdout.write("*");
  //   }
  //   print("");

  // SOAL 3
  //   stdout.write("Masukkan bilangan: ");
  //   int angka = int.parse(stdin.readLineSync()!);

  //   if (cekPrima(angka)) {
  //     print("$angka merupakan bilangan prima");
  //   } else {
  //     print("$angka bukan bilangan prima");
  //   }
  // }

  // bool cekPrima(int n) {
  //   if (n < 2) return false;
  //   for (int i = 2; i <= n ~/ 2; i++) {
  //     if (n % i == 0) {
  //       return false;
  //     }
  //   }
  //   return true;
  // }
}
