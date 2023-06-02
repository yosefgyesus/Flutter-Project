import 'package:equatable/equatable.dart';

abstract class CreateContentState extends Equatable {
  const CreateContentState();

  @override
  List<Object> get props => [];
}

class CreateContentInitial extends CreateContentState {}

class CreateContentLoading extends CreateContentState {}

class CreateContentSuccess extends CreateContentState {}

class CreateContentFailure extends CreateContentState {
  final String error;

  const CreateContentFailure({required this.error});

  @override
  List<Object> get props => [error];
}
