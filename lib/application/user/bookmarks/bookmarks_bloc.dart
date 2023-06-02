import 'dart:async';
import 'package:bloc/bloc.dart';
//import 'package:finalproject/domain/user/bookmarks/bookmarks.dart';
import 'bookmarks_service.dart';

import 'bookmarks_event.dart';
import 'bookmarks_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final BookmarkService bookmarkService;

  BookmarkBloc(this.bookmarkService) : super(BookmarkInitial());

  Stream<BookmarkState> mapEventToState(BookmarkEvent event) async* {
    if (event is LoadBookmarks) {
      yield* _mapLoadBookmarksToState();
    } else if (event is AddBookmark) {
      yield* _mapAddBookmarkToState(event);
    } else if (event is RemoveBookmark) {
      yield* _mapRemoveBookmarkToState(event);
    }
  }

  Stream<BookmarkState> _mapLoadBookmarksToState() async* {
    yield BookmarkLoading();
    try {
      final bookmarks = await bookmarkService.getBookmarks();
      yield BookmarkLoadSuccess(bookmarks);
    } catch (error) {
      yield BookmarkLoadFailure('Failed to load bookmarks: $error');
    }
  }

  Stream<BookmarkState> _mapAddBookmarkToState(AddBookmark event) async* {
    try {
      await bookmarkService.addBookmark(event.bookmark);
      final bookmarks = await bookmarkService.getBookmarks();
      yield BookmarkLoadSuccess(bookmarks);
    } catch (error) {
      yield BookmarkLoadFailure('Failed to add bookmark: $error');
    }
  }

  Stream<BookmarkState> _mapRemoveBookmarkToState(RemoveBookmark event) async* {
    try {
      await bookmarkService.removeBookmark(event.bookmark);
      final bookmarks = await bookmarkService.getBookmarks();
      yield BookmarkLoadSuccess(bookmarks);
    } catch (error) {
      yield BookmarkLoadFailure('Failed to remove bookmark: $error');
    }
  }
}
