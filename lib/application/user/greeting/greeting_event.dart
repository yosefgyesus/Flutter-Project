import 'package:equatable/equatable.dart';

abstract class GreetingEvent extends Equatable {
  const GreetingEvent();

  @override
  List<Object> get props => [];
}

class FetchGreetings extends GreetingEvent {}
