import 'package:cc206_bahanap/features/map_page.dart';
import 'package:cc206_bahanap/features/welcome.dart';
import 'package:flutter/material.dart';
import 'package:cc206_bahanap/features/get_started.dart';
import 'package:cc206_bahanap/features/forgot_password.dart';
import 'package:flutter/services.dart';
import 'features/sign_up_page.dart';
import 'features/dashboard_page.dart';
import 'features/sign_in_page.dart';
import 'features/verify.dart';
import 'features/notifications_page.dart';

void main() {
  runApp(const MyApp());
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
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blue,
        ),
        focusColor: Colors.blue,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
        ),
      ),
      initialRoute: 'home',
      routes: {
        'dash': (context) => DashboardPage(),
        'forgot': (context) => ForgotPassword(),
        'signup': (context) => SignUpPage(),
        'notifications': (context) => NotificationsPage(),
        'map': (context) => MapPage(),
        'signin': (context) => SignInPage(),
        'getstarted': (context) => GetStarted(),
        'verify': (context) => Verify(),
      },
      home: const Welcome(),
    );
  }
}
