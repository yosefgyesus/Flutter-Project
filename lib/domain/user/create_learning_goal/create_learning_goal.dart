import 'package:finalproject/infrastructure/services/database_service.dart';
import 'package:finalproject/infrastructure/models/learning_goal_model.dart';

class CreateLearningGoal {
  final DatabaseService _databaseService;

  CreateLearningGoal(this._databaseService);

  Future<void> createLearningGoal(
      String userId, String title, String description) async {
    final learningGoal = LearningGoalModel(
      userId: userId,
      title: title,
      description: description,
    );
    await _databaseService.saveLearningGoal(learningGoal);
  }
}
