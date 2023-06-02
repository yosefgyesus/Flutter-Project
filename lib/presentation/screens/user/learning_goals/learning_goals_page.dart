import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/application/user/learning_goals/learning_goals_bloc.dart';
import 'package:finalproject/application/user/create_learning_goal/create_learning_goal_event.dart';
import 'package:finalproject/infrastructure/models/learning_goal_model.dart';
import 'package:finalproject/application/user/learning_goals/learning_goals_service.dart';

import '../../../../application/user/learning_goals/learning_goals_event.dart';

class LearningGoalPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final String userId;

  LearningGoalPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    var formKey4;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Learning Goal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey4,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  var formKey4;
                  if (formKey4.currentState!.validate()) {
                    final title = _titleController.text.trim();
                    final description = _descriptionController.text.trim();

                    final learningGoal = LearningGoalModel(
                      userId: userId,
                      title: title,
                      description: description,
                    );

                    BlocProvider.of<LearningGoalBloc>(context).add(
                      CreateLearningGoal(learningGoal) as LearningGoalEvent,
                    );

                    Navigator.pop(context);
                  }
                },
                child: Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
