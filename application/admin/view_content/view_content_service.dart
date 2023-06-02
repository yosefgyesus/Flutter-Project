// //import 'package:finalproject/infrastructure/models/content_model.dart';
// import 'package:finalproject/infrastructure/services/api_service.dart';

// class ViewContentModel {
//   final ApiService apiService;

//   ViewContentModel(this.apiService);

//   Future<void> viewContent() async {
//     try {
//       await apiService.viewContent();
//       // Content creation successful
//     } catch (error) {
//       // Handle the error
//     }
//   }
// }
// import 'package:finalproject/infrastructure/models/content_model.dart';
// import 'package:finalproject/infrastructure/services/api_service.dart';

// class ViewContentService {
//   final ApiService apiService;

//   ViewContentService(this.apiService);

//   Future<List<ContentModel>> viewContent() async {
//     try {
//       return await apiService.viewContent();
//     } catch (error) {
//       rethrow;
//     }
//   }
// }
import 'package:finalproject/infrastructure/models/content_model.dart';
import 'package:finalproject/infrastructure/services/api_service.dart';

class ViewContentService {
  final ApiService apiService;

  ViewContentService(this.apiService);

  Future<List<ContentModel>> getContentList() async {
    try {
      final contentList = await apiService.viewContent();
      return contentList;
    } catch (error) {
      throw Exception('Failed to retrieve content: $error');
    }
  }
}
