// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// //import 'package:finalproject/presentation/user/bookmarks/bookmark_bloc.dart';
// //import 'package:finalproject/infrastructure/user/bookmarks/bookmark_services.dart';
// //import 'package:finalproject/presentation/user/bookmarks/bookmark_page.dart';

// import '../../../../application/user/bookmarks/bookmarks_bloc.dart';
// import '../../../../application/user/bookmarks/bookmarks_service.dart';
// import '../bookmarks/books_page.dart';

// class BookmarkScreen extends StatelessWidget {
//   final BookmarkService bookmarkService = BookmarkService();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<BookmarkBloc>(
//       create: (_) => BookmarkBloc(bookmarkService),
//       child: BookmarkPage(),
//     );
//   }
// }

import 'package:finalproject/application/user/bookmarks/bookmarks_bloc.dart';
import 'package:finalproject/application/user/bookmarks/bookmarks_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/domain/user/bookmarks/bookmarks.dart';

class CreateBookmarkScreen extends StatelessWidget {
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _meaningController = TextEditingController();

  CreateBookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Bookmark'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _wordController,
              decoration: const InputDecoration(
                labelText: 'Word',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _meaningController,
              decoration: const InputDecoration(
                labelText: 'Meaning',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                final word = _wordController.text;
                final meaning = _meaningController.text;
                if (word.isNotEmpty && meaning.isNotEmpty) {
                  final bookmark = Bookmark(
                    word: word,
                    meaning: meaning,
                    id: null,
                  );
                  BlocProvider.of<BookmarkBloc>(context)
                      .add(AddBookmark(bookmark));
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
