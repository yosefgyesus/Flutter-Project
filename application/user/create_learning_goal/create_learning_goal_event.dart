// import 'package:finalproject/infrastructure/models/learning_goal_model.dart';

// abstract class CreateLearningGoalEvent {}

// class CreateLearningGoal extends CreateLearningGoalEvent {
//   final LearningGoalModel learningGoal;

//   CreateLearningGoal(this.learningGoal);
// }
import 'package:equatable/equatable.dart';

//import 'package:equatable/equatable.dart';
import 'package:finalproject/infrastructure/models/learning_goal_model.dart';

abstract class CreateLearningGoalEvent extends Equatable {
  const CreateLearningGoalEvent();

  @override
  List<Object> get props => [];
}

class CreateLearningGoal extends CreateLearningGoalEvent {
  final LearningGoalModel learningGoal;

  const CreateLearningGoal(this.learningGoal);

  @override
  List<Object> get props => [learningGoal];
}

class DeleteLearningGoal extends CreateLearningGoalEvent {
  final String learningGoalId;

  const DeleteLearningGoal(this.learningGoalId);

  @override
  List<Object> get props => [learningGoalId];
}

class UpdateLearningGoal extends CreateLearningGoalEvent {
  final LearningGoalModel learningGoal;

  const UpdateLearningGoal(this.learningGoal);

  @override
  List<Object> get props => [learningGoal];
}
