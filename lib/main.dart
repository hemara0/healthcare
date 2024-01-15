import 'package:flutter/material.dart';
import 'package:healthcareit/home/medicalStore/login.dart';
import 'package:healthcareit/pages/homePage.dart';
import 'package:healthcareit/pages/myRecordsPage.dart';
import 'package:healthcareit/pages/notificationsPage.dart';
import 'package:healthcareit/pages/settingsPage.dart';
import 'package:healthcareit/provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: NavigationExample(), debugShowCheckedModeBanner: false);
  }
}

class NavigationExample extends StatefulWidget {
  //const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
   /* return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("AppName"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Notifications'),
                        ),
                        body: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: NotificationEx(),
                        ),
                      );
                    },
                  ));
                })
          ]),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            label: 'My Records',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings_outlined),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Records(),
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Home(),
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Settings(),
        ),
      ][currentPageIndex],
    );
  */
  return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Heal"),
      ),
  body:const Login(),);
}
}