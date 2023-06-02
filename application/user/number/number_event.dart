import 'package:equatable/equatable.dart';

import '../../../domain/user/number/number.dart';

abstract class NumberEvent extends Equatable {
  const NumberEvent();

  @override
  List<Object> get props => [];
}

class FetchNumbers extends NumberEvent {}

class AddToChecked extends NumberEvent {
  final Number number;

  const AddToChecked(this.number);

  @override
  List<Object> get props => [number];
}
