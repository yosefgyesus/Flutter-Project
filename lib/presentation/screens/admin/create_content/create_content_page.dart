// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:finalproject/application/admin/create_content/create_content_bloc.dart';

// import '../../../../application/admin/create_content/create_content_event.dart';
// import '../../../../application/admin/create_content/create_content_state.dart';

// class CreateContentPage extends StatefulWidget {
//   const CreateContentPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _CreateContentPageState createState() => _CreateContentPageState();
// }

// class _CreateContentPageState extends State<CreateContentPage> {
//   final TextEditingController _wordController = TextEditingController();
//   final TextEditingController _meaningController = TextEditingController();

//   late CreateContentBloc _createContentBloc;

//   @override
//   void initState() {
//     super.initState();
//     _createContentBloc = BlocProvider.of<CreateContentBloc>(context);
//   }

//   @override
//   void dispose() {
//     _wordController.dispose();
//     _meaningController.dispose();
//     super.dispose();
//   }

//   void _onCreateButtonPressed() {
//     final word = _wordController.text;
//     final meaning = _meaningController.text;
//     _createContentBloc.add(CreateContentEvent(word, meaning));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Create Content'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _wordController,
//               decoration: const InputDecoration(
//                 labelText: 'Word',
//               ),
//             ),
//             TextFormField(
//               controller: _meaningController,
//               decoration: const InputDecoration(
//                 labelText: 'Meaning',
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _onCreateButtonPressed,
//               child: const Text('Create'),
//             ),
//             BlocBuilder<CreateContentBloc, CreateContentState>(
//               builder: (context, state) {
//                 if (state is CreateContentLoading) {
//                   return const CircularProgressIndicator();
//                 } else if (state is CreateContentSuccess) {
//                   return const Text('Content created successfully!');
//                 } else if (state is CreateContentFailure) {
//                   return const Text(
//                       'Failed to create content. Please try again.');
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/application/admin/create_content/create_content_bloc.dart';

import '../../../../application/admin/create_content/create_content_event.dart';
import '../../../../application/admin/create_content/create_content_state.dart';

class CreateContentPage extends StatefulWidget {
  const CreateContentPage({Key? key, required Size screenSize})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreateContentPageState createState() => _CreateContentPageState();
}

class _CreateContentPageState extends State<CreateContentPage> {
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _meaningController = TextEditingController();

  late CreateContentBloc _createContentBloc;

  @override
  void initState() {
    super.initState();
    _createContentBloc = context.read<CreateContentBloc>();
  }

  @override
  void dispose() {
    _wordController.dispose();
    _meaningController.dispose();
    super.dispose();
  }

  void _onCreateButtonPressed() {
    final word = _wordController.text;
    final meaning = _meaningController.text;
    _createContentBloc
        .add(CreateContentButtonPressed(word: word, meaning: meaning));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Content'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.05),
        child: Column(
          children: [
            TextFormField(
              controller: _wordController,
              decoration: const InputDecoration(
                labelText: 'Word',
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            TextFormField(
              controller: _meaningController,
              decoration: const InputDecoration(
                labelText: 'Meaning',
              ),
            ),
            SizedBox(height: screenSize.height * 0.04),
            ElevatedButton(
              onPressed: _onCreateButtonPressed,
              child: const Text('Create'),
            ),
            BlocBuilder<CreateContentBloc, CreateContentState>(
              builder: (context, state) {
                if (state is CreateContentLoading) {
                  return const CircularProgressIndicator();
                } else if (state is CreateContentSuccess) {
                  return const Text('Content created successfully!');
                } else if (state is CreateContentFailure) {
                  return const Text(
                      'Failed to create content. Please try again.');
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
