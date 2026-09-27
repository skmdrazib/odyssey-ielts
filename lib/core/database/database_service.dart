import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();

    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    return openDatabase(
      join(dbPath, 'odyssey.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE favorites(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          word TEXT UNIQUE
        )
        ''');

        await db.execute('''
        CREATE TABLE progress(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          lesson TEXT,
          completed INTEGER
        )
        ''');
      },
    );
  }
}