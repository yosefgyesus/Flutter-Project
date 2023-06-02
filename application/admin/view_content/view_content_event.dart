import 'package:equatable/equatable.dart';

abstract class ViewContentEvent extends Equatable {
  const ViewContentEvent();

  @override
  List<Object> get props => [];
}

class ViewContentLoad extends ViewContentEvent {}
