import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/application/user/greeting/greeting_bloc.dart';
import 'package:finalproject/application/user/greeting/greeting_service.dart';

import 'package:finalproject/infrastructure/services/api_service.dart';
import 'package:finalproject/infrastructure/repository/greeting_repository.dart';

import 'greegting_page.dart';

class GreetingScreen extends StatelessWidget {
  final GreetingService greetingService;

  const GreetingScreen({Key? key, required this.greetingService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    final GreetingRepository greetingRepository =
        GreetingRepository(apiService);

    return BlocProvider(
      create: (context) => GreetingBloc(
        greetingRepository: greetingRepository,
        greetingService: greetingService,
      ),
      child: GreetingPage(),
    );
  }
}
