import 'package:bas_agrisi_takip_sistemi/sqflite/model/bas_agri_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "basAgri.db";
  static const databaseVersion = 1;
  static const table = "basagri_table";
  static const columnId = "id";
  static const columnDate = "date";
  static const columnSiddet = "siddet";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = (await _initDatabase()) as Database?;
    return null;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table(
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnDate TEXT NOT NULL,
      $columnSiddet INTEGER NOT NULL
    )
    ''');
  }

  Future<int?> insert(BasAgri agri) async {
    Database? db = await instance.database;
    return await db?.insert(table, {
      "date": agri.date,
      "siddet": agri.siddet,
    });
  }

  Future<int?> delete(int id) async {
    Database? db = await instance.database;
    return await db?.delete(
      table,
      where: "$columnId = ?",
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>?> queryAllRows() async {
    Database? db = await instance.database;
    return await db?.query(table);
  }
}
