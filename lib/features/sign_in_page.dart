import 'package:cc206_bahanap/features/dashboard_page.dart';
import 'package:cc206_bahanap/features/sign_up_page.dart';
import 'package:cc206_bahanap/features/forgot_password.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

Route _createFadeRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => DashboardPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

Route _createFadeRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SignUpPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  bool _keepMeLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'getstarted');
                    },
                    icon: const Icon(Icons.arrow_back,
                        size: 30, color: Color(0xFF32ade6)),
                  ),
                  const Text(
                    'Login Account',
                    style: TextStyle(
                        fontFamily: 'SfPro',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF154961)),
                  ),
                  const Text(
                    'Welcome back!',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF575757)),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Email Address',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF575757)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Enter email address',
                        labelStyle: const TextStyle(
                            color: Color(0xFFAFAFAF), fontSize: 15)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF575757)),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Enter password',
                        labelStyle: const TextStyle(
                            color: Color(0xFFAFAFAF), fontSize: 15)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _keepMeLoggedIn,
                            onChanged: (bool? value) {
                              setState(() {
                                _keepMeLoggedIn = value ?? false;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          const Text(
                            'Keep me logged in',
                            style: TextStyle(
                                fontSize: 14, color: Color(0XFF575757)),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'forgot');
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFF32ade6),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(_createFadeRoute());
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 60),
                        backgroundColor: const Color(0XFF32ade6),
                        foregroundColor: Colors.white,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: Color(0XFF32ade6),
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'SfPro',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      SizedBox(width: 12),
                      Text('or sign in with'),
                      SizedBox(width: 12),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text("Login with google"),
                                  content: const Text("Google Login API here."),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Ok"))
                                  ],
                                ));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        foregroundColor: Colors.black,
                        elevation: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google.png',
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text("Login with apple"),
                                  content: const Text("Apple Login API here."),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Ok"))
                                  ],
                                ));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        elevation: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/apple.png',
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Continue with Apple',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text("Login with Facebook"),
                                  content:
                                      const Text("Facebook Login API here."),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Ok"))
                                  ],
                                ));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: Color(0XFF32ade6),
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        elevation: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/facebook.png',
                            height: 44,
                            width: 44,
                          ),
                          const SizedBox(width: 2),
                          const Text(
                            'Continue with Facebook',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(_createFadeRoute2());
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
