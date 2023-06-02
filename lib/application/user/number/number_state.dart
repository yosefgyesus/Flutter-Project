import 'package:equatable/equatable.dart';
import 'package:finalproject/domain/user/number/number.dart';

abstract class NumberState extends Equatable {
  const NumberState();

  @override
  List<Object> get props => [];
}

class NumberInitial extends NumberState {}

class NumberLoading extends NumberState {}

class NumberLoaded extends NumberState {
  final List<Number> numbers;

  const NumberLoaded({required this.numbers});

  @override
  List<Object> get props => [numbers];
}

class NumberFailure extends NumberState {
  final String errorMessage;

  const NumberFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
