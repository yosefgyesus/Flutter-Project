import 'dart:async';

import 'package:finalproject/infrastructure/models/user_model.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:finalproject/infrastructure/models/content_model.dart';
import 'package:finalproject/domain/user/bookmarks/bookmarks.dart';

import '../models/learning_goal_model.dart';

// class DatabaseService {
//   late Db _database;
//   late DbCollection _vocabulariesCollection;
//   late DbCollection _userCollection;
//   late StreamController<ContentModel> _contentDeletionController;
//   late StreamController<UserModel> _userDeletionController;
//   // late StreamController<UserModel> _user;

//   Future<void> connectToDatabase() async {
//     const dbUrl = 'mongodb://localhost:27017/my_database_name';
//     _database = Db(dbUrl);
//     await _database.open();
//     _vocabulariesCollection = _database.collection('vocabularies');
//     _contentDeletionController = StreamController<ContentModel>.broadcast();
//     _userDeletionController = StreamController<UserModel>.broadcast();
//     _userCollection = _database.collection('users');
//   }

//   Future<void> saveVocabulary(ContentModel vocabulary) async {
//     final vocabularyMap = vocabulary.toJson();
//     await _vocabulariesCollection.insert(vocabularyMap);
//   }

//   Future<List<ContentModel>> getVocabularies() async {
//     final vocabularies = await _vocabulariesCollection.find().toList();
//     return vocabularies
//         .map((vocabularyMap) => ContentModel.fromJson(vocabularyMap))
//         .toList();
//   }

//   Future<void> deleteContent(ContentModel content) async {
//     final contentId = content.id;
//     await _vocabulariesCollection.remove(where.eq('id', contentId));
//     _contentDeletionController.add(content);
//   }

//   Future<void> deleteUser(ContentModel user) async {
//     final userId = user.id;
//     await _userCollection.remove(where.eq('id', userId));
//     _userDeletionController.add(user as UserModel);
//   }

//   Future<void> updateUser(UserModel user) async {
//     final userId = user.id;
//     await _userCollection.remove(where.eq('id', userId));
//     _userDeletionController.add(user);
//   }

//   Future<List<UserModel>> getUser() async {
//     final user = await _userCollection.find().toList();
//     return user.map((userMap) => UserModel.fromJson(userMap)).toList();
//   }

//   Stream<ContentModel> get onContentDeleted =>
//       _contentDeletionController.stream;

//   Future<void> disconnectFromDatabase() async {
//     await _database.close();
//     _contentDeletionController.close();
//   }
// }
class DatabaseService {
  late Db _database;
  late DbCollection _vocabulariesCollection;
  late DbCollection _numbersCollection;

  late DbCollection _userCollection;
  late DbCollection _bookmarkscollection;
  late DbCollection _learningGoalsCollection;
  late StreamController<ContentModel> _contentDeletionController;
  late StreamController<UserModel> _userDeletionController;
  late StreamController<LearningGoalModel> _learningGoalCreationController;

  Future<void> connectToDatabase() async {
    const dbUrl = 'mongodb://localhost:27017/my_database_name';
    _database = Db(dbUrl);
    await _database.open();
    _vocabulariesCollection = _database.collection('vocabularies');
    _contentDeletionController = StreamController<ContentModel>.broadcast();
    _userDeletionController = StreamController<UserModel>.broadcast();
    _userCollection = _database.collection('users');
  }

  Future<void> saveVocabulary(ContentModel vocabulary) async {
    final vocabularyMap = vocabulary.toJson();
    await _vocabulariesCollection.insert(vocabularyMap);
  }

  Future<List<ContentModel>> getVocabularies() async {
    final vocabularies = await _vocabulariesCollection.find().toList();
    return vocabularies
        .map((vocabularyMap) => ContentModel.fromJson(vocabularyMap))
        .toList();
  }

  Future<List<ContentModel>> getNumbers() async {
    final numbers = await _numbersCollection.find().toList();
    return numbers
        .map((numbermap) => ContentModel.fromJson(numbermap))
        .toList();
  }

  Future<void> deleteContent(ContentModel content) async {
    final contentId = content.id;
    await _vocabulariesCollection.remove(where.eq('id', contentId));
    _contentDeletionController.add(content);
  }

  Future<void> deleteUser(ContentModel user) async {
    final userId = user.id;
    await _userCollection.remove(where.eq('id', userId));
    _userDeletionController.add(user as UserModel);
  }

  Future<void> updateUser(UserModel user) async {
    final userId = user.id;
    await _userCollection.remove(where.eq('id', userId));
    _userDeletionController.add(user);
  }

  Future<List<UserModel>> getUser() async {
    final user = await _userCollection.find().toList();
    return user.map((userMap) => UserModel.fromJson(userMap)).toList();
  }

  Stream<ContentModel> get onContentDeleted =>
      _contentDeletionController.stream;

  Future<void> saveBookmark(Bookmark bookmark) async {
    final bookmarkMap = bookmark.toJson();
    await _bookmarkscollection.insert(bookmarkMap);
  }

  Future<List<Bookmark>> getBookmarks() async {
    final bookmarks = await _bookmarkscollection.find().toList();
    return bookmarks
        .map((bookmarkMap) => Bookmark.fromJson(bookmarkMap))
        .toList();
  }

  Future<void> saveLearningGoal(LearningGoalModel learningGoal) async {
    final learningGoalMap = learningGoal.toJson();
    await _learningGoalsCollection.insert(learningGoalMap);
    _learningGoalCreationController.add(learningGoal);
  }

  Stream<LearningGoalModel> get onLearningGoalCreated =>
      _learningGoalCreationController.stream;

// <Future>

  Future<void> disconnectFromDatabase() async {
    await _database.close();
    _contentDeletionController.close();
  }

  createUser(UserModel user) {}
}
