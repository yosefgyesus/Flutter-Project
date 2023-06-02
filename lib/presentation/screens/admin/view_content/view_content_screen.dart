import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/application/admin/view_content/view_content_bloc.dart';
//import 'package:finalproject/application/admin/view_content/view_content_event.dart';
import 'package:finalproject/application/admin/view_content/view_content_state.dart';

class ViewContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewContentBloc, ViewContentState>(
      builder: (context, state) {
        if (state is ViewContentLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ViewContentSuccess) {
          final contentList = state.contentList;
          return ListView.builder(
            itemCount: contentList.length,
            itemBuilder: (context, index) {
              final content = contentList[index];
              return ListTile(
                title: Text(content.word), // Update 'title' to 'word'
                subtitle: Text(content.meaning),
              );
            },
          );
        } else if (state is ViewContentFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
