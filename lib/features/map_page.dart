import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          scrollDirection: Axis.vertical,
          children: [Text("placeholder for map")]),
    );
  }
}
