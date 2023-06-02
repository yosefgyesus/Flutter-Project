// import 'package:equatable/equatable.dart';

// abstract class CreateContentEvent extends Equatable {
//   const CreateContentEvent();

//   @override
//   List<Object> get props => [];
// }

// class CreateContentButtonPressed extends CreateContentEvent {
//   final String word;
//   final String meaning;

//   const CreateContentButtonPressed({required this.word, required this.meaning});

//   @override
//   List<Object> get props => [word, meaning];
// }

import 'package:equatable/equatable.dart';

abstract class CreateContentEvent extends Equatable {
  const CreateContentEvent();

  @override
  List<Object?> get props => [];
}

class CreateContentButtonPressed extends CreateContentEvent {
  final String word;
  final String meaning;

  const CreateContentButtonPressed({required this.word, required this.meaning});

  @override
  List<Object?> get props => [word, meaning];
}
