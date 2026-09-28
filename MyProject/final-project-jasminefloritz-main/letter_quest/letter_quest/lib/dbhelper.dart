import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:letter_quest/model/flashcard.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  factory DbHelper() => _instance;

  DbHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'letter_quest.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            word TEXT,
            image TEXT,
            favorite INTEGER
          )
        ''');
      },
    );
  }

  Future<int?> getFavoriteId(String word) async {
    final db = await database;
    List<Map> maps = await db.query(
      'favorites',
      columns: ['id'],
      where: 'word = ?',
      whereArgs: [word],
    );
    if (maps.isNotEmpty) {
      return maps.first['id'] as int;
    }
    return null;
  }

  Future<int> insertFlashcard(Flashcard card) async {
    final db = await database;

    List<Map> maps = await db.query(
      'favorites',
      where: 'word = ?',
      whereArgs: [card.word],
    );
    if (maps.isNotEmpty) return maps.first['id'];

    return await db.insert('favorites', card.toMap());
  }

  Future<List<Flashcard>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');
    return List.generate(maps.length, (i) => Flashcard.fromMap(maps[i]));
  }

  Future<int> deleteFlashcard(int id) async {
    final db = await database;
    return await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearDatabase() async {
    final db = await database;
    await db.delete('favorites');
  }
}
