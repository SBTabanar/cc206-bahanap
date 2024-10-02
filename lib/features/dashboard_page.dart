import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
	    body:  ListView(
      scrollDirection: Axis.vertical,
	    children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 55, 10, 10),
          child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.circle, size: 60, color: Color(0xffD9D9D9),),
                const Text(style: TextStyle(fontSize: 34, fontFamily: 'Syne', fontWeight: FontWeight.w400,),"BaHanap"),
                Container (
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(color: Color(0xffF3F3F3), shape: BoxShape.circle,),
                  child:  Icon(Icons.notifications_none_outlined, color: Colors.black),
                ), 
              ],
              ),     
        ), Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
          decoration: BoxDecoration(color: Color(0xffF3F3F3), borderRadius: BorderRadius.circular(32)),
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.search, color: Color(0xffABB7C2), size: 30,), 
              const SizedBox(
                height: 20,
                width: 250,
                child: TextField(
                  decoration: InputDecoration(hintText: 'Search'),
                ),
              ),
              Container (
                height: 30,
                width: 30,
                decoration: BoxDecoration(color: Color(0xff32ADE6), shape: BoxShape.circle,),
                child:  Icon(Icons.tune, color: Colors.white,),
              ),
             
              
          ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
          child: Container(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: ElevatedButton( 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF3F3F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  ),
                  onPressed: () {
                    // butang logic here
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),)
                ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: ElevatedButton( 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF3F3F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  ),
                  onPressed: () {
                    // butang logic here
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),)
                ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: ElevatedButton( 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF3F3F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  ),
                  onPressed: () {
                    // butang logic here
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),)
                ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: ElevatedButton( 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF3F3F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  ),
                  onPressed: () {
                    // butang logic here
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),)
                ),
                ),
              ],
            ),
          ),
        
        ),
        Container(
          decoration: BoxDecoration(color: Color(0xffF3F3F3), borderRadius: BorderRadius.circular(8)),
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          child: Text(style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),'Your Location'),
        ),
      Padding(padding: EdgeInsets.all(10),
        child: GridView(
          shrinkWrap: true, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 3, mainAxisSpacing: 8),  
          children: [
            Padding(padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.only(top: 15),
                alignment: Alignment.topCenter,
                height: 15,
                width: 60,
                decoration: BoxDecoration(color: Color(0xffF3F3F3), borderRadius: BorderRadius.circular(37)),
                child: Text(style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),'Flood Reports'),
              ),
            ), Padding(padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.only(top: 15),
                alignment: Alignment.topCenter,
                height: 15,
                width: 60,
                decoration: BoxDecoration(color: Color(0xffF3F3F3), borderRadius: BorderRadius.circular(37)),
                child: Text(style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),'Risks'),
              ),
            ), Padding(padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.only(top: 15),
                alignment: Alignment.topCenter,
                height: 15,
                width: 60,
                decoration: BoxDecoration(color: Color(0xffF3F3F3), borderRadius: BorderRadius.circular(37)),
                child: Text(style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),'Emergency Routes'),
              ),
            ), Padding(padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.only(top: 15),
                alignment: Alignment.topCenter,
                height: 15,
                width: 60,
                decoration: BoxDecoration(color: Color(0xffF3F3F3), borderRadius: BorderRadius.circular(37)),
                child: Text(style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),'Water Level'),
              ),
            ),
          ],
          ),
      ),
      Container(
          margin: const EdgeInsets.fromLTRB(10, 25, 10, 10),
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          decoration: BoxDecoration(color: Color(0xff32ADE6), borderRadius: BorderRadius.circular(32)),
          child: Table(
            children: <TableRow>[
              TableRow(children: <Widget>[
                Icon(Icons.home_outlined, size: 30, color: Colors.white,),
                Icon(Icons.groups_outlined, size: 30, color: Colors.white,),
                Icon(Icons.map_outlined, size: 30, color: Colors.white,),
                Icon(Icons.explore_outlined, size: 30, color: Colors.white,),
                Icon(Icons.account_circle_outlined, size: 30, color: Colors.white,),
              ])
            ],
          ),
      )
      ]
      )
    );
  }
}

