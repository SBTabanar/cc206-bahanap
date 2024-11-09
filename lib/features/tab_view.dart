import 'package:flutter/material.dart';
import 'package:cc206_bahanap/features/dashboard_page.dart';
import 'package:cc206_bahanap/features/map_page.dart';
import 'package:cc206_bahanap/features/news_page.dart';
import 'package:cc206_bahanap/features/account_page.dart';
class TabView extends StatelessWidget {
  const TabView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:4,
      child: Scaffold(
      bottomNavigationBar: TabBar(
        tabs: [
          const Tab(icon: Icon(Icons.home_outlined, size: 30,)),
          const Tab(icon: Icon(Icons.map_outlined, size: 30,),),
          const Tab(icon: Icon(Icons.explore_outlined, size: 30,)),
          const Tab(icon: Icon(Icons.account_circle_outlined, size: 30,)),
        ]
      ),
	    body:
        TabBarView(
          children: [
            const DashboardPage(),
            const MapPage(),
            
            const NewsPage(),
            const AccountPage(),
            
          ]
        ),
      
      //     floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add your SOS button action here
      //   },
      //   backgroundColor: Colors.red,
      //   child: Text(
      //     'SOS',
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      ),
      
    );
  }
}

