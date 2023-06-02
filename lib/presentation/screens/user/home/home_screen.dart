import 'package:finalproject/application/user/home/home_bloc.dart';
import 'package:finalproject/application/user/home/home_event.dart';
import 'package:finalproject/application/user/home/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/user/home/home_state.dart';

class HomeScreen extends StatelessWidget {
  final HomeService homeService;

  const HomeScreen({Key? key, required this.homeService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(homeService: homeService),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is ValidationSuccess) {
                homeService.navigateToHomePage(context);
              } else if (state is ValidationFailure) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content: Text(state.errorMessage),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is ValidationLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Login'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Dispatch the ValidateCredentials event with the entered email and password
                          context.read<HomeBloc>().add(
                                ValidateCredentials(
                                  email:
                                      'test@example.com', // Replace with actual entered email
                                  password:
                                      'password', // Replace with actual entered password
                                ),
                              );
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
