import 'package:equatable/equatable.dart';
import 'package:finalproject/domain/user/bookmarks/bookmarks.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class LoadBookmarks extends BookmarkEvent {}

class AddBookmark extends BookmarkEvent {
  final Bookmark bookmark;

  const AddBookmark(this.bookmark);

  @override
  List<Object> get props => [bookmark];

  @override
  String toString() => 'AddBookmark { bookmark: $bookmark }';
}

class RemoveBookmark extends BookmarkEvent {
  final Bookmark bookmark;

  const RemoveBookmark(this.bookmark);

  @override
  List<Object> get props => [bookmark];

  @override
  String toString() => 'RemoveBookmark { bookmark: $bookmark }';
}
