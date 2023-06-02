import 'package:finalproject/application/user/learning_goals/learning_goals_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/application/user/learning_goals/learning_goals_bloc.dart';
//import 'package:finalproject/application/user/learning_goals/learning_goals_event.dart';
//import 'package:finalproject/application/user/learning_goals/learning_goals_service.dart';
import '../../../../application/user/learning_goals/learning_goals_state.dart';
import 'learning_goal_card.dart';

class LearningGoalScreen extends StatelessWidget {
  const LearningGoalScreen(
      {super.key, required LearningGoalService learningGoalService});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearningGoalBloc, LearningGoalState>(
      builder: (context, state) {
        if (state is LearningGoalLoadSuccess) {
          final learningGoals = state.learningGoals;

          return Scaffold(
            appBar: AppBar(
              title: Text('Learning Goals'),
            ),
            body: ListView.builder(
              itemCount: learningGoals.length,
              itemBuilder: (context, index) {
                final learningGoal = learningGoals[index];
                return LearningGoalCard(learningGoal: learningGoal);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Navigate to create learning goal screen
                Navigator.pushNamed(context, '/createlearninggoal');
              },
              child: const Icon(Icons.add),
            ),
          );
        } else if (state is LearningGoalLoadFailure) {
          return Center(
            child: Text('Failed to load learning goals: ${state.error}'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
