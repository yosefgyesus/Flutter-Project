import 'package:bloc/bloc.dart';
import 'package:finalproject/application/user/home/home_event.dart';
import 'package:finalproject/application/user/home/home_state.dart';
import 'package:finalproject/application/user/home/home_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService homeService;

  HomeBloc({required this.homeService}) : super(HomeInitial());

  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is ValidateCredentials) {
      yield ValidationLoading();

      try {
        final isValid = await homeService.validateUserCredentials(
            event.email, event.password);

        if (isValid) {
          yield ValidationSuccess();
        } else {
          yield const ValidationFailure('Invalid credentials');
        }
      } catch (error) {
        yield ValidationFailure('Failed to validate credentials: $error');
      }
    }
  }
}
