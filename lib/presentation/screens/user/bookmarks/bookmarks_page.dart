import 'package:finalproject/application/user/bookmarks/bookmarks_bloc.dart';
import 'package:finalproject/application/user/bookmarks/bookmarks_event.dart';
import 'package:finalproject/application/user/bookmarks/bookmarks_state.dart';
//import 'package:finalproject/application/user/bookmarks/bookmarks_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../create_bookmark/create_bookmark_page.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late BookmarkBloc _bookmarkBloc;

  @override
  void initState() {
    super.initState();
    _bookmarkBloc = BlocProvider.of<BookmarkBloc>(context);
    _bookmarkBloc.add(LoadBookmarks());
  }

  @override
  void dispose() {
    _bookmarkBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: BlocBuilder<BookmarkBloc, BookmarkState>(
        builder: (context, state) {
          if (state is BookmarkLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BookmarkLoadSuccess) {
            final bookmarks = state.bookmarks;
            if (bookmarks.isEmpty) {
              return const Center(
                child: Text('No bookmarks available'),
              );
            }
            return ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final bookmark = bookmarks[index];
                return ListTile(
                  title: Text(bookmark.word),
                  subtitle: Text(bookmark.meaning),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _bookmarkBloc.add(RemoveBookmark(bookmark));
                    },
                  ),
                );
              },
            );
          } else if (state is BookmarkLoadFailure) {
            return Center(
              child: Text('Failed to load bookmarks: ${state.errorMessage}'),
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CreateBookmarkPage(),
            ),
          );
        },
      ),
    );
  }
}
