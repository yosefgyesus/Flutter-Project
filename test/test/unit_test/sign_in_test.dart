// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:finalproject/infrastructure/authentication/auth_bloc.dart';
// import 'package:finalproject/infrastructure/authentication/auth_event.dart';
// import 'package:finalproject/authentication/sign_in_page.dart';

// void main() {
//   late AuthBloc authBloc;

//   setUp(() {
//     authBloc = AuthBloc(authService: null);
//   });

//   tearDown(() {
//     authBloc.close();
//   });

//   testWidgets('Sign in button triggers sign in event',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider<AuthBloc>.value(
//           value: authBloc,
//           child: SignInScreen(),
//         ),
//       ),
//     );

//     final emailField = find.byKey(Key('email_field'));
//     final passwordField = find.byKey(Key('password_field'));
//     final signInButton = find.text('Sign In');

//     // Enter valid email and password
//     await tester.enterText(emailField, 'test@example.com');
//     await tester.enterText(passwordField, 'password');

//     // Tap the sign in button
//     await tester.tap(signInButton);
//     await tester.pump();

//     // Verify that the sign-in event is dispatched
//     expect(
//       authBloc.state,
//       emitsInOrder([isA<AuthLoadingState>(), isA<SignInSuccessState>()]),
//     );
//   });

//   testWidgets('Empty email field shows validation error',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider<AuthBloc>.value(
//           value: authBloc,
//           child: SignInScreen(),
//         ),
//       ),
//     );

//     final signInButton = find.text('Sign In');

//     // Tap the sign in button without entering any email
//     await tester.tap(signInButton);
//     await tester.pump();

//     // Verify that the validation error is displayed
//     expect(find.text('Please enter your email address'), findsOneWidget);
//     expect(authBloc.state, neverEmits(isA<AuthEvent>()));
//   });

//   testWidgets('Empty password field shows validation error',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider<AuthBloc>.value(
//           value: authBloc,
//           child: SignInScreen(),
//         ),
//       ),
//     );

//     final emailField = find.byKey(Key('email_field'));
//     final signInButton = find.text('Sign In');

//     // Enter valid email but leave password field empty
//     await tester.enterText(emailField, 'test@example.com');

//     // Tap the sign in button
//     await tester.tap(signInButton);
//     await tester.pump();

//     // Verify that the validation error is displayed
//     expect(find.text('Please enter your password'), findsOneWidget);
//     expect(authBloc.state, neverEmits(isA<AuthEvent>()));
//   });
// }
