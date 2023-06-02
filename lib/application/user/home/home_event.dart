import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ValidateCredentials extends HomeEvent {
  final String email;
  final String password;

  const ValidateCredentials({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
