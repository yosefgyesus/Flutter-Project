import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ValidationLoading extends HomeState {}

class ValidationSuccess extends HomeState {}

class ValidationFailure extends HomeState {
  final String errorMessage;

  const ValidationFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
