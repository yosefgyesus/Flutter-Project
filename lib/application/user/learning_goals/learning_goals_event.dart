// import 'package:equatable/equatable.dart';
// import 'package:finalproject/infrastructure/models/learning_goal_model.dart';

// abstract class LearningGoalEvent extends Equatable {
//   const LearningGoalEvent();

//   @override
//   List<Object> get props => [];
// }

// class CreateLearningGoal extends LearningGoalEvent {
//   final LearningGoalModel learningGoal;

//   const CreateLearningGoal(this.learningGoal);

//   @override
//   List<Object> get props => [learningGoal];
// }

// class DeleteLearningGoal extends LearningGoalEvent {
//   final LearningGoalModel learningGoal;

//   const DeleteLearningGoal(this.learningGoal);

//   @override
//   List<Object> get props => [learningGoal];
// }

// import 'package:finalproject/infrastructure/models/learning_goal_model.dart';

// abstract class LearningGoalEvent {}

// class CreateLearningGoalEvent extends LearningGoalEvent {
//   final LearningGoalModel learningGoal;

//   CreateLearningGoalEvent(this.learningGoal);
// }

// class DeleteLearningGoalEvent extends LearningGoalEvent {
//   final String learningGoalId;

//   DeleteLearningGoalEvent(this.learningGoalId);
// }

// class UpdateLearningGoalEvent extends LearningGoalEvent {
//   final LearningGoalModel learningGoal;

//   UpdateLearningGoalEvent(this.learningGoal);
// }

// class FetchLearningGoalsEvent extends LearningGoalEvent {}
import 'package:finalproject/infrastructure/models/learning_goal_model.dart';

// abstract class LearningGoalsEvent {}

// class GetLearningGoals extends LearningGoalsEvent {}

// class DeleteLearningGoal extends LearningGoalsEvent {
//   final String learningGoalId;

//   DeleteLearningGoal(this.learningGoalId);
// }

// class UpdateLearningGoal extends LearningGoalsEvent {
//   final LearningGoalModel learningGoal;

//   UpdateLearningGoal(this.learningGoal);
// }

import 'package:equatable/equatable.dart';

abstract class LearningGoalEvent extends Equatable {
  const LearningGoalEvent();

  @override
  List<Object> get props => [];
}

class LoadLearningGoals extends LearningGoalEvent {}

class DeleteLearningGoal extends LearningGoalEvent {
  final String learningGoalId;

  const DeleteLearningGoal(this.learningGoalId);

  @override
  List<Object> get props => [learningGoalId];
}
