import 'package:finalproject/application/user/number/number_bloc.dart';
import 'package:finalproject/application/user/number/number_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'number_page.dart';

class NumberScreen extends StatelessWidget {
  final NumberService numberService;

  const NumberScreen({super.key, required this.numberService});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NumberBloc(numberService: numberService),
      child: const NumberPage(),
    );
  }
}
