// // lib/domain/admin/create_content/create_content.dart

// import 'package:your_app/domain/admin/create_content/vocabulary.dart';

// class CreateContent {
//   final VocabularyRepository _repository;

//   CreateContent(this._repository);

//   Future<void> createVocabulary(String word, String meaning) async {
//     final vocabulary = Vocabulary(word: word, meaning: meaning);
//     await _repository.saveVocabulary(vocabulary);
//   }
// }
import 'package:finalproject/infrastructure/models/content_model.dart';

import 'vocabulary.dart';
import 'package:finalproject/infrastructure/repository/vocabulary_repository.dart';

class CreateContent {
  final VocabularyRepository _repository;

  CreateContent(this._repository);

  Future<void> createVocabulary(String word, String meaning) async {
    final vocabulary = Vocabulary(word: word, meaning: meaning);
    await _repository.saveVocabulary(vocabulary as ContentModel);
  }
}
