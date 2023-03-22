import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._instance();

  DbHelper._instance();

  static Database? _db;

  Future<Database> get db async {
    _db ??= await initDb();
    return _db!;
  }

  static Future<Database> initDb() async {
    final db = openDatabase(
      join(await getDatabasesPath(), 'shop.db'),
      onCreate: (db, version) => _createDb(db),
      version: 1,
    );
    return db;
  }

  static void _createDb(Database db) {
    db.execute(
        'CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price INTEGER, quantity INTEGER, status INTEGER)');
    db.execute(
        ' CREATE TABLE clients(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, last_name TEXT, email TEXT, phone TEXT, address TEXT, status INTEGER)');
  }
}
