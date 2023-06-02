// import 'package:flutter/material.dart';
// import 'package:finalproject/application/admin/delete_content/delete_content_service.dart';
// import '../../../../infrastructure/models/content_model.dart';

// class DeleteContentDialog {
//   final DeleteContentService _deleteContentService;

//   DeleteContentDialog(this._deleteContentService);

//   Future<void> showDeleteConfirmation(
//       BuildContext context, ContentModel content) async {
//     // Show a dialog to confirm content deletion
//     final confirmed = await showDialog<bool>(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Delete Content'),
//         content: const Text('Are you sure you want to delete this content?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(false),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(true),
//             child: const Text('Delete'),
//           ),
//         ],
//       ),
//     );

//     if (confirmed != null && confirmed) {
//       await _deleteContentService.deleteContent(content);
//       // Perform any necessary UI updates after successful deletion
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Content deleted successfully'),
//         ),
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/application/admin/delete_content/delete_content_bloc.dart';

import '../../../../application/admin/delete_content/delete_content_service.dart';
import 'delete_content_screen.dart';

class DeleteContentPage extends StatelessWidget {
  final DeleteContentService deleteContentService;

  const DeleteContentPage({super.key, required this.deleteContentService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Content'),
      ),
      body: BlocProvider(
        create: (context) => DeleteContentBloc(deleteContentService),
        child: const DeleteContentScreen(),
      ),
    );
  }
}
