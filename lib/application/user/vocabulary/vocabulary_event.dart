import 'package:equatable/equatable.dart';
import 'package:finalproject/domain/user/vocabulary/vocabulary.dart';

abstract class VocabularyEvent extends Equatable {
  const VocabularyEvent();

  @override
  List<Object> get props => [];
}

class GetVocabularyList extends VocabularyEvent {}

class AddVocabulary extends VocabularyEvent {
  final Vocabulary vocabulary;

  const AddVocabulary({required this.vocabulary});

  @override
  List<Object> get props => [vocabulary];
}

class ToggleBookmark extends VocabularyEvent {
  final Vocabulary vocabulary;

  const ToggleBookmark({required this.vocabulary});

  @override
  List<Object> get props => [vocabulary];
}
