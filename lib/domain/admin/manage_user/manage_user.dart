// import 'package:finalproject/infrastructure/models/user_model.dart';
// import 'package:finalproject/infrastructure/services/database_service.dart';

// class ManageUser {
//   final DatabaseService _databaseService;

//   ManageUser(this._databaseService);

//   Future<void> getUser() async {
//     // Retrieve all users from the database
//     await _databaseService.getUser();
//   }

//   Future<void> updateUser(UserModel user) async {
//     // this is used for to upadate user in the database
//     await _databaseService.updateUser(user);
//   }

//   Future<void> deleteUser(UserModel user) async {
//     //this is to delete it from the database
//     await _databaseService.deleteUser(user as ContentModel);
//   }
// }

import 'package:finalproject/infrastructure/models/content_model.dart';
import 'package:finalproject/infrastructure/models/user_model.dart';
import 'package:finalproject/infrastructure/services/database_service.dart';

class ManageUser {
  final DatabaseService _databaseService;

  ManageUser(this._databaseService);

  Future<List<UserModel>> getUsers() async {
    return await _databaseService.getUser();
  }

  Future<void> createUser(UserModel user) async {
    await _databaseService.createUser(user);
  }

  Future<void> updateUser(UserModel user) async {
    await _databaseService.updateUser(user);
  }

  Future<void> deleteUser(String userId) async {
    await _databaseService.deleteUser(userId as ContentModel);
  }
}
