import 'package:finalproject/authentication/loading.dart';
import 'package:finalproject/presentation/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;
  bool isLoggedIn = false; // Set to true if the user is already logged in
  bool isAdmin = false; // Set to true if the user is an admin

  @override
  void initState() {
    super.initState();
    // Simulate loading process
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.generateRoute,
      initialRoute: isLoading
          ? '/loading'
          : (isLoggedIn ? (isAdmin ? '/admin/home' : '/user/home') : '/signIn'),
    );
  }
}
