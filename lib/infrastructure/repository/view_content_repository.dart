import 'package:finalproject/infrastructure/services/api_service.dart';
import 'package:finalproject/infrastructure/models/content_model.dart';

abstract class ViewContentRepository {
  Future<List<ContentModel>> getContents();
}

class ApiViewContentRepository implements ViewContentRepository {
  final ApiService apiService;

  ApiViewContentRepository(this.apiService);

  @override
  Future<List<ContentModel>> getContents() async {
    try {
      return await apiService.viewContent();
    } catch (error) {
      // Handle the error
      throw Exception('Failed to retrieve contents: $error');
    }
  }
}
