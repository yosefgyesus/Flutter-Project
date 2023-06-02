import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../domain/user/bookmarks/bookmarks.dart';

class BookmarkRepository {
  late Database _database;

  Future<Database> openDatabase(String path,
      {required int version,
      required void Function(Database, int)? onCreate}) async {
    final databasePath = await getDatabasesPath();
    final dbPath = join(databasePath, path);
    final database =
        await openDatabase(dbPath, version: version, onCreate: onCreate);
    return database;
  }

  Future<void> closeDatabase() async {
    await _database.close();
  }

  Future<void> addBookmark(Bookmark bookmark) async {
    await _database.insert('bookmarks', bookmark.toJson());
  }

  Future<List<Bookmark>> getBookmarks() async {
    final List<Map<String, dynamic>> maps = await _database.query('bookmarks');
    return List.generate(maps.length, (index) {
      return Bookmark.fromJson(maps[index]);
    });
  }

  Future<void> removeBookmark(Bookmark bookmark) async {
    await _database.delete(
      'bookmarks',
      where: 'id = ?',
      whereArgs: [bookmark.id],
    );
  }
}
