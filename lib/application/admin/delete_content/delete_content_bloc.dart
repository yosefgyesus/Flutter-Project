import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/application/admin/delete_content/delete_content_event.dart';
import 'package:finalproject/application/admin/delete_content/delete_content_state.dart';
//import 'package:finalproject/infrastructure/services/api_service.dart';

import 'delete_content_service.dart';

class DeleteContentBloc extends Bloc<DeleteContentEvent, DeleteContentState> {
  final DeleteContentService _deleteContentService;

  DeleteContentBloc(this._deleteContentService) : super(DeleteContentInitial());

  Stream<DeleteContentState> mapEventToState(DeleteContentEvent event) async* {
    if (event is DeleteContentRequested) {
      yield DeleteContentInProgress();
      try {
        await _deleteContentService.deleteContent(event.contentId);
        yield DeleteContentSuccess();
      } catch (error) {
        yield DeleteContentFailure(error.toString());
      }
    }
  }
}
