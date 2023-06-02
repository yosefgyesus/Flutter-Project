import 'package:finalproject/application/admin/view_content/view_content_service.dart';
import 'package:finalproject/infrastructure/repository/view_content_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/application/admin/view_content/view_content_bloc.dart';

import '../../../../application/admin/view_content/view_content_service.dart';
import 'view_content_screen.dart';

class ViewContentPage extends StatelessWidget {
  final ViewContentRepository
      viewContentRepository; // Add the repository as a dependency

  const ViewContentPage({required this.viewContentRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Content'),
      ),
      body: BlocProvider(
        create: (context) => ViewContentBloc(
            viewContentRepository), // Provide the repository to the bloc
        child: ViewContentScreen(),
      ),
    );
  }
}
