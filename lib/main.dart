// main.dart
import 'package:flutter/material.dart';
import 'package:first_flutter_projects/view/boarding_page_view.dart';
import 'package:first_flutter_projects/view/sign_up_view.dart';
import 'package:first_flutter_projects/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Upanetra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set boarding page as initial route
      routes: {
        '/': (context) => const BoardingPageView(),
        '/signup': (context) => const SignUpView(),
        '/login': (context) => const LoginView(),


      },
    );
  }
}