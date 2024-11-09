import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(scrollDirection: Axis.vertical, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 55, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.circle,
                    size: 60,
                    color: Color(0xffD9D9D9),
                  ),
                  onPressed: () {},
                ),
                const Text(
                    style: TextStyle(
                      fontSize: 34,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w400,
                    ),
                    "BaHanap"),
                IconButton.outlined(
                  padding: EdgeInsets.all(9),
                  icon: const Icon(Icons.notifications_none_outlined,
                      color: Colors.black),
                  onPressed: () {
                    Navigator.pushNamed(context, 'notifications');
                    ;
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
            decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(32)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.search,
                  color: Color(0xffABB7C2),
                  size: 30,
                ),
                const SizedBox(
                  height: 20,
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Search'),
                  ),
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(child: Text("Option 1")),
                    PopupMenuItem(child: Text("Option 2")),
                  ],
                  onSelected: (value) {
                    //logic para sa search filters
                  },
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
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        )),
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
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        )),
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
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        )),
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
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(8)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              child: const Text(
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  'Your Location'),
              onLongPress: () => showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text("Your Location"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 3, mainAxisSpacing: 8),
              children: [
                Padding(
                    padding: EdgeInsets.all(8),
                    child: GestureDetector(
                      child: Container(
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.topCenter,
                          height: 15,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(37)),
                          child: Text(
                            'Flood Reports',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Flood Reports"),
                                  content: Text(
                                      "This is where the flood reports would be."),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Ok"))
                                  ],
                                ));
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: GestureDetector(
                      child: Container(
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.topCenter,
                          height: 15,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(37)),
                          child: Text(
                            'Risks',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Risks"),
                                  content: Text(
                                      "This is where information about the risks would be."),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Ok"))
                                  ],
                                ));
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: GestureDetector(
                      child: Container(
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.topCenter,
                          height: 15,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(37)),
                          child: Text(
                            'Emergency Routes',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Emergency Routes"),
                                  content: Text(
                                      "This is where the emergency routes would be."),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Ok"))
                                  ],
                                ));
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: GestureDetector(
                      child: Container(
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.topCenter,
                          height: 15,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(37)),
                          child: Text(
                            'Water Levels',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Water Levels"),
                                  content: Text(
                                      "This is where information regarding water levels would be."),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Ok"))
                                  ],
                                ));
                      },
                    )),
              ],
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
          child: FloatingActionButton(
            onPressed: () {
              // Add your SOS button action here
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("SOS Alert"),
                        content: Text(
                            "Your SOS alert has been successfully sent. Stay safe."),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Ok"))
                        ],
                      ));
            },
            backgroundColor: Colors.red,
            child: Text(
              'SOS',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            shape: CircleBorder(),
          ),
        ));
  }
}
