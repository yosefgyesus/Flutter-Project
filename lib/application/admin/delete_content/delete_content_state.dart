import 'package:equatable/equatable.dart';

abstract class DeleteContentState extends Equatable {
  const DeleteContentState();

  @override
  List<Object> get props => [];
}

class DeleteContentInitial extends DeleteContentState {}

class DeleteContentInProgress extends DeleteContentState {}

class DeleteContentSuccess extends DeleteContentState {}

class DeleteContentFailure extends DeleteContentState {
  final String error;

  const DeleteContentFailure(this.error);

  @override
  List<Object> get props => [error];
}
