// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static const String baseUrl = 'http://localhost:8000/api';

// // for the create operation
//   Future<http.Response> post(String endpoint, dynamic body) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/$endpoint'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(body),
//     );
//     return response;
//   }

// // for the read operation
//   Future<http.Response> get(String endpoint, {String? token}) async {
//     final headers = token != null ? {'Authorization': token} : null;
//     final response = await http.get(
//       Uri.parse('$baseUrl/$endpoint'),
//       headers: headers,
//     );
//     return response;
//   }

// //for the update operation
//   Future<http.Response> put(String endpoint, dynamic body,
//       {String? token}) async {
//     final headers = token != null ? {'Authorization': token} : null;
//     final response = await http.put(
//       Uri.parse('$baseUrl/$endpoint'),
//       headers: headers,
//       body: jsonEncode(body),
//     );
//     return response;
//   }

// // for the delete operation
//   Future<http.Response> delete(String endpoint, {String? token}) async {
//     final headers = token != null ? {'Authorization': token} : null;
//     final response = await http.delete(
//       Uri.parse('$baseUrl/$endpoint'),
//       headers: headers,
//     );
//     return response;
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:finalproject/infrastructure/models/user_model.dart';
import 'package:finalproject/infrastructure/models/content_model.dart';
import 'package:finalproject/domain/user/bookmarks/bookmarks.dart';
import 'package:finalproject/infrastructure/models/learning_goal_model.dart';
import 'package:finalproject/domain/user/vocabulary/vocabulary.dart';
import '../../domain/user/greeting/greeting.dart';
import '../../domain/user/number/number.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000/api';

  Future<void> signUp(UserModel user, String password) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/signup'),
          body: jsonEncode(user.toJson()),
          headers: {'content-type': 'application/json'});
    } catch (error) {
      //hadle error
    }
  }

  Future<void> signIn(UserModel user, String password) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/signin'),
          body: jsonEncode(user.toJson()),
          headers: {'Content-Type': 'application/json'});
      //res
    } catch (error) {
      // errors
      print(error);
    }
  }

  Future<void> createContent(ContentModel content) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/content'),
          body: jsonEncode(content.toJson()),
          headers: {'content-type': 'application/json'});
      if (response.statusCode == 200) {
        print('create content is done successfully');
      } else {
        // Update failed
        print(
            'Failed to create content. Response status: ${response.statusCode}');
      }
    } catch (error) {
      //errors
      print('falied to create content:$error');
    }
  }

  Future<void> createBookmark(Bookmark bookmark) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/createbookmark'),
          body: jsonEncode(bookmark.toJson()),
          headers: {'Content-Type': 'application/json'});
      // Handle the response if needed
      if (response.statusCode == 200) {
        print('create Bookmark is done successfully');
      } else {
        // Update failed
        print(
            'Failed to create Bookmark. Response status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle the error
      print('failed to create Bookmark:$error');
    }
  }

  Future<void> createLearningGoal(LearningGoalModel learningGoal) async {
    try {
      final response = await http.post(
          Uri.parse('$baseUrl/learninggoals/create'),
          body: jsonEncode(learningGoal.toJson()),
          headers: {'Content-Type': 'application/json'});
      // Handle the response if needed
      if (response.statusCode == 200) {
        print('create learning goal successfully');
      } else {
        // Update failed
        print(
            'Failed to add learning goal. Response status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle the error
      print('failed to create learning goal: $error');
    }
  }

  Future<void> deleteContent(String contentId) async {
    try {
      final response =
          await http.delete(Uri.parse('$baseUrl/content/delete/$contentId'));
      // Handle the response if needed
      if (response.statusCode == 200) {
        print('delete content successfully');
      } else {
        // Update failed
        print(
            'failed to delete content. Response status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle the error
      print('falied to delete content:$error');
    }
  }

  Future<void> manageUser(String userId) async {
    try {
      final response =
          await http.put(Uri.parse('$baseUrl/user/manage/$userId'));
      // Handle the response if needed
      if (response.statusCode == 200) {
        print('User updated successfully');
      } else {
        // Update failed
        print('Failed to manage user. Response status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle the error
      print('falied to manage user:$error');
    }
  }

  Future<void> saveBookmark(Bookmark bookmark) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/bookmarks/save'),
          body: jsonEncode(bookmark.toJson()),
          headers: {'Content-Type': 'application/json'});
      // Handle the response if needed

      if (response.statusCode == 200) {
        print('saved bookmark successfully');
      } else {
        // Update failed
        print(
            'Failed saved bookmark successfully. Response status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle the error
      print('falied to save bookmark:$error');
    }
  }

  Future<void> deleteLearningGoal(String learningGoalId) async {
    try {
      final response = await http
          .delete(Uri.parse('$baseUrl/learninggoals/delete/$learningGoalId'));
      // Handle the response if needed
      if (response.statusCode == 200) {
        print('Delete learning goal successfully');
      } else {
        // Update failed
        print('Failed to delete goal. Response status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle the error

      print('failed to delete goal:$error');
    }
  }

  Future<void> updateLearningGoal(LearningGoalModel learningGoal) async {
    try {
      final response = await http.put(
          Uri.parse('$baseUrl/learninggoals/update/${learningGoal.id}'),
          body: jsonEncode(learningGoal.toJson()),
          headers: {'Content-Type': 'application/json'});
      // Handle the response if needed
      if (response.statusCode == 200) {
        print('User updated learning goal successfully');
      } else {
        // Update failed
        print(
            'Failed to update learning goas=l. Response status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle the error
      print('Failed to updatte learning goal: $error');
    }
  }

  Future<void> updateContent(ContentModel content) async {
    try {
      final response = await http.put(
          Uri.parse('$baseUrl/content/update/${content.id}'),
          body: jsonEncode(content.toJson()),
          headers: {'Content-Type': 'application/json'});
      // Handle the response if needed
      if (response.statusCode == 200) {
        print('Updated content successfully');
      } else {
        // Update failed
        print(
            'Failed to update content. Response status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle the error
      print('failed to update content. Response status:$error');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      final response =
          await http.delete(Uri.parse('$baseUrl/user/delete/$userId'));
      // Handle the response if needed
      if (response.statusCode == 200) {
        print('User deleted successfully');
      } else {
        // Update failed
        print('Failed to delete user. Response status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle the error
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/user/update/${user.id}'),
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      // Handle the response if needed
      if (response.statusCode == 200) {
        print('User updated successfully');
      } else {
        // Update failed
        print('Failed to update user. Response status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle the error
      print('Failed to update user: $error');
    }
  }

  Future<List<LearningGoalModel>> getLearningGoals() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/learninggoals'));
      final data = jsonDecode(response.body) as List<dynamic>;
      final learningGoalList =
          data.map((json) => LearningGoalModel.fromJson(json)).toList();
      return learningGoalList;
    } catch (error) {
      print('Failed to retrieve learning goals: $error');
      return [];
    }
  }

  Future<List<Object>> fetchGreetings() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/greetings'));
      final data = jsonDecode(response.body) as List<dynamic>;
      final greetingsList =
          data.map((json) => Greeting.fromJson(json)).cast<Greeting>().toList();
      return greetingsList;
    } catch (error) {
      print('Failed to fetch greetings: $error');
      return [];
    }
  }

  Future<List<Object>> fetchNumbers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/numbers'));
      final data = jsonDecode(response.body) as List<dynamic>;
      final numbersList =
          data.map((json) => Number.fromJson(json)).cast<Number>().toList();
      return numbersList;
    } catch (error) {
      print('Failed to fetch numbers: $error');
      return [];
    }
  }

  Future<List<ContentModel>> viewContent() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/content/view'));
      final data = jsonDecode(response.body) as List<dynamic>;
      final contentList =
          data.map((json) => ContentModel.fromJson(json)).toList();
      return contentList;
    } catch (error) {
      print('Failed to retrieve view content: $error');
      return [];
    }
  }

  Future<List<Vocabulary>> getVocabularyList() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/vocabulary'));
      final data = jsonDecode(response.body) as List<dynamic>;
      final vocabularyList =
          data.map((json) => Vocabulary.fromJson(json)).toList();
      return vocabularyList;
    } catch (error) {
      print('Failed to retrieve vocabulary list: $error');
      return [];
    }
  }

  Future<void> addVocabulary(Vocabulary vocabulary) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/vocabularypost'),
          body: jsonEncode(vocabulary.toJson()),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        print('Added vocabulary successfully');
      } else {
        print(
            'Failed to add vocabulary. Response status: ${response.statusCode}');
      }
    } catch (error) {
      print('Failed to add vocabulary: $error');
    }
  }

  Future<void> updateVocabulary(Vocabulary vocabulary) async {
    try {
      final response = await http.put(
          Uri.parse('$baseUrl/vocabulary/${vocabulary.id}'),
          body: jsonEncode(vocabulary.toJson()),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        print('Updated vocabulary successfully');
      } else {
        print(
            'Failed to update vocabulary. Response status: ${response.statusCode}');
      }
    } catch (error) {
      print('Failed to update vocabulary: $error');
    }
  }

  Future<void> deleteVocabulary(String vocabularyId) async {
    try {
      final response =
          await http.delete(Uri.parse('$baseUrl/vocabulary/$vocabularyId'));
      if (response.statusCode == 200) {
        print('Deleted vocabulary successfully');
      } else {
        print(
            'Failed to delete vocabulary. Response status: ${response.statusCode}');
      }
    } catch (error) {
      print('Failed to delete vocabulary: $error');
    }
  }
}
