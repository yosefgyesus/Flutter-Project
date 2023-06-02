import 'dart:async';
import 'package:finalproject/infrastructure/models/learning_goal_model.dart';
import 'package:finalproject/infrastructure/services/api_service.dart';
//import 'package:finalproject/services/api_service.dart';

// class LearningGoalService {
//   final ApiService _apiService = ApiService();
//   final StreamController<List<LearningGoalModel>> _learningGoalsController =
//       StreamController<List<LearningGoalModel>>.broadcast();

//   Stream<List<LearningGoalModel>> get learningGoalsStream =>
//       _learningGoalsController.stream;

//   void createLearningGoal(LearningGoalModel learningGoal) async {
//     try {
//       await _apiService.createLearningGoal(learningGoal);
//       _fetchLearningGoals();
//     } catch (error) {
//       print('Failed to create learning goal: $error');
//     }
//   }

//   void deleteLearningGoal(LearningGoalModel learningGoal) async {
//     try {
//       await _apiService.deleteLearningGoal(learningGoal.id);
//       _fetchLearningGoals();
//     } catch (error) {
//       print('Failed to delete learning goal: $error');
//     }
//   }

//   Future<void> _fetchLearningGoals() async {
//     try {
//       final learningGoals = await _apiService.getLearningGoals();
//       _learningGoalsController.add(learningGoals);
//     } catch (error) {
//       print('Failed to retrieve learning goals: $error');
//     }
//   }

//   void dispose() {
//     _learningGoalsController.close();
//   }
//}

class LearningGoalService {
  final ApiService _apiService;

  LearningGoalService(this._apiService);

  Future<void> createLearningGoal(LearningGoalModel learningGoal) async {
    try {
      await _apiService.createLearningGoal(learningGoal);
      print('Create learning goal successfully');
    } catch (error) {
      print('Failed to create learning goal: $error');
    }
  }

  Future<void> deleteLearningGoal(String learningGoalId) async {
    try {
      await _apiService.deleteLearningGoal(learningGoalId);
      print('Delete learning goal successfully');
    } catch (error) {
      print('Failed to delete learning goal: $error');
    }
  }

  Future<void> updateLearningGoal(LearningGoalModel learningGoal) async {
    try {
      await _apiService.updateLearningGoal(learningGoal);
      print('Update learning goal successfully');
    } catch (error) {
      print('Failed to update learning goal: $error');
    }
  }

  Future<List<LearningGoalModel>> getLearningGoals() async {
    try {
      final learningGoals = await _apiService.getLearningGoals();
      return learningGoals;
    } catch (error) {
      throw Exception('Failed to retrieve learning goals: $error');
    }
  }
}
