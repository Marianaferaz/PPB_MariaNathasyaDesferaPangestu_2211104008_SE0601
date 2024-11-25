import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//Kelas untuk mengelola database
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

// factory constructor untuk mengembalikan instance singletonce
  factory DatabaseHelper() {
    return _instance;
  }

// Private constructor
  DatabaseHelper._internal();

//Getter untuk database
  Future<Database> get database async {
    if (_database != null) return _database!;
    {
      _database = await _initDatabase();
      return _database!;
    }
  }

  //Inisialisasi database
  Future<Database> _initDatabase() async {
    // mendapatkan path untuk database
    String path = join(await getDatabasesPath(), 'my_prakdatabase.db');
    // membuka database
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      // Ini untuk menangani upgrade
      onUpgrade: _onUpgrade,
    );
  }

  //Membuat tabel db dengan record dan value id, nama, nim
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE my_table(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
      nama TEXT, 
      nim TEXT,
      alamat TEXT,
      hobi TEXT, 
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Menambahkan kolom alamat dan hobi jika belum ada
      await db.execute('ALTER TABLE my_table ADD COLUMN alamat TEXT');
      await db.execute('ALTER TABLE my_table ADD COLUMN hobi TEXT');
    }
  }

// metode untuk mengambil semua data dari tabel
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('my_table', row);
  }

//  metode untuk memperbarui data dalam tabel
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('my_table', row, where: 'id = ?', whereArgs: [id]);
  }

  // metode untuk menghapus data dari tabel
  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete('my_table', where: 'id = ?', whereArgs: [id]);
  }

  //Membaca semua data
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query('my_table');
  }
}  