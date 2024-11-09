import 'package:cc206_bahanap/features/tab_view.dart';
import 'package:flutter/material.dart';
import 'features/sign_up_page.dart';
import 'features/dashboard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bahanap Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}
