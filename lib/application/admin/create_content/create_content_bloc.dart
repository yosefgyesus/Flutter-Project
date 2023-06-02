import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/application/admin/create_content/create_content_event.dart';
import 'package:finalproject/application/admin/create_content/create_content_state.dart';
// ignore: unused_import
import 'package:finalproject/infrastructure/services/api_service.dart';
import 'package:finalproject/infrastructure/models/content_model.dart';
import 'package:finalproject/infrastructure/repository/vocabulary_repository.dart';

import '../../../domain/admin/create_content/vocabulary.dart';

class CreateContentBloc extends Bloc<CreateContentEvent, CreateContentState> {
  final VocabularyRepository repository;

  CreateContentBloc({required this.repository}) : super(CreateContentInitial());

  Stream<CreateContentState> mapEventToState(CreateContentEvent event) async* {
    if (event is CreateContentButtonPressed) {
      yield CreateContentLoading();

      try {
        final vocabulary = Vocabulary(
          word: event.word,
          meaning: event.meaning,
        );

        await repository.saveVocabulary(vocabulary as ContentModel);

        yield CreateContentSuccess();
      } catch (error) {
        yield const CreateContentFailure(error: 'Failed to create content');
      }
    }
  }
}
