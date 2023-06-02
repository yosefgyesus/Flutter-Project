import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:finalproject/domain/user/vocabulary/vocabulary.dart';
//import 'package:finalproject/domain/user/vocabulary/vocabulary.dart';
import 'vocabulary_service.dart';
import 'vocabulary_event.dart';
import 'vocabulary_state.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  final VocabularyService vocabularyService;

  VocabularyBloc({required this.vocabularyService})
      : super(VocabularyInitial());

  Stream<VocabularyState> mapEventToState(VocabularyEvent event) async* {
    if (event is GetVocabularyList) {
      yield* _mapGetVocabularyListToState();
    } else if (event is AddVocabulary) {
      yield* _mapAddVocabularyToState(event);
    } else if (event is ToggleBookmark) {
      yield* _mapToggleBookmarkToState(event);
    }
  }

  Stream<VocabularyState> _mapGetVocabularyListToState() async* {
    yield VocabularyLoading();
    try {
      final vocabularyList = await vocabularyService.getVocabularyList();
      yield VocabularyLoaded(vocabularyList: vocabularyList.cast<Vocabulary>());
    } catch (error) {
      yield const VocabularyFailure(
          errorMessage: 'Failed to fetch vocabulary list.');
    }
  }

  Stream<VocabularyState> _mapAddVocabularyToState(AddVocabulary event) async* {
    try {
      await vocabularyService.addVocabulary(event.vocabulary);
      yield VocabularyLoaded(vocabularyList: state.vocabularyList);
    } catch (error) {
      yield const VocabularyFailure(errorMessage: 'Failed to add vocabulary.');
    }
  }

  Stream<VocabularyState> _mapToggleBookmarkToState(
      ToggleBookmark event) async* {
    try {
      final updatedVocabularyList = state.vocabularyList.map((vocabulary) {
        if (vocabulary.id == event.vocabulary.id) {
          final updatedVocabulary = vocabulary.copyWith(
            isBookmarked: !vocabulary.isBookmarked,
          );
          return updatedVocabulary;
        }
        return vocabulary;
      }).toList();

      yield VocabularyLoaded(vocabularyList: updatedVocabularyList);
    } catch (error) {
      yield const VocabularyFailure(errorMessage: 'Failed to toggle bookmark.');
    }
  }
}
