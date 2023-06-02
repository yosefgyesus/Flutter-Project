//import 'package:finalproject/infrastructure/models/content_model.dart';
//import 'package:finalproject/domain/user/create_learning_goal/create_learning_goal.dart';
import 'package:finalproject/infrastructure/models/learning_goal_model.dart';
import 'package:finalproject/infrastructure/services/api_service.dart';

// class CreateLearningService {
//   final ApiService apiService;

//   CreateLearningService(this.apiService);

//   Future<void> createLearningGoal(LearningGoalModel learningGoal) async {
//     try {
//       await apiService.createLearningGoal(learningGoal);
//       // Content creation successful
//     } catch (error) {
//       // Handle the error
//       throw Exception('Failed to create learning goal: $error');
//     }
//   }
// }
class CreateLearningService {
  final ApiService apiService;

  CreateLearningService(this.apiService);

  Future<void> createLearningGoal(LearningGoalModel learningGoal) async {
    try {
      await apiService.createLearningGoal(learningGoal);
      // Content creation successful
    } catch (error) {
      // Handle the error
      throw Exception('Failed to create learning goal: $error');
    }
  }
}

class DeleteLearningGoalService {
  final ApiService apiService;

  DeleteLearningGoalService(this.apiService);

  Future<void> deleteLearningGoal(String learningGoalId) async {
    try {
      await apiService.deleteLearningGoal(learningGoalId);
      // Deletion successful
    } catch (error) {
      // Handle the error
      throw Exception('Failed to delete learning goal: $error');
    }
  }
}

class UpdateLearningGoalService {
  final ApiService apiService;

  UpdateLearningGoalService(this.apiService);

  Future<void> updateLearningGoal(LearningGoalModel learningGoal) async {
    try {
      await apiService.updateLearningGoal(learningGoal);
      // Update successful
    } catch (error) {
      // Handle the error
      throw Exception('Failed to update learning goal: $error');
    }
  }
}
