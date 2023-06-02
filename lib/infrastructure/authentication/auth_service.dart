import 'package:finalproject/infrastructure/models/user_model.dart';

import '../services/api_service.dart';

class AuthService {
  final ApiService _apiService;

  AuthService({required ApiService apiService}) : _apiService = apiService;

  Future<void> signUp(String email, String password) async {
    try {
      await _apiService.signUp(email as UserModel, password);
    } catch (error) {
      throw Exception('Sign up failed');
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _apiService.signIn(email as UserModel, password);
    } catch (error) {
      throw Exception('Sign in failed');
    }
  }
}
