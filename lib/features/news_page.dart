import 'package:flutter/material.dart';
import 'package:cc206_bahanap/features/notifications_page.dart';
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
	    body:  ListView(
      scrollDirection: Axis.vertical,
	    children: [
            Text("placeholder for news")
      
          ]
        ),
    );
  }
}

