import 'package:dp_practice_quiz/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const String dbname = 'myApp.db';
  static const int version = 1;

  static const String table = 'itemTable';
  static const String id = 'itemId';
  static const String name = 'itemName';

  Future<Database> opendb() async {
    var path = join(await getDatabasesPath(), dbname);
    Database db = await openDatabase(
      path,
      version: version,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $table(
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        $name TEXT)''');
      },
    );
    return db;
  }

  Future<int> insertItem(Item item) async {
    final db = await opendb();

    return await db.insert(table, item.tomap());
  }

  Future<List<Item>> display() async{
    final db = await opendb();
    final List<Map<String, dynamic>> maps = await db.query(table);

    return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
  }
}
