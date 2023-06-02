import 'package:finalproject/infrastructure/models/content_model.dart';
import 'package:finalproject/infrastructure/services/database_service.dart';

class VocabularyRepository {
  final DatabaseService _databaseService;

  VocabularyRepository(this._databaseService);

  Future<void> saveVocabulary(ContentModel vocabulary) async {
    // Save the vocabulary to the database
    await _databaseService.saveVocabulary(vocabulary);
  }

  Future<List<ContentModel>> getVocabularies() async {
    // Retrieve vocabularies from the database
    return _databaseService.getVocabularies();
  }
}
