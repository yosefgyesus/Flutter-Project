import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:finalproject/domain/user/number/number.dart';
import 'number_service.dart';
import 'number_event.dart';
import 'number_state.dart';

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  final NumberService numberService;

  NumberBloc({required this.numberService}) : super(NumberInitial());

  @override
  Stream<NumberState> mapEventToState(NumberEvent event) async* {
    if (event is FetchNumbers) {
      yield* _mapFetchNumbersToState();
    } else if (event is AddToChecked) {
      yield* _mapAddToCheckedToState(event);
    }
  }

  Stream<NumberState> _mapFetchNumbersToState() async* {
    yield NumberLoading();
    try {
      final numbers = await numberService.getNumbers();
      yield NumberLoaded(numbers: numbers);
    } catch (error) {
      yield NumberFailure('Failed to fetch numbers: $error');
    }
  }

  Stream<NumberState> _mapAddToCheckedToState(AddToChecked event) async* {
    try {
      await numberService.addToChecked(event.number);
      final currentState = state;
      if (currentState is NumberLoaded) {
        final updatedNumbers = List<Number>.from(currentState.numbers);
        yield NumberLoaded(numbers: updatedNumbers);
      }
    } catch (error) {
      yield NumberFailure('Failed to add item to checked: $error');
    }
  }
}
