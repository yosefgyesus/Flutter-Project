import 'package:bloc/bloc.dart';
import 'package:finalproject/application/user/greeting/greeting_service.dart';
import 'package:finalproject/domain/user/greeting/greeting.dart';
import 'greeting_event.dart';
import 'greeting_state.dart';
import 'package:finalproject/infrastructure/repository/greeting_repository.dart';

class GreetingBloc extends Bloc<GreetingEvent, GreetingState> {
  final GreetingRepository greetingRepository;

  GreetingBloc({
    required this.greetingRepository,
    required GreetingService greetingService,
  }) : super(GreetingInitial()) {
    on<FetchGreetings>(_mapFetchGreetingsToState);
  }

  Future<void> _mapFetchGreetingsToState(
    FetchGreetings event,
    Emitter<GreetingState> emit,
  ) async {
    emit(GreetingLoading());
    try {
      final greetings = await greetingRepository.fetchGreetings();
      emit(GreetingLoaded(greetings));
    } catch (e) {
      emit(const GreetingFailure('Failed to fetch greetings'));
    }
  }
}
