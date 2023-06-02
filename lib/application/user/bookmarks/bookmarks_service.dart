// import 'dart:ffi';

// import 'package:finalproject/domain/user/bookmarks/bookmarks.dart';
// import 'package:finalproject/infrastructure/models/content_model.dart';

// class BookamrkService {
//   final List<Bookmark> _bookmarks = [];
//   Future<void> addBookmark(Bookmark bookmark) async {
//     _bookmarks.add(bookmark);
//   }

//   Future<List<Bookmark>> getBookmarks() async {
//     return _bookmarks;
//   }

//   Future<List<Bookmark>> removeBookmark(Bookmark bookmark) async {
//     _bookmarks.remove(bookmark);
//     return _bookmarks;
//   }
// }
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:finalproject/domain/user/bookmarks/bookmarks.dart';

class BookmarkService {
  late Database _database;
  final _bookmarksController = StreamController<List<Bookmark>>();

  BookmarkService() {
    _initializeDatabase();
    _loadBookmarks();
  }

  Future<void> _initializeDatabase() async {
    try {
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, 'bookmarks.db');
      _database = await openDatabase(path, version: 1, onCreate: (db, version) {
        db.execute('''
          CREATE TABLE bookmarks (
            id INTEGER PRIMARY KEY,
            word TEXT,
            meaning TEXT
          )
        ''');
      });
    } catch (error) {
      throw Exception('Failed to initialize database: $error');
    }
  }

  Future<void> addBookmark(Bookmark bookmark) async {
    try {
      await _database.insert('bookmarks', bookmark.toJson());
      _notifyListeners();
    } catch (error) {
      throw Exception('Failed to add bookmark: $error');
    }
  }

  Future<List<Bookmark>> getBookmarks() async {
    try {
      final bookmarks = await _database.query('bookmarks');
      return bookmarks.map((bookmark) => Bookmark.fromJson(bookmark)).toList();
    } catch (error) {
      throw Exception('Failed to get bookmarks: $error');
    }
  }

  Future<void> removeBookmark(Bookmark bookmark) async {
    try {
      await _database.delete(
        'bookmarks',
        where: 'id = ?',
        whereArgs: [bookmark.id],
      );
      _notifyListeners();
    } catch (error) {
      throw Exception('Failed to remove bookmark: $error');
    }
  }

  void _notifyListeners() async {
    try {
      final bookmarks = await getBookmarks();
      _bookmarksController.add(bookmarks);
    } catch (error) {
      throw Exception('Failed to notify listeners: $error');
    }
  }

  void _loadBookmarks() {
    _notifyListeners();
  }

  Stream<List<Bookmark>> get bookmarksStream => _bookmarksController.stream;

  void dispose() {
    _bookmarksController.close();
    _database.close();
  }
}
