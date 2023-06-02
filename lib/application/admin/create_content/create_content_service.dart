import 'package:finalproject/infrastructure/models/content_model.dart';
import 'package:finalproject/infrastructure/services/api_service.dart';

class CreateContentService {
  final ApiService apiService;

  CreateContentService(this.apiService);

  Future<void> createContent(ContentModel content) async {
    try {
      await apiService.createContent(content);
      // Content creation successful
    } catch (error) {
      // Handle the error
    }
  }
}
