import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static const _databaseName = "tr_store.db";
  static const _databaseVersion = 1;

  static const noteTable =
      'CREATE TABLE product(id INTEGER PRIMARY KEY, title TEXT,content TEXT, price TEXT, image_url TEXT,thumbnail TEXT, timestamp INTEGER, created_at TEXT, updated_at TEXT)';
  static const moneyTable =
      'CREATE TABLE cart(id INTEGER PRIMARY KEY, product_id INTEGER, user_id INTEGER, total_products TEXT, total_amount TEXT, title TEXT, price TEXT, thumbnail TEXT, timestamp INTEGER, created_at TEXT, updated_at TEXT)';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await db.execute(noteTable);
        await db.execute(moneyTable);
      },
    );
  }
}
