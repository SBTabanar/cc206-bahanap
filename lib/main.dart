import 'package:cc206_bahanap/features/tab_view.dart';
import 'package:flutter/material.dart';
import 'features/sign_up_page.dart';
import 'features/dashboard_page.dart';
import 'features/sign_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bahanap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInPage(),
    );
  }
}
