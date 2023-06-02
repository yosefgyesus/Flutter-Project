import 'package:equatable/equatable.dart';
import 'package:finalproject/infrastructure/models/user_model.dart';

abstract class ManageUserState extends Equatable {
  const ManageUserState();

  @override
  List<Object?> get props => [];
}

class ManageUserInitial extends ManageUserState {}

class UserCreationInProgress extends ManageUserState {}

class UserCreationSuccess extends ManageUserState {}

class UserCreationFailure extends ManageUserState {
  final String error;

  const UserCreationFailure(this.error);

  @override
  List<Object?> get props => [error];
}
