import 'package:supabase/supabase.dart';

const supabaseUrl = 'https://bsltpsgroyrtedaukaev.supabase.co';
const supabaseKey = 'sb_publishable_sK9pz6yKZkAriw0oFJ_igQ_pU1EZjLA';

final supabase = SupabaseClient(supabaseUrl, supabaseKey);

Future<void> main() async {
  // CREATE (Insert data buku)
  await createBuku(
    judul: "Laskar Pelangi",
    penulis: "Andrea Hirata",
    tahunTerbit: 2005,
    genre: "Novel",
  );

  // READ (Ambil semua data)
  await readBuku();
}

// =========================
// CREATE DATA
// =========================
Future<void> createBuku({
  required String judul,
  required String penulis,
  required int tahunTerbit,
  required String genre,
}) async {
  final response = await supabase.from('perpustakaan').insert({
    'judul': judul,
    'penulis': penulis,
    'tahun_terbit': tahunTerbit,
    'genre': genre,
  });

  print("Data berhasil ditambahkan:");
  print(response);
}

// =========================
// READ DATA
// =========================
Future<void> readBuku() async {
  final response = await supabase.from('perpustakaan').select();

  print("\n=== Daftar Buku di Supabase ===");
  for (var item in response) {
    print("""
ID            : ${item['id']}
Judul         : ${item['judul']}
Penulis       : ${item['penulis']}
Tahun Terbit  : ${item['tahun_terbit']}
Genre         : ${item['genre']}
Created At    : ${item['created_at']}
---------------------------------------
""");
  }
}
