import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLHelper {
  static Future<Database> db() async {
    return openDatabase(
      join(await getDatabasesPath(), 'mahasiswa.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute("""
          CREATE TABLE mahasiswa(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            nim TEXT,
            alamat TEXT,
            hobi TEXT
          )
        """);
      },
    );
  }

  // CREATE
  static Future<int> createData(String nama, String nim, String alamat, String hobi) async {
    final db = await SQLHelper.db();

    final data = {
      'nama': nama,
      'nim': nim,
      'alamat': alamat,
      'hobi': hobi,
    };

    return db.insert('mahasiswa', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // READ
  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await SQLHelper.db();
    return db.query('mahasiswa', orderBy: "id DESC");
  }
}
