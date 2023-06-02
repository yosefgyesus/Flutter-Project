//import 'package:finalproject/domain/admin/delete_content/delete_content.dart';
//import '../../../infrastructure/models/content_model.dart';
import 'package:finalproject/infrastructure/services/api_service.dart';

class DeleteContentService {
  // final DeleteContent _deleteContent;
  final ApiService apiService;

  DeleteContentService(this.apiService);
  Future<void> deleteContent(contentId) async {
    try {
      await apiService.deleteContent(contentId);
    } catch (error) {
      //handle error
    }
  }
}
