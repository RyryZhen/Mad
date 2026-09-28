import 'package:bike_buddy2/Models/pro_tips.dart';
import 'package:bike_buddy2/Models/tip_highlight.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//lib\db_helper\database.dart
class DBHelper {
  static const String dbName = 'bike_bud.db';
  static const String table = 'favorites_table';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await openDb();
    return _database!;
  }

  Future<Database> openDb() async {
    var path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $table (
          id INTEGER PRIMARY KEY,
          title TEXT,
          description TEXT,
          iconCode INTEGER,
          colorValue INTEGER,
          category TEXT
        )''');
      },
    );
  }

  Future<int> insertFavorite(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteById(int id) async {
    final db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<dynamic>> getAllFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(table);

    return List.generate(maps.length, (i) {
      if (maps[i]['category'] == 'Daily Tip') {
        return DailyTip.fromMap(maps[i]);
      } else {
        return ProTip.fromMap(maps[i]);
      }
    });
  }

  Future<void> clearAll() async {
    final db = await database;
    await db.delete(table);
  }
}
