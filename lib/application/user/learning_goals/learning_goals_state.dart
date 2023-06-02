// import 'package:equatable/equatable.dart';
// import 'package:finalproject/domain/user/learning_goals/learning_goals.dart';
// import 'package:finalproject/infrastructure/models/learning_goal_model.dart';

// abstract class LearningGoalState extends Equatable {
//   const LearningGoalState();

//   @override
//   List<Object> get props => [];
// }

// class LearningGoalInitial extends LearningGoalState {}

// class LearningGoalLoaded extends LearningGoalState {
//   final List<LearningGoalModel> learningGoals;

//   const LearningGoalLoaded(this.learningGoals);

//   @override
//   List<Object> get props => [learningGoals];
// }

//import 'package:finalproject/domain/user/learning_goals/learning_goal_model.dart';

// import 'package:finalproject/infrastructure/models/learning_goal_model.dart';

// abstract class LearningGoalsState {}

// class LearningGoalsInitial extends LearningGoalsState {}

// class LearningGoalsLoading extends LearningGoalsState {}

// class LearningGoalsLoaded extends LearningGoalsState {
//   final List<LearningGoalModel> learningGoals;

//   LearningGoalsLoaded(this.learningGoals);
// }

// class LearningGoalDeleted extends LearningGoalsState {}

// class LearningGoalUpdated extends LearningGoalsState {}

// class LearningGoalsFailure extends LearningGoalsState {
//   final String errorMessage;

//   LearningGoalsFailure(this.errorMessage);
// }

import 'package:equatable/equatable.dart';
import 'package:finalproject/infrastructure/models/learning_goal_model.dart';

abstract class LearningGoalState extends Equatable {
  const LearningGoalState();

  @override
  List<Object> get props => [];
}

class LearningGoalInitial extends LearningGoalState {}

class LearningGoalLoading extends LearningGoalState {}

class LearningGoalLoadSuccess extends LearningGoalState {
  final List<LearningGoalModel> learningGoals;

  const LearningGoalLoadSuccess(this.learningGoals);

  @override
  List<Object> get props => [learningGoals];
}

class LearningGoalLoadFailure extends LearningGoalState {
  final String error;

  const LearningGoalLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}

class LearningGoalDeleting extends LearningGoalState {}

class LearningGoalDeleteSuccess extends LearningGoalState {
  final List<LearningGoalModel> learningGoals;

  const LearningGoalDeleteSuccess(this.learningGoals);

  @override
  List<Object> get props => [learningGoals];
}

class LearningGoalDeleteFailure extends LearningGoalState {
  final String error;

  const LearningGoalDeleteFailure(this.error);

  @override
  List<Object> get props => [error];
}
