// abstract class CreateLearningGoalState {}

// class CreateLearningGoalInitial extends CreateLearningGoalState {}

// class CreateLearningGoalLoading extends CreateLearningGoalState {}

// class CreateLearningGoalSuccess extends CreateLearningGoalState {}

// class CreateLearningGoalFailure extends CreateLearningGoalState {
//   final String errorMessage;

//   CreateLearningGoalFailure(this.errorMessage);
// }
import 'package:equatable/equatable.dart';

abstract class CreateLearningGoalState extends Equatable {
  const CreateLearningGoalState();

  @override
  List<Object> get props => [];
}

class CreateLearningGoalInitial extends CreateLearningGoalState {}

class CreateLearningGoalLoading extends CreateLearningGoalState {}

class CreateLearningGoalSuccess extends CreateLearningGoalState {}

class CreateLearningGoalFailure extends CreateLearningGoalState {
  final String error;

  const CreateLearningGoalFailure(this.error);

  @override
  List<Object> get props => [error];
}
