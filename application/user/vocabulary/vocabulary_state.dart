import 'package:equatable/equatable.dart';
import 'package:finalproject/domain/user/vocabulary/vocabulary.dart';

abstract class VocabularyState extends Equatable {
  const VocabularyState();

  @override
  List<Object> get props => [];

  get vocabularyList => null;
}

class VocabularyInitial extends VocabularyState {
  @override
  List<Vocabulary> get vocabularyList => [];
}

class VocabularyLoading extends VocabularyState {
  @override
  List<Vocabulary> get vocabularyList => [];
}

class VocabularyLoaded extends VocabularyState {
  @override
  final List<Vocabulary> vocabularyList;

  const VocabularyLoaded({required this.vocabularyList});

  @override
  List<Object> get props => [vocabularyList];
}

class VocabularyFailure extends VocabularyState {
  final String errorMessage;

  const VocabularyFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
