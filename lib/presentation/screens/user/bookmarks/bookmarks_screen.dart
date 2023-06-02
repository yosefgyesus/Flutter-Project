import 'package:finalproject/application/user/bookmarks/bookmarks_bloc.dart';
import 'package:finalproject/application/user/bookmarks/bookmarks_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bookmarks_page.dart';

class BookmarksScreen extends StatelessWidget {
  final BookmarkService bookmarkService;

  const BookmarksScreen({Key? key, required this.bookmarkService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookmarkBloc(bookmarkService),
      child: BookmarkPage(),
    );
  }
}
