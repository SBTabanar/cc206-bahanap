import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
	    body:  Row(
	    children: [
          // Put the list of widgets here, separated by commas
        ElevatedButton(
            onPressed: () {
              // butang logic here
            },
            child: Text('Home'),
          ),
          ElevatedButton(
            onPressed: () {
              //logic here
            },
            child: Text('Page 2'),
          ),
          ElevatedButton(
            onPressed: () {
              
            },
            child: Text('Page 3'),
          ),
         const SizedBox(
          width: 200.0,
            child: TextField(
              decoration: InputDecoration(labelText: 'Search'),
            ),
        ),   
        ElevatedButton(
            onPressed: () {
              
            },
            child: Text('Search'),
          ), 
      ]
      )
    );
  }
}

