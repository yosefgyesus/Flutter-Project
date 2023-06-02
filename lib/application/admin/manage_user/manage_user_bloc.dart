import 'package:finalproject/application/admin/manage_user/manage_user_event.dart';
import 'package:finalproject/application/admin/manage_user/manage_user_state.dart';
import 'manage_user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageUserBloc extends Bloc<ManageUserEvent, ManageUserState> {
  final ManageUserService userService;

  ManageUserBloc(this.userService) : super(ManageUserInitial());

  @override
  Stream<ManageUserState> mapEventToState(ManageUserEvent event) async* {
    if (event is CreateUserEvent) {
      yield* _mapCreateUserEventToState(event);
    }
  }

  Stream<ManageUserState> _mapCreateUserEventToState(
      CreateUserEvent event) async* {
    yield UserCreationInProgress();

    try {
      await userService.createUser(event.user);
      yield UserCreationSuccess();
    } catch (error) {
      yield UserCreationFailure('Failed to create user: $error');
    }
  }
}
