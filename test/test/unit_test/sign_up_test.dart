import 'package:finalproject/authentication/sign_up_page.dart';
import 'package:finalproject/infrastructure/authentication/auth_service.dart';
import 'package:finalproject/infrastructure/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/infrastructure/authentication/auth_event.dart';
import 'package:finalproject/infrastructure/authentication/auth_bloc.dart';

void main() {
  group('SignUpScreen', () {
    late AuthBloc authBloc;

    setUp(() {
      authBloc = AuthBloc(authService: AuthService(apiService: ApiService()));
    });

    tearDown(() {
      authBloc.close();
    });

    testWidgets('renders sign up screen correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: authBloc,
          child: MaterialApp(
            home: SignUpScreen(),
          ),
        ),
      );

      expect(find.text('Sign Up'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(4));
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Already have an account?     Sign in'), findsOneWidget);
    });

    testWidgets('validates form fields correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: authBloc,
          child: MaterialApp(
            home: SignUpScreen(),
          ),
        ),
      );

      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      expect(find.text('Please enter your full name'), findsOneWidget);
      expect(find.text('Please enter your email address'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
      expect(find.text('Please confirm your password'), findsOneWidget);

      await tester.enterText(find.byKey(Key('email_field')), 'invalid');
      await tester.enterText(find.byKey(Key('password_field')), 'short');
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      expect(find.text('Please enter a valid email address'), findsOneWidget);
      expect(find.text('Password must be at least 6 characters long'),
          findsOneWidget);

      await tester.enterText(find.byKey(Key('name_field')), 'John Doe');
      await tester.enterText(
          find.byKey(Key('email_field')), 'johndoe@example.com');
      await tester.enterText(find.byKey(Key('password_field')), 'password');
      await tester.enterText(
          find.byKey(Key('confirm_password_field')), 'password');
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      expect(find.text('Please enter your full name'), findsNothing);
      expect(find.text('Please enter your email address'), findsNothing);
      expect(find.text('Please enter your password'), findsNothing);
      expect(find.text('Please confirm your password'), findsNothing);
      expect(authBloc.state, emits(isA<SignUpEvent>()));
    });

    testWidgets('navigates to sign-in screen on sign-up success',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: authBloc,
          child: MaterialApp(
            home: SignUpScreen(),
            routes: {
              '/signIn': (context) => const Placeholder(),
            },
          ),
        ),
      );

      // Fill all fields with valid values
      await tester.enterText(find.byKey(Key('name_field')), 'John Doe');
      await tester.enterText(
          find.byKey(Key('email_field')), 'johndoe@example.com');
      await tester.enterText(find.byKey(Key('password_field')), 'password');
      await tester.enterText(
          find.byKey(Key('confirm_password_field')), 'password');
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      expect(find.byType(Placeholder), findsOneWidget);
    });

    testWidgets('navigates to sign-in screen on "Already have an account?" tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: authBloc,
          child: MaterialApp(
            home: SignUpScreen(),
            routes: {
              '/signIn': (context) => const Placeholder(),
            },
          ),
        ),
      );

      await tester.tap(find.text('Already have an account?     Sign in'));
      await tester.pumpAndSettle();

      expect(find.byType(Placeholder), findsOneWidget);
    });
  });
}
