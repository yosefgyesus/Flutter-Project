import 'package:equatable/equatable.dart';
import 'package:finalproject/domain/user/greeting/greeting.dart';

abstract class GreetingState extends Equatable {
  const GreetingState();

  @override
  List<Object?> get props => [];
}

class GreetingInitial extends GreetingState {}

class GreetingLoading extends GreetingState {}

class GreetingLoaded extends GreetingState {
  final List<Greeting> greetings;

  const GreetingLoaded(this.greetings);

  @override
  List<Object?> get props => [greetings];

  String get greeting => greetings.first.greeting; // Add this getter
}

class GreetingFailure extends GreetingState {
  final String errorMessage;

  const GreetingFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
