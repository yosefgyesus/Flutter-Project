import 'package:finalproject/application/admin/view_content/view_content_event.dart';
//import 'package:finalproject/domain/admin/view_content/view_content.dart';

import '../../../infrastructure/repository/view_content_repository.dart';
import 'view_content_state.dart';

import 'package:bloc/bloc.dart';

class ViewContentBloc extends Bloc<ViewContentEvent, ViewContentState> {
  final ViewContentRepository viewContentRepository;

  ViewContentBloc(this.viewContentRepository) : super(ViewContentInitial());

  Stream<ViewContentState> mapEventToState(ViewContentEvent event) async* {
    if (event is ViewContentLoad) {
      yield ViewContentLoading();
      try {
        final contents = await viewContentRepository.getContents();
        yield ViewContentSuccess(contents);
      } catch (error) {
        yield ViewContentFailure(error.toString());
      }
    }
  }
}
