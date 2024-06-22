import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'user_home_page.dart';
import 'trainer_home_page.dart';
import 'admin_home_page.dart';
import 'admin_login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Gym App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => SignupPage(),
        '/trainer_home': (context) => TrainerHomePage(),
        '/user_home': (context) => UserHomePage(),
        '/admin_login': (context) => AdminLoginPage(),
        '/admin_home': (context) => AdminHomePage(),
      },
    );
  }
}
