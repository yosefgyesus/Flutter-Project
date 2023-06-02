import 'package:equatable/equatable.dart';
import 'package:finalproject/domain/user/bookmarks/bookmarks.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoading extends BookmarkState {}

class BookmarkLoadSuccess extends BookmarkState {
  final List<Bookmark> bookmarks;

  const BookmarkLoadSuccess(this.bookmarks);

  @override
  List<Object> get props => [bookmarks];

  @override
  String toString() => 'BookmarkLoadSuccess { bookmarks: $bookmarks }';
}

class BookmarkLoadFailure extends BookmarkState {
  final String errorMessage;

  const BookmarkLoadFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'BookmarkLoadFailure { errorMessage: $errorMessage }';
}
