import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/application/admin/delete_content/delete_content_bloc.dart';
import 'package:finalproject/application/admin/delete_content/delete_content_event.dart';
import 'package:finalproject/application/admin/delete_content/delete_content_state.dart';

class DeleteContentScreen extends StatefulWidget {
  const DeleteContentScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DeleteContentScreenState createState() => _DeleteContentScreenState();
}

class _DeleteContentScreenState extends State<DeleteContentScreen> {
  late DeleteContentBloc _deleteContentBloc;

  @override
  void initState() {
    super.initState();
    _deleteContentBloc = BlocProvider.of<DeleteContentBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteContentBloc, DeleteContentState>(
      listener: (context, state) {
        if (state is DeleteContentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Content deleted successfully'),
            ),
          );
        } else if (state is DeleteContentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DeleteContentInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _deleteContentBloc
                        .add(const DeleteContentRequested('<contentId>'));
                  },
                  child: const Text('Delete Content'),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
