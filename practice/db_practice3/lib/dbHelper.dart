import 'package:db_practice3/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const String dbName = 'mydb.db';
  static const int version = 1;

  static const String table = 'table';
  static const String id = 'id';
  static const String name = 'name';

  Future<Database> openDB() async {
    var path = join(await getDatabasesPath(), dbName);

    Database db = await openDatabase(
      path,
      version: version,
      onCreate: (db, version) async {
        await db.execute('''Create table $table(
      $id INTEGER PRIMARY KEY AUTOINCREMENT,
      $name TEXT
      )''');
      },
    );
    return db;
  }

  Future<int> insertion(Item item) async {
    final db = await openDB();
    return await db.insert(table, item.toMap());
  }

  Future<List<Item>> displaying() async {
    final db = await openDB();
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
  }
}
