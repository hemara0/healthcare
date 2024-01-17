import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcareit/pages/settingsPage.dart';

import 'homePage.dart';
import 'myRecordsPage.dart';
import 'notificationsPage.dart';

class NavigationEx extends StatefulWidget {
  //const NavigationExample({super.key});

  @override
  State<NavigationEx> createState() => _NavigationExState();
}

class _NavigationExState extends State<NavigationEx> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  }
}
