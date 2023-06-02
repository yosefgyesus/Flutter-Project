import 'package:equatable/equatable.dart';

abstract class DeleteContentEvent extends Equatable {
  const DeleteContentEvent();

  @override
  List<Object> get props => [];
}

class DeleteContentRequested extends DeleteContentEvent {
  final String contentId;

  const DeleteContentRequested(this.contentId);

  @override
  List<Object> get props => [contentId];
}
