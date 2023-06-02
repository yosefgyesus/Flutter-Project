// import 'package:finalproject/infrastructure/repository/bookmark_repository.dart';
// import 'package:finalproject/domain/user/bookmarks/bookmarks.dart';

// class CreateBookmark{
//   final BookmarkRepository _repository;

//   CreateBookmark(this._repository);

//   Future<void> createBookmark(String word, String meaning) async {
//     final bookmark = Bookmark(id:id,word: word, meaning: meaning, );
//     await _repository.saveBookmark(bookmark as );
//   }
// }

//import 'package:finalproject/infrastructure/models/content_model.dart';
//import 'package:finalproject/infrastructure/models/bookmark_model.dart';
import 'package:finalproject/infrastructure/services/database_service.dart';

import 'package:flutter/foundation.dart';

import '../../../infrastructure/repository/vocabulary_repository.dart';
import '../bookmarks/bookmarks.dart';

class CreateBookmark {
  final VocabularyRepository _vocabularyRepository;
  final DatabaseService _databaseService;

  CreateBookmark({
    required VocabularyRepository vocabularyRepository,
    required DatabaseService databaseService,
  })  : _vocabularyRepository = vocabularyRepository,
        _databaseService = databaseService;

  Future<void> createBookmark({
    required String userId,
    required String word,
    required String meaning,
  }) async {
    final Bookmark bookmark = Bookmark(
      id: DateTime.now().millisecondsSinceEpoch,
      word: word,
      meaning: meaning,
    );

    await _databaseService.saveBookmark(bookmark);
  }
}
