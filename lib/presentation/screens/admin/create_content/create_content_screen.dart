import 'package:flutter/material.dart';
import 'create_content_page.dart';

class CreateContentScreen extends StatelessWidget {
  const CreateContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Content'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return CreateContentPage(
            screenSize: Size(constraints.maxWidth, constraints.maxHeight),
          );
        },
      ),
    );
  }
}
