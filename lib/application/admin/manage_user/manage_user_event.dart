import 'package:equatable/equatable.dart';
import 'package:finalproject/infrastructure/models/user_model.dart';

abstract class ManageUserEvent extends Equatable {
  const ManageUserEvent();

  @override
  List<Object?> get props => [];
}

class CreateUserEvent extends ManageUserEvent {
  final UserModel user;

  const CreateUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}
