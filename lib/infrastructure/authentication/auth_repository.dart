import 'package:finalproject/infrastructure/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  static const String baseUrl = ''; //backend api base URL

  Future<UserModel?> signIn(String email, String password) async {
    // Perform sign in logic
    // Example: Call the backend API for authentication
    // and return the authenticated user if successful, otherwise. return null
    try {
      final url = Uri.parse(''); //sign in api end point
      final response =
          await http.post(url, body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        final userJson = json.decode(response.body);
        final user = UserModel.fromJson(userJson);
        return user;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  Future<UserModel?> signUp(String email, String password) async {
    // Perform sign up logic
    // Example: Call the backend API for user registration
    // and return the registered user if successful, otherwise return null
    try {
      final url = Uri.parse(''); //sign up api end point
      final response =
          await http.post(url, body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        final userJson = json.decode(response.body);
        final user = UserModel.fromJson(userJson);
        return user;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
