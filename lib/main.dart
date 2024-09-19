import 'package:flutter/material.dart';
import 'features/sign_up_page.dart'; // Import the SignUpPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(), // Set SignUpPage as the home widget
    );
  }
}
