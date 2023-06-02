import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class HomeService {
  bool isAdmin = false; // Set this flag based on user role

  Future<bool> validateUserCredentials(String email, String password) async {
    // Connect to the local MongoDB database
    var db = await Db.create('mongodb://127.0.0.1:27017');
    await db.open();

    // Perform your validation logic here, e.g., check credentials against the database
    var collection = db.collection('users');
    var query = where.eq('email', email).eq('password', password);
    var count = await collection.count(query);

    // Close the database connection
    await db.close();

    // Return true if the credentials are valid, false otherwise
    return count > 0;
  }

  void navigateToHomePage(BuildContext context) {
    // Navigate to the appropriate home page based on user role
    if (isAdmin) {
      Navigator.pushReplacementNamed(context, '/adminhomescreen');
    } else {
      Navigator.pushReplacementNamed(context, '/userhomescreen');
    }
  }
}
