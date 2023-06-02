import 'package:flutter/material.dart';
import 'package:finalproject/infrastructure/models/learning_goal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/application/user/learning_goals/learning_goals_event.dart';

import '../../../../application/user/learning_goals/learning_goals_bloc.dart';
//import '../../../../application/user/create_learning_goal/create_learning_goal_event.dart';

class LearningGoalCard extends StatelessWidget {
  final LearningGoalModel learningGoal;

  const LearningGoalCard({Key? key, required this.learningGoal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: Text(learningGoal.title),
        subtitle: Text(learningGoal.description),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Dispatch DeleteLearningGoal event to the LearningGoalBloc
            BlocProvider.of<LearningGoalBloc>(context).add(
              DeleteLearningGoal(learningGoal.id),
            );
          },
        ),
      ),
    );
  }
}
