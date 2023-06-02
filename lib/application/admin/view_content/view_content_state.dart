import 'package:equatable/equatable.dart';
import 'package:finalproject/infrastructure/models/content_model.dart';

abstract class ViewContentState extends Equatable {
  const ViewContentState();

  @override
  List<Object?> get props => [];
}

class ViewContentInitial extends ViewContentState {}

class ViewContentLoading extends ViewContentState {}

class ViewContentSuccess extends ViewContentState {
  final List<ContentModel> contentList;

  const ViewContentSuccess(this.contentList);

  @override
  List<Object?> get props => [contentList];
}

class ViewContentFailure extends ViewContentState {
  final String errorMessage;

  const ViewContentFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
