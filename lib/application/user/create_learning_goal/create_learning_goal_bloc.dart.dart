import 'dart:async';
import 'package:bloc/bloc.dart';
import 'create_learning_goal_event.dart';
import 'create_learning_goal_state.dart';
//import 'package:finalproject/infrastructure/models/learning_goal_model.dart';
import 'creating_learning_goal_service.dart';

//import 'package:finalproject/infrastructure/models/learning_goal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateLearningGoalBloc
    extends Bloc<CreateLearningGoalEvent, CreateLearningGoalState> {
  final CreateLearningService createLearningService;

  CreateLearningGoalBloc(this.createLearningService)
      : super(CreateLearningGoalInitial());

  @override
  Stream<CreateLearningGoalState> mapEventToState(
    CreateLearningGoalEvent event,
  ) async* {
    if (event is CreateLearningGoal) {
      yield CreateLearningGoalLoading();
      try {
        await createLearningService.createLearningGoal(event.learningGoal);
        yield CreateLearningGoalSuccess();
      } catch (error) {
        yield CreateLearningGoalFailure(error.toString());
      }
    }
  }
}


// class CreateLearningGoalBloc extends Bloc<CreateLearningGoalEvent, CreateLearningGoalState> {
//   final CreateLearningService createLearningService;

//   CreateLearningGoalBloc(this.createLearningService) : super(CreateLearningGoalInitial());

//   @override
//   Stream<CreateLearningGoalState> mapEventToState(CreateLearningGoalEvent event) async* {
//     if (event is CreateLearningGoal) {
//       yield CreateLearningGoalLoading();
//       try {
//         await createLearningService.createLearningGoal(event.userId, event.title, event.description);
//         yield CreateLearningGoalSuccess();
//       } catch (error) {
//         yield CreateLearningGoalFailure(error.toString());
//       }
//     }
//   }
// }
