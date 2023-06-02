// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:finalproject/domain/user/learning_goals/learning_goals.dart';
// import 'learning_goals_service.dart';
// import 'learning_goals_event.dart';
// import 'learning_goals_state.dart';

// class LearningGoalBloc extends Bloc<LearningGoalEvent, LearningGoalState> {
//   final LearningGoalService _learningGoalService;

//   LearningGoalBloc(this._learningGoalService) : super(LearningGoalInitial()) {
//     _learningGoalService.learningGoalsStream.listen((learningGoals) {
//       add(LearningGoalLoadedEvent(learningGoals));
//     });
//   }

//   @override
//   Stream<LearningGoalState> mapEventToState(
//     LearningGoalEvent event,
//   ) async* {
//     if (event is CreateLearningGoal) {
//       _learningGoalService.createLearningGoal(event.learningGoal);
//     } else if (event is DeleteLearningGoal) {
//       _learningGoalService.deleteLearningGoal(event.learningGoal);
//     } else if (event is LearningGoalLoadedEvent) {
//       yield LearningGoalLoaded(event.learningGoals);
//     }
//   }

//   @override
//   Future<void> close() {
//     _learningGoalService.dispose();
//     return super.close();
//   }
// }

import 'dart:async';
import 'package:bloc/bloc.dart';
//import 'package:finalproject/domain/user/learning_goals/learning_goals.dart';
import 'package:finalproject/application/user/learning_goals/learning_goals_service.dart';
import 'learning_goals_event.dart';
import 'learning_goals_state.dart';

// class LearningGoalBloc extends Bloc<LearningGoalEvent, LearningGoalState> {
//   final LearningGoalService _learningGoalService;

//   LearningGoalBloc(this._learningGoalService)
//       : super(LearningGoalLoadingState());

//   Stream<LearningGoalState> mapEventToState(LearningGoalEvent event) async* {
//     if (event is CreateLearningGoalEvent) {
//       yield LearningGoalLoadingState();
//       try {
//         await _learningGoalService.createLearningGoal(event.learningGoal);
//         yield LearningGoalCreatedState();
//       } catch (error) {
//         yield LearningGoalErrorState('Failed to create learning goal: $error');
//       }
//     } else if (event is DeleteLearningGoalEvent) {
//       yield LearningGoalLoadingState();
//       try {
//         await _learningGoalService.deleteLearningGoal(event.learningGoalId);
//         yield LearningGoalDeletedState();
//       } catch (error) {
//         yield LearningGoalErrorState('Failed to delete learning goal: $error');
//       }
//     } else if (event is UpdateLearningGoalEvent) {
//       yield LearningGoalLoadingState();
//       try {
//         await _learningGoalService.updateLearningGoal(event.learningGoal);
//         yield LearningGoalUpdatedState();
//       } catch (error) {
//         yield LearningGoalErrorState('Failed to update learning goal: $error');
//       }
//     } else if (event is FetchLearningGoalsEvent) {
//       yield LearningGoalLoadingState();
//       try {
//         final learningGoals = await _learningGoalService.getLearningGoals();
//         yield LearningGoalFetchedState(learningGoals);
//       } catch (error) {
//         yield LearningGoalErrorState('Failed to fetch learning goals: $error');
//       }
//     }
//   }
// }

//import 'package:finalproject/domain/learning_goals/learning_goals_event.dart';
//import 'package:finalproject/domain/learning_goals/learning_goals_state.dart';

//import 'package:finalproject/infrastructure/models/learning_goal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'learning_goals_event.dart';
// import 'learning_goals_state.dart';

// class LearningGoalsBloc extends Bloc<LearningGoalsEvent, LearningGoalsState> {
//   final LearningGoalService learningGoalsService;

//   LearningGoalsBloc(this.learningGoalsService) : super(LearningGoalsInitial());

//   @override
//   Stream<LearningGoalsState> mapEventToState(LearningGoalsEvent event) async* {
//     if (event is GetLearningGoals) {
//       yield LearningGoalsLoading();
//       try {
//         final List<LearningGoalModel> learningGoals =
//             await learningGoalsService.getLearningGoals();
//         yield LearningGoalsLoaded(learningGoals);
//       } catch (error) {
//         yield LearningGoalsFailure(error.toString());
//       }
//     } else if (event is DeleteLearningGoal) {
//       yield LearningGoalsLoading();
//       try {
//         await learningGoalsService.deleteLearningGoal(event.learningGoalId);
//         yield LearningGoalDeleted();
//       } catch (error) {
//         yield LearningGoalsFailure(error.toString());
//       }
//     } else if (event is UpdateLearningGoal) {
//       yield LearningGoalsLoading();
//       try {
//         await learningGoalsService.updateLearningGoal(event.learningGoal);
//         yield LearningGoalUpdated();
//       } catch (error) {
//         yield LearningGoalsFailure(error.toString());
//       }
//     }
//   }
// }

class LearningGoalBloc extends Bloc<LearningGoalEvent, LearningGoalState> {
  final LearningGoalService learningGoalService;

  LearningGoalBloc(this.learningGoalService) : super(LearningGoalInitial());

  @override
  Stream<LearningGoalState> mapEventToState(LearningGoalEvent event) async* {
    if (event is LoadLearningGoals) {
      yield LearningGoalLoading();
      try {
        final learningGoals = await learningGoalService.getLearningGoals();
        yield LearningGoalLoadSuccess(learningGoals);
      } catch (error) {
        yield LearningGoalLoadFailure(error.toString());
      }
    } else if (event is DeleteLearningGoal) {
      yield LearningGoalDeleting();
      try {
        await learningGoalService.deleteLearningGoal(event.learningGoalId);
        final learningGoals = await learningGoalService.getLearningGoals();
        yield LearningGoalDeleteSuccess(learningGoals);
      } catch (error) {
        yield LearningGoalDeleteFailure(error.toString());
      }
    }
  }
}
