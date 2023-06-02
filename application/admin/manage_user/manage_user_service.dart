import 'package:finalproject/infrastructure/models/user_model.dart';
import 'package:finalproject/infrastructure/services/api_service.dart';

class ManageUserService {
  final ApiService apiService;

  ManageUserService(this.apiService);

  Future<void> createUser(UserModel user) async {
    try {
      await apiService.manageUser(user as String);
      // User creation successful
    } catch (error) {
      // Handle the error appropriately, e.g., log the error or display an error message
      print('Failed to create user: $error');
      throw Exception('Failed to create user');
    }
  }
}
