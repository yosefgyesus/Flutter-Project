import 'package:finalproject/infrastructure/models/content_model.dart';
import 'package:finalproject/infrastructure/services/database_service.dart';

class DeleteContent {
  final DatabaseService _databaseService;

  DeleteContent(this._databaseService);

  Future<void> deleteContent(ContentModel content) async {
    // Implement the logic to delete the content from the database
    await _databaseService.deleteContent(content);
  }
}
