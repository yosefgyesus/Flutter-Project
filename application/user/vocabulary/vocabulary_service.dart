import 'package:finalproject/domain/user/vocabulary/vocabulary.dart';
import 'package:finalproject/infrastructure/services/api_service.dart';
//import 'package:finalproject/infrastructure/services/api_service.dart';
import 'package:sqflite/sqflite.dart';
import "package:path_provider/path_provider.dart";

class VocabularyService {
  final ApiService _apiService;

  VocabularyService(this._apiService);

  Future<List> getVocabularyList() async {
    try {
      final List<Map<String, dynamic>> vocabularyMaps =
          await DatabaseProvider.database.query('vocabulary');
      return vocabularyMaps.map((map) => Vocabulary.fromMap(map)).toList();
    } catch (error) {
      // Handle the error
      print('Failed to retrieve vocabulary list: $error');
      return [];
    }
  }

  Future<void> addVocabulary(Vocabulary vocabulary) async {
    try {
      await DatabaseProvider.database.insert(
        'vocabulary',
        vocabulary.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      // Success message or further actions
      print('Added vocabulary successfully');
    } catch (error) {
      // Handle the error
      print('Failed to add vocabulary: $error');
    }
  }

  Future<void> updateVocabulary(Vocabulary vocabulary) async {
    try {
      await DatabaseProvider.database.update(
        'vocabulary',
        vocabulary.toMap(),
        where: 'id = ?',
        whereArgs: [vocabulary.id],
      );
      // Success message or further actions
      print('Updated vocabulary successfully');
    } catch (error) {
      // Handle the error
      print('Failed to update vocabulary: $error');
    }
  }

  Future<void> deleteVocabulary(int vocabularyId) async {
    try {
      await DatabaseProvider.database.delete(
        'vocabulary',
        where: 'id = ?',
        whereArgs: [vocabularyId],
      );
      // Success message or further actions
      print('Deleted vocabulary successfully');
    } catch (error) {
      // Handle the error
      print('Failed to delete vocabulary: $error');
    }
  }
}

class DatabaseProvider {
  static late Database database;

  static Future<void> initialize() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = documentsDirectory.path + '/vocabulary.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE vocabulary (
            id INTEGER PRIMARY KEY,
            word TEXT,
            meaning TEXT
          )
        ''');
      },
    );
  }
}
