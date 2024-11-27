import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verify extends StatelessWidget {
  const Verify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,
                  size: 30, color: Color(0xFF32ade6)),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Card(
                elevation: 20,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Verification',
                        style: TextStyle(fontSize: 24, color: Colors.blue),
                      ),
                      Image.asset(
                        'assets/forgot.png',
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Enter the verification code we just sent to your email address',
                        style: TextStyle(
                            fontFamily: 'SfPro',
                            fontSize: 16,
                            color: Color(0XFF000000)),
                      ),
                      const SizedBox(height: 20),
                      PinCodeTextField(
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: Colors.blue[50]!,
                          activeColor: Colors.blue,
                          selectedColor: Colors.blue,
                          selectedFillColor: Colors.blue[50]!,
                          inactiveFillColor: Colors.grey[200]!,
                          inactiveColor: Colors.grey,
                        ),
                        onChanged: (value) {},
                        beforeTextPaste: (text) {
                          return true;
                        },
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signin');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 60),
                          backgroundColor: Color(0XFF32ade6),
                          foregroundColor: Colors.white,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Verify',
                          style: TextStyle(
                              fontSize: 19,
                              fontFamily: 'SfPro',
                              letterSpacing: 0.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
