import 'dart:async';
import 'package:bloc/bloc.dart';
import 'auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc({required AuthService authService})
      : _authService = authService,
        super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignUpEvent) {
      yield* _mapSignUpEventToState(event);
    } else if (event is SignInEvent) {
      yield* _mapSignInEventToState(event);
    }
  }

  Stream<AuthState> _mapSignUpEventToState(SignUpEvent event) async* {
    yield AuthLoading();
    try {
      await _authService.signUp(event.email, event.password);
      yield AuthAuthenticated();
    } catch (error) {
      yield AuthFailure(errorMessage: 'Sign up failed. Please try again.');
    }
  }

  Stream<AuthState> _mapSignInEventToState(SignInEvent event) async* {
    yield AuthLoading();
    try {
      await _authService.signIn(event.email, event.password);
      yield AuthAuthenticated();
    } catch (error) {
      yield AuthFailure(errorMessage: 'Sign in failed. Please try again.');
    }
  }
}
