import 'package:finalproject/infrastructure/models/content_model.dart';
import 'package:finalproject/infrastructure/services/database_service.dart';

class ViewContent {
  final DatabaseService _databaseService;

  ViewContent(this._databaseService);

  Future<List<ContentModel>> viewContent() async {
    return await _databaseService.getVocabularies();
  }
}
