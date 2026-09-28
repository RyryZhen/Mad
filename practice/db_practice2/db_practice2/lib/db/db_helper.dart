// import 'package:db_practice2/item.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DbHelper {
//   static const String dbName = 'mydb.db';
//   static const int version = 2;

//   static const String table = 'items';
//   static const String id = 'id';
//   static const String name = 'name';

//   Future<Database> openDb() async {
//     var path = join(await getDatabasesPath(), dbName);

//     Database db = await openDatabase(
//       path,
//       version: version,
//       onCreate: (db, version) async {
//         await db.execute('''Create table $table(
// $id INTEGER PRIMARY KEY AUTOINCREMENT,
// $name TEXT
// )''');
//       },
//     );
//     return db;
//   }

//   // Future<Database> openDb() async {
//   //   var path = join(await getDatabasesPath(), dbName);

//   //   Database db = await openDatabase(
//   //     path,
//   //     version: version,
//   //     onCreate: (db, version) async {
//   //       await db.execute('''CREATE TABLE $table(
//   //     $id INTEGER PRIMARY KEY AUTOINCREMENT,
//   //     $name TEXT
//   //     )''');
//   //     },
//   //   );
//   //   return db;
//   // }

//   // Future<int> inserting(Item item) async {
//   //   final db = await openDb();
//   //   return await db.insert(table, item.toMap());
//   // }
//   // Insert a new item into the table
//   Future<int> insertion(Item item) async {
//     final db = await openDb();
//     return await db.insert(table, item.toMap());
//   }

//   // Get all items from the table
//   Future<List<Item>> displaying() async {
//     final db = await openDb();
//     final List<Map<String, dynamic>> maps = await db.query(table);
//     return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
//   }

//   // Search items by name (contains keyword)
//   Future<List<Item>> searching(String keyword) async {
//     final db = await openDb();
//     final List<Map<String, dynamic>> maps = await db.query(
//       table,
//       where: 'name LIKE ?',
//       whereArgs: ['%$keyword%'], // corrected to include variable
//     );
//     return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
//   }

//   // Delete a specific item by id
//   Future<int> deleting(int id) async {
//     final db = await openDb();
//     return await db.delete(table, where: 'id = ?', whereArgs: [id]);
//   }

//   // Update an existing item by id
//   Future<int> updating(Item item) async {
//     final db = await openDb();
//     return await db.update(
//       table,
//       item.toMap(),
//       where: 'id = ?',
//       whereArgs: [item.id],
//     );
//   }

//   Future<int> ins(Item item) async {
//     final db = await openDb();
//     return await db.insert(table, item.toMap());
//   }

//   // Delete all items from the table
//   Future<int> clearAll() async {
//     final db = await openDb();
//     return await db.delete(table);
//   }

//   // Future<List<Item>> searching(String keyword) async {
//   //   final db = await openDb();
//   //   final List<Map<String, dynamic>> maps = await db.query(
//   //     table,
//   //     where: 'name LIKE ?',
//   //     whereArgs: ['%keyword'],
//   //   );
//   //   return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
//   // }

//   // Future<List<Item>> displaying() async {
//   //   final db = await openDb();

//   //   final List<Map<String, dynamic>> maps = await db.query(table);

//   //   return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
//   // }

//   // Future<int> updateItem(Item item) async {
//   //   final db = await openDb();
//   //   return await db.update(
//   //     table,
//   //     item.toMap(),
//   //     where: 'id = ?',
//   //     whereArgs: [item.id],
//   //   );
//   // }

//   // Future<int> deleting(int id) async {
//   //   final db = await openDb();
//   //   return await db.delete(table, where: 'id=?', whereArgs: [id]);
//   // }

//   // // In db_helper.dart
//   // Future<List<Item>> searching(String keyword) async {
//   //   final db = await openDb();
//   //   final List<Map<String, dynamic>> maps = await db.query(
//   //     table,
//   //     where: 'name LIKE ?',
//   //     whereArgs: ['%$keyword%'],
//   //   );
//   //   return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
//   // }

//   // Future<int> insertItem(Item item) async {
//   //   final db = await openDb();
//   //   return await db.insert(table, item.toMap());
//   // }

//   // Future<List<Item>> display() async {
//   //   final db = await openDb();

//   //   final List<Map<String, dynamic>> maps = await db.query(table);
//   //   return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
//   // }

//   // Future<int> deleteItem(int id) async {
//   //   final db = await openDb();
//   //   return await db.delete(table, where: 'id = ?', whereArgs: [id]);
//   // }
// }
// //db_helper.dart

import 'package:db_practice2/item.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const String dbName = 'my_db.db';
  static const int version = 1;

  static const String table = 'table';
  static const String id = 'id';
  static const String name = 'name';

  Future<Database> openDb() async {
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
    final db = await openDb();
    return await db.insert(table, item.toMap());
  }

  // Future<List<Item>> displaying() async {
  //   final db = await openDb();
  //   final List<Map<String, dynamic>> map = await db.query(table);
  //   return List.generate(map.length, (i) => Item.fromMap(map[i]));
  // }
  Future<List<Item>> displaying() async {
    final db = await openDb();
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
  }

  Future<int> deleting(int id) async {
    final db = await openDb();
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  // Future<int> deletion(int id) async {
  //   final db = await openDb();
  //   return await db.delete(table, where: 'id=?', whereArgs: [id]);
  // }
  Future<int> updating(Item item) async {
    final db = await openDb();
    return await db.update(
      table,
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }
  // Future<int> updating(Item item) async {
  //   final db = await openDb();
  //   return await db.update(
  //     table,
  //     item.toMap(),
  //     where: 'id=?',
  //     whereArgs: [item.id],
  //   );
  // }

  Future<List<Item>> searching(String keyword) async {
    final db = await openDb();
    final List<Map<String, dynamic>> map = await db.query(
      table,
      where: 'name LIKE ?',
      whereArgs: ['%keyword%'],
    );
    return List.generate(map.length, (i) => Item.fromMap(map[i]));
  }
}
